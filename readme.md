## Workflow
When installing a new plugin make sure to follow these instructions:
- Import in `packer.lua`
- add a comment on top of it with "{{name of library}} ({{what it is/does}})"
- If necessary create a `{{plugin}}.lua` file to add configurations and mappings to it

When creating remaps, try to follow these guidelines:
- Keep concepts separated in their own letters, for example, all telescope commands are started with `<leader>f`
- Document remaps with `which-key` so they appear in the cheatsheet
