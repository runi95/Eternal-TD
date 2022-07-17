import { Log, LogLevel } from './lib/Serilog/Serilog';
import { StringSink } from './lib/Serilog/Sinks/StringSink';
import { Game } from './Game/Game';
import { addScriptHook, W3TS_HOOK } from "w3ts/hooks";

const oldFourCC = FourCC;
globalThis['FourCC'] = (id: string) => {
    const a: number = oldFourCC(id);
    return a;
};

Log.Init([new StringSink(LogLevel.Error, print)]);

addScriptHook(W3TS_HOOK.MAIN_AFTER, () => {
    xpcall(
        () => {
            BlzLoadTOCFile('war3mapImported/Templates.toc');
            createQuests();
            new Game().start();
        },
        (err) => {
            Log.Fatal(err);
        },
    );
});

function createQuests(): void {

}
