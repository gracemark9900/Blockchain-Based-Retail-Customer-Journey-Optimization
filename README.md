# Blockchain-Based Retail Customer Journey Optimization

A comprehensive blockchain solution for optimizing retail customer journeys using Stacks blockchain and Clarity smart contracts. This system provides retailers with tools to track, measure, and improve customer experiences across all touchpoints.

## Overview

This project consists of five interconnected smart contracts that work together to create a complete customer journey optimization platform:

1. **Retailer Verification Contract** - Validates and manages retail businesses
2. **Touchpoint Tracking Contract** - Records customer interactions across channels
3. **Experience Measurement Contract** - Collects and analyzes customer feedback
4. **Journey Optimization Contract** - Manages and optimizes customer journey paths
5. **Conversion Improvement Contract** - Tracks and improves conversion rates

## Features

### 🏪 Retailer Management
- Retailer registration and verification system
- Admin-controlled verification process
- Industry categorization and status management

### 📊 Touchpoint Tracking
- Multi-channel touchpoint recording (web, mobile, in-store)
- Anonymous and identified customer tracking
- Metadata support for rich context

### ⭐ Experience Measurement
- 5-star rating system for customer feedback
- Automatic aggregation of retailer scores
- Feedback collection with touchpoint linking

### 🛤️ Journey Optimization
- Custom journey path creation
- Step-by-step customer progress tracking
- Journey completion monitoring

### 📈 Conversion Improvement
- Flexible conversion goal definition
- Attempt and success rate tracking
- Performance analytics and optimization

## Smart Contracts

### Retailer Verification (\`retailer-verification.clar\`)
Manages retailer registration, verification, and status.

**Key Functions:**
- \`register-retailer\` - Register a new retail business
- \`verify-retailer\` - Admin verification of retailers
- \`is-verified-retailer\` - Check retailer verification status

### Touchpoint Tracking (\`touchpoint-tracking.clar\`)
Records customer interactions across all channels.

**Key Functions:**
- \`record-touchpoint\` - Record customer interaction
- \`record-anonymous-touchpoint\` - Record anonymous interaction
- \`get-touchpoint\` - Retrieve touchpoint data

### Experience Measurement (\`experience-measurement.clar\`)
Collects and analyzes customer experience ratings.

**Key Functions:**
- \`submit-rating\` - Submit customer rating (1-5 stars)
- \`get-retailer-average-score\` - Get average retailer rating
- \`get-rating\` - Retrieve specific rating

### Journey Optimization (\`journey-optimization.clar\`)
Manages customer journey paths and optimization.

**Key Functions:**
- \`create-journey-path\` - Define new journey path
- \`start-customer-journey\` - Begin customer journey
- \`advance-customer-journey\` - Progress through journey steps

### Conversion Improvement (\`conversion-improvement.clar\`)
Tracks conversion goals and success rates.

**Key Functions:**
- \`create-conversion-goal\` - Define conversion objectives
- \`record-conversion-attempt\` - Track conversion attempts
- \`record-conversion\` - Record successful conversions
- \`get-conversion-rate\` - Calculate conversion rates

## Getting Started

### Prerequisites
- Stacks blockchain development environment
- Clarity CLI tools
- Node.js and npm for testing

### Installation

1. Clone the repository:
   \`\`\`bash
   git clone <repository-url>
   cd retail-journey-optimization
   \`\`\`

2. Install dependencies:
   \`\`\`bash
   npm install
   \`\`\`

3. Run tests:
   \`\`\`bash
   npm test
   \`\`\`

### Deployment

Deploy contracts to Stacks blockchain:

\`\`\`bash
# Deploy retailer verification first (dependency for others)
clarinet deploy retailer-verification

# Deploy other contracts
clarinet deploy touchpoint-tracking
clarinet deploy experience-measurement
clarinet deploy journey-optimization
clarinet deploy conversion-improvement
\`\`\`

## Usage Examples

### 1. Register and Verify a Retailer

\`\`\`clarity
;; Register as a retailer
(contract-call? .retailer-verification register-retailer "My Store" "Electronics")

;; Admin verifies the retailer
(contract-call? .retailer-verification verify-retailer 'SP2J6ZY48GV1EZ5V2V5RB9MP66SW86PYKKNRV9EJ7)
\`\`\`

### 2. Track Customer Touchpoints

\`\`\`clarity
;; Record a customer touchpoint
(contract-call? .touchpoint-tracking record-touchpoint
'SP3FGQ8Z7JY9BWYZ5WM53E0M9NK7WHJF0691NZ159
"web"
"product_view"
"{\"product_id\": \"123\", \"category\": \"electronics\"}")
\`\`\`

### 3. Collect Customer Feedback

\`\`\`clarity
;; Submit a customer rating
(contract-call? .experience-measurement submit-rating
'SP2J6ZY48GV1EZ5V2V5RB9MP66SW86PYKKNRV9EJ7
u4
"Great service, fast delivery!"
(some u1))
\`\`\`

### 4. Create and Manage Journey Paths

\`\`\`clarity
;; Create a journey path
(contract-call? .journey-optimization create-journey-path
"Purchase Journey"
(list "homepage" "category" "product" "cart" "checkout"))

;; Start customer journey
(contract-call? .journey-optimization start-customer-journey
'SP3FGQ8Z7JY9BWYZ5WM53E0M9NK7WHJF0691NZ159
u0)
\`\`\`

### 5. Track Conversions

\`\`\`clarity
;; Create conversion goal
(contract-call? .conversion-improvement create-conversion-goal
"Purchase Completion"
"Customer completes a purchase"
u100)

;; Record conversion
(contract-call? .conversion-improvement record-conversion
'SP3FGQ8Z7JY9BWYZ5WM53E0M9NK7WHJF0691NZ159
u0
(some u1)
(some u5))
\`\`\`

## Testing

The project includes comprehensive test suites for all contracts using Vitest:

\`\`\`bash
# Run all tests
npm test

# Run specific test file
npm test retailer-verification.test.js

# Run tests with coverage
npm run test:coverage
\`\`\`

## Architecture

The system follows a modular architecture where:

1. **Retailer Verification** serves as the foundation, ensuring only verified retailers can use the system
2. **Touchpoint Tracking** captures all customer interactions
3. **Experience Measurement** collects feedback linked to touchpoints
4. **Journey Optimization** uses touchpoint data to create optimized paths
5. **Conversion Improvement** measures the effectiveness of journey optimizations

## Security Considerations

- Only verified retailers can record touchpoints and manage journeys
- Admin controls for retailer verification
- Input validation for all user-provided data
- Immutable audit trail of all customer interactions

## Contributing

1. Fork the repository
2. Create a feature branch
3. Add tests for new functionality
4. Ensure all tests pass
5. Submit a pull request

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Support

For questions and support, please open an issue in the GitHub repository.
