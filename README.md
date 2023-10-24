# csci_6221

Short project description here.


## Table of Contents


- [csci\_6221](#csci_6221)
  - [Table of Contents](#table-of-contents)
  - [Prerequisites](#prerequisites)
  - [Setup and Installation](#setup-and-installation)
  - [Running Vue.js Files](#running-vuejs-files)
  - [Running Crystal Files](#running-crystal-files)
  - [GitHub Operation Specifications](#github-operation-specifications)

## Prerequisites

- Ensure you have [Node.js](https://nodejs.org/) installed for running Vue.js files.
- Ensure you have [Crystal](https://crystal-lang.org/install/) installed to run Crystal files.
- Recommended Operating Systems: macOS, Linux, or Windows Subsystem for Linux (WSL).

## Setup and Installation

Clone the repository to your local machine:

```bash
git clone https://github.com/XDB-x/csci_6221.git
cd csci_6221 && shards install
crystal src csci_6221.cr
```

## Running Vue.js Files

```bash
cd path-to-vue-directory
npm install
npm run serve
Now, your Vue.js application should be running on http://localhost:8080.
```

## Running Crystal Files

```bash
cd path-to-crystal-directory
crystal build your-file.cr
./your-file
```

## GitHub Operation Specifications

Branches: It's recommended to create separate branches for different features or bug fixes.
Pull Requests: Submit pull requests for code review before merging into the main branch.
Issues: Use GitHub issues to track bugs, feature requests, and other types of issues.
Actions: Utilize GitHub Actions for continuous integration and other automation.
