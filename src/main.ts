import { Log, LogLevel } from './lib/Serilog/Serilog';
import { StringSink } from './lib/Serilog/Sinks/StringSink';
import { Game } from './Game/Game';

export class Initialiser {
    public static run(): void {
        // tslint:disable-next-line:typedef
        const oldFourCC = FourCC;
        globalThis['FourCC'] = (id: string) => {
            const a: number = oldFourCC(id);
            return a;
        };
        Log.Init([new StringSink(LogLevel.Error, SendMessage)]);

        xpcall(
            () => {
                BlzLoadTOCFile('war3mapImported\\Templates.toc');
                createQuests();
                const game = new Game();
                game.start();
            },
            (err) => {
                Log.Fatal(err);
            },
        );
    }
}

ceres.suppressDefaultMain();
ceres.oldMain();
Initialiser.run();

// eslint-disable-next-line @typescript-eslint/no-empty-function
function createQuests(): void {

}

// eslint-disable-next-line
function SendMessage(this: void, msg: any): void {
    DisplayTimedTextToForce(bj_FORCE_ALL_PLAYERS, 10, `${msg}`);
}
