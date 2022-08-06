import War3Map from "mdx-m3-viewer/dist/cjs/parsers/w3x/map";
import { compileMap, getFilesInDirectory, loadJsonFile, logger, toArrayBuffer } from "./utils";
import type { IProjectConfig } from "./utils";
import * as fs from "fs-extra";
import * as path from "path";

function main(): void {
  const config = loadJsonFile<IProjectConfig>("config.json");
  compileMap(config);

  logger.info(`Creating w3x archive...`);
  if (!fs.existsSync(config.outputFolder)) {
    fs.mkdirSync(config.outputFolder);
  }

  createMapFromDir(`${config.outputFolder}/${config.mapFolder}`, `./dist/${config.mapFolder}`);
}

/**
 * Creates a w3x archive from a directory
 * @param output The output filename
 * @param dir The directory to create the archive from
 */
export function createMapFromDir(output: string, dir: string): void {
  const map = new War3Map();
  const files = getFilesInDirectory(dir);

  map.archive.resizeHashtable(files.length);

  for (const fileName of files) {
    const contents = toArrayBuffer(fs.readFileSync(fileName));
    const archivePath = path.relative(dir, fileName);
    const imported = map.import(archivePath, contents);

    if (!imported) {
      throw new Error(`Failed to import ${archivePath}`);
    }
  }

  const result = map.save();
  if (!result) {
    throw new Error("Failed to save archive.");
  }

  fs.writeFileSync(output, new Uint8Array(result));

  logger.info("Finished!");
}

try {
  main();
} catch (err) {
  logger.error(err.toString());
  logger.error(`Failed to compile map.`);
  process.exit(1);
}
