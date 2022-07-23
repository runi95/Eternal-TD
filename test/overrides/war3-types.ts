export { };

declare global {
    function FourCC(str: string): number;
}

global.FourCC = function FourCC(str: string) {
    return 0;
};
