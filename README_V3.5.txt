JG Mobile Mechanic V3.5

Changes:
- Customer signup confirmation is explicitly redirected to https://app.jgmechanic.co.uk
- Added Forgot password? button to Customer/Mechanic login screen
- Added Supabase password recovery email flow
- Added in-app Choose New Password screen for recovery links
- Added friendly success/error messages
- No database SQL upgrade is required for V3.5

Deployment:
Upload/replace index.html, manifest.json and sw.js (plus existing assets) in the GitHub Pages app repository.
Supabase Authentication URL Configuration should keep Site URL https://app.jgmechanic.co.uk and Redirect URL https://app.jgmechanic.co.uk/**
