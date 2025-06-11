--// ReplicatedStorage.ClientModules.ReactRoduxMods.Roact.invalidSetStateMessages (ModuleScript)

return {
    ["willUpdate"] = "setState cannot be used in the willUpdate lifecycle method.\nConsider using the didUpdate method instead, or using getDerivedStateFromProps.\n\nCheck the definition of willUpdate in the component %q.",
    ["willUnmount"] = "setState cannot be used in the willUnmount lifecycle method.\nA component that is being unmounted cannot be updated!\n\nCheck the definition of willUnmount in the component %q.",
    ["shouldUpdate"] = "setState cannot be used in the shouldUpdate lifecycle method.\nshouldUpdate must be a pure function that only depends on props and state.\n\nCheck the definition of shouldUpdate in the component %q.",
    ["init"] = "setState cannot be used in the init method.\nDuring init, the component hasn\'t initialized yet, and isn\'t ready to render.\n\nInstead, set the `state` value directly:\n\n\tself.state = {\n\t\tvalue = \"foo\"\n\t}\n\nCheck the definition of init in the component %q.",
    ["render"] = "setState cannot be used in the render method.\nrender must be a pure function that only depends on props and state.\n\nCheck the definition of render in the component %q.",
    ["reconcile"] = "setState cannot be called while a component is being reified or reconciled.\nThis is the step where Roact constructs Roblox instances, and starting another\nrender here would introduce bugs.\n\nCheck the component %q to see if setState is being called by:\n* a child Ref\n* a child Changed event\n* a child\'s render method",
    ["default"] = "setState can not be used in the current situation, but Roact couldn\'t find a\nmessage to display.\n\nThis is a bug in Roact.\nIt was triggered by the component %q.\n"
}