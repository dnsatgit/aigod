# Contributing to aigod

Thanks for your interest in contributing to aigod.

## How to Contribute

### Reporting Issues

- Use GitHub Issues for bug reports and feature requests
- Include your environment details (OS, Claude Code version, Node version)
- For bugs, include steps to reproduce

### Adding Roles

1. Create a new `.md` file in the appropriate `roles/<division>/` directory
2. Follow the role template format (see `roles/TEMPLATE.md`)
3. Add the role to `roles/index.yaml`
4. Submit a PR with a description of the role's purpose and use cases

### Adding Skills

1. Create a new directory under `.claude/skills/`
2. Include a `SKILL.md` with proper frontmatter
3. Add any reference files to a `references/` subdirectory
4. Document trigger conditions and methodology
5. Submit a PR

### Adding Eval Assertions

1. Add assertion sets to `evals/assertions/`
2. Follow the promptfoo assertion format
3. Include examples of pass/fail cases
4. Submit a PR

### Code Style

- Keep role definitions concise and actionable
- Eval configs should use haiku as the grader model (cost efficiency)
- Skills should be stateless — no persistent side effects
- Memory files use structured frontmatter

### Pull Request Process

1. Fork the repo
2. Create a feature branch (`git checkout -b feature/your-feature`)
3. Make your changes
4. Test with `npx promptfoo eval` if modifying evals
5. Submit a PR with a clear description

## Questions?

Open an issue or start a discussion.
