import {readFileSync} from "node:fs";
import {PipelineRunner} from "./pipeline.js";

export class VfcPipelineRunner extends PipelineRunner {
   #vfcRecords;
   #idMap;

   /**
    * @param {object} opts
    * @param {string} opts.vfcDataPath - Path to vfcs.predicted.json
    * @param {string} opts.idMapPath   - Path to id-map.json
    */
   constructor(opts) {
      super(opts);
      this.#vfcRecords = JSON.parse(readFileSync(opts.vfcDataPath, "utf-8"));
      this.#idMap = JSON.parse(readFileSync(opts.idMapPath, "utf-8"));
   }

   #resolveAdvisoryId(record) {
      const versioned = `${record.vulnerable_package}@${record.vulnerable_version}`;
      return this.#idMap[versioned] ?? this.#idMap[record.vulnerable_package] ?? null;
   }

   async start() {
      const records = this.#vfcRecords.slice(this.offset, this.offset + this.limit);
      console.log(`Running ${records.length} VFC records`);
      let i = 0;
      for (const record of records) {
         const advisoryId = this.#resolveAdvisoryId(record);
         if (!advisoryId) {
            console.warn(`Skipping ${record.vulnerable_package}@${record.vulnerable_version}: no advisory ID in id-map`);
            continue;
         }
         console.log(`[${++i}/${records.length}] ${record.vulnerable_package}@${record.vulnerable_version} → ${advisoryId}`);
         await super.spawn({
            ...this.opts,
            advisoryId,
            vfcRecord: record,
            packageName: `${record.vulnerable_package}@${record.vulnerable_version}`,
            description: record.advisory_descriptions.join("\n\n"),
            vulnerabilityTypeLabel: record.generated?.potential_vulnerability?.potential_vulnerability_type ?? null,
         });
      }
      this.onFinish();
   }
}
