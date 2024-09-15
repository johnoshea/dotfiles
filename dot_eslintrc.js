module.exports = {
    "env": {
        "browser": true
    },
    "extends": "eslint:recommended",
    "parserOptions": {
        "ecmaFeatures": {
            "experimentalObjectRestSpread": true,
            "jsx": true
        }
    },
    "plugins": [
        "react"
    ],
    "rules": {
        "indent": [
            2,
            "tab"
        ],
        "linebreak-style": [
            2,
            "unix"
        ],
        "quotes": [
            2,
            "double"
        ],
        "semi": [
            2,
            "always"
        ]
    }
};