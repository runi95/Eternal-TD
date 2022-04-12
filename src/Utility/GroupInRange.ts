import {Point} from "w3ts/handles/point";
import {Group} from "./Group";

// TODO: PR to w3ts to add this
export function GroupInRange(radius: number, point: Point) {
    print("disabled function!")
    return Group.fromRange(radius, point);
}
