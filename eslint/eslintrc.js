module.exports = {
  'env': {
    'browser': true,
    'es6': true,
    'node': true
  },

  'extends': 'eslint:recommended',

  'parserOptions': {
    'sourceType': 'module'
    'ecmaVersion': 8
  },

  'rules': {
    'indent': [
      'error',
      2
    ],

    'linebreak-style': [
      'error',
      'unix'
    ],

    'quotes': [
      'error',
      'single'
    ],

    'semi': [
      'error',
      'always'
    ],

    'no-console': [
      'error',
      { allow: ['log', 'warn', 'error', 'trace'] }
    ],

    'no-unused-vars': [
      'error',
      {
        'varsIgnorePattern': '[iI]gnore',
        'argsIgnorePattern': '[iI]gnore'
      }
    ]
  }
};
