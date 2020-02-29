var fs = require("fs");
var p = require("path");

function walk(rootDir) {
    return recursiveWalk(rootDir, []);
}

function recursiveWalk(rootDir, paths) {
    const list = fs.readdirSync(rootDir);
    for (const path of list) {
        const dirPath = p.join(rootDir, path);
        if (fs.statSync(dirPath).isDirectory()) {
            recursiveWalk(dirPath, paths);
        }
        else {
            paths.push(p.join(rootDir, path));
        }
    }
    return paths;
}

function addMatches(text, regexp, set) {
    let array;
    while ((array = regexp.exec(text)) !== null) {
        for (let idx = 1; idx < array.length; idx++)
            set.add(array[idx]);
    }
}

const effectSet = new Set();
const perkSet = new Set();
const keyItemSet = new Set();
const flagSet = new Set();

function fileAnalyze(filename) {
    var content = fs.readFileSync(filename);
    addMatches(content, /createStatusEffect\("([^"]+)"\)/g, effectSet);
    addMatches(content, /hasStatusEffect\("([^"]+)"\)/g, effectSet);
    addMatches(content, /removeStatusEffect\("([^"]+)"\)/g, effectSet);
    addMatches(content, /createPerk\("([^"]+)"\)/g, perkSet);
    addMatches(content, /hasPerk\("([^"]+)"\)/g, perkSet);
    addMatches(content, /removePerk\("([^"]+)"\)/g, perkSet);
    addMatches(content, /createKeyItem\("([^"]+)"\)/g, keyItemSet);
    addMatches(content, /hasKeyItem\("([^"]+)"\)/g, keyItemSet);
    addMatches(content, /removeKeyItem\("([^"]+)"\)/g, keyItemSet);
    addMatches(content, /flags\["([^"]+)"\]/g, flagSet);
}
walk('classes').forEach(fileAnalyze);

console.log(`Effects: ${effectSet.size} Perks: ${perkSet.size} KeyItems: ${keyItemSet.size} Flags: ${flagSet.size}`);

fs.writeFile('editor/Documentation/StatusEffectList.md', `# Status Effect List\n\`${Array.from(effectSet.values()).join('`, `')}\`\n'`, err => console.log(err));
fs.writeFile('editor/Documentation/PerkList.md', `# Perk List\n\`${Array.from(perkSet.values()).join('`, `')}\`\n'`, err => console.log(err));
fs.writeFile('editor/Documentation/KeyItemList.md', `# Key Item List\n\`${Array.from(keyItemSet.values()).join('`, `')}\`\n'`, err => console.log(err));
fs.writeFile('editor/Documentation/FlagList.md', `# Flag List\n\`${Array.from(flagSet.values()).join('`, `')}\`\n'`, err => console.log(err));
