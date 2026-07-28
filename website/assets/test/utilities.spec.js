import { test, expect } from "@playwright/test";
import { gotoPrimitive } from "./helpers/docs.js";

test.describe("Utility Primitives", () => {
  test("Label should render", async ({ page }) => {
    await gotoPrimitive(page, "label");
    await expect(page.locator("label")).toContainText("First Name");
  });
});
