import * as grp from "w3ts/handles/group";
import {Unit} from "w3ts";
import {Point} from "w3ts/handles/point";


// TODO: PR to w3ts to add this

export class Group extends grp.Group {
    constructor() {
        super();
    }
    public for(exp: (u: Unit) => void): void {
        let u: Unit = this.first;
        while (u) {
            exp(u);
            this.removeUnit(u)
            u = this.first;
        }
    }

    public static fromHandle(handle: group | undefined): Group | undefined {
        return handle ? this.getObject(handle) : undefined;
    }

    public static fromRange(radius: number, point: Point) {
        return Group.fromHandle(GetUnitsInRangeOfLocAll(radius, point.handle));
    }
}
