return {
    flags = { debounce_text_changes = 150 },
    autostart = true,
    settings = {
        python = {
            {
                analysis = {
                    autoSearchPaths = true,
                    --diagnosticMode = "openFilesOnly",
                    diagnosticMode = "workspace",
                    useLibraryCodeForTypes = true,
                    typeCheckingMode = "basic",
                },
            }
        },
    },
}

