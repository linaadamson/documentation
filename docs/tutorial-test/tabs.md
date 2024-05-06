---
sidebar_position: 3
title: Tabs
description: My document description
slug: /my-custom-url
---

import Tabs from '@theme/Tabs';
import TabItem from '@theme/TabItem';

<Tabs>
  <TabItem value="apple" label="npm" default>
    ```jsx 
npm install --save raw-loader
```
  </TabItem>

  <TabItem value="orange" label="yarn">
      ```jsx 
    yarn add raw-loader
    ```
  </TabItem>

  <TabItem value="banana" label="pnpm">
      ```jsx 
    pnpm add raw-loader
    ```
  </TabItem>
</Tabs>
