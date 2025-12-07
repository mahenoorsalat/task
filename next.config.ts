import type { NextConfig } from "next";

const SUPABASE_URL =
  process.env.NEXT_PUBLIC_SUPABASE_URL ??
  "https://default-supabase-url.supabase.co";

const nextConfig: NextConfig = {
  images: {
    remotePatterns: [
      {
        protocol: "https",
        hostname: new URL(SUPABASE_URL).hostname,
        pathname: "**",
      },
    ],
  },
};

export default nextConfig;
