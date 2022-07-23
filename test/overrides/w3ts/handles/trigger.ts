export class Trigger {
    public readonly register: any[] = [];
    public readonly actions: (() => void)[] = [];

    public registerEnterRegion(whichRegion: region, filter: boolexpr | (() => boolean) | null): event {
        this.register.push({ whichRegion, filter });
    }

    public addAction(actionFunc: () => void) {
        this.actions.push(actionFunc);
    }
}
