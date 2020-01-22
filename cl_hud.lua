--BY BNJ-- 𝑯𝒐𝒎𝒎𝒆-𝒆𝒇𝒇𝒊𝒄𝒂𝒔𝒆

ESX                  = nil


local faimVal = 0
local soifVal = 0
local rdy = true

Citizen.CreateThread(function()

    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)

    end
end)

function drawTxt3(x,y ,width,height,scale, text, r,g,b,a)
        SetTextFont(4)
        SetTextProportional(0)
        SetTextScale(scale, scale)
        SetTextColour(r, g, b, a)
        SetTextDropShadow(0, 0, 0, 0,255)
        SetTextEdge(2, 0, 0, 0, 255)
        SetTextDropShadow()
        SetTextOutline()
        SetTextEntry("STRING")
        AddTextComponentString(text)
        DrawText(x - width/2, y - height/2 + 0.005)
end

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function()
    rdy = true
end)

Citizen.CreateThread(function()
    
    while true do
        Citizen.Wait(5000)
        
        TriggerEvent('esx_status:getStatus', 'hunger', function(status)
            faimVal = status.val/1000000*100

        end)
        TriggerEvent('esx_status:getStatus', 'thirst', function(status)
            soifVal = status.val/1000000*100

        end)
        
    end

end)

Citizen.CreateThread(function()
    hea = 200
    while true do
        Citizen.Wait(0)
        if rdy then
                if boss then
                end  
                drawTxt3(0.676  , 1.325, 1.0,1.0,0.60 , "" ..math.ceil(faimVal) .. "%", 255, 255, 255, 255) 
                drawTxt3(0.655, 1.325, 1.0,1.0,0.50 , "" .."🍔" ,255, 255, 255, 255) 

                drawTxt3(0.675  , 1.375, 1.0,1.0,0.60 , "" ..math.ceil(soifVal) .. "%", 255, 255, 255, 255) 
                drawTxt3(0.655, 1.375, 1.0,1.0,0.50 , "" .."🍹" ,255, 255, 255, 255) 
            end
        end
end)


