export default function Page() {
  return (
    <main className="min-h-screen flex items-center justify-center bg-background p-6">
      <div className="max-w-md w-full flex flex-col gap-4 text-center">
        <h1 className="text-2xl font-semibold text-foreground">Manhunt AI Datapack</h1>
        <p className="text-muted-foreground text-sm leading-relaxed">
          For Minecraft 1.21.11 with Fabric and HeroBot. Drop the zip into your world&apos;s datapacks folder, then run
          /reload and /function manhunt:help.
        </p>
        <a
          href="/manhunt-ai.zip"
          download
          className="inline-flex items-center justify-center rounded-md bg-primary px-4 py-3 text-primary-foreground font-medium hover:opacity-90"
        >
          Download manhunt-ai.zip
        </a>
      </div>
    </main>
  )
}
