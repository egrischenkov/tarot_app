## Changes
<!--
For more info https://github.com/surfstudio/flutter-roadmap/blob/main/docs/PULL_REQUEST_TEMPLATE_README.md#changes
-->

## Screenshot / Video

## Troubles (optional)
<!--
For more info https://github.com/surfstudio/flutter-roadmap/blob/main/docs/PULL_REQUEST_TEMPLATE_README.md#troubles-optional
-->

## Checklist for self-check
- [ ] The author is marked as an assigne and assigned mandatory reviewers.
- [ ] Required labels marked
- [ ] Specified related tasks and/or related PRs.
- [ ] Specified Changes.
- [ ] Feature doesn't need a demo OR Attached videos/screenshots demonstrating the fix/feature.
- [ ] All unspecified fields in the PR description deleted.
- [ ] New code covered by unit tests and goldens or doesn't need this

## Checklist for reviewers
- CI passed successfully _(with a green check mark)_.
- PR is atomic, by volume no more than 400 (+-) corrected lines (not including codogen).

Design:
- System design corresponds to the agreements on structure and architecture on the project.
- The code is decomposed into necessary and sufficient components.

Functionality:
- The code solves the problem.
- Any changes to the user interface are reasonable and look good.

Complexity:
- The code is clear, easy to read, functions are small, no more than 50 lines.
- The logic is not overcomplicated, there is no overengineering (no code sections that may be needed in the future, but no one knows about it).

Tests:
- Updated or added tests for mandatory components.
- The tests are correct, helpful, and well designed/developed.

Naming:
- The naming of variables, methods, classes and other components is understandable.

Comments:
- The comments are understandable and helpful.
