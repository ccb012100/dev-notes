# regex

Remove duplicate lines from sorted list:

- Find: `^(.+(?:\R|$))\1+`
- Replace with: `\1`
