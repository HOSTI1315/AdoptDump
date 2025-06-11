--// ReplicatedStorage.new.bootstrap.BootstrapClient (LocalScript)

local v1 = game:GetService("ReplicatedFirst")
local v2 = game:GetService("ReplicatedStorage")
local v3 = require(v1.Load.AwaitPersistentModels)
local v4 = v2.new.modules
local v5 = v2.ClientServices
v3.await()
while not v2:GetAttribute("ServerInitDone") do
    v2:GetAttributeChangedSignal("ServerInitDone"):Wait()
end
local v6 = require(v4.LegacyServiceLoader)
require(v4.SoundOptimizer).start()
require(v4.Subscriptions.SubscriptionsClient).start()
require(v4.Limiteds.LimitedsDisplayClient).start()
require(v4.Performance.ClientFramerateLog).start()
v6.run_services_by_frame_folders(v5)
require(v4.HotspotsByInterior).start()
require(v4.Ailments.AilmentsClientService).start()
require(v4.Ailments.ClientUI.AilmentHintsService).start()
require(v4.Ailments.ClientUI.AilmentSpeechBubblesService).start()
require(v4.PickupEntities.PickupEntityService).start()
require(v4.StandardSequencePreview.StandardSequencePreviewClient).start()