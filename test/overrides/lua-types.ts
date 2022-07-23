export { };

declare global {
    function MathRound(v: number): number;
}

global.MathRound = function MathRound(v: number) {
    return Math.round(v);
};
