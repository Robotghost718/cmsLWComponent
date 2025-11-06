# CMS Auto Margin Component

A Salesforce Lightning Web Component (LWC) that automatically manages content from Salesforce CMS with intelligent image path conversion and margin normalization.

## Features

- 🎯 Fetches managed content from Salesforce CMS
- 🖼️ Automatically converts Salesforce CMS media URLs to community paths
- 📐 Normalizes margins on heading and paragraph elements
- 🔗 Handles relative and absolute image paths intelligently
- 📱 Responsive and lightweight

## Component Overview

This component displays CMS-managed content with automatic:

1. **Image URL Conversion**: Converts Salesforce absolute media URLs to community-relative paths for better portability
2. **Margin Normalization**: Removes default margins from `h1-h5` and `p` elements for consistent styling
3. **HTML Entity Decoding**: Properly decodes HTML entities in CMS content

## Installation

### Prerequisites
- Salesforce DX (SFDX) or Salesforce CLI
- Salesforce org with CMS enabled (Experience Cloud or Digital Experiences)
- Node.js 14+ and npm

### Setup

1. Clone the repository:
```bash
git clone https://github.com/Roboghost718/cmsLWComponent.git
cd cmsLWComponent
```

2. Authorize your Salesforce org:
```bash
sf org login web --set-default
# or (if using older SFDX)
sfdx force:auth:web:login --setdefaultusername
```

3. Deploy to your org:
```bash
sf project deploy start --metadata force-app
# or (if using older SFDX)
sfdx force:source:push
```

## Usage

### Basic Implementation

Add the component to a Lightning page or Experience Cloud page:

```html
<c-cms-auto-margin-comp content-id="YOUR_CONTENT_KEY"></c-cms-auto-margin-comp>
```

### Input Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `contentId` | String | Yes | The content key from Salesforce CMS |

### Example in Aura Component

```html
<div>
    <c:cmsAutoMarginComp contentId="your-content-key-here" />
</div>
```

## Component Architecture

### JavaScript (`cmsAutoMarginComp.js`)
- Uses `@wire` to fetch content via `ManagedContentController.getContent()`
- Processes HTML and modifies image sources
- Handles error states

### Apex Controller (`ManagedContentController.cls`)
- `getContent()`: Fetches a specific content item by content key
- `getContentList()`: Retrieves a list of managed content items
- Both methods support pagination, language, and filtering

## Image URL Conversion Logic

The component intelligently handles three types of image URLs:

1. **Salesforce CMS Absolute URLs**
   - `https://*.lightning.force.com/cms/media/ABC123` → `/sfsites/c/cms/delivery/media/ABC123`

2. **Relative Paths**
   - `image.png` → `/sfsites/c/image.png`
   - `/images/photo.jpg` → `/sfsites/c/images/photo.jpg`

3. **External/Already Correct URLs** (unchanged)
   - `https://example.com/image.png`
   - `/sfsites/c/assets/image.png`
   - `data:image/png;base64,...`

## Supported Salesforce API Versions

- Source API Version: 65.0+
- Tested with Summer '23 and later releases

## Troubleshooting

### Images not loading?
- Verify the content is published in CMS
- Check that image media files exist
- Review browser console for detailed logs
- Ensure your community has proper file serving configured

### Content not appearing?
- Confirm the `contentId` (content key) is correct
- Verify the CMS content is published
- Check user permissions for CMS access
- Review Apex debug logs for API errors

## Architecture & Design

### Security
- Uses `with sharing` on Apex controller to respect Salesforce sharing rules
- `@AuraEnabled(cacheable=true)` for performance
- HTML content is parsed in DOM to prevent injection attacks

### Performance
- Cacheable wire adapters reduce API calls
- Single DOM parse operation
- Minimal JavaScript bundle size

## Contributing

We welcome contributions! Please see [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines.

## Code of Conduct

Please review our [CODE_OF_CONDUCT.md](CODE_OF_CONDUCT.md) before participating.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Support

For issues and questions:
- Open an [issue](https://github.com/yourusername/cmsLWComponent/issues)
- Check existing issues for similar problems
- Include your Salesforce API version and browser details

## Authors

- Robotghost718 (@Robotghost718)

## Changelog

### Version 1.0.0
- Initial release
- Image URL conversion
- Margin normalization
- HTML entity decoding

---

**Built with ❤️ for the Salesforce community**
