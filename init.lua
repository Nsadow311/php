local usergroups = {

	["admin"] = true,
	["superadmin"] = false,

}

AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")

function ENT:Initialize()
	self:SetModel("models/hunter/plates/plate3x4.mdl") -- Model goes here
	self:SetMoveType(MOVETYPE_NONE)
	self:SetSolid(SOLID_VPHYSICS)
	self:SetUseType(SIMPLE_USE)
	self:PhysicsInit(SOLID_VPHYSICS)
	self:SetCustomCollisionCheck(true)
end

hook.Add( "ShouldCollide", "recruit_stopper", function( ent1, ent2 )

	if ent1:IsPlayer() then

		if ent2:GetClass() != "recruit_stopper" then return end

		if ent1:Team() == TEAM_GUN or usergroups[ent1:GetUserGroup()] then -- TEAM_ FOR THE RECRUIT

			return true

		else

			return false

		end

	elseif ent2:IsPlayer() then

		if ent1:GetClass() != "recruit_stopper" then return end

		if ent2:Team() == TEAM_GUN or usergroups[ent2:GetUserGroup()] then --  -- TEAM_ FOR THE RECRUIT
			return true
		else
			return false
		end

	end

	if not ent1:IsPlayer() && ent2:IsPlayer() then
		return true
	end

end )
