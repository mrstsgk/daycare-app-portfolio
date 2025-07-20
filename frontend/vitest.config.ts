import {defineConfig, mergeConfig} from "vite";
import {defineConfig as defineVitestConfig} from "vitest/config";
import react from "@vitejs/plugin-react";
import * as path from "node:path";

export default mergeConfig(
    defineConfig({
        plugins: [react()],
    }),
    defineVitestConfig({
        test: {
            environment: "jsdom",
            setupFiles: [path.resolve(__dirname, "src/setupTests.ts")],
            globals: true,
        },
    })
);
