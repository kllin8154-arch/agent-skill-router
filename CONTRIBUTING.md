# Contributing to Agent Skill Router

Thanks for your interest in contributing!

## How to Contribute

### Adding New Skill Routes

1. Add the route to `templates/<lang>/shared/skill-index.json`
2. Update `Skill-Quick-Reference-EN.md` or `技能速查手册-ZH.md`
3. If adding a new parameter, update both CLAUDE.md and AGENTS.md

### Adding New Templates

1. Follow the existing directory structure under `templates/<lang>/`
2. Use `{{PARAMETER_NAME}}` syntax for configurable values
3. Ensure both EN and ZH versions are provided

### Bug Reports

Open an issue with:
- What you expected to happen
- What actually happened
- Steps to reproduce

### Pull Requests

1. Fork the repo
2. Create a feature branch
3. Make your changes
4. Open a PR with a clear description
