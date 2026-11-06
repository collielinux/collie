# Command Metadata

Read this before adding or changing commands in `bin/`.

Commands in `bin/` can declare CLI metadata in comments near the top of the
file. `bin/collie` scans the first 80 lines, and tests expect command metadata
to remain valid.

Supported metadata keys:

- `# collie:group=...` - override the command group inferred from the filename
- `# collie:name=...` - override the command name inferred from the filename
- `# collie:summary=...` - short help text
- `# collie:args=...` - usage arguments
- `# collie:examples=...` - examples separated with ` | `
- `# collie:alias=...` / `# collie:aliases=...` - alternate routes
- `# collie:hidden=true` - hide from default command listings
- `# collie:requires-sudo=true` - mark commands that require sudo

Only use `collie:examples` where there are args that need explaining.

Prefer explicit metadata for user-facing commands. Keep routes consistent with
the filename unless there is a deliberate alias or compatibility route.

Example:

```bash
# collie:summary=Take a screenshot
# collie:args=[smart|region|windows|fullscreen] [slurp|copy]
# collie:examples=collie screenshot | collie capture screenshot region
```
