import { execFile, execSync } from "child_process";
import { loadJsonFile, logger, compileMap } from "./utils";
import type { IProjectConfig } from "./utils";

function main(): void {
  const config = loadJsonFile<IProjectConfig>("config.json");
  compileMap(config);

  const cwd = process.cwd();
  const filename = `${cwd}/dist/${config.mapFolder}`;

  logger.info(`Launching map "${filename.replace(/\\/g, "/")}"...`);

  if (config.winePath) {
    const wineFilename = `"Z:${filename}"`
    const prefix = config.winePrefix ? `WINEPREFIX=${config.winePrefix}` : ''
    execSync(`${prefix} ${config.winePath} "${config.gameExecutable}" ${["-loadfile", wineFilename, ...config.launchArgs].join(' ')}`, { stdio: 'ignore' });
  } else {
    execFile(config.gameExecutable, ["-loadfile", filename, ...config.launchArgs], (err: any) => {
      if (err && err.code === 'ENOENT') {
        logger.error(`No such file or directory "${config.gameExecutable}". Make sure gameExecutable is configured properly in config.json.`);
      }
    });
  }
}

try {
  main();
} catch (err) {
  logger.error(err.toString());
  logger.error(`Failed to compile map.`);
  process.exit(1);
}
