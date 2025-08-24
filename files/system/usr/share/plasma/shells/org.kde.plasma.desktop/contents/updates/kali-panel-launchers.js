panelIds.forEach(panelId => {
    const panel = panelById(panelId);
    panel.widgetIds.forEach(widgetId => {
        const widget = panel.widgetById(widgetId);
        if (widget.type === 'org.kde.plasma.icontasks') {
            widget.currentConfigGroup = ["General"];
            widget.writeConfig('launchers', ['applications:org.kde.konsole.desktop', 'applications:org.kde.dolphin.desktop', 'applications:org.kde.kate.desktop', 'applications:firefox-esr.desktop']);
        }
    });
});
