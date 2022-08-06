import { loadJsonFile, logger } from "./utils";
import War3TSTLHelper from "war3tstlhelper";
import type { IProjectConfig } from "./utils";
import * as fs from "fs-extra";

function main(): void {
    const config = loadJsonFile<IProjectConfig>("config.json");

    // Create definitions file for generated globals
    const luaFile = `./maps/${config.mapFolder}/war3map.lua`;
    const contents = fs.readFileSync(luaFile, "utf8");
    const parser = new War3TSTLHelper(contents);
    const result = parser.genTSDefinitions();
    fs.writeFileSync("src/war3map.d.ts", result);
}

try {
    main();
} catch (err) {
    logger.error(err.toString());
    logger.error('An error occurred while trying to generate definition files');
    process.exit(1);
}
