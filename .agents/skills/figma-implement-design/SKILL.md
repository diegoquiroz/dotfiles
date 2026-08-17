---
name: implement-figma-design
description: Analyze Figma layers and screenshots to build web UI.
---

Use your tools (Figma MCP or Framelink MCP) to get Figma layer data and screenshots of the design based on the URL provided by the user.

- Which tool to use? If the repo uses tailwind use the Figma MCP, if it doesn't use the Framelink MCP instead.

## Code implementation

Before building CSS or new components check existing components and global CSS directives and tokens to avoid code duplication.
Figma will return text-specific rules that are not part of the repo like `line-height`, don't add those, always inherit global CSS rules.
