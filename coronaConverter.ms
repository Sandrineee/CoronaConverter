

(
	/* #######################################################################################################################
	
	Copyright (C) 2016 Martin Geupel (http://www.racoon-artworks.de) , All Rights Reserved
	Permission is hereby granted, free of charge, to any person obtaining a copy of this software (the "Software"), to use, 
	copy, and/or distribute the software, subject to the following conditions:

	- The above copyright notice and this permission notice shall be included in all copies of the Software.
	- You may not misrepresent the name of the Original Author or the name of the Software.
	- You can distribute the Software only free of charge, you may not sell and/or rent the Software.
	- You may add functionality and/or modify existent functionaly if it is then clearly marked and noted in this Header.

	THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE 
	WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR 
	COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR 
	OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

	MODIFIED VERSION
	dubcat fstorm support editon
	
	##########################################################################################################################
	
	supported materials:
	- StandardMaterial
	- FStorm
	- FStormMixMat
	- FStormOverrideMat
	- FStormPortal
	- VRayMtl
	- VRayBlendMtl
	- VRayLightMtl
	- VRay2SidedMtl
	- VRayCarPaintMtl
	- VrayOverrideMtl
	- VrayMtlWrapper
	- VRayFastSSS (basic)
	- VRayFastSSS2
	- VRayHairMtl
	- VRayColor2Bump
	- Arch___Design__mi
	- Car_Paint_Material__mi
	- fR_Advanced
	- fR_Architectural
	- Shellac
	- Autodesk_Material
	- Architectural
	- RaytraceMaterial (basic)
	- fR_Metal (basic)
	- fR_Glass (basic)
	- iray_material (by Michiel Quist)
	
	supported maps:
	- FStormBitmap
	- FStormColor
	- FStormColorCorrection
	- FStormDirt
	- FStormFalloff
	- FStormGradient
	- FStormMix
	- FStormMultiTex
	- FStormNoise
	- FStormSky
	- VrayColor
	- VrayDirt
	- VrayNormalMap
	- VraySky
	- VRayCompTex
	- VRayEdgesTex
	- VRayGLSLTex
	- VRaySoftbox
	- VRayHDRI
	- VRayTriplanarTex
	- VRayColor2Bump
	- Normal_Bump
	- Autodesk_Map
	- Multi_Sub_Map
	- Ambient/Reflective_Occlusion
	
	supported lights:
	- VRayLight
	- VRayIES
	- VRaySun
	- FStormLight
	- FStormSunLight
	- mr_Sun
	- mr_Sky_Portal
	- miAreaLight
	- miAreaLightomni
	- fR RectLight
	- Free_Light
	- Target_Light
	- TargetDirectionallight
	- freeSpot
	- Directionallight
	- Omnilight
	- targetSpot
	- Daylight assemblies
	
	other:
	- VrayProxy
	- VrayDisplacementMod
	- FStormDisplacement
	
	cameras:
	- FStormCamera
	
	
	TODO:
	- VrayMultiSub map(?)
	- vrayEdgesTex -> corona https://corona-renderer.com/forum/index.php/topic,126.msg88521.html#msg88521
	- photometric lights
	- Dome light conversion
	- Hdri white balance setting https://corona-renderer.com/forum/index.php?topic=126.msg110097#msg110097
	- VrayCam to CoronaCam
	
	
	changelog:
	*v1.412 - [2018/02/07] -----------------------------------------------------------------------------
	- fstorm support
	*v1.41 - [2018/01/30]------------------------------------------------------------------------------
	- added support for VRayColor2Bump
	- added simple VrayBumpMtl conversion
	*v1.40 - [2017/12/04]------------------------------------------------------------------------------
	- fixed displacement checkbox in VraySSS2 Mtl
	*v1.39 - [2017/10/31]------------------------------------------------------------------------------
	- added VRayHairMtl conversion
	*v1.38 - [2017/09/26] -----------------------------------------------------------------------------
	- fixed maxscript property renamings
	*v1.37 - [2017/09/22] -----------------------------------------------------------------------------
	- added first version of VraySkinMtl and VrayFastSSS2 conversions
	*v1.36 - [2017/05/15] -----------------------------------------------------------------------------
	- added buttons to enable or disable legacy mode in CoronaRoundEdges map
	*v1.35 - [2017/04/29] -----------------------------------------------------------------------------
	- fixed: standard lights shadow conversion overwrote already existing CoronaShadows settings
	- fixed: Mental Ray Multi/Sub-Map slot order
	*v1.34 - [2017/04/11] -----------------------------------------------------------------------------
	- Fixed: VrayNormalMap conversion error with old vray versions
	*v1.33 - [2017/03/15] -----------------------------------------------------------------------------
	- fixed Arch___Design__mi bump amount conversion
	- fixed VrayHDRI conversion error with non-existing referenced files in max 2014+
	- updated VrayBlend -> CoronaLayeredMtl conversion due to new layout
	*v1.32 - [2017/03/09] -----------------------------------------------------------------------------
	- fixed: VrayNormalMap conversion now respects "flip red", "flip green", "swap red and green" checkboxes
	- added vrayTriplanarTex conversion
	*v1.31 - [2016/11/07] -----------------------------------------------------------------------------
	- actually hooked up the iray material this time + some bugfixes for max 2014
	*v1.30 - [2016/10/27] -----------------------------------------------------------------------------
	- added unofficial conversion of (downloadable) iray_material by Michiel Quist, 3diee.nl
	- fixed MR Reflective_Occlusion map conversion
	*v1.29 - [2016/09/25] -----------------------------------------------------------------------------
	- added button for changing the PBR Mode in all CoronaMtls
	- fixed CoronaBitmap conversion for new maxscript property name
	*v1.28 - [2016/09/01] -----------------------------------------------------------------------------
	- adjusted VrayDirt conversion for new CoronaAO property names
	- added VrayDirt bias -> CoronaAO direction offset conversion
	- brought back "show maps in viewport" tool for selected objects
	*v1.27 - [2016/06/29] -----------------------------------------------------------------------------
	- removed VrayGGX to CoronaGGX (new non-clamped) glossiness conversion
	- added new VrayBlinn to CoronaGGX glossiness conversion table and curve
	- changed the vray options to just one checkbox for conversion of non GGX Brdfs
	- removed "show maps in Viewport" buttons since this is now supported natively by Corona
	- added a button to remove old Glossiness conversion output maps from already converted scenes
	- fixed: StandardMtl bump strength with NormalBump
	- probably fixed: VrayHDRI undefined filename error
	*v1.26 - [2016/04/11] -----------------------------------------------------------------------------
	- minor changes to vray light units conversion
	- bitmaps with empty filepath can now be converted to CoronaBitmap
	- fixed: VrayHdri conversion with older Vray versions
	- fixed: properties will not animate anymore when Auto Key is on
	*v1.25 - [2016/01/21] -----------------------------------------------------------------------------
	- added: Vray 3.3 additional bump map in VrayNormalMap conversion
	- added: Vray 3.3 VrayBlendMtl enable checkbox conversion
	- added: VrayHDRI conversion (enabled by default) to prevent crashes using recent Vray 3.x versions
	*v1.24 - [2015/12/09] -----------------------------------------------------------------------------
	- added check for invalid Vray refraction glossiness values
	- fixed glossiness map conversion in VRayCarPaintMtl, VRayFastSSS2
	- added better proxy converter error log (maxscript listener)
	- fixed proxy converter crash with missing vrmesh files
	*v1.23 - [2015/11/24] -----------------------------------------------------------------------------
	- added VrayDisplacementMod conversion tool
	- improved VrayLight units conversion, luminance and radiance still inaccurate due to limitations
	- improved VrayMtl anisotropy conversion: 50 percent decresed intensity, orientation in local z preserved
	*v1.22 - [2015/11/13] -----------------------------------------------------------------------------
	- fixed conversion issue with fog texmap (affecting older Vray builds prior 2.5)
	- adjusted bump conversion for Arch___Design__mi, Standard
	- added additional check to prevent crashes with 0 face objects and ProxyConverter
	*v1.21 - [2015/11/04] -----------------------------------------------------------------------------
	- ProxyConverter now takes VrayProxy scale setting into account and translates it to transforms scale
	- ProxyConverter "pick path" button now displays picked path
	*v1.20 - [2015/11/02] -----------------------------------------------------------------------------
	- VrayNormalMap / CoronaNormal / Normal_Bump maps will not be affected by bump conversion multipler
	- ProxyExporter: fixed animation range bug
	*v1.19 - [2015/11/02] -----------------------------------------------------------------------------
	- new Vray Blinn to Corona (clamped) GGX conversion method
	- new Vray GGX to Corona (clamped) GGX conversion method
	- new VrayLight Directionality conversion
	- new Bump strength conversion, multiplier can be changed in converterSettings struct
	- added a proxy converter from scratch including animated VrayProxy support
	- added VrayMtl fog texmap -> CoronaMtl absorption texmap
	*v1.18 - [2015/09/09] -----------------------------------------------------------------------------
	- changed round corners conversion for Arch___Design__mi, fR_Architectural to new CoronaRoundEdges texturemap 
	- added support for additional bump mapping in NormalBump -> CoronaNormal texture conversion
	*v1.17 - [2015/08/07] -----------------------------------------------------------------------------
	- added CoronaLightMtl to legacy mode Tool
	- added support for VrayBlend conversion to new CoronaLayeredMtl
	- added VrayMtl anisotropy map channel conversion
	- VrayMtl glossiness values are now clamped to 2 decimals
	*v1.16 - [2015/07/23] -----------------------------------------------------------------------------
	- fixed VrayLight disc conversion
	- fixed Photometric Light Shadows conversion
	*v1.15 - [2015/07/22] -----------------------------------------------------------------------------
	- changed light conversions due to the new CoronaSun
	- added CoronaNormal gamma fixing tool
	- added CoronaBitmap to Bitmaptexture conversion tool
	*v1.14 - [2015/07/03] -----------------------------------------------------------------------------
	- Internal structural changes, should now be better accessable via MAXScript
	- Maxscript documentation got IMPORTANT updates, have a look if you're using it 
	- possible fix for "Unable to convert: undefined to type: FileName" errors
	- fixed script crash with Daylight Assemblies
	*v1.13 - [2015/06/18] -----------------------------------------------------------------------------
	- fixed CoronaBitmap conversion errors when referenced bitmaptexture bitmap is not existing (missing map)
	- fixed CoronaBitmap conversion crashing the script when map paths were empty or hit unsupported file type 
	- added ".jpeg" to supported file types in CoronaBitmap conversion
	*v1.12 - [2015/06/15] -----------------------------------------------------------------------------
	- fixed: additional CoronaSun on DaylightAssembly conversion
	- fixed: autodesk map Width/Height scale parameters are now converted properly to Bitmap worldunits
	- fixed: VrayIES lights did not convert when the file path was undefined
	- CoronaBitmap: updated realWorldScale conversion
	- CoronaBitmap: added gamma conversion
	*v1.11 - [2015/06/12] -----------------------------------------------------------------------------
	- [BETA] CoronaBitmap: added .hdr format
	- [BETA] CoronaBitmap: added mono channel output, rgb channel output, crop and placement 
	- added minimize button to converter dialog
	*v1.10 - [2015/06/07] -----------------------------------------------------------------------------
	- [BETA] CoronaBitmap: added real world scale mapping, W rotation, alpha source
	- removed the "on" button for legacy mode switching, this functionality is obsolete
	*v1.09 - [2015/05/29] -----------------------------------------------------------------------------
	- updated VrayLight directionality conversion using a logit curve
	- fixed: missing VrayLight double sided conversion
	- fixed: legacy mode conversion stopped working due to renamed property
	- added Bitmaptexture -> CoronaBitmap conversion (WIP)
	*v1.08 - [2015/05/04] -----------------------------------------------------------------------------
	- fixed selected mode for "show maps in viewport" tool
	*v1.07 - [2015/05/01] -----------------------------------------------------------------------------
	- added "only selected objects" mode for show maps in viewport tool
	- fixed renderer assignment (due to new Corona class naming scheme)
	- fixed: vray light in mesh mode throwing error when mesh is not present in the scene (=> light is now ignored)
	*v1.06 - [2015/04/10] -----------------------------------------------------------------------------
	- fixed: "switch renderer to Corona" was overwriting settings even if Corona was already assigned
	- added installed Vray version info to Error report
	*v1.05 - [2015/03/23] -----------------------------------------------------------------------------
	- added support for Ambient/Reflective Occlusion map
	- added support for Multi_Sub_Map
	- fixed: VrayMtl conversion did not properly convert the SelfIllumination multiplier in some occasions
	- fixed: Autodesk_Map printed error report when source file did not exist
	- fixed: link colors for light max ui
	*v1.04 - [2015/03/06] -----------------------------------------------------------------------------
	- fixed VrayFastSSS2, conversion now respects older Vray versions (pre 3.10.01)
	*v1.03 - [2015/03/05] -----------------------------------------------------------------------------
	- updated VrayFastSSS2 material (diffuse, refl, opacity, bump, displacement)
	- updated Architectural material (diffuse, bump, opacity)
	- state of ui elements and dialog position will now be saved and recalled on each usage
	*v1.02 - [2015/03/03] -----------------------------------------------------------------------------
	- VrayMtls without reflection or refraction will now convert to default CoronaMtl refl/refr settings instead of black
	- removed bitmap blur clamping
	- added "only scene lights" conversion selection 
	- updated info section
	*v1.01 - [2015/02/24] -----------------------------------------------------------------------------
	- added a tool for fixing opacity maps (after conversion) that are using embedded alphas (e.g. tif and leafs)
	*v1.00 - [2015/02/16] -----------------------------------------------------------------------------
	- first version for Corona 1.0 release
	
	######################################################################################################################## */ 
	
	global CoronaConverterSuppressGui
	global CoronaProxyConverter
	global CoronaConverter
	
	
	struct CoronaProxyConverterStr (
		vrayMeshReader,
		proxyInfoArray = #(),
		proxyFileArray = #(),
		
		VrayProxyInfo =(
			struct VrayProxyInfo (
				maxobj,
				proxyFile,
				displayType,
				playbackOffset,
				playbackSpeed,
				proxyScale
			)
		),
		
		VrayProxyFile =(
			struct VrayProxyFile (
				filename,
				doesExist = true,
				owner,
				frameCount = 1,
				coronaProxyFilename = undefined,
				
				on create do (
					if (doesFileExist filename) then(
						frameCount = owner.vrayMeshReader.GetNumberOfFrames filename
					)else(
						doesExist = false
					)
					append owner.proxyFileArray this
				)
			)
		),
		
		fn combineToPath stringArray =(
			local outPath = ""
			for pth in stringArray do (
				outPath = pathConfig.appendPath outPath pth
			)
			outPath
		),
		
		fn maxAnimRange =(
			local proxyLengthArray = for i in proxyFileArray collect i.frameCount
			if proxyLengthArray.count != 0 then(
				sort proxyLengthArray
				proxyLengthArray[proxyLengthArray.count]
			)else(
				1
			)
		),
		
		fn isProxyFileDefined filename =(
			local found = false
			local out = undefined
			
			for prx in proxyFileArray while not found do(
				if prx.filename == filename then(
					out = prx
					found = true
				)
			)
			out
		),
		
		fn VrayMeshReaderAssembly =(
			-- file:///C:/Program%20Files/Chaos%20Group/V-Ray/3dsmax%202016%20for%20x64/docs/vrmesh_format.html
			source = ""
			source += "using System;\n"
			source += "using System.IO;\n"
			source += "\n"
			source += "public class vrMeshReader\n"
			source += "{\n"
			source += "	public int GetNumberOfFrames(string filePath)\n"
			source += "	{\n"
			source += "		byte[] buffer = null;\n"
			source += "		int FrameCount = 0;\n"
			source += "		\n"
			source += "		FileStream vrM = new FileStream(filePath, FileMode.Open);\n"
			source += "		try\n"
			source += "		{\n"
			source += "	    	vrM.Seek(11, SeekOrigin.Begin); // skipping fileversion and description\n"
			source += "			\n"
			source += "	    	UInt64 lutOffset;\n"
			source += "	    	buffer = new byte[8];\n"
			source += "	    	vrM.Read(buffer, 0, buffer.Length);\n"
			source += "	    	lutOffset = BitConverter.ToUInt64(buffer, 0);\n"
			source += "			\n"
			source += "	    	vrM.Seek((long)lutOffset, SeekOrigin.Begin);\n"
			source += "			\n"
			source += "	    	buffer = new byte[4];\n"
			source += "	     	vrM.Read(buffer, 0, buffer.Length);\n"
			source += "	    	UInt32 numVoxels = (BitConverter.ToUInt32(buffer, 0));\n"
			source += "	     	vrM.Seek(36 * numVoxels, SeekOrigin.Current);\n"
			source += "	    	FrameCount = 1;\n"
			source += "			\n"
			source += "	    	while (numVoxels != 0)\n"
			source += "	    	{\n"
			source += "	       		buffer = new byte[4];\n"
			source += "	        	vrM.Read(buffer, 0, buffer.Length);\n"
			source += "	       		numVoxels = (BitConverter.ToUInt32(buffer, 0));\n"
			source += "	        	if (numVoxels == 0) { break; }\n"
			source += "	        	FrameCount++;\n"
			source += "	         	vrM.Seek(36 * numVoxels, SeekOrigin.Current);\n"
			source += "	    	}\n"
			source += "	    	vrM.Close();\n"
			source += "		}\n"
			source += "		catch (Exception)\n"
			source += "		{\n"
			source += "	    	vrM.Close();\n"
			source += "	    	throw;\n"
			source += "		}\n"
			source += "		return FrameCount;\n"
			source += "	}\n"
			source += "}\n"
			
			csharpProvider = dotnetobject "Microsoft.CSharp.CSharpCodeProvider"
			compilerParams = dotnetobject "System.CodeDom.Compiler.CompilerParameters"
			
			compilerParams.ReferencedAssemblies.Add "System.dll"
			
			compilerParams.GenerateInMemory = on
			compilerResults = csharpProvider.CompileAssemblyFromSource compilerParams #(source)
			
			(compilerResults.CompiledAssembly).CreateInstance "vrMeshReader"
		),
		
		fn collectSceneData =(
			for prx in (getClassInstances VrayProxy) do(
				local prxInfo = VrayProxyInfo()
				prxInfo.maxobj = prx
				
				local proxyFile = isProxyFileDefined prx.fileName
				prxInfo.proxyFile = if proxyFile != undefined then proxyFile else VrayProxyFile filename:prx.fileName owner:this
				prxInfo.displayType = prx.display
				prxInfo.playbackOffset = prx.anim_offset
				prxInfo.playbackSpeed = prx.anim_speed
				prxInfo.proxyScale = prx.proxy_scale
				
				append proxyInfoArray prxInfo
			)
		),
		
		fn generateCoronaProxies location: overwrite: =(
			local askForOverwrite = true
			local overwriteFiles = false
			
			if overwrite != unsupplied then(
				askForOverwrite = false
				overwriteFiles = overwrite
			)
			
			for prx in proxyFileArray do(
				
				local vrProxy = vrayProxy fileName:prx.Filename display:4 proxy_scale:1.0 -- whole mesh display
				local corProxy = CProxy()
				local outpath
				local skipFile = false
				
				if location == unsupplied then(
					outpath = combineToPath #((getFilenamePath prx.Filename), (getFilenameFile prx.Filename) + ".cgeo")
				)else(
					outpath = combineToPath #(location, (getFilenameFile prx.Filename) + ".cgeo")
				)
				prx.coronaProxyFilename = outpath
				
				if doesFileExist outpath then (
					if askForOverwrite then(
						overwriteFiles = queryBox "One or more CoronaProxy files do already exist on Disk, do you want to overwrite them?\n\n(If you press \"No\", the existing files will be used for the generated Proxies)" title:"Corona Proxy Export"
						askForOverwrite = false
					)
					
					if not overwriteFiles then skipFile = true
				)		
				
				if prx.doesExist then(
					if ((getPolygonCount vrProxy)[1] == 0 )then(  -- if facecount is 0 max crashes => corona bug
						skipFile = true 
						prx.coronaProxyFilename = undefined
						format ("Skipped [.vrmesh contains 0 faces]: " + prx.Filename + "\n")
					)
				)else(  -- if vrmesh file path is invalid
					skipFile = true 
					prx.coronaProxyFilename = undefined
					format ("Skipped [invalid .vrmesh filepath]: " + prx.Filename + "\n")
				)
				
				
				
				if not skipFile then(
					with redraw off (
						if prx.frameCount == 1 then(  -- singleFrame 
							CProxy.ProxyFp.fromScene corProxy vrProxy outpath
						)else(  -- animated
							CProxy.ProxyFp.fromSceneAnimated corProxy vrProxy outpath 0 (prx.frameCount - 1) 10000 1 
						)
					)
					format ("Generated CoronaProxy: " + outpath + "\n")
				)
				
				delete vrProxy
				delete corProxy
				gc light:true
			)
		),
		
		fn replaceVrayProxies =(
			for vrayPrx in proxyInfoArray where classof vrayPrx.maxobj == VRayProxy do(
				cProxFilename = vrayPrx.proxyFile.coronaProxyFilename
				if cProxFilename != undefined then(
					crnProxy = CProxy filename:cProxFilename animationOffset:vrayPrx.playbackOffset animationSpeedMultiplier:vrayPrx.playbackSpeed previzType:2 
					
					replaceInstances vrayPrx.maxobj crnProxy
					
					if vrayPrx.proxyScale != 1.0 then (
						local prxInstances
						InstanceMgr.GetInstances crnProxy &prxInstances
						for obj in prxInstances do obj.scale *= vrayPrx.proxyScale
					)
					delete crnProxy
				)
			)
			
			gc light:true
		),
		
		fn convertProxies location: overwrite: =(
			local saveStart = animationRange.start
			local saveEnd = animationRange.end
			
			collectSceneData()
			
			animationRange = (interval 0 (maxAnimRange() ))
			
			generateCoronaProxies location:location overwrite:overwrite
			replaceVrayProxies()
			
			proxyInfoArray = #()
			proxyFileArray = #()
			animationRange = (interval saveStart saveEnd)
		),
		
		CoronaProxyConverterRoll = rollout CoronaProxyConverterRoll "Corona Proxy conversion" width:230 height:170(
			local owner = if owner != undefined do owner
			local savePath = undefined
			
			group "Options" (
				label lbl "Location for created Corona Proxies" align:#left
				radiobuttons rdoMode "" labels:#("Same file path as original", "Pick new path") columns:1 align:#left
				button btnPick "Pick save path" width:200 enabled:false
			)
			group "Convert" (
				button btnConvertProxies "Convert Proxies" width:200 height:32 
			)
			
			on btnPick pressed do(
				
				savePath = getSavePath()
				if savePath != undefined do(
					btnPick.caption = savePath
					btnPick.tooltip = savePath
				)
			)
			
			on rdoMode changed state do(
				if state == 1 then btnPick.enabled = false else btnPick.enabled = true
			)
			
			on btnConvertProxies pressed do (
				with animate off (
					if rdoMode.state == 1 then(
						owner.convertProxies()
					)
					else(
						if savePath != undefined then (
							owner.convertProxies location:savePath
						)else(
							messagebox "Invalid save Path!" title:"Error"
						)
					)
				)
			)
		),
		
		fn openGui=(
			createDialog CoronaProxyConverterRoll style:#(#style_titlebar, #style_sysmenu, #style_minimizebox)
		),
		
		fn destroyGui=(
			try(destroyDialog CoronaProxyConverterRoll)catch()
		),
		
		on create do(
			CoronaProxyConverterRoll.owner = this
			vrayMeshReader = VrayMeshReaderAssembly()
		)
		
	)

	
	
	struct CoronaConverterStr (
		CoronaConverterVersion = "1.41",
		
		-- miscellaneous functions
		converterSettings =(
			struct converterSettings 
			(
				standardMatSpecToRefl = true,
				vrayConvertGlossyValues = true,  -- depreciated
				vrayConvertGlossyMaps = true,  -- depreciated
				vrayUseAdvBlinnToCoronaGgxConversion = false,
				vrayblendToMultilayerdBlend = true, -- depreciated
				VrayHDRIToBitmaptexture = true,
				bitmapTextureToCoronaBitmap = false,
				addCoronaPrefix = false,
				userPrefixStr = "CRN.",
				clampDisp = false,
				clampDispAmount = 5.0,
				clampIor = false,
				clampIorAmount = 25.0,
				convertProxies = false,
				switchRenderEngine = false,
				miLightsToCrnLights = false,
				showMapsInVPselectedOnly = false,
				printInfo = true,
				silent = false,
				useTryCatchBugReporting = true,
				uiLinkColor = (if (colorMan.getColor #background).x < 0.5 then color 150 180 210 else color 0 80 200), -- colors for dark and light ui
				exposeDebugSettings = false,
				
				dialogPosX = 0,
				dialogPosY = 0,
				iniPath = "$plugcfg\\CoronaConverter.ini",
				requiredBuildDate = 20170926, --YearMonthDay
				
				vrayBumpMultiplier = 3.5,
				
				/* obsolete
				vrayBlinnToCoronaClampedGgxTable = #([1.0,1.0],[0.99,0.99],[0.98,0.98],[0.97,0.95],[0.96,0.9],[0.95,0.83],[0.94,0.77],[0.93,0.73],
					[0.92,0.68],[0.91,0.65],[0.9,0.62],[0.89,0.59],[0.88,0.57],[0.87,0.54],[0.86,0.52],[0.85,0.51],[0.84,0.49],[0.83,0.47],
					[0.82,0.46],[0.81,0.44],[0.8,0.43],[0.79,0.42],[0.78,0.41],[0.77,0.39],[0.76,0.38],[0.75,0.37],[0.74,0.36],[0.73,0.35],
					[0.72,0.34],[0.71,0.33],[0.7,0.32],[0.69,0.31],[0.68,0.3],[0.67,0.3],[0.66,0.29],[0.65,0.28],[0.64,0.27],[0.63,0.26],
					[0.62,0.25],[0.61,0.24],[0.6,0.23],[0.59,0.22],[0.58,0.21],[0.57,0.19],[0.56,0.18],[0.55,0.16],[0.54,0.14],[0.53,0.1],
					[0.52,0.01],[0.51,0.01],[0.5,0.01],[0.49,0.01],[0.48,0.01],[0.47,0.01],[0.46,0.01],[0.45,0.01],[0.44,0.01],[0.43,0.01],
					[0.42,0.01],[0.41,0.01],[0.4,0.01],[0.39,0.01],[0.38,0.01],[0.37,0.01],[0.36,0.01],[0.35,0.01],[0.34,0.01],[0.33,0.01],
					[0.32,0.01],[0.31,0.01],[0.3,0.01],[0.29,0.01],[0.28,0.01],[0.27,0.01],[0.26,0.01],[0.25,0.01],[0.24,0.01],[0.23,0.01],
					[0.22,0.01],[0.21,0.01],[0.2,0.01],[0.19,0.01],[0.18,0.01],[0.17,0.01],[0.16,0.01],[0.15,0.01],[0.14,0.01],[0.13,0.01],
					[0.12,0.01],[0.11,0.01],[0.1,0.01],[0.09,0.01],[0.08,0.01],[0.07,0.01],[0.06,0.01],[0.05,0.01],[0.04,0.01],[0.03,0.01],
					[0.02,0.01],[0.01,0.01],[0.0,0.01]),
					
				vrayGgxToCoronaClampedGgxTable = #([1.0,1.0],[0.99,0.99],[0.98,0.97],[0.97,0.95],[0.96,0.94],[0.95,0.91],[0.94,0.87],[0.93,0.83],
					[0.92,0.8],[0.91,0.77],[0.9,0.75],[0.89,0.72],[0.88,0.69],[0.87,0.67],[0.86,0.65],[0.85,0.62],[0.84,0.61],[0.83,0.59],
					[0.82,0.57],[0.81,0.55],[0.8,0.54],[0.79,0.53],[0.78,0.51],[0.77,0.5],[0.76,0.49],[0.75,0.47],[0.74,0.46],[0.73,0.45],
					[0.72,0.44],[0.71,0.43],[0.7,0.42],[0.69,0.41],[0.68,0.4],[0.67,0.39],[0.66,0.38],[0.65,0.38],[0.64,0.37],[0.63,0.36],
					[0.62,0.35],[0.61,0.34],[0.6,0.33],[0.59,0.33],[0.58,0.32],[0.57,0.31],[0.56,0.3],[0.55,0.3],[0.54,0.29],[0.53,0.28],
					[0.52,0.27],[0.51,0.26],[0.5,0.26],[0.49,0.25],[0.48,0.24],[0.47,0.23],[0.46,0.22],[0.45,0.21],[0.44,0.2],[0.43,0.19],
					[0.42,0.18],[0.41,0.16],[0.4,0.14],[0.39,0.12],[0.38,0.01],[0.37,0.01],[0.36,0.01],[0.35,0.01],[0.34,0.01],[0.33,0.01],
					[0.32,0.01],[0.31,0.01],[0.3,0.01],[0.29,0.01],[0.28,0.01],[0.27,0.01],[0.26,0.01],[0.25,0.01],[0.24,0.01],[0.23,0.01],
					[0.22,0.01],[0.21,0.01],[0.2,0.01],[0.19,0.01],[0.18,0.01],[0.17,0.01],[0.16,0.01],[0.15,0.01],[0.14,0.01],[0.13,0.01],
					[0.12,0.01],[0.11,0.01],[0.1,0.01],[0.09,0.01],[0.08,0.01],[0.07,0.01],[0.06,0.01],[0.05,0.01],[0.04,0.01],[0.03,0.01],
					[0.02,0.01],[0.01,0.01],[0.0,0.0]),
				*/
					
				vrayDirectionalityToCoronaDirectionality = #([1.0,1.0],[0.99,0.96],[0.98,0.88],[0.97,0.82],[0.96,0.78],[0.95,0.74],[0.94,0.72],
					[0.93,0.69],[0.92,0.68],[0.91,0.66],[0.9,0.65],[0.89,0.63],[0.88,0.62],[0.87,0.61],[0.86,0.6],[0.85,0.6],[0.84,0.59],
					[0.83,0.58],[0.82,0.57],[0.81,0.57],[0.8,0.56],[0.79,0.56],[0.78,0.55],[0.77,0.55],[0.76,0.54],[0.75,0.54],[0.74,0.53],
					[0.73,0.53],[0.72,0.52],[0.71,0.52],[0.7,0.51],[0.69,0.51],[0.68,0.51],[0.67,0.5],[0.66,0.5],[0.65,0.5],[0.64,0.49],
					[0.63,0.49],[0.62,0.49],[0.61,0.49],[0.6,0.48],[0.59,0.48],[0.58,0.48],[0.57,0.47],[0.56,0.47],[0.55,0.47],[0.54,0.47],
					[0.53,0.46],[0.52,0.46],[0.51,0.46],[0.5,0.46],[0.49,0.45],[0.48,0.45],[0.47,0.45],[0.46,0.45],[0.45,0.44],[0.44,0.44],
					[0.43,0.44],[0.42,0.44],[0.41,0.44],[0.4,0.43],[0.39,0.43],[0.38,0.43],[0.37,0.43],[0.36,0.42],[0.35,0.42],[0.34,0.42],
					[0.33,0.42],[0.32,0.41],[0.31,0.41],[0.3,0.41],[0.29,0.41],[0.28,0.41],[0.27,0.4],[0.26,0.4],[0.25,0.4],[0.24,0.4],
					[0.23,0.4],[0.22,0.39],[0.21,0.39],[0.2,0.39],[0.19,0.38],[0.18,0.38],[0.17,0.38],[0.16,0.38],[0.15,0.37],[0.14,0.37],
					[0.13,0.37],[0.12,0.36],[0.11,0.36],[0.1,0.36],[0.09,0.35],[0.08,0.35],[0.07,0.35],[0.06,0.34],[0.05,0.33],[0.04,0.33],
					[0.03,0.32],[0.02,0.31],[0.01,0.3],[0.0,0.0]),
					
				vrayBlinnToCoronaGgxTable = #([1.0,1.0],[0.99,0.99],[0.98,09.98],[0.97,0.97],[0.96,0.95],[0.95,0.93],[0.94,0.91],[0.93,0.89],
					[0.92,0.88],[0.91,0.86],[0.9,0.85],[0.89,0.83],[0.88,0.82],[0.87,0.8],[0.86,0.79],[0.85,0.78],[0.84,0.76],[0.83,0.75],
					[0.82,0.74],[0.81,0.72],[0.8,0.71],[0.79,0.7],[0.78,0.68],[0.77,0.67],[0.76,0.66],[0.75,0.65],[0.74,0.63],[0.73,0.62],
					[0.72,0.61],[0.71,0.6],[0.7,0.59],[0.69,0.57],[0.68,0.56],[0.67,0.55],[0.66,0.54],[0.65,0.53],[0.64,0.51],[0.63,0.5],
					[0.62,0.49],[0.61,0.48],[0.6,0.47],[0.59,0.45],[0.58,0.44],[0.57,0.43],[0.56,0.42],[0.55,0.41],[0.54,0.4],[0.53,0.39],
					[0.52,0.37],[0.51,0.36],[0.5,0.35],[0.49,0.34],[0.48,0.33],[0.47,0.32],[0.46,0.31],[0.45,0.3],[0.44,0.28],[0.43,0.27],
					[0.42,0.26],[0.41,0.25],[0.4,0.24],[0.39,0.23],[0.38,0.22],[0.37,0.21],[0.36,0.2],[0.35,0.18],[0.34,0.17],[0.33,0.16],
					[0.32,0.15],[0.31,0.14],[0.3,0.13],[0.29,0.12],[0.28,0.11],[0.27,0.1],[0.26,0.09],[0.25,0.08],[0.24,0.06],[0.23,0.05],
					[0.22,0.04],[0.21,0.03],[0.2,0.02],[0.19,0.01],[0.18,0.01],[0.17,0.01],[0.16,0.01],[0.15,0.01],[0.14,0.01],[0.13,0.01],
					[0.12,0.01],[0.11,0.01],[0.1,0.01],[0.09,0.01],[0.08,0.01],[0.07,0.01],[0.06,0.01],[0.05,0.01],[0.04,0.01],[0.03,0.01],
					[0.02,0.01],[0.01,0.01]),
					
				fStormToCoronaTable = #([1.0,1.0],[0.99,0.99],[0.98,0.98],[0.97,0.96],[0.96,0.96],[0.95,0.96],[0.94,0.95],[0.93,0.94],
					[0.92,0.94],[0.91,0.93],[0.9,0.92],[0.89,0.91],[0.88,0.91],[0.87,0.90],[0.86,0.89],[0.85,0.88],[0.84,0.88],[0.83,0.87],
					[0.82,0.86],[0.81,0.86],[0.8,0.85],[0.79,0.84],[0.78,0.83],[0.77,0.83],[0.76,0.82],[0.75,0.81],[0.74,0.81],[0.73,0.8],
					[0.72,0.79],[0.71,0.79],[0.7,0.78],[0.69,0.77],[0.68,0.77],[0.67,0.76],[0.66,0.75],[0.65,0.75],[0.64,0.74],[0.63,0.74],
					[0.62,0.73],[0.61,0.72],[0.6,0.72],[0.59,0.71],[0.58,0.71],[0.57,0.7],[0.56,0.69],[0.55,0.69],[0.54,0.68],[0.53,0.67],
					[0.52,0.67],[0.51,0.66],[0.5,0.66],[0.49,0.65],[0.48,0.64],[0.47,0.64],[0.46,0.63],[0.45,0.63],[0.44,0.62],[0.43,0.61],
					[0.42,0.61],[0.41,0.61],[0.4,0.6],[0.39,0.59],[0.38,0.59],[0.37,0.58],[0.36,0.58],[0.35,0.57],[0.34,0.56],[0.33,0.56],
					[0.32,0.55],[0.31,0.55],[0.3,0.54],[0.29,0.54],[0.28,0.53],[0.27,0.53],[0.26,0.52],[0.25,0.52],[0.24,0.51],[0.23,0.51],
					[0.22,0.5],[0.21,0.49],[0.2,0.49],[0.19,0.48],[0.18,0.48],[0.17,0.47],[0.16,0.47],[0.15,0.46],[0.14,0.46],[0.13,0.45],
					[0.12,0.45],[0.11,0.44],[0.1,0.44],[0.09,0.43],[0.08,0.43],[0.07,0.42],[0.06,0.42],[0.05,0.41],[0.04,41],[0.03,41],
					[0.02,0.4],[0.01,0.39],[0.0,0.38])
					
			)
			converterSettings()
		),
		
		fn getCoronaBuildTimeStamp =(
			try(
				vString = CoronaRenderer.getCoronaVersion()
				fstr = filterstring vString " "
				
				year = fstr[fstr.count - 1] as integer
				month = finditem #("Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec") fstr[fstr.count - 3]
				day = fstr[fstr.count - 2] as integer
				tme = filterstring fstr[fstr.count] ":"
				tHours = tme[1] as integer
				tMins = tme[2] as integer
				tSecs = tme[3] as integer
				
				fn frm2d str = (
					formattedprint str format:".2d"
				)
				
				comparableDate = (year as string + frm2d month + frm2d day) as Integer 
				comparableTime = (tHours*3600 + tMins*60 + tSecs) 
				
				#(year, month, day, tHours, tMins, tSecs, comparableDate, comparableTime)
			)catch(
				#(0000, 00, 00, 00, 00, 00, 0, 0)
			)
		),
		
		converterTempData =(
			struct converterTempData 
			(
				owner,
				-- used to determine which classes will be converted, important
				supportedMtlClasses = #("StandardMaterial", "FStorm", "FStormMixMat", "FStormOverrideMat", "FStormPortal", "VRayMtl", "VRayBlendMtl", "VRayLightMtl", "VRay2SidedMtl", \
					"VRayCarPaintMtl", "VrayOverrideMtl", "VrayMtlWrapper", "Arch___Design__mi", "Car_Paint_Material__mi", \
					"fR_Advanced", "fR_Architectural" , "Shellac", "Autodesk_Material", "VRayFastSSS", "VRayFastSSS2", \
					"VRayHairMtl", "VRaySkinMtl", "RaytraceMaterial", "Architectural", "fR_Metal", "fR_Glass", "iray_Material", \
					"VRayBumpMtl"),
				supportedMapClasses = #("Bitmaptexture", "FStormBitmap", "FStormMix", "FStormMultiTex", "FStormNoise", "FStormSky", "FStormColor", "FStormColorCorrection", "FStormDirt", "FStormFalloff", "FStormGradient", "VrayColor", "VrayDirt", "Normal_Bump", "VrayNormalMap", "VraySky", \
					"VRayCompTex", "VRayEdgesTex", "VRayGLSLTex", "VRaySoftbox", "Autodesk_Map", "Ambient_Reflective_Occlusion__3dsmax", \
					"Multi_Sub_Map", "VRayHDRI", "VRayTriplanarTex", "VRayColor2Bump"),
				-- NOT used to determine which classes will be converted, just for information purposes
				supportedLightClasses = #("VRayLight", "VRaySun", "FStormLight", "FStormSunLight", "mrSun", "mr_Sky_Portal", "VRayIES", "miAreaLight", \
					"miAreaLightomni", "RectLight", "Free_Light", "Target_Light", "TargetDirectionallight", "freeSpot", \
					"Directionallight", "Omnilight", "targetSpot", "Daylight Assemblies"),
				supportedCameraClasses = #("FStormCamera"),
				
				--glossyConversionOutputMap = undefined,
				glossyConversionOutputMapVrayBlinnCoronaClGgx = undefined,
				glossyConversionOutputMapVrayGgxCoronaClGgx = undefined,
				AD_mats_found = false,
				foundPortals = false,
				
				orig_mtls=#(),
				new_mtls=#(),
				orig_maps=#(),
				new_maps=#(),
				orig_lights=#(),
				new_lights=#(),
				crnSkyPortalMtl,
				
				foundAdskMtls=#(),
				errorBuffer=#(),
				conversionTimeInfo = #(),
				
				coronaBuildTimestamp = owner.getCoronaBuildTimeStamp()
			)
			converterTempData owner:this
		),
		
		fn isCoronaVersionOfDateOrHigher dateInt =(  -- yyyymmdd
			instCorBuild = converterTempData.coronaBuildTimestamp  -- installed corona build
			reqCorBuild = dateInt  -- lowest corona build version accepted
			instCorBuild[7] >= reqCorBuild
		),
		
		converterTools =(
			struct converterTools (
				owner,
				
				private fn collectMaterialClasses =(
					myString = "" as stringstream 
					showclass "*:material*" to:myString
					
					rawClass = filterstring (myString as string) "\n"
					rawClass = for elem in rawClass collect (filterstring elem ": ")[1] 
					sort rawClass
					rawClass
				),
				
				private fn recursiveShowMaps orig_mtl mode =(
					local sub_count=getNumSubMtls orig_mtl
					if sub_count >= 1 then (
						for i=1 to sub_count do (
							submtl = getSubMtl orig_mtl i
							if submtl != undefined do (
								recursiveShowMaps submtl mode
							)
						)
					)
					else(
						if classof orig_mtl == CoronaMtl then(
							try(showTextureMap orig_mtl mode)catch()
						)
					)
				),
				
				private fn convertFrom_VrayDisplacementMod orig =(
					crnMod = CoronaDisplacementMod()
					crnMod.mapSource = 1
					crnMod.texmap = orig.texmap
					
					local amount = orig.amount
					local shift = orig.shift
					local waterLvl = orig.waterLevelValue
					crnMod.levelMax = amount + shift
					crnMod.levelMin = shift
					
					if orig.waterLevelOn then(
						crnMod.useWaterLevel = true
						crnMod.waterLevel = (waterLvl - shift) / amount  -- ((amount + shift) - shift)
					)
					
					crnMod
				),
				
				private fn convertFrom_FStormDisplacement orig =(
					crnMod = CoronaDisplacementMod()
					crnMod.mapSource = 1
					crnMod.texmap = orig.texture
					
					crnMod.levelMax = orig.power
					
					crnMod.waterLevel = orig.center
					
					crnMod.useWaterLevel = on
					
					crnMod
				),
				
				public
				CoronaMtlConvStatsRoll = rollout CoronaMtlConvStatsRoll "Corona Mtl Statistics" width:210 height:176 (
					label lblNumCrnMat "number of CoronaMtls containing..." pos:[8,8] width:200 height:16
					label lblNumReflect "Reflections:" pos:[16,24] width:200 height:16
					label lblNumRefract "Refractions:" pos:[16,40] width:200 height:16
					label lblNumSelfIllu "Self illumination:" pos:[16,56] width:96 height:16
					label lblNumTransl "Translucency:" pos:[16,72] width:96 height:16
					label lblNumOpacity "Opacity:" pos:[16,88] width:96 height:16
					label lblNumDisplace "Displacement:" pos:[16,104] width:96 height:16
					label lblNumCrnLight "number of CoronaLightMtls..." pos:[8,128] width:176 height:16
					label lblNumEmitting "emitting Light (direct):" pos:[16,144] width:144 height:16
					
					on CoronaMtlConvStatsRoll open do(
						local CrnMats = getclassinstances CoronaMtl 
						local numReflectiveCrn = 0
						local numTwoSided = 0
						local numCaustics = 0
						local numRefractiveCrn = 0
						local numSelfIlluCrn = 0
						local numTranslucentCrn = 0
						local numOpacityCrn = 0
						local numDisplacementCrn = 0
						local CrnLightMat = getclassinstances CoronaLightMtl
						local numEmittingLightMat = 0
						
						for mat in CrnMats do(
							--count reflective 
							if mat.levelReflect != 0 then(
								if mat.colorReflect != black then numReflectiveCrn += 1 else(
									if mat.texmapReflect != undefined AND mat.texmapOnReflect == true then numReflectiveCrn += 1
								)
							)
							
							--count refractive 
							if mat.levelRefract != 0 then(
								if mat.colorRefract != black then( 
									numRefractiveCrn += 1
									if mat.thin then numTwoSided += 1
									if mat.caustics then numCaustics += 1
								)
								else(
									if mat.texmapRefract != undefined AND mat.texmapOnRefract == true then(
										numRefractiveCrn += 1
										if mat.thin then numTwoSided += 1
										if mat.caustics then numCaustics += 1
									)
								)
							)
							
							--count selfillum 
							if mat.levelSelfIllum != 0 then(
								if mat.colorSelfIllum != black then numSelfIlluCrn += 1 else(
									if mat.texmapSelfIllum != undefined AND mat.texmapOnSelfIllum == true then numSelfIlluCrn += 1
								)
							)
							
							--count translucent 
							if mat.levelTranslucency != 0 then(
								if mat.colorTranslucency != black then numTranslucentCrn += 1 else(
									if mat.texmapTranslucency != undefined AND mat.texmapOnTranslucency == true then numTranslucentCrn += 1
								)
							)
							
							--count opacity 
							if mat.levelOpacity != 1.0 then numOpacityCrn += 1
							else(
								if mat.colorOpacity != white then numOpacityCrn += 1 else(
									if mat.texmapOpacity != undefined AND mat.texmapOnOpacity == true then numOpacityCrn += 1
								)
							)
							
							--count displacement 
							if mat.levelTranslucency != 0 then(
								if mat.texmapDisplace != undefined AND mat.texmapOnDisplacement == true then numDisplacementCrn += 1
							)
						)
						
						for mat in CrnLightMat do if mat.emitLight then numEmittingLightMat += 1
						
						lblNumCrnMat.text = "number of CoronaMtls(" + CrnMats.count as string + ") containing..."
						lblNumReflect.text = "Reflections: " + numReflectiveCrn as string
						lblNumRefract.text = "Refractions: " + numRefractiveCrn as string  + "   Caustics(" + numCaustics as string + ") Thin(" + numTwoSided as string + ")"			
						lblNumSelfIllu.text = "Self illumination: " + numSelfIlluCrn as string 		
						lblNumTransl.text = "Translucency: " + numTranslucentCrn as string 	
						lblNumOpacity.text = "Opacity: " + numOpacityCrn as string 
						lblNumDisplace.text = "Displacement: " + numDisplacementCrn as string 
						lblNumCrnLight.text = "number of CoronaLightMtls(" + CrnLightMat.count as string + ") ..."
						lblNumEmitting.text = "emitting Light (direct): " + numEmittingLightMat as string 
					)
				),
				
				CoronaMtlConvClassRoll = rollout CoronaMtlConvClassRoll "Convert by class" width:180 height:480 (
					label lblDesc "Convert any material class to a default gray CoronaMtl. You can select several classes at once." pos:[4,4] width:170 height:60
					multilistbox mlb "" pos:[4,50] width:170 height:30 items:(collectMaterialClasses())
					button convertClasses  "Convert to Default CoronaMtl" pos:[4,450]width:170
						
					on convertClasses pressed do(
						for cls in mlb.selection do(
							for mtl in (getclassinstances (execute mlb.items[cls])) where classof mtl != CoronaMtl do(
								try(replaceInstances mtl (CoronaMtl name:mtl.name))catch("Unknown Error occured!")
							)
						)
					)
				),
				
				fn showMapsInVP mode selected:false =(
					if not selected then(
						for o in (getclassinstances CoronaMtl) do(
							try(showTextureMap o mode)catch()
						)
					)
					else(
						for o in selection do(
							if o.material != undefined do(
								recursiveShowMaps o.material mode
							)
						)
					)
				),
				
				fn SetMaxDisplacementLevel amnt =(
					with animate off (
						for o in (getclassinstances CoronaMtl) do(
							o.displacementMaximum = amnt
						)
					)
				),
				
				fn DisableDisplacementTex =(
					with animate off (
						for o in (getclassinstances CoronaMtl) do(
							o.texmapOnDisplacement = false
						)
					)
				),
				
				fn setLegacyMode state =(
					with animate off (
						for mat in (getclassinstances CoronaMtl) do(
							if (hasproperty mat "legacyA7Mode") then(
								mat.legacyA7Mode = state  -- true = legacy, false = standard
							)
							if (hasproperty mat "legacyMode") then(
								mat.legacyMode = state  -- true = legacy, false = standard
							)
						)
						for mat in (getclassinstances CoronaLightMtl) do(
							if (hasproperty mat "legacyMode") then(
								mat.legacyMode = state  -- true = legacy, false = standard
							)
						)
					)
				),
				
				fn setPBRMode state =(
					with animate off (
						for mat in (getclassinstances CoronaMtl) do(
							mat.pbrMode = state
						)
					)
				),
				
				fn setRoundCornerLegacyMode state =(
					with animate off (
						for map in (getclassinstances CoronaRoundEdges) do(
							map.legacy = state
						)
					)
				),
				
				fn convertClass =(
					createDialog CoronaMtlConvClassRoll
				),
				
				fn CoronaMtlStats =(
					createDialog CoronaMtlConvStatsRoll
				),
				
				fn resetMtlEdit =(
					for i = 1 to 24 do(
						meditmaterials[i] = CoronaMtl name:((formattedPrint i format:".2d") + " - CoronaMtl")
					)
				),
				
				fn fixOpacityMapsUsingMonoChannel =(
					with animate off (
						crnMtls = getClassInstances CoronaMtl
						
						for mtl in crnMtls do(
							if mtl.texmapOpacity != undefined and classof mtl.texmapOpacity == Bitmaptexture then(
								if mtl.texmapOpacity.monoOutput == 1 then(
									opcMap = mtl.texmapOpacity
									
									mtl.texmapOpacity = CoronaMix texmapMix:opcMap
								)
							)
						)
					)
				),
				
				fn convertBitmapToCoronaBitmap =(
					with animate off (
						for map in getclassinstances Bitmaptexture do(
							newMap = owner.mapConvMethods.convertFrom_BitmapTexture map
							if newMap != #NoReplacement do(
								replaceInstances map newMap
							)
						)
					)
				),
				
				fn convertCoronaBitmapToBitmap =(
					with animate off (
						for map in getclassinstances CoronaBitmap do(
							newMap = owner.mapConvMethods.convertFrom_CoronaBitmap map
							if newMap != #NoReplacement do(
								replaceInstances map newMap
							)
						)
					)
				),
				
				fn convertVrayDisplacementMods =(
					local allMods = (getclassinstances VRayDisplacementMod)
					for dsplMod in allMods where (classof dsplMod == VRayDisplacementMod) do(
						replaceInstances dsplMod (convertFrom_VrayDisplacementMod dsplMod)
					)
				),
				
				fn convertFStormDisplacement =(
					local allMods = (getclassinstances FStormDisplacement)
					for dsplMod in allMods where (classof dsplMod == FStormDisplacement) do(
						replaceInstances dsplMod (convertFrom_FStormDisplacement dsplMod)
					)
				),
				
				fn fixCoronaNormalGamma =(
					with animate off (
						for mp in (getClassInstances CoronaNormal) do(
							if mp.gammaWarning then mp.addGamma = not mp.addGamma
						)
					)
				),
				
				fn removeOldGlossinessConversionMaps =(
					for opmap in (getclassinstances output) where opmap.name == "GlossyConversion" do (
						if opmap.map1 != undefined do replaceinstances opmap opmap.map1
					)
				),
				
				fn getVersion =( 
					owner.CoronaConverterVersion 
				),
				
				fn checkForNewVersion =(
					if not owner.converterSettings.silent then (
						rollout CheckOnlineRoll "Online version check" width:210 height:124 (
							local publicVersion = undefined
							local dailyBuildsVersion = undefined
							local lastpos = [8,8]
							
							label lbl0 "This version: " pos:(lastpos += [20,0]) align:#left
							label lbl1 "Latest versions on " pos:(lastpos += [-20,20]) align:#left
							hyperlink hypDwnld "Converter website:" address:"http://www.racoon-artworks.de/CoronaConverter/CoronaConverter.html" pos:(lastpos += [92,0]) visitedColor:(color 150 180 210) color:(color 150 180 210)
							label lbl2 "public version: error" pos:(lastpos += [-72,20]) align:#left
							label lbl3 "daily builds version: error" pos:(lastpos += [0,20]) align:#left
							button btnClose "Close" pos:(lastpos += [39,24]) width:80
							
							on btnClose pressed do destroyDialog CheckOnlineRoll
							
							on CheckOnlineRoll open do (
								try(
									publicVersion = ((dotNetObject "System.Net.WebClient").downloadString "http://www.racoon-artworks.de/CoronaConverter/version.txt")
									dailyBuildsVersion = ((dotNetObject "System.Net.WebClient").downloadString "http://www.racoon-artworks.de/CoronaConverter/version_dailyBuilds.txt")
									lbl0.text = ("This version: v" + owner.converterTools.getVersion())
									lbl2.text = ("public version: v" + publicVersion)
									lbl3.text = ("daily builds version: v" + dailyBuildsVersion)
								)catch()
							)
						)
						createDialog CheckOnlineRoll
						#(#("public", CheckOnlineRoll.publicVersion), #("daily", CheckOnlineRoll.dailyBuildsVersion))
					)
					else(
						try(
							publicVersion = ((dotNetObject "System.Net.WebClient").downloadString "http://www.racoon-artworks.de/CoronaConverter/version.txt")
							dailyBuildsVersion = ((dotNetObject "System.Net.WebClient").downloadString "http://www.racoon-artworks.de/CoronaConverter/version_dailyBuilds.txt")
							#(#("public", publicVersion), #("daily", dailyBuildsVersion))
						)catch(undefined)
					)
				)
			)
			converterTools owner:this
		),
		
		fn scenematerialsUpdateHack =(
			-- DIRTY HACK to force max to save something and re-evaluate the scenematerials tree, so no "dead" classes will remain somewhere.
			-- if not done, e.g. Autodesk_Material warnings will pop up all the time if there was a Adsk mtl because it's still referenced somehwere.
			start = timeStamp()
			tempFile = GetDir #temp + "/_tempSceneMaterialsHack.max" 
			saveNodes #() tempFile
			deleteFile tempFile
			end = timeStamp()
			if converterSettings.printInfo do format "INFO: UpdateFix took % seconds to complete\n" ((end - start) / 1000.0)
		),
		
		fn createErrorReports =(
			rollout ErrorReportRollout "Error Report" width:400 height:500 (
				local owner = if owner != undefined do owner
				local report
				label lbl1 "Conversion finished but one or more errors occured!"
				label lbl2 " Please save the ErrorReport.txt below and post it in this thread:"
				hyperLink lnk "https://corona-renderer.com/forum/index.php/topic,126" address:"https://corona-renderer.com/forum/index.php/topic,126" color:owner.converterSettings.uiLinkColor visitedColor:owner.converterSettings.uiLinkColor offset:[50,0]
				dotNetControl edxErr "System.Windows.Forms.TextBox" pos:[0,60] width:400 height:400 
				button btnCopy "Save ErrorReport.txt" height:30
				
				on ErrorReportRollout open do(
					edxErr.Multiline = true
					edxErr.ReadOnly = true
					edxErr.backcolor = edxErr.backcolor.FromArgb 60 60 60  
					edxErr.foreColor = edxErr.foreColor.FromArgb 255 120 0  
					
					if not converterSettings.silent do(
						report = ""
						report += ">>> SCENE Info: <<<\r\n"
						report += "Corona version: " + CoronaRenderer.getCoronaVersion() + "\r\n"
						report += "Converter version: " + owner.converterTools.getVersion() + "\r\n"
						report += "Max version: " + (maxversion())[1] as string + "\r\n"
						report += "Installed Vray plugins: "
						for i in RendererClass.classes where substring (i as string) 1 5 == "V_Ray" do report += i as string + "  "							
						report += "\r\n"
						for i in converterTempData.conversionTimeInfo do report += ("# " + i + "\r\n")
						report += "\r\n"
						
						for i in converterTempData.errorBuffer do report += (i + "\r\n\r\n")
						
						ErrorReportRollout.edxErr.text = report
					)
				)
				
				on btnCopy pressed do (
					loc = getSavePath "Location to store ErrorReport.txt"
					if loc != undefined do (
						file = createFile (pathConfig.appendPath loc "ErrorReport.txt")
						if file != undefined do format report to:file  --edxErr.text
						close file
					)
				)
			)
			
			ErrorReportRollout.owner = this
			
			if converterTempData.errorBuffer.count != 0 do (
				createDialog ErrorReportRollout
			)
			converterTempData.errorBuffer=#()
			converterTempData.conversionTimeInfo=#()
		),
		
		fn errorCatching functionName orig =(
			errcls = classof orig
			if converterSettings.useTryCatchBugReporting then(
				try(
					out = functionName orig
				)catch(
					append converterTempData.errorBuffer ("Error occured in " + errcls as string + " : " + orig as string + "\r\n" + getCurrentException() ) 
					out = orig
				)
			)else(
				out = functionName orig
			)
			out
		),
		
		fn getGlossyConversionOutputMap type =(
			/*  
				Most of the code in this function is taken from the cg-talk thread 
				"Is it possible To Create and Edit Output Map Curve?"
				http://forums.cgsociety.org/showthread.php?f=98&t=993502  
				Thanks goes to denisT for sharing these great tech tips.
			*/
			outputmap = undefined
			backupMtl = undefined
			selectedSlot = undefined
			isEditOpen = undefined
			
			try(destroydialog easyCCurve) catch()
			rollout easyCCurve "Easy CCurve" width:208 height:215
			(
				fn mouseWindowMove hwnd x y sx sy =
				(
					fn makeParam LoWord HiWord =
					(
						bit.or (bit.shift HiWord 16) (bit.and LoWord 0xFFFF)
					)
					WM_LBUTTONDOWN 	= 0x0201
					WM_LBUTTONUP 	= 0x0202
					WM_MOUSEMOVE	= 0x0200
					MK_LBUTTON	  = 0x0001
					
					p0 = makeParam x y
					p1 = makeParam (x+sx) (y+sy)
					
					uiaccessor.sendmessage hwnd WM_LBUTTONDOWN 0 p0 
					uiaccessor.sendmessage hwnd WM_MOUSEMOVE MK_LBUTTON p1 
					uiaccessor.sendmessage hwnd WM_LBUTTONUP 0 p1 
				)
				curveControl cc numcurves:1 width:200 height:200 pos:[4,4] \
					zoomvalues:[200,100] scrollvalues:[4,2] uiFlags:#() rcmFlags:#()
			)
			createdialog easyCCurve style:#() pos:[-1000,300]
			
			with redraw off
			(
				d_hwnd = (windows.getChildHWND 0 easyCCurve.title)[1]
				c_hwnd = for w in (windows.getChildrenHWND d_hwnd) where w[4] == "DefCurveWindow" do exit with w[1]
				
				cc = easyCCurve.cc.curves[1]
				cc.color = black
				cc.numpoints = 4
				
				pp = easyCCurve.cc.curves[1].points
				pp.selected = on
				
				case type of ( 
					#VrayGgxToClampedGgx: (  -- depreciated
						cc.numpoints = 4
						pp = easyCCurve.cc.curves[1].points
						pp.selected = on
						
						pp[1].value = [0,0.017]	
						
						pp[2].value = [0.38,0.01]	
						pp[2].outtangent = [0.01,0.135]
						
						pp[3].value = [0.65,0.375]	
						pp[3].intangent = [-0.25,-0.175]
						pp[3].outtangent = [0.25,0.175]
						
						pp[4].value = [1.0,1.0]
						pp[4].intangent = [-0.06,-0.06]
					)
					#fStormToCorona: (
						cc.numpoints = 4
						pp = easyCCurve.cc.curves[1].points
						pp.selected = on
						
						pp[1].value = [0,0.017]	
						
						pp[2].value = [0.38,0.01]	
						pp[2].outtangent = [0.01,0.135]
						
						pp[3].value = [0.65,0.375]	
						pp[3].intangent = [-0.25,-0.175]
						pp[3].outtangent = [0.25,0.175]
						
						pp[4].value = [1.0,1.0]
						pp[4].intangent = [-0.06,-0.06]
					)
					default: (  -- vray blinn to corona ggx (new)
						cc.numpoints = 3
						pp = easyCCurve.cc.curves[1].points
						pp.selected = on
						
						pp[1].value = [0,0.01]	
						
						pp[2].value = [0.19,0.01]	
						pp[2].outtangent = [0.45,0.48]
						
						pp[3].value = [1.0,1.0]
						pp[3].intangent = [-0.16,-0.25]
					)
					
				)
				
				
				-- make backups
				backupMtl = meditmaterials[1]
				selectedSlot = medit.GetActiveMtlSlot()
				isEditOpen = MatEditor.isOpen()
				matEditorMode = MatEditor.mode 
				--mateditor.close()
				
				if matEditorMode == #advanced then (
					MatEditor.mode = #basic
				)
				
				-- Make Output Map
				outputmap = output name:"GlossyConversionBlinnToGGX"
				medit.PutMtlToMtlEditor outputmap 1
				medit.SetActiveMtlSlot 1 on
					
				-- Init Mono_Color_Map 
				
				mateditor.open()
				c = windows.getchildhwnd (windows.getchildhwnd 0 ("Material Editor - " + outputmap.name))[1] "Enable Color Map"
					
				BM_SETCHECKED = 0x00F1
				UIAccessor.SendMessage c[1] BM_SETCHECKED 1 0
				UIAccessor.PressButton c[1]
					
				-- Replace Curve
				replaceinstances outputmap.output.Mono_Color_Map.curve_1 easyCCurve.cc.curves[1][1].parent
				--medit.SetActiveMtlSlot 1 on
					
				-- restore backups
				medit.PutMtlToMtlEditor backupMtl 1
				medit.SetActiveMtlSlot selectedSlot on
				if not isEditOpen do MatEditor.Close()
				MatEditor.mode = matEditorMode
			)
			destroydialog easyCCurve
			free easyCCurve
			
			outputmap
		),
		
		
		-- structs containing conversion methods for mtl, map, light classes
		matConvMethods =(
			struct matConvMethods 
			(
				owner,
				
				-- ############## Standard Material ################
				fn convertFrom_Standard origMtl =(
					r=CoronaMtl()
					r.name=(if owner.converterSettings.addCoronaPrefix then owner.converterSettings.userPrefixStr else "") + origMtl.name
					
					origMtl.shaderType = 1 -- make sure standard mat shader type is set to default blinn
					
					--Diffuse
					r.levelDiffuse=1.0 
					r.colorDiffuse=origMtl.diffuse 
					r.texmapDiffuse=origMtl.diffuseMap 
					if r.texmapDiffuse != undefined then(
						r.texmapOnDiffuse=origMtl.diffuseMapEnable 
						r.mapamountDiffuse=origMtl.diffuseMapAmount --/ 100.0 
					)
					
					--Reflection
					if owner.converterSettings.standardMatSpecToRefl then(
						r.levelReflect = (if origMtl.specularLevel > 100.0 then 1.0 else origMtl.specularLevel / 100.0)
						r.colorReflect = origMtl.specular
						r.reflectGlossiness = sqrt (origMtl.glossiness / 100.0)
						
						r.texmapReflect = origMtl.specularLevelMap  -- default: uses specular level for reflection..
						if r.texmapReflect != undefined then(
							r.texmapOnReflect = origMtl.specularLevelMapEnable 
							r.mapamountReflect = origMtl.specularLevelMapAmount --/ 100.0 
						)
						
						if origMtl.reflectionMap != undefined do (  -- but will override if reflection map is supplied
							r.texmapReflect = origMtl.reflectionMap 
							if r.texmapReflect != undefined then(
								r.texmapOnReflect = origMtl.reflectionMapEnable 
								r.mapamountReflect = origMtl.reflectionMapAmount --/ 100.0 
							)
						)
						r.texmapReflectGlossiness = origMtl.glossinessMap 
						if r.texmapReflectGlossiness != undefined then(
							r.texmapOnReflectGlossiness = origMtl.glossinessMapEnable 
							r.mapamountReflectGlossiness = origMtl.glossinessMapAmount --/ 100.0 
						)
						
						if r.texmapReflectGlossiness == undefined and r.texmapReflect == undefined and r.levelReflect == 0.0 and abs(origMtl.glossiness - 10.0) < 0.01 then(
							r.reflectGlossiness = 1.0
						)
					)
					
					--Refraction
					r.texmapRefract = origMtl.refractionMap 
					if r.texmapRefract != undefined then(
						r.levelRefract = 1.0 
						r.colorRefract = color 0 0 0
						r.texmapOnRefract = origMtl.refractionMapEnable 
						r.mapamountRefract = origMtl.refractionMapAmount --/ 100.0 
					)
					r.ior = if origMtl.ior < 1.0 then 1.0 else origMtl.ior
					
					--Bumpmap
					r.texmapBump=origMtl.bumpMap 
					if r.texmapBump != undefined then(
						if classof r.texmapBump == Normal_Bump or classof r.texmapBump == CoronaNormal then(
							r.texmapOnBump=origMtl.bumpMapEnable 
							r.mapamountBump= (origMtl.bumpMapAmount / 100.0)
						)else(
							r.texmapOnBump=origMtl.bumpMapEnable 
							r.mapamountBump= (origMtl.bumpMapAmount / 100.0) * 3.5
						)
					)
					
					--Opacity
					r.levelOpacity= origMtl.opacity / 100.0 
					r.colorOpacity=(color 255 255 255)
					r.texmapOpacity=origMtl.opacityMap 
					if r.texmapOpacity != undefined then(
						r.texmapOnOpacity=origMtl.opacityMapEnable 
						r.mapamountOpacity=origMtl.opacityMapAmount --/ 100.0 
					)
					
					--Emission
					r.levelSelfIllum = if origMtl.useSelfIllumColor then 1.0 else (origMtl.selfIllumAmount /100.0) 
					r.colorSelfIllum =  if origMtl.useSelfIllumColor then origMtl.selfIllumColor else r.colorDiffuse 
					r.texmapSelfIllum = origMtl.selfillumMap 
					if r.texmapSelfIllum != undefined then(
						r.texmapOnSelfIllum = origMtl.selfillumMapEnable 
						r.mapamountSelfIllum = origMtl.selfillumMapAmount --/ 100.0 
					)
					else(
						if origMtl.useSelfIllumColor == false AND origMtl.selfIllumAmount != 0 then(
							r.colorSelfIllum = r.colorDiffuse
							if r.texmapOnDiffuse then(r.texmapSelfIllum = r.texmapDiffuse; r.texmapOnSelfIllum = true)
						)
					)
					
					--Displacement
					r.texmapDisplace=origMtl.displacementMap 
					if r.texmapDisplace != undefined then(
						r.texmapOnDisplacement=origMtl.displacementMapEnable 
					)
					
					r
					
				),
				
				-- ############## Create Default Corona Material ################
				fn CreateDefaultCoronaMtl origMtl =(
					r=CoronaMtl()
					r.name=(if owner.converterSettings.addCoronaPrefix then owner.converterSettings.userPrefixStr else "") + origMtl.name
					r
				),

				-- ############## FStorm Material ################
				fn convertFrom_FStorm origMtl =(
					
					fn getfStormGlossiness vrGlossVal curve =(
						local out
						local run = true
						local closest = 100.0
						
						if vrGlossVal < 0.0 then( out = 0.0; run = false)
						if vrGlossVal > 1.0 then( out = 1.0; run = false)
						
						for dataPoint in curve while run do(
							local diff = (abs (vrGlossVal - dataPoint.x))
							if diff > closest then(
								run = false
							)else(
								closest = diff
								out = dataPoint.y
							)
						)
						out
					)
					
					r=CoronaMtl()
					r.name=(if owner.converterSettings.addCoronaPrefix then owner.converterSettings.userPrefixStr else "") + origMtl.name
					
					--Diffuse
					r.levelDiffuse = origMtl.diff_level 
					r.colorDiffuse = origMtl.Diffuse
					r.texmapDiffuse = origMtl.diffuse_tex
					r.texmapOnDiffuse = origMtl.diffuse_tex_on 
					r.mapamountDiffuse = origMtl.diffuse_tex_pow
					
					--Reflection
					if origMtl.Reflection.value == 0 and origMtl.reflection_tex == undefined then
					(
						r.levelReflect = 0
					)
					r.levelReflect = origMtl.refl_level
					r.colorReflect = origMtl.Reflection
					r.texmapReflect = origMtl.reflection_tex
					r.texmapOnReflect = origMtl.reflection_tex_on
					r.mapamountReflect = origMtl.reflection_tex_pow
					
					--IOR
					r.fresnelIor = origMtl.ior
					r.texmapFresnelIor = origMtl.ior_tex
					r.texmapOnFresnelIor = origMtl.ior_tex_on
					r.mapamountFresnelIor = origMtl.ior_tex_pow
					
					--Reflection Glossiness
					if origMtl.refl_glossiness_invert == on then
					(
						r.reflectGlossiness = getfStormGlossiness (1 - origMtl.refl_glossiness) owner.converterSettings.fStormToCoronaTable 
					)
					else
					(
						r.reflectGlossiness = getfStormGlossiness origMtl.refl_glossiness owner.converterSettings.fStormToCoronaTable 
					)
					r.texmapReflectGlossiness = origMtl.reflection_glossy_tex
					r.texmapOnReflectGlossiness = origMtl.reflection_glossy_tex_on
					r.mapamountReflectGlossiness = origMtl.reflection_glossy_tex_pow
					
					--Refraction
					if origMtl.Refraction.value == 0 and origMtl.refraction_tex == undefined then
					(
						r.levelRefract = 0
					)
					else
					r.levelRefract = origMtl.refr_level
					r.colorRefract = origMtl.Refraction
					r.texmapRefract = origMtl.refraction_tex
					r.texmapOnRefract = origMtl.refraction_tex_on
					r.mapamountRefract = origMtl.refraction_tex_pow

					--Dispersion
					if origMtl.refr_dispersion > 0 then
					(
						r.refractDispersionEnable =  on
					)
					
					-- Refraction Glossiness
					if origMtl.refr_glossiness_invert == on then
					(
						r.refractGlossiness = 1 - origMtl.refr_glossiness
					)
					else
					(
						r.refractGlossiness = origMtl.refr_glossiness
					)
					r.texmapRefractGlossiness = origMtl.refraction_glossy_tex
					r.texmapOnRefractGlossiness = origMtl.refraction_glossy_tex_on
					r.mapamountRefract = origMtl.refraction_glossy_tex_pow

					--Opacity
					r.levelOpacity = origMtl.opacity
					r.texmapOpacity = origMtl.opacity_tex
					
					--Bumpmap
					if origMtl.bump_extra_mult == 0 then
					(
						r.mapamountBump = origMtl.bump_texture_amount
					)
					else if origMtl.bump_extra_mult == 1 then
					(
						r.mapamountBump = origMtl.bump_texture_amount / 10
					)
					else if origMtl.bump_extra_mult == 2 then
					(
						r.mapamountBump = origMtl.bump_texture_amount / 100
					)
					else if origMtl.bump_extra_mult == 3 then
					(
						r.mapamountBump = origMtl.bump_texture_amount / 1000
					)
					r.texmapOnBump = origMtl.bump_texture_on
					r.texmapBump = origMtl.bump_texture

					--Absorption
					r.absorptionDistance = origMtl.volume_distance
					r.absorptionColor = origMtl.volume_absorption
					r.scatterColor = origMtl.volume_scattering

					--Translucency
					if origMtl.translucence.value == 0 and origMtl.translucence_tex == undefined then
					(
						r.levelTranslucency = 0
					)
					else
					r.levelTranslucency = origMtl.traslucence_level * 0.4
					r.colorTranslucency = origMtl.translucence
					r.texmapOnTranslucency = origMtl.translucence_tex_on
					r.texmapTranslucency = origMtl.translucence_tex
					r.mapamountTranslucency = origMtl.translucence_tex_pow

					--SelfIllumination
					r.levelSelfIllum = origMtl.emission_power
					r.colorSelfIllum = origMtl.emission
					r.texmapOnSelfIllum = origMtl.emission_texture_on
					r.texmapSelfIllum = origMtl.emission_texture
					r.mapamountSelfIllum = origMtl.emission_texture_amount
					
					r
				),
				
				-- ############## FStorm Mix Material ################
				fn convertFrom_FStormMixMat origMtl =(
										
					r=CoronaLayeredMtl()
					r.name=(if owner.converterSettings.addCoronaPrefix then owner.converterSettings.userPrefixStr else "") + origMtl.name
					
					r.baseMtl = origMtl.material1
					r.Layers[1] = origMtl.material2
					r.mixmaps[1] = origMtl.mixTexture
					
					r.masksOn[1] = origMtl.mixtexture_on
					r.maskAmounts[1] = origMtl.mixvalue
					
					r
				),
				
				-- ############## FStorm Override Material ################
				fn convertFrom_FStormOverrideMat origMtl =(
										
					r=CoronaRaySwitchMtl()
					r.name=(if owner.converterSettings.addCoronaPrefix then owner.converterSettings.userPrefixStr else "") + origMtl.name
					
					r.directMtl = origMtl.base
					r.giMtl = origMtl.GI
					r.reflectMtl = origMtl.Reflection
					r.refractMtl = origMtl.Refraction
					
					r
				),
				
				-- ############## FStorm Portal Material ################
				fn convertFrom_FStormPortal origMtl =(
										
					r=CoronaPortalMtl()
					r.name=(if owner.converterSettings.addCoronaPrefix then owner.converterSettings.userPrefixStr else "") + origMtl.name
					
					r
				),
				
				-- ############## Vray Material ################
				fn convertFrom_VrayMtl origMtl =(
					fn getMaxIOR =(
						if owner.converterSettings.clampIor then(
							owner.converterSettings.clampIorAmount
						)else( 999.0 )		
					)
					
					fn getCoronaGlossiness vrGlossVal curve =(
						local out
						local run = true
						local closest = 100.0
						
						if vrGlossVal < 0.0 then( out = 0.0; run = false)
						if vrGlossVal > 1.0 then( out = 1.0; run = false)
						
						for dataPoint in curve while run do(
							local diff = (abs (vrGlossVal - dataPoint.x))
							if diff > closest then(
								run = false
							)else(
								closest = diff
								out = dataPoint.y
							)
						)
						out
					)
					
					r=CoronaMtl()
					r.name=(if owner.converterSettings.addCoronaPrefix then owner.converterSettings.userPrefixStr else "") + origMtl.name
					
					--Diffuse
					r.levelDiffuse = 1.0 
					r.colorDiffuse = origMtl.diffuse 
					r.texmapDiffuse = origMtl.texmap_diffuse 
					if r.texmapDiffuse != undefined then(
						r.texmapOnDiffuse = origMtl.texmap_diffuse_on 
						r.mapamountDiffuse = origMtl.texmap_diffuse_multiplier --/ 100.0 
					)
					
					--Reflection
					if origMtl.reflection == black and origMtl.texmap_reflection == undefined then(  -- to preserve CoronaMtl defaults, if no map is used and color is black -> default coronaMtl
						r.levelReflect = 0.0
						r.colorReflect = white
					)else( -- for all other cases, set reflection level to 1.0
						r.levelReflect = 1.0
						r.colorReflect = origMtl.reflection 
					)
					r.texmapReflect = origMtl.texmap_reflection 
					if r.texmapReflect != undefined then(
						r.texmapOnReflect = origMtl.texmap_reflection_on 
						r.mapamountReflect = origMtl.texmap_reflection_multiplier --/ 100.0 
					)
					
					if origMtl.reflection_lockIOR then(
						r.fresnelIor = if origMtl.refraction_ior < 1.0 then 1.0 else origMtl.refraction_ior
					)
					else(
						r.fresnelIor = if origMtl.reflection_ior < 1.0 then 1.0 else origMtl.reflection_ior
					)
					if origMtl.reflection_fresnel == false then(
						r.fresnelIor = getMaxIOR() -- normally 999.0 for non-fresnel-activated mats --can be overridden by user
					)
					r.texmapFresnelIor = origMtl.texmap_reflectionIOR 
					if r.texmapFresnelIor != undefined then(
						r.texmapOnFresnelIor = origMtl.texmap_reflectionIOR_on 
						r.mapamountFresnelIor = origMtl.texmap_reflectionIOR_multiplier 
					)
					
					--Reflection Glossiness
					if origMtl.brdf_type == 4 then( -- Vray GGX
						r.reflectGlossiness = origMtl.reflection_glossiness
					)else( -- all others -> default Blinn
						if owner.converterSettings.vrayUseAdvBlinnToCoronaGgxConversion then( 
							r.reflectGlossiness = getCoronaGlossiness origMtl.reflection_glossiness owner.converterSettings.vrayBlinnToCoronaGgxTable 
						)else(
							r.reflectGlossiness = origMtl.reflection_glossiness
						) 
					)
					
					r.reflectGlossiness = (r.reflectGlossiness * 100) as integer / 100.0 -- clamps to 2 decimals
					r.texmapReflectGlossiness = origMtl.texmap_reflectionGlossiness 
					if r.texmapReflectGlossiness != undefined then(
						if origMtl.brdf_type != 4 and owner.converterSettings.vrayUseAdvBlinnToCoronaGgxConversion then( -- everything not vray ggx
							outmp
							
							if owner.converterTempData.glossyConversionOutputMapVrayBlinnCoronaClGgx == undefined do(
								owner.converterTempData.glossyConversionOutputMapVrayBlinnCoronaClGgx = owner.getGlossyConversionOutputMap #VrayBlinnToCoronaGgx
							)
							outmp = copy owner.converterTempData.glossyConversionOutputMapVrayBlinnCoronaClGgx
							
							outmp.map1 = r.texmapReflectGlossiness
							r.texmapReflectGlossiness = outmp
						)
						
						r.texmapOnReflectGlossiness = origMtl.texmap_reflectionGlossiness_on 
						r.mapamountReflectGlossiness = origMtl.texmap_reflectionGlossiness_multiplier --/ 100.0 
					)
					
					--Refraction
					if origMtl.refraction == black and origMtl.texmap_refraction == undefined then( -- to preserve CoronaMtl defaults, if no map is used and color is black -> default coronaMtl
						r.levelRefract = 0.0
						r.colorRefract = white
					)else( -- for all other cases, set refraction level to 1.0
						r.levelRefract = 1.0 
						r.colorRefract = origMtl.refraction 
					)
					r.texmapRefract = origMtl.texmap_refraction 
					if r.texmapRefract != undefined then(
						r.texmapOnRefract = origMtl.texmap_refraction_on 
						r.mapamountRefract = origMtl.texmap_refraction_multiplier --/ 100.0 
					)
					r.ior = if origMtl.refraction_ior < 1.0 then 1.0 else(if origMtl.refraction_ior > 10.0 then 10.0 else origMtl.refraction_ior)
					
					r.texmapIor = origMtl.texmap_refractionIOR      
					if r.texmapIor != undefined then(
						r.texmapOnIor = origMtl.texmap_refractionIOR_on 
						r.mapamountIor = origMtl.texmap_refractionIOR_multiplier 
					)
					
					
					-- Refraction Glossiness
					if origMtl.brdf_type == 4 then( -- Vray GGX
						r.refractGlossiness = origMtl.refraction_glossiness
					)else( -- all others -> default Blinn
						if owner.converterSettings.vrayUseAdvBlinnToCoronaGgxConversion then(
							r.refractGlossiness = getCoronaGlossiness origMtl.refraction_glossiness owner.converterSettings.vrayBlinnToCoronaGgxTable 
						) else(
							r.refractGlossiness = origMtl.refraction_glossiness
						)
					)
					
					
					r.refractGlossiness = (r.refractGlossiness * 100) as integer / 100.0 -- clamps to 2 decimals
					r.texmapRefractGlossiness = origMtl.texmap_refractionGlossiness 
					if r.texmapRefractGlossiness != undefined then(
						if origMtl.brdf_type != 4 and owner.converterSettings.vrayUseAdvBlinnToCoronaGgxConversion then (
							outmp
							
							if owner.converterTempData.glossyConversionOutputMapVrayBlinnCoronaClGgx == undefined do(
								owner.converterTempData.glossyConversionOutputMapVrayBlinnCoronaClGgx = owner.getGlossyConversionOutputMap #VrayBlinnToCoronaGgx
							)
							outmp = copy owner.converterTempData.glossyConversionOutputMapVrayBlinnCoronaClGgx
							
							outmp.map1 = r.texmapRefractGlossiness
							r.texmapRefractGlossiness = outmp
						)
						
						r.texmapOnRefractGlossiness = origMtl.texmap_refractionGlossiness_on 
						r.mapamountRefractGlossiness = origMtl.texmap_refractionGlossiness_multiplier --/ 100.0 
					)
					
					--Opacity
					r.levelOpacity = 1.0 
					r.colorOpacity = (color 255 255 255) 
					r.texmapOpacity = origMtl.texmap_opacity 
					if r.texmapOpacity != undefined then(
						r.texmapOnOpacity = origMtl.texmap_opacity_on 
						r.mapamountOpacity = origMtl.texmap_opacity_multiplier --/ 100.0 
					)
					
					--Bumpmap
					r.texmapBump = origMtl.texmap_bump 
					if r.texmapBump != undefined then(
						local texmapClass = classof r.texmapBump
						local isNormalMap = (texmapClass == VrayNormalMap or texmapClass == CoronaNormal or texmapClass == Normal_Bump)
						r.texmapOnBump = origMtl.texmap_bump_on 
						r.mapamountBump = (origMtl.texmap_bump_multiplier / 100.0) * (if isNormalMap then 1.0 else owner.converterSettings.vrayBumpMultiplier)
					)					
					
					--Absorption
					if origMtl.refraction_fogColor != white then(
						r.absorptionDistance = 1.0/origMtl.refraction_fogMult 
						r.absorptionColor = origMtl.refraction_fogColor 
					)
					if (hasProperty origMtl "texmap_refraction_fog") then(  -- vray < 2.5
						r.texmapAbsorption = origMtl.texmap_refraction_fog
						if r.texmapAbsorption != undefined then(
							r.absorptionDistance = 1.0/origMtl.refraction_fogMult 
							r.texmapOnAbsorption = origMtl.texmap_refraction_fog_on 
							r.mapamountAbsorption = origMtl.texmap_refraction_fog_multiplier --/ 100.0 
						)
					)
					
					--Translucency
					/*
					if origMtl.translucency_on > 0 then(
						r.scatterDirectionality = ((origMtl.translucency_fbCoeff - 0.5)*2) * -1
						r.scatterColor = origMtl.translucency_color
						r.texmapScatterColor = origMtl.texmap_translucent
						r.mapamountScatterColor = origMtl.texmap_translucent_multiplier
						r.texmapOnScatterColor = origMtl.texmap_translucent_on
					)
					*/
					
					--Anisotropy
					r.anisotropy = origMtl.anisotropy / 2.0 
					if origMtl.anisotropy_derivation == 0 and origMtl.anisotropy_axis == 2 then r.anisotropy = -r.anisotropy  -- flips the orientation
					
					if origMtl.texmap_anisotropy != undefined then(
						r.texmapReflectAnisotropy = output name:"CoronaAdaption" map1:origMtl.texmap_anisotropy rgb_offset:0.5 output_amount:0.5
						if origMtl.anisotropy_derivation == 0 and origMtl.anisotropy_axis == 2 then r.texmapReflectAnisotropy.output.invert = true  -- flips the orientation
					)
					if r.texmapReflectAnisotropy != undefined then(
						r.texmapOnAnisotropy = origMtl.texmap_anisotropy_on 
						r.mapamountAnisotropy = origMtl.texmap_anisotropy_multiplier --/ 100.0 
					)
					r.anisotropyRotation = origMtl.anisotropy_rotation 
					r.texmapReflectAnisotropyRotation = origMtl.texmap_anisotropy_rotation 
					if r.texmapReflectAnisotropyRotation != undefined then(
						r.texmapOnAnisotropyRotation = origMtl.texmap_anisotropy_rotation_on 
						r.mapamountAnisotropyRotation = origMtl.texmap_anisotropy_rotation_multiplier --/ 100.0 
					)
					r.anisotropyOrientationMode = origMtl.anisotropy_derivation
					r.anisotropyOrientationUvwChannel = origMtl.anisotropy_channel
					
					--Displacement
					r.texmapDisplace = origMtl.texmap_displacement 
					if r.texmapDisplace != undefined then(
						r.texmapOnDisplacement = origMtl.texmap_displacement_on
						if owner.converterSettings.clampDisp then r.displacementMaximum = owner.converterSettings.clampDispAmount
					)
					
					--SelfIllumination
					if hasProperty origMtl #selfIllumination then(
						if origMtl.selfIllumination == black and origMtl.texmap_self_illumination == undefined and origMtl.selfIllumination_multiplier == 1.0 then() else(
							r.levelSelfIllum = origMtl.selfIllumination_multiplier 
							r.colorSelfIllum = origMtl.selfIllumination
							r.texmapSelfIllum = origMtl.texmap_self_illumination 
							if r.texmapSelfIllum != undefined then(
								r.texmapOnSelfIllum = origMtl.texmap_self_illumination_on 
								r.mapamountSelfIllum = origMtl.texmap_self_illumination_multiplier --/ 100.0 
							)
						)
					)
					
					r
				),
				
				-- ############## VRay Carpaint Material ################
				fn convertFrom_VRayCarPaintMtl origMtl =(
					cpbaseMtl=CoronaMtl()
					cpbaseMtl.name = (if owner.converterSettings.addCoronaPrefix then owner.converterSettings.userPrefixStr else "") + origMtl.name
					if origMtl.coat_strength > 0.0 then(
						cpbaseMtl.name = (if owner.converterSettings.addCoronaPrefix then owner.converterSettings.userPrefixStr else "") + (origMtl.name + "_Base")
						cpCoatMtl=CoronaMtl()
						cpCoatMtl.name = (if owner.converterSettings.addCoronaPrefix then owner.converterSettings.userPrefixStr else "") + (origMtl.name + "_Coat")
						cpBlendMtl=Blend()
						cpBlendMtl.name = (if owner.converterSettings.addCoronaPrefix then owner.converterSettings.userPrefixStr else "") + origMtl.name
					)
					
					--Base Diffuse
					cpbaseMtl.levelDiffuse = 1.0 
					cpbaseMtl.colorDiffuse = origMtl.base_color 
					cpbaseMtl.texmapDiffuse = origMtl.texmap_base_color
					if cpbaseMtl.texmapDiffuse != undefined then(
						cpbaseMtl.texmapOnDiffuse = origMtl.texmap_base_color_on 
						cpbaseMtl.mapamountDiffuse = origMtl.texmap_base_color_multiplier --/ 100.0 
					)
					--Base Reflection
					cpbaseMtl.levelReflect = origMtl.base_reflection 
					cpbaseMtl.colorReflect = origMtl.base_color 
					cpbaseMtl.texmapReflect = origMtl.texmap_base_reflection 
					if cpbaseMtl.texmapReflect != undefined then(
						cpbaseMtl.texmapOnReflect = origMtl.texmap_base_reflection_on 
						cpbaseMtl.mapamountReflect = origMtl.texmap_base_reflection_multiplier --/ 100.0 
					)
					cpbaseMtl.fresnelIor = 50.0 
					cpbaseMtl.reflectGlossiness = (if owner.converterSettings.vrayConvertGlossyValues then(1.0 - sqrt(1.0 - origMtl.base_glossiness)) else(origMtl.base_glossiness) ) 
					cpbaseMtl.texmapReflectGlossiness = origMtl.texmap_base_glossiness 
					if cpbaseMtl.texmapReflectGlossiness != undefined then(
						if owner.converterSettings.vrayConvertGlossyMaps do (
							if owner.converterTempData.glossyConversionOutputMapVrayBlinnCoronaClGgx == undefined do(
								owner.converterTempData.glossyConversionOutputMapVrayBlinnCoronaClGgx = owner.getGlossyConversionOutputMap #VrayBlinnToClampedGgx
							)
							outmp = copy owner.converterTempData.glossyConversionOutputMapVrayBlinnCoronaClGgx
							outmp.map1 = cpbaseMtl.texmapReflectGlossiness
							cpbaseMtl.texmapReflectGlossiness = outmp
						)
						
						cpbaseMtl.texmapOnReflectGlossiness = origMtl.texmap_base_glossiness_on 
						cpbaseMtl.mapamountReflectGlossiness = origMtl.texmap_base_glossiness_multiplier --/ 100.0 
					)
					--Base Bumpmap
					cpbaseMtl.texmapBump = origMtl.texmap_base_bump 
					if cpbaseMtl.texmapBump != undefined then(
						cpbaseMtl.texmapOnBump = origMtl.texmap_base_bump_on 
						cpbaseMtl.mapamountBump = (origMtl.texmap_base_bump_multiplier / 100.0) * owner.converterSettings.vrayBumpMultiplier 
					)
					
					
					if cpBlendMtl != undefined then(
						--Coat Diffuse
						cpCoatMtl.levelDiffuse = 1.0 
						cpCoatMtl.colorDiffuse = (color 0 0 0)  
						--Coat Reflection
						cpCoatMtl.levelReflect = 1.0 
						cpCoatMtl.colorReflect = origMtl.coat_color 
						cpCoatMtl.texmapReflect = origMtl.texmap_coat_color 
						if cpCoatMtl.texmapReflect != undefined then(
							cpCoatMtl.texmapOnReflect = origMtl.texmap_coat_color_on 
							cpCoatMtl.mapamountReflect = origMtl.texmap_coat_color_multiplier --/ 100.0 
						)
						cpCoatMtl.fresnelIor = 25.0 
						cpCoatMtl.reflectGlossiness = (if owner.converterSettings.vrayConvertGlossyValues then(1.0 - sqrt(1.0 - origMtl.coat_glossiness)) else(origMtl.coat_glossiness) ) 
						cpCoatMtl.texmapReflectGlossiness = origMtl.texmap_coat_glossiness 
						if cpCoatMtl.texmapReflectGlossiness != undefined then(
							if owner.converterSettings.vrayConvertGlossyMaps do (
								if owner.converterTempData.glossyConversionOutputMapVrayBlinnCoronaClGgx == undefined do(
									owner.converterTempData.glossyConversionOutputMapVrayBlinnCoronaClGgx = owner.getGlossyConversionOutputMap #VrayBlinnToClampedGgx
								)
								outmp = copy owner.converterTempData.glossyConversionOutputMapVrayBlinnCoronaClGgx
								outmp.map1 = cpCoatMtl.texmapReflectGlossiness
								cpCoatMtl.texmapReflectGlossiness = outmp
							)
							
							cpCoatMtl.texmapOnReflectGlossiness = origMtl.texmap_coat_glossiness_on 
							cpCoatMtl.mapamountReflectGlossiness = origMtl.texmap_coat_glossiness_multiplier --/ 100.0 
						)
						--Coat Bumpmap
						cpCoatMtl.texmapBump = origMtl.texmap_coat_bump 
						if cpCoatMtl.texmapBump != undefined then(
							cpCoatMtl.texmapOnBump = origMtl.texmap_coat_bump_on 
							cpCoatMtl.mapamountBump = origMtl.texmap_coat_bump_multiplier / 100.0 
						)
						
						cpBlendMtl.MAP1 = cpbaseMtl
						cpBlendMtl.MAP2 = cpCoatMtl
						cpBlendMtl.mixAmount = origMtl.coat_strength*100.0
						if origMtl.texmap_coat_strength != undefined then(
							cpBlendMtl.maskEnabled = origMtl.texmap_coat_strength_on 
							cpBlendMtl.Mask = origMtl.texmap_coat_strength
						)
						
						cpBlendMtl
					)
					else(
						cpbaseMtl
					)
				),
				
				-- ############## MR Car_Paint_Material ################ 
				fn convertFrom_MRCarPaintMaterial origMtl =(
					cpbaseMtl=CoronaMtl()
					cpbaseMtl.name = (if owner.converterSettings.addCoronaPrefix then owner.converterSettings.userPrefixStr else "") + (origMtl.name + "_Base")
					cpCoatMtl=CoronaMtl()
					cpCoatMtl.name = (if owner.converterSettings.addCoronaPrefix then owner.converterSettings.userPrefixStr else "") + (origMtl.name + "_Coat")
					cpBlendMtl=Blend()
					cpBlendMtl.name = (if owner.converterSettings.addCoronaPrefix then owner.converterSettings.userPrefixStr else "") + origMtl.name
					
					--Base Diffuse
					cpbaseMtl.levelDiffuse = 1.0 
					cpbaseMtl.colorDiffuse = (color 0 0 0)
					cpbaseMtl.texmapDiffuse = falloff() 
					cpbaseMtl.texmapOnDiffuse = true
					cpbaseMtl.texmapDiffuse.color1 = origMtl.base_color
					cpbaseMtl.texmapDiffuse.color2 = origMtl.edge_color
					cpbaseMtl.texmapDiffuse.MAP1 = origMtl.base_color_shader
					cpbaseMtl.texmapDiffuse.MAP2 = origMtl.edge_color_shader
					
					--Base Reflection
					cpbaseMtl.levelReflect = 1.0 
					cpbaseMtl.texmapReflect = cpbaseMtl.texmapDiffuse
					cpbaseMtl.fresnelIor = 2.5 
					cpbaseMtl.reflectGlossiness = 0.3
					
					--Coat Diffuse
					cpCoatMtl.levelDiffuse = 1.0 
					cpCoatMtl.colorDiffuse = (color 0 0 0) 
					--Coat Reflection
					cpCoatMtl.levelReflect = 1.0 
					cpCoatMtl.colorReflect = origMtl.reflection_color 
					cpCoatMtl.fresnelIor = 2.5 
					
					cpBlendMtl.MAP1 = cpbaseMtl
					cpBlendMtl.MAP2 = cpCoatMtl
					cpBlendMtl.mixAmount = 20.0
					
					cpBlendMtl
				),
				
				-- ############## MR_ArchAndDesign Material ################
				fn convertFrom_ArchAndDesign origMtl =(
					r=CoronaMtl()
					r.name=(if owner.converterSettings.addCoronaPrefix then owner.converterSettings.userPrefixStr else "") + origMtl.name
					
					--Diffuse
					r.levelDiffuse = origMtl.diff_weight 
					r.colorDiffuse = (color origMtl.diff_color.r origMtl.diff_color.g origMtl.diff_color.b)  -- is not converting rgba colors, therefore r,g,b seperation 
					r.texmapDiffuse = origMtl.diff_color_map 
					if r.texmapDiffuse != undefined then(
						r.texmapOnDiffuse = origMtl.diff_color_map_on 
					)
					
					--Reflection
					r.levelReflect = origMtl.refl_weight 
					r.colorReflect = (color origMtl.refl_color.r origMtl.refl_color.g origMtl.refl_color.b) 
					r.texmapReflect = origMtl.refl_color_map 
					if r.texmapReflect != undefined then(
						r.texmapOnReflect = origMtl.refl_color_map_on  
					)
					r.fresnelIor = if origMtl.refr_ior < 1.0 then 1.0 else origMtl.refr_ior  -- must use refraction ior since there is no seperate ior setting for reflection, maybe i'll add some "conversion" later 
					r.texmapFresnelIor = origMtl.refr_ior_map 
					if r.texmapFresnelIor != undefined then(
						r.texmapOnFresnelIor = (origMtl.refr_ior_map_on AND origMtl.refl_func_fresnel)  -- only active when global ior map on AND brdf radiobutton set to "by IOR"  
					)
					r.reflectGlossiness = origMtl.refl_gloss   
					r.texmapReflectGlossiness = origMtl.refl_gloss_map 
					if r.texmapReflectGlossiness != undefined then(
						r.texmapOnReflectGlossiness = origMtl.refl_gloss_map_on 
					)
					
					--Refraction
					r.levelRefract = origMtl.refr_weight 
					r.colorRefract = (color origMtl.refr_color.r origMtl.refr_color.g origMtl.refr_color.b) 
					r.texmapRefract = origMtl.refr_color_map 
					if r.texmapRefract != undefined then(
						r.texmapOnRefract = origMtl.refr_color_map_on  
					)
					r.ior = if origMtl.refr_ior < 1.0 then 1.0 else(if origMtl.refr_ior > 10.0 then 10.0 else origMtl.refr_ior) 
					r.texmapIor = origMtl.refr_ior_map 
					if r.texmapIor != undefined then(
						r.texmapOnIor = origMtl.refr_color_map_on 
					)
					r.refractGlossiness = origMtl.refr_gloss 
					r.texmapRefractGlossiness = origMtl.refr_gloss_map 
					if r.texmapRefractGlossiness != undefined then(
						r.texmapOnRefractGlossiness = origMtl.refr_gloss_map_on 
					)
					
					-- Glassmode
					if origMtl.opts_1sided == off then() else r.thin = true
					
					--Translucency
					if origMtl.refr_trans_on == false then(
						r.levelTranslucency = 0.0
					)
					else(
						--r.levelTranslucency = origMtl.refr_transw
						r.levelTranslucency = origMtl.refr_weight
						r.levelRefract = (1- origMtl.refr_transw)
					)
					r.colorTranslucency = (color origMtl.refr_transc.r origMtl.refr_transc.g origMtl.refr_transc.b) 
					r.texmapTranslucency = origMtl.refr_transc_map 
					if r.texmapTranslucency != undefined then(
						r.texmapOnTranslucency = origMtl.refr_transc_map_on 
					)
					
					--Opacity
					r.levelOpacity = 1.0 
					r.colorOpacity = (color 255 255 255) 
					r.texmapOpacity = origMtl.cutout_map 
					if r.texmapOpacity != undefined then(
						r.texmapOnOpacity = origMtl.cutout_map_on 
					)
					
					--Emission
					if origMtl.self_illum_on then r.levelSelfIllum = origMtl.self_illum_int_arbitrary 
					r.colorSelfIllum = (color origMtl.self_illum_color_filter.r origMtl.self_illum_color_filter.g origMtl.self_illum_color_filter.b)
					r.texmapSelfIllum = origMtl.self_illum_map 
					if r.texmapSelfIllum != undefined then(
						r.texmapOnSelfIllum = origMtl.self_illum_map_on 
					)
					
					--Bumpmap
					r.texmapBump = origMtl.bump_map 
					if r.texmapBump != undefined then(
						r.texmapOnBump = origMtl.bump_map_on 
						r.mapamountBump = origMtl.bump_map_amt 
					)
					
					--RoundedCorners
					if origMtl.opts_round_corners_on then(
						local rcmap = CoronaRoundEdges()
						rcmap.radius = origMtl.opts_round_corners_radius
						rcmap.mapAdditionalBump = r.texmapBump
						rcmap.mapOnAdditional = r.texmapOnBump
						r.texmapBump = rcmap
					)
					
					--Anisotropy
					r.anisotropy = if origMtl.anisotropy >= 1.0 then((origMtl.anisotropy-1.0)/9.0)else(origMtl.anisotropy-1.0)   
					r.texmapReflectAnisotropy = origMtl.anisotropy_map 
					if r.texmapReflectAnisotropy != undefined then(
						r.texmapOnAnisotropy = origMtl.anisotropy_map_on 
					)
					r.anisotropyRotation = origMtl.anisoangle 
					r.texmapReflectAnisotropyRotation = origMtl.anisoangle_map 
					if r.texmapReflectAnisotropyRotation != undefined then(
						r.texmapOnAnisotropyRotation = origMtl.anisoangle_map_on 
					)
					--Displacement
					r.texmapDisplace = origMtl.displacement_map 
					if r.texmapDisplace != undefined then(
						r.texmapOnDisplacement = origMtl.displacement_map_on 
						if owner.converterSettings.clampDisp then r.displacementMaximum = owner.converterSettings.clampDispAmount
					)
					
					r
				),
				
				-- ############## fR Advanced Material ################
				fn convertFrom_fR_Advanced origMtl =(
					r=CoronaMtl()
					r.name=(if owner.converterSettings.addCoronaPrefix then owner.converterSettings.userPrefixStr else "") + origMtl.name
					
					--Diffuse
					r.levelDiffuse = if origMtl.diffuseMultiplier > 100.0 then(1.0) else (origMtl.diffuseMultiplier / 100.0) 
					r.colorDiffuse = origMtl.diffuseColor 
					r.texmapDiffuse = origMtl.diffuseMap 
					if r.texmapDiffuse != undefined then(
						r.texmapOnDiffuse = origMtl.useDiffuseMap
						r.mapamountDiffuse = origMtl.diffuseMapAmount --/100.0 
					)
					
					--Reflection
					r.levelReflect = 1.0 
					r.colorReflect = origMtl.reflectFilter 
					r.texmapReflect = origMtl.reflectMap 
					if r.texmapReflect != undefined then(
						r.texmapOnReflect = origMtl.useReflectMap 
						r.mapamountReflect = origMtl.reflectMapAmount --/ 100.0 
					)
					r.fresnelIor = if origMtl.reflectIOR < 1.0 then 1.0 else origMtl.reflectIOR 
					r.texmapFresnelIor = origMtl.reflectIORMap 
					if r.texmapFresnelIor != undefined then(
						r.texmapOnFresnelIor = origMtl.useReflectIORMap 
						r.mapamountFresnelIor = origMtl.reflectIORMapAmount --/ 100.0 
					)
					r.reflectGlossiness = (1.0-(origMtl.reflectGlossy /100.0)) 
					r.texmapReflectGlossiness = origMtl.reflectBlurryMap 		-- !! Might want to add a invert map here to match others engines 1-0 range !!
					if r.texmapReflectGlossiness != undefined then(
						r.texmapOnReflectGlossiness = origMtl.useReflectBlurryMap 
						r.mapamountReflectGlossiness = origMtl.reflectBlurryMapAmount --/ 100.0 
					)
					
					--Refraction
					r.levelRefract = 1.0 
					r.colorRefract = origMtl.refractFilter 
					r.texmapRefract = origMtl.refractMap 
					if r.texmapRefract != undefined then(
						r.texmapOnRefract = origMtl.useRefractMap 
						r.mapamountRefract = origMtl.refractMapAmount --/ 100.0
					)
					r.ior = if origMtl.refractIOR < 1.0 then 1.0 else(if origMtl.refractIOR > 10.0 then 10.0 else origMtl.refractIOR) 
					r.texmapIor = origMtl.refractIORMap 
					if r.texmapIor != undefined then(
						r.texmapOnIor = origMtl.useRefractIORMap 
						r.mapamountIor = origMtl.refractIORMapAmount --/ 100.0 
					)
					r.refractGlossiness = (1.0-(origMtl.refractGlossy /100.0))
					r.texmapRefractGlossiness = origMtl.refractBlurryMap 
					if r.texmapRefractGlossiness != undefined then(
						r.texmapOnRefractGlossiness = origMtl.useRefractBlurryMap 
						r.mapamountRefractGlossiness = origMtl.refractBlurryMapAmount --/ 100.0 
					)
					
					--Opacity
					r.levelOpacity = 1.0 
					r.colorOpacity = (color 255 255 255) 
					r.texmapOpacity = origMtl.opacityMap
					if r.texmapOpacity != undefined then(
						r.texmapOnOpacity = origMtl.useOpacityMap 
						r.mapamountOpacity = origMtl.opacityMapAmount --/ 100.0 
					)
					
					--Emission
					r.levelSelfIllum = origMtl.selfIllumMultiplier/100.0 
					r.colorSelfIllum = origMtl.selfIllum 
					r.texmapSelfIllum = origMtl.selfillumMap 
					if r.texmapSelfIllum != undefined then(
						r.texmapOnSelfIllum = origMtl.useSelfIllumMap 
						r.mapamountSelfIllum = origMtl.selfillumMapAmount --/100.0 
					)
					
					--Bumpmap
					r.texmapBump = origMtl.bumpMap 
					if r.texmapBump != undefined then(
						r.texmapOnBump = origMtl.useBumpMap 
						r.mapamountBump = origMtl.bumpMapAmount/100.0 
					)
					
					--Absorption
					if origMtl.useRefrAbsorption == true then(
						r.absorptionDistance = origMtl.refrAbsorption 
						r.absorptionColor = origMtl.refrAbsorpColor 
					)
					
					--Anisotropy
					r.anisotropy = origMtl.Anisotropic/100.0
					r.texmapReflectAnisotropy = origMtl.anisoAmountReflectionMap 
					if r.texmapReflectAnisotropy != undefined then(
						r.texmapOnAnisotropy = origMtl.useAnisoAmountReflectionMap 
						r.mapamountAnisotropy = origMtl.anisoAmountReflectionMapAmount --/100.0 
					)
					r.anisotropyRotation = origMtl.orientation 
					r.texmapReflectAnisotropyRotation = origMtl.anisoOrientationReflectionMap 
					if r.texmapReflectAnisotropyRotation != undefined then(
						r.texmapOnAnisotropyRotation = origMtl.useAnisoOrientationReflectionMap 
						r.mapamountAnisotropyRotation = origMtl.anisoOrientationReflectionMapAmount --/100.0 
					)
					--Displacement
					r.texmapDisplace = origMtl.MTDMap 
					if r.texmapDisplace != undefined then(
						r.texmapOnDisplacement = origMtl.useMTDMap 
						if owner.converterSettings.clampDisp then r.displacementMaximum = owner.converterSettings.clampDispAmount
					)
					
					r
				),
				
				-- ############## fR Architectural Material ################
				fn convertFrom_fR_Architectural origMtl =(
					r=CoronaMtl()
					r.name=(if owner.converterSettings.addCoronaPrefix then owner.converterSettings.userPrefixStr else "") + origMtl.name
					
					--Diffuse
					r.levelDiffuse = if origMtl.diffuse_weight > 1.0 then(1.0) else(origMtl.diffuse_weight)
					r.colorDiffuse = origMtl.diffuse_color 
					r.texmapDiffuse = origMtl.diffcolor_map 
					if r.texmapDiffuse != undefined then(
						r.texmapOnDiffuse = origMtl.use_diffcolor_map 
					)
					
					--Reflection
					r.levelReflect = origMtl.reflectivity 
					r.colorReflect = (color origMtl.refl_color.r origMtl.refl_color.g origMtl.refl_color.b)
					r.texmapReflect = origMtl.reflcolor_map 
					if r.texmapReflect != undefined then(
						r.texmapOnReflect = origMtl.use_reflcolor_map 
					)
					r.fresnelIor = if origMtl.refr_ior < 1.0 then 1.0 else origMtl.refr_ior -- must use refraction ior since there is no seperate ior setting for reflection, maybe i'll add some "conversion" later 
					r.texmapFresnelIor = origMtl.ior_map 
					if r.texmapFresnelIor != undefined then(
						r.texmapOnFresnelIor = (origMtl.use_ior_map AND origMtl.brdf_fresnel)  -- only active when global ior map on AND brdf radiobutton set to "by IOR" 
					)
					r.reflectGlossiness = origMtl.refl_gloss   
					r.texmapReflectGlossiness = origMtl.reflgloss_map 
					if r.texmapReflectGlossiness != undefined then(
						r.texmapOnReflectGlossiness = origMtl.use_reflgloss_map 
					)
					
					--Refraction
					r.levelRefract = origMtl.transparency 
					r.colorRefract = (color origMtl.refr_color.r origMtl.refr_color.g origMtl.refr_color.b) 
					r.texmapRefract = origMtl.refrcolor_map 
					if r.texmapRefract != undefined then(
						r.texmapOnRefract = origMtl.use_refrcolor_map  
					)
					r.ior = if origMtl.refr_ior < 1.0 then 1.0 else(if origMtl.refr_ior > 10.0 then 10.0 else origMtl.refr_ior) 
					r.texmapIor = origMtl.ior_map 
					if r.texmapIor != undefined then(
						r.texmapOnIor = origMtl.use_ior_map 
					)
					r.refractGlossiness = origMtl.refr_gloss 
					r.texmapRefractGlossiness = origMtl.refrgloss_map 
					if r.texmapRefractGlossiness != undefined then(
						r.texmapOnRefractGlossiness = origMtl.use_refrgloss_map 
					)
					
					-- Glassmode
					r.thin = if origMtl.thin_walled == 0 then false else true
					
					--Translucency
					if origMtl.refr_translucency == false then(
						r.levelTranslucency = 0.0
					)
					else(
						--r.levelTranslucency = origMtl.refr_transw
						r.levelTranslucency = origMtl.transparency
						r.levelRefract = (1- origMtl.refr_trans_weight)
					)
					r.colorTranslucency = (color origMtl.refr_trans_color.r origMtl.refr_trans_color.g origMtl.refr_trans_color.b)
					r.texmapTranslucency = origMtl.transcolor_map
					if r.texmapTranslucency != undefined then(
						r.texmapOnTranslucency = origMtl.use_transcolor_map 
					)
					
					--Opacity
					r.levelOpacity = 1.0 
					r.colorOpacity = (color 255 255 255) 
					r.texmapOpacity = origMtl.cutout_map
					if r.texmapOpacity != undefined then(
						r.texmapOnOpacity = origMtl.use_cutout_map 
					)
					
					--Emission
					if origMtl.self_illumination_on then r.levelSelfIllum = origMtl.self_illum_intensity 
					r.colorSelfIllum = (color origMtl.self_illum_filter.r origMtl.self_illum_filter.g origMtl.self_illum_filter.b) 
					r.texmapSelfIllum = origMtl.selfillum_map 
					if r.texmapSelfIllum != undefined then(
						r.texmapOnSelfIllum = origMtl.use_selfillum_map 
					)
					
					--Bumpmap
					r.texmapBump = origMtl.bump_map 
					if r.texmapBump != undefined then(
						r.texmapOnBump = origMtl.use_bump_map 
						r.mapamountBump = origMtl.bump_map_amount 
					)
					
					--RoundedCorners
					if origMtl.roundcorners_on then(
						local rcmap = CoronaRoundEdges()
						rcmap.radius = origMtl.roundcorners_radius
						rcmap.mapAdditionalBump = r.texmapBump
						rcmap.mapOnAdditional = r.texmapOnBump
						r.texmapBump = rcmap
					)
					
					--Anisotropy
					r.anisotropy = if origMtl.anisotropy > 1.0 then((origMtl.anisotropy-1.0)/9.0)else(origMtl.anisotropy-1.0) 
					r.texmapReflectAnisotropy = origMtl.anisotropy_map 
					if r.texmapReflectAnisotropy != undefined then(
						r.texmapOnAnisotropy = origMtl.use_anisotropy_map 
					)
					r.anisotropyRotation = origMtl.anisotropy_rotation 
					r.texmapReflectAnisotropyRotation = origMtl.anisorot_map 
					if r.texmapReflectAnisotropyRotation != undefined then(
						r.texmapOnAnisotropyRotation = origMtl.use_anisorot_map 
					)
					
					--Displacement
					r.texmapDisplace = origMtl.displacement_map 
					if r.texmapDisplace != undefined then(
						r.texmapOnDisplacement = origMtl.use_displacement_map 
						if owner.converterSettings.clampDisp then r.displacementMaximum = owner.converterSettings.clampDispAmount
					)
					
					r
				),
				
				-- ############## Autodesk Materials ################
				fn convertFrom_AutodeskMtl origMtl =(
					owner.converterTempData.AD_mats_found = true
					for elem in (refs.dependentNodes origMtl) do appendIfUnique owner.converterTempData.foundAdskMtls elem
					
					matName = origMtl.name
					if origMtl.definitionID != "Generic" then(
						origMtl = origMtl.ConvertToGeneric 
					)
					r=CoronaMtl()
					r.name=(if owner.converterSettings.addCoronaPrefix then owner.converterSettings.userPrefixStr else "") + matName
					
					--Diffuse
					r.colorDiffuse = origMtl.Generic_Color as color  
					r.texmapDiffuse = origMtl.Generic_Image 
					
					if r.texmapDiffuse != undefined then (
						r.texmapOnDiffuse = true
						r.mapamountDiffuse = origMtl.Generic_Image_Fade --/ 100.0
					)
					
					--Reflection
					if origMtl.Reflectivity_Enable then(
						r.levelReflect = (origMtl.Reflectivity_Direct / 100.0)
						if origMtl.Reflectivity_Direct_Option == 1 then r.texmapReflect = origMtl.Reflectivity_Direct_Map 
						if r.texmapReflect != undefined then(
							r.texmapOnReflect = true   
						)
						r.fresnelIor = 20.0
					)
					r.reflectGlossiness = origMtl.Generic_Glossiness -- / 100.0 
					
					--Refraction
					if origMtl.Transparency_Enable then(
						r.levelRefract = origMtl.Transparency_Amount / 100.0 
						r.colorRefract = white  
						r.texmapRefract = origMtl.Transparency_Image 
						if r.texmapRefract != undefined then(
							r.texmapOnRefract = true  
							r.mapamountRefract = origMtl.Transparency_Image_Fade --/ 100.0
						)
						r.ior = origMtl.Transparency_Refraction
					)
					
					--Opacity
					if origMtl.Cutouts_Enable then(
						r.levelOpacity = 1.0 
						r.colorOpacity = (color 255 255 255) 
						r.texmapOpacity = origMtl.Cutouts_Image 
						if r.texmapOpacity != undefined then(
							r.texmapOnOpacity = origMtl.Cutouts_Enable
						)
					)
					
					--Emission
					if origMtl.Self_Illumination_Enable then(
						r.levelSelfIllum = (origMtl.Self_Illumination_Luminance / 100.0)
						r.colorSelfIllum = origMtl.Self_Illumination_Filter_Color
						if origMtl.Self_Illumination_Filter_Color_Option == 1 then r.texmapSelfIllum = origMtl.Self_Illumination_Filter_Color_Map 
						if r.texmapSelfIllum != undefined then(
							r.texmapOnSelfIllum = true
						)
					)
					
					--Bumpmap
					if origMtl.Bump_Enable then(
						r.texmapBump = origMtl.Bump_Image
						if r.texmapBump != undefined then(
							r.texmapOnBump = true
							r.mapamountBump = (if origMtl.bump_amount / 100.0 > 0.3 then 0.3 else origMtl.bump_amount / 100.0) 
						)
					)
					
					r
				),
				
				-- ############## VrayBlend Material ################
				fn convertFrom_VrayBlendMtl origMtl =(
					r=CoronaLayeredMtl()
					r.name=(if owner.converterSettings.addCoronaPrefix then owner.converterSettings.userPrefixStr else "") + origMtl.name
					
					r.baseMtl = origMtl.baseMtl
					for layerID = 1 to origMtl.coatMtl.count do(
						r.layers[layerID] = origMtl.coatMtl[layerID]
						r.amounts[layerID] = origMtl.blend[layerID].value / 255.0 * 100.0
						r.mixmaps[layerID] = origMtl.texmap_blend[layerID]
						r.maskAmounts[layerID] = origMtl.texmap_blend_multiplier[layerID]
						if r.mixmaps[layerID] != undefined and origMtl.texmap_blend_multiplier[layerID] == 100.0 then(
							r.amounts[layerID] = 100.0
						)
					)
					
					if hasProperty origMtl #coatMtl_enable then(  -- Vray 3.3
						for layerID = 1 to origMtl.coatMtl_enable.count do(
							if origMtl.coatMtl_enable[layerID] == false then r.layersOn[layerID] = false
						)
					)
					
					r
				),
				
				-- ############## VrayLight Material ################
				fn convertFrom_VrayLightMtl origMtl =(
					r=CoronaLightMtl()
					r.name=(if owner.converterSettings.addCoronaPrefix then owner.converterSettings.userPrefixStr else "") + origMtl.name
					
					r.color = origMtl.color 
					r.intensity = origMtl.multiplier
					r.emitLight = origMtl.directLight_on
					if origMtl.texmap != undefined then(
						r.texmapOn = origMtl.texmap_on
						r.texmap = origMtl.texmap
					)
					if origMtl.opacity_texmap != undefined then(
						r.opacityTexmapOn = origMtl.opacity_texmap_on
						r.opacityTexmap = origMtl.opacity_texmap
					)
					
					r
				),
				
				-- ############## Vray2Sided Material ################
				fn convertFrom_Vray2sidedMtl origMtl =(
					-- currently just taking 2sided mats slot 1 and setting translucency in material from 2sided options
					r=origMtl.frontMtl	
					if r != undefined and classof r == CoronaMtl do (
						r.thin = true
						r.levelTranslucency = (origMtl.Translucency.r + origMtl.Translucency.g + origMtl.Translucency.b)/3.0/255
						
						if origMtl.texmap_translucency != undefined then(
							r.colorTranslucency = origMtl.Translucency  -- translucency color from 2sided transl.
							r.texmapTranslucency = origMtl.texmap_translucency
							r.texmapOnTranslucency = true
						)
						else(
							r.colorTranslucency = r.colorDiffuse  -- translucency color from diffuse
							
							if r.texmapDiffuse != undefined then(
								r.texmapTranslucency = r.texmapDiffuse 
								r.texmapOnTranslucency = true
							)
						)
						
					)
					if origMtl.frontMtl	== undefined then r = origMtl
					
					r
				),
				
				-- ############## VRayFastSSS Material ################
				fn convertFrom_VRayFastSSS origMtl =(
					r=CoronaMtl()
					r.name=(if owner.converterSettings.addCoronaPrefix then owner.converterSettings.userPrefixStr else "") + origMtl.name
					
					r.colorDiffuse = origMtl.shallow_color
					
					r
				),
				
				/* old
				-- ############## VRayFastSSS2 Material ################
				fn convertFrom_VRayFastSSS2 origMtl =(
					r=CoronaMtl()
					r.name=(if owner.converterSettings.addCoronaPrefix then owner.converterSettings.userPrefixStr else "") + origMtl.name
					
					
					--Diffuse
					r.levelDiffuse = 1.0 
					r.colorDiffuse = origMtl.diffuse_color 
					r.texmapDiffuse = origMtl.texmap_diffuse_color 
					if r.texmapDiffuse != undefined then(
						r.texmapOnDiffuse = origMtl.texmap_diffuse_color_on 
						r.mapamountDiffuse = origMtl.texmap_diffuse_color_multiplier 
					)
					
					--Reflection
					r.levelReflect = 1.0
					r.colorReflect = origMtl.specular_color 
					
					r.texmapReflect = origMtl.texmap_specular_color 
					if r.texmapReflect != undefined then(
						r.texmapOnReflect = origMtl.texmap_specular_color_on 
						r.mapamountReflect = origMtl.texmap_specular_color_multiplier
					)
					
					r.fresnelIor = origMtl.ior
					
					r.reflectGlossiness = (if owner.converterSettings.vrayConvertGlossyValues then(1.0 - sqrt(1.0 - origMtl.specular_glossiness)) else(origMtl.specular_glossiness) ) 
					r.texmapReflectGlossiness = origMtl.texmap_specular_glossiness 
					if r.texmapReflectGlossiness != undefined then(
						if owner.converterSettings.vrayConvertGlossyMaps do (
							if owner.converterTempData.glossyConversionOutputMapVrayBlinnCoronaClGgx == undefined do(
								owner.converterTempData.glossyConversionOutputMapVrayBlinnCoronaClGgx = owner.getGlossyConversionOutputMap #VrayBlinnToClampedGgx
							)
							outmp = copy owner.converterTempData.glossyConversionOutputMapVrayBlinnCoronaClGgx
							outmp.map1 = r.texmapReflectGlossiness
							r.texmapReflectGlossiness = outmp
						)
						
						r.texmapOnReflectGlossiness = origMtl.texmap_specular_glossiness_on
						r.mapamountReflectGlossiness = origMtl.texmap_specular_glossiness_multiplier 
					)
					
					--Refraction
					r.ior = origMtl.ior
					
					--Opacity
					if hasProperty origMtl #texmap_opacity then (  -- NEW in Vray 3.10.01
						r.levelOpacity = 1.0 
						r.colorOpacity = (color 255 255 255) 
						r.texmapOpacity = origMtl.texmap_opacity 
						if r.texmapOpacity != undefined then(
							r.texmapOnOpacity = origMtl.texmap_opacity_on 
							r.mapamountOpacity = origMtl.texmap_opacity_multiplier --/ 100.0 
						)
					)
					
					--Bumpmap
					r.texmapBump = origMtl.texmap_bump 
					if r.texmapBump != undefined then(
						r.texmapOnBump = origMtl.texmap_bump_on 
						r.mapamountBump = (origMtl.texmap_bump_multiplier / 100.0) * owner.converterSettings.vrayBumpMultiplier 
					)
					
					--Displacement
					r.texmapDisplace = origMtl.texmap_displacement 
					if r.texmapDisplace != undefined then(
						r.texmapOnDisplacement = origMtl.texmap_displacement_on
						if owner.converterSettings.clampDisp then r.displacementMaximum = owner.converterSettings.clampDispAmount
					)
					
					r
				),
				*/
				
				-- ############## VRayFastSSS2 Material ################
				fn convertFrom_VRayFastSSS2 origMtl =(
					r=CoronaSkinMtl()
					r.name=(if owner.converterSettings.addCoronaPrefix then owner.converterSettings.userPrefixStr else "") + origMtl.name
					
					
					r.skinLevel = 1.0
					r.sssRadiusScale = origMtl.scale
					
					-- sss amount
					r.sssAmount = 1.0 - origMtl.diffuse_amount
					if origMtl.texmap_diffuse_amount != undefined do(
						r.texmapSssAmount = mix color1:white color2:black mask:origMtl.texmap_diffuse_amount
						r.texmapOnSssAmount = origMtl.texmap_diffuse_amount_on 
						r.mapamountSssAmount = origMtl.texmap_diffuse_amount_multiplier 
					)
					
					--overall color
					r.sss2Weight = 0.0
					r.sss3Weight = 0.0
					r.skinColor = origMtl.sub_surface_color
					r.sss1Color = origMtl.scatter_color
					
					r.texmapSkinColor = origMtl.texmap_sss_color
					if r.texmapSkinColor != undefined then(
						r.texmapOnSkinColor = origMtl.texmap_sss_color_on 
						r.mapamountSkinColor = origMtl.texmap_sss_color_multiplier 
					)
					r.texmapSss1Color = origMtl.texmap_scatter_color
					if r.texmapSss1Color != undefined then(
						r.texmapOnSss1Color = origMtl.texmap_scatter_color_on 
						r.mapamountSss1Color = origMtl.texmap_scatter_color_multiplier 
					)
					
					if origMtl.diffuse_amount > 0.0 or origMtl.texmap_diffuse_amount != undefined then(
						local cm = mix()
						cm.color1 = r.skinColor
						cm.map1 = r.texmapSkinColor
						cm.color2 = origMtl.diffuse_color
						cm.map2 = r.texmapSss1Color
						cm.mixAmount = origMtl.diffuse_amount
						cm.mask = origMtl.texmap_diffuse_amount
						
						r.texmapSkinColor = cm
					)
					
					--radius
					r.sss1Radius = origMtl.scatter_radius
					r.texmapSss1Radius = origMtl.texmap_scatter_radius
					if r.texmapSss1Radius != undefined then(
						r.texmapOnSss1Radius = origMtl.texmap_scatter_radius_on 
						r.mapamountSss1Radius = origMtl.texmap_scatter_radius_multiplier 
					)
					
					--opacity
					r.opacityLevel = 1.0 
					r.opacityColor = (color 255 255 255) 
					r.texmapOpacityColor = origMtl.texmap_opacity 
					if r.texmapOpacityColor != undefined then(
						r.texmapOnOpacityColor = origMtl.texmap_opacity_on 
						r.mapamountOpacityColor = origMtl.texmap_opacity_multiplier --/ 100.0 
					)
					
					
					--bumpmap
					r.texmapBump = origMtl.texmap_bump 
					if r.texmapBump != undefined then(
						r.texmapOnBump = origMtl.texmap_bump_on 
						r.mapamountBump = (origMtl.texmap_bump_multiplier / 100.0) * owner.converterSettings.vrayBumpMultiplier 
					)
					
					--displacement
					r.texmapDisplace = origMtl.texmap_displacement 
					if r.texmapDisplace != undefined then(
						r.texmapOnDisplace = origMtl.texmap_displacement_on
					)
					
					r
				),
				
				-- ############## VRayHairMtl Material ################
				fn convertFrom_VRayHairMtl origMtl =(
					r=CoronaHairMtl()
					r.name=(if owner.converterSettings.addCoronaPrefix then owner.converterSettings.userPrefixStr else "") + origMtl.name
					
					r.melanin = 0
					r.colorTint = origMtl.secondary_specular
					r.texmapTint = origMtl.texmap_secondary_specular 
					if r.texmapTint != undefined then(
						r.texmapOnTint = origMtl.texmap_secondary_specular_on 
						r.mapamountTint = origMtl.texmap_secondary_specular_multiplier
					)
					
					r.transmission = origMtl.transmission
					r.texmapTransmission = origMtl.texmap_transmission 
					if r.texmapTransmission != undefined then(
						r.texmapOnTransmission = origMtl.texmap_transmission_on 
						r.mapamountTransmission = origMtl.texmap_transmission_multiplier
					)
					
					r.colorDiffuse = origMtl.Diffuse
					r.levelDiffuse = origMtl.diffuse_amount
					r.texmapDiffuse = origMtl.texmap_diffuse 
					if r.texmapDiffuse != undefined then(
						r.texmapOnDiffuse = origMtl.texmap_diffuse_on 
						r.mapAmountDiffuse = origMtl.texmap_diffuse_multiplier
					)
					
					r.colorOpacity = origMtl.opacity
					r.texmapOpacity = origMtl.texmap_opacity
					if r.texmapOpacity != undefined then(
						r.texmapOnOpacity = origMtl.texmap_opacity_on 
						r.mapamountOpacity = origMtl.texmap_opacity_multiplier
					)
					
					r
				),
				
				-- ############## VRaySkinMtl Material ################
				fn convertFrom_VRaySkinMtl origMtl =(
					r=CoronaSkinMtl()
					r.name=(if owner.converterSettings.addCoronaPrefix then owner.converterSettings.userPrefixStr else "") + origMtl.name
					
					
					r.skinLevel = 1.0
					r.sssRadiusScale = origMtl.scale
					r.sssAmount = if origMtl.max_sss_amount > 1.0 then 1.0 else origMtl.max_sss_amount
					r.texmapSssAmount = origMtl.texmap_sss_amount
					if r.texmapSssAmount != undefined then(
						r.texmapOnSssAmount = origMtl.texmap_sss_amount_on 
						r.mapamountSssAmount = origMtl.texmap_sss_amount_multiplier 
					)
					
					--Overall color
					if origMtl.diffuse_amount > 0.0 then(
						r.skinColor = origMtl.diffuse_color
						r.texmapSkinColor = origMtl.texmap_diffuse_color
						if r.texmapSkinColor != undefined then(
							r.texmapOnSkinColor = origMtl.texmap_diffuse_color_on 
							r.mapamountSkinColor = origMtl.texmap_diffuse_color_multiplier 
						)
					)else(
						r.skinColor = origMtl.shallow_color
						r.texmapSkinColor = origMtl.texmap_shallow_color
						if r.texmapSkinColor != undefined then(
							r.texmapOnSkinColor = origMtl.texmap_shallow_color_on 
							r.mapamountSkinColor = origMtl.texmap_shallow_color_multiplier 
						)
					)
					
					
					--sss layer 1
					r.sss1Color = origMtl.shallow_color 
					r.texmapSss1Color = origMtl.texmap_shallow_color
					if r.texmapSss1Color != undefined then(
						r.texmapOnSss1Color = origMtl.texmap_shallow_color_on 
						r.mapamountSss1Color = origMtl.texmap_shallow_color_multiplier 
					)
					r.sss1Radius = origMtl.shallow_radius
					r.texmapSss1Radius = origMtl.texmap_shallow_radius
					if r.texmapSss1Radius != undefined then(
						r.texmapOnSss1Radius = origMtl.texmap_shallow_radius_on 
						r.mapamountSss1Radius = origMtl.texmap_shallow_radius_multiplier 
					)
					r.sss1Weight = if origMtl.shallow_amount > 1.0 then 1.0 else origMtl.shallow_amount
					r.texmapSss1Weight = origMtl.texmap_shallow_amount
					if r.texmapSss1Weight != undefined then(
						r.texmapOnSss1Weight = origMtl.texmap_shallow_amount_on 
						r.mapamountSss1Weight = origMtl.texmap_shallow_amount_multiplier 
					)
					
					
					--sss layer 2
					r.sss2Color = origMtl.medium_color 
					r.texmapSss2Color = origMtl.texmap_medium_color
					if r.texmapSss2Color != undefined then(
						r.texmapOnSss2Color = origMtl.texmap_medium_color_on 
						r.mapamountSss2Color = origMtl.texmap_medium_color_multiplier 
					)
					r.sss2Radius = origMtl.medium_radius
					r.texmapSss2Radius = origMtl.texmap_medium_radius
					if r.texmapSss2Radius != undefined then(
						r.texmapOnSss2Radius = origMtl.texmap_medium_radius_on 
						r.mapamountSss2Radius = origMtl.texmap_medium_radius_multiplier 
					)
					r.sss2Weight = if origMtl.medium_amount > 1.0 then 1.0 else origMtl.medium_amount
					r.texmapSss2Weight = origMtl.texmap_medium_amount
					if r.texmapSss2Weight != undefined then(
						r.texmapOnSss2Weight = origMtl.texmap_medium_amount_on 
						r.mapamountSss2Weight = origMtl.texmap_medium_amount_multiplier 
					)
					
					
					--sss layer 3
					r.sss3Color = origMtl.deep_color 
					r.texmapSss3Color = origMtl.texmap_deep_color
					if r.texmapSss3Color != undefined then(
						r.texmapOnSss3Color = origMtl.texmap_deep_color_on 
						r.mapamountSss3Color = origMtl.texmap_deep_color_multiplier 
					)
					r.sss3Radius = origMtl.deep_radius
					r.texmapSss3Radius = origMtl.texmap_deep_radius
					if r.texmapSss3Radius != undefined then(
						r.texmapOnSss3Radius = origMtl.texmap_deep_radius_on 
						r.mapamountSss3Radius = origMtl.texmap_deep_radius_multiplier 
					)
					r.sss3Weight = if origMtl.deep_amount > 1.0 then 1.0 else origMtl.deep_amount
					r.texmapSss3Weight = origMtl.texmap_deep_amount
					if r.texmapSss3Weight != undefined then(
						r.texmapOnSss3Weight = origMtl.texmap_deep_amount_on 
						r.mapamountSss3Weight = origMtl.texmap_deep_amount_multiplier 
					)
					
					
					--refl layer 1
					r.reflection1Level = origMtl.primary_reflection_amount
					r.reflection1Color = origMtl.primary_reflection_color
					r.texmapReflection1Color = origMtl.texmap_primary_reflection_color
					if r.texmapReflection1Color != undefined then(
						r.texmapOnReflection1Color = origMtl.texmap_primary_reflection_color_on 
						r.mapamountReflection1Color = origMtl.texmap_primary_reflection_color_multiplier 
					)
					if origMtl.texmap_primary_reflection_amount != undefined do(
						if r.texmapReflection1Color != undefined then(
							local cm = CoronaMix mixOperation:2 mixInSRgb:false
							cm.texmapBottom = r.texmapReflection1Color
							cm.texmapTop = origMtl.texmap_primary_reflection_amount
							r.texmapReflection1Color = cm
						)else(
							r.texmapReflection1Color = origMtl.texmap_primary_reflection_amount
						)
					)
					r.reflection1Glossiness = origMtl.primary_reflection_glossiness
					r.texmapReflection1Glossiness = origMtl.texmap_primary_reflection_glossiness
					if r.texmapReflection1Glossiness != undefined then(
						r.texmapOnReflection1Color = origMtl.texmap_primary_reflection_glossiness_on 
						r.mapamountReflection1Color = origMtl.texmap_primary_reflection_glossiness_multiplier 
					)
					r.reflection1Ior = origMtl.primary_reflection_fresnel_ior
					
					
					--refl layer 2
					r.reflection2Level = origMtl.secondary_reflection_amount
					r.reflection2Color = origMtl.secondary_reflection_color
					r.texmapReflection2Color = origMtl.texmap_secondary_reflection_color
					if r.texmapReflection2Color != undefined then(
						r.texmapOnReflection2Color = origMtl.texmap_secondary_reflection_color_on 
						r.mapamountReflection2Color = origMtl.texmap_secondary_reflection_color_multiplier 
					)
					if origMtl.texmap_secondary_reflection_amount != undefined do(
						if r.texmapReflection2Color != undefined then(
							local cm = CoronaMix mixOperation:2 mixInSRgb:false
							cm.texmapBottom = r.texmapReflection2Color
							cm.texmapTop = origMtl.texmap_secondary_reflection_amount
							r.texmapReflection2Color = cm
						)else(
							r.texmapReflection2Color = origMtl.texmap_secondary_reflection_amount
						)
					)
					r.reflection2Glossiness = origMtl.secondary_reflection_glossiness
					r.texmapReflection2Glossiness = origMtl.texmap_secondary_reflection_glossiness
					if r.texmapReflection2Glossiness != undefined then(
						r.texmapOnReflection2Color = origMtl.texmap_secondary_reflection_glossiness_on 
						r.mapamountReflection2Color = origMtl.texmap_secondary_reflection_glossiness_multiplier 
					)
					r.reflection2Ior = origMtl.secondary_reflection_fresnel_ior
					
					
					--opacity
					r.opacityLevel = 1.0
					r.opacityColor = origMtl.opacity
					r.texmapOpacityColor = origMtl.texmap_opacity 
					if r.texmapOpacityColor != undefined then(
						r.texmapOnOpacityColor = origMtl.texmap_opacity_on 
						r.mapamountOpacityColor = origMtl.texmap_opacity_multiplier 
					)
					
					
					--bump
					r.texmapBump = origMtl.texmap_bump 
					if r.texmapBump != undefined then(
						local texmapClass = classof r.texmapBump
						local isNormalMap = (texmapClass == VrayNormalMap or texmapClass == CoronaNormal or texmapClass == Normal_Bump)
						r.texmapOnBump = origMtl.texmap_bump_on 
						r.mapamountBump = (origMtl.texmap_bump_multiplier / 100.0) * (if isNormalMap then 1.0 else owner.converterSettings.vrayBumpMultiplier)
					)
					
					
					--displacement
					r.texmapDisplace = origMtl.texmap_displacement 
					if r.texmapDisplace != undefined then(
						r.texmapOnDisplace = origMtl.texmap_displacement_on
					)
					
					r
				),
				
				-- ############## VrayOverrideMtl Material ################
				fn convertFrom_VrayOverrideMtl origMtl =(
					r=CoronaRaySwitchMtl()
					r.name=(if owner.converterSettings.addCoronaPrefix then owner.converterSettings.userPrefixStr else "") + origMtl.name
					
					r.directMtl = origMtl.baseMtl
					if origMtl.giMtl != undefined then r.giMtl = origMtl.giMtl else r.giMtl = r.directMtl
					if origMtl.reflectMtl != undefined then r.reflectMtl = origMtl.reflectMtl else r.reflectMtl = r.directMtl
					if origMtl.refractMtl != undefined then r.refractMtl = origMtl.refractMtl else r.refractMtl = r.directMtl
					
					r
				),
				
				-- ############## VrayMtlWrapper Material ################
				fn convertFrom_VrayMtlWrapper origMtl =(
					r
					if origMtl.baseMtl != undefined then(
						r=origMtl.baseMtl
					)else(
						r=CoronaMtl()
						r.name=(if owner.converterSettings.addCoronaPrefix then owner.converterSettings.userPrefixStr else "") + origMtl.name
					)
					
					r
				),
				
				-- ############## VRayBumpMtl Material ################
				fn convertFrom_VRayBumpMtl origMtl =(
					r = origMtl.base_mtl
					if r == undefined do(
						r = CoronaMtl()
						r.name = origMtl.name
					)
					
					r
				),
				
				
				-- ############## Architectural Material ################
				fn convertFrom_Architectural origMtl =(
					r=CoronaMtl()
					r.name=(if owner.converterSettings.addCoronaPrefix then owner.converterSettings.userPrefixStr else "") + origMtl.name
					
					--Diffuse
					r.levelDiffuse = 1.0 
					r.colorDiffuse = origMtl.Diffuse 
					r.texmapDiffuse = origMtl.diffuseMap 
					if r.texmapDiffuse != undefined then(
						r.texmapOnDiffuse = origMtl.diffuseMapEnable 
						r.mapamountDiffuse = origMtl.diffuseMapAmount 
					)
					
					--Bumpmap
					r.texmapBump = origMtl.bumpMap 
					if r.texmapBump != undefined then(
						r.texmapOnBump = origMtl.bumpMapEnable 
						r.mapamountBump = origMtl.bumpMapAmount / 100.0 
					)
					
					--Opacity
					r.levelOpacity = 1.0 
					r.colorOpacity = (color 255 255 255) 
					r.texmapOpacity = origMtl.cutoutMap 
					if r.texmapOpacity != undefined then(
						r.texmapOnOpacity = origMtl.cutoutMapEnable 
						r.mapamountOpacity = origMtl.cutoutMapAmount --/ 100.0 
					)
					
					r
				),
				
				-- ############## Shellac Material ################
				fn convertFrom_Shellac origMtl =(
					r=Blend()
					r.name=origMtl.name
					
					r.map1 = origMtl.shellacMtl1
					r.map2 = origMtl.shellacMtl2
					
					r
				),
				
				-- ############## MR_iRay_Material ################ -- by Michiel Quist, 3diee.nl
				fn convertFrom_iray_Material origMtl =(
					r=CoronaMtl()
					r.name=(if owner.converterSettings.addCoronaPrefix then owner.converterSettings.userPrefixStr else "") + origMtl.name
					
					--Diffuse
					r.levelDiffuse = origMtl.Diffuse_weight
					r.colorDiffuse = (color origMtl.diffuse_color.r origMtl.diffuse_color.g origMtl.diffuse_color.b)  -- is not converting rgba colors, therefore r,g,b seperation 
					r.texmapDiffuse = origMtl.diffuse_color_map 
					if r.texmapDiffuse != undefined then(
						r.texmapOnDiffuse = origMtl.enable_diffuse_color_map 
					)
					
					--Reflection
					r.levelReflect = origMtl.glossy_weight 
					r.colorReflect = (color origMtl.glossy_color.r origMtl.glossy_color.g origMtl.glossy_color.b) 
					r.texmapReflect = origMtl.glossy_color_map
					if r.texmapReflect != undefined then(
						r.texmapOnReflect = origMtl.Enable_glossy_color_map 
					)
					r.fresnelIor = 999.0 
					r.texmapFresnelIor = origMtl.Fresnel_IOR_map
					if r.texmapFresnelIor != undefined then(
						r.texmapOnFresnelIor = origMtl.enable_Fresnel_IOR_map  -- only active when global ior map on AND brdf radiobutton set to "by IOR"  
					)
					r.reflectGlossiness = 1 - origMtl.Glossy_roughness
					r.texmapReflectGlossiness = origMtl.Glossy_roughness_map
					if r.texmapReflectGlossiness != undefined then(
						r.texmapOnReflectGlossiness = origMtl.enable_Glossy_roughness_map
					)
					
					--Refraction 
					if origMtl.Enable_refraction == on then(
						r.levelRefract = 1
						r.ior = if origMtl.refraction_ior < 1.0 then 1.0 else(if origMtl.refraction_ior > 10.0 then 10.0 else origMtl.refraction_ior)
						r.fresnelIor = r.ior
						r.colorRefract = r.colorReflect
					)
					
					-- Glassmode
					if origMtl.Thin_material== 1 then r.thin = true
					
					--Translucency
					if origMtl.Enable_translucency == false then(
						r.levelTranslucency = 0.0
					)
					else(
						--r.levelTranslucency = origMtl.refr_transw
						r.levelTranslucency = origMtl.Translucency_weight
						r.levelRefract = (origMtl.refraction_ior)
					)
					r.colorTranslucency = (color origMtl.translucency_color.r origMtl.translucency_color.g origMtl.translucency_color.b) 
					r.texmapTranslucency = origMtl.Translucency_color_map 
					if r.texmapTranslucency != undefined then(
						r.texmapOnTranslucency = origMtl.enable_Translucency_color_map 
					)
					
					--Opacity
					r.levelOpacity = 1.0 
					r.colorOpacity = (color 255 255 255) 
					r.texmapOpacity = origMtl.cutout_map 
					if r.texmapOpacity != undefined then(
						r.texmapOnOpacity = origMtl.enable_cutout
					)
					
					--Emission
					if hasproperty origMtl "Enable_emission" then(
						if origMtl.Enable_emission then r.levelSelfIllum = origMtl.luminance / 100
					)
					r.colorSelfIllum = (color origMtl.filter_Color.r origMtl.filter_Color.g origMtl.filter_Color.b)
					r.texmapSelfIllum = origMtl.Filter_color_map 
					if r.texmapSelfIllum != undefined then(
						r.texmapOnSelfIllum = origMtl.Enable_filter_color_map 
					)
					
					--Bumpmap
					if hasproperty origMtl "Base_bump_map" then(
						r.texmapBump = origMtl.Base_bump_map 
						if r.texmapBump != undefined then(
							r.texmapOnBump = origMtl.Enable_base_bump_map 
							r.mapamountBump = origMtl.Base_bump_map_amount * 3.5
						)
					)
					
					
					--Anisotropy
					if origMtl.Enable_base_forward then(
						r.anisotropy = origMtl.Base_forward_amount
						r.texmapReflectAnisotropy = origMtl.Base_forward_amount_map
						if r.texmapReflectAnisotropy != undefined then(
							r.texmapOnAnisotropy = origMtl.Base_forward_amount_map_enabled
						)
						r.anisotropyRotation = origMtl.Base_rotation
						r.texmapReflectAnisotropyRotation = origMtl.Base_rotation_map 
						if r.texmapReflectAnisotropyRotation != undefined then(
							r.texmapOnAnisotropyRotation = origMtl.Base_rotation_map_enabled 
						)
					)
					
					--Displacement
					r.texmapDisplace = origMtl.displacement_map 
					if r.texmapDisplace != undefined then(
						r.texmapOnDisplacement = origMtl.Enable_displacement 
						if owner.converterSettings.clampDisp then r.displacementMaximum = owner.converterSettings.clampDispAmount
					)
					
					--Volume settings like absorption and SSS no dispersion and thin film yet 
					if origMtl.Enable_absorption AND origMtl.Thin_material == 0 then(
						r.absorptionDistance = origMtl.Volume_distance
						r.absorptionColor = (color origMtl.Transmitted_color.r origMtl.Transmitted_color.g origMtl.Transmitted_color.b) 
						
						if origMtl.Enable_SSS then(
							r.scatterColor = (color ((color 255 255 255)*origMtl.SSS_amount).r ((color 255 255 255)*origMtl.SSS_amount).g ((color 255 255 255)*origMtl.SSS_amount).b) 
							r.scatterDirectionality = origMtl.SSS_direction
						)
					)
					
					--Lets see if it has a reflective coating and then create a coronalayered material..
					if (hasproperty origMtl "Enable_reflective_coating") and origMtl.Enable_reflective_coating then(
						quiz = CoronaLayeredMtl()
						refcoat = CoronaMtl()
						refcoat.name = r.name + "_coating"
						quiz.name = r.name + "_layer"
						r.name = r.name + "_base"
						
						--coating values s variable!!
						refcoat.levelDiffuse = 0.0
						refcoat.colorDiffuse = color 0 0 0 
						
						refcoat.levelReflect = 1.0
						refcoat.colorReflect = (color origMtl.color.r origMtl.color.g origMtl.color.b) 
						refcoat.texmapReflect = origMtl.color_Map
						if refcoat.texmapReflect != undefined then(
							refcoat.texmapOnReflect = origMtl.Enable_color_map 
						)
						if origMtl.Blend_mode == 0 then refcoat.fresnelIor = 999.0
							if origMtl.Blend_mode == 1 then refcoat.fresnelIor = origMtl.Fresnel_IOR
								if origMtl.Blend_mode == 2 then refcoat.fresnelIor = origMtl.Fresnel_IOR
						refcoat.texmapFresnelIor = origMtl.weight_map
						if refcoat.texmapFresnelIor != undefined then(
							refcoat.texmapOnFresnelIor = origMtl.Enable_weight_map  -- only active when global ior map on AND brdf radiobutton set to "by IOR"  
						)
						refcoat.reflectGlossiness = 1 - origMtl.roughness
						refcoat.texmapReflectGlossiness = origMtl.roughness_map
						if refcoat.texmapReflectGlossiness != undefined then(
							refcoat.texmapOnReflectGlossiness = origMtl.enable_roughness_map
						)
						
						--Bumpmap
						refcoat.texmapBump = origMtl.bump_map 
						if refcoat.texmapBump != undefined then(
							refcoat.texmapOnBump = origMtl.enable_bump_map 
							refcoat.mapamountBump = origMtl.bump_map_amount * 3.5
						)
						
						--construct the layered material
						quiz.baseMtl = r
						
						quiz.layers[1] = refcoat
						
						if origMtl.Blend_mode == 0 then quiz.amounts[1] = origMtl.weight * 100
						if origMtl.Blend_mode == 1 OR origMtl.Blend_mode == 2 then(
							quiz.amounts[1] = origMtl.weight * 100
							fall = falloff()
							fall.name = r.name + "_falloff"
							fall.type = 2
							fall.mtlIOROverride = on
							fall.ior = origMtl.Fresnel_IOR
							
							quiz.mixmaps[1] = fall
						)
						r = quiz
					)
					
					r
				)
				
			)
			matConvMethods owner:this
		),
		
		mapConvMethods =(
			struct mapConvMethods 
			(
				owner,
				
				-- ############## Bitmaptexture ################
				fn convertFrom_BitmapTexture origMap =(
					r = CoronaBitmap()
					r.name = origMap.name
					doNotConvert = false
					
					-- filename, output
					if origMap.fileName != "" and origMap.fileName != undefined then( 
						type = getFilenameType origMap.fileName
						if (findItem #(".jpg", ".jpeg", ".png", ".gif", ".bmp", ".exr", ".tif", ".tiff", ".tga", ".hdr") (toLower type)) != 0 then(
							r.filename = origMap.fileName
							
							-- gamma handling, ONLY max 2014+
							local isValidMap = true
							try(origMap.bitmap)catch(isValidMap = false)
							if (maxVersion())[1] >= 16000 and isValidMap then (
								local gammaOrig = origMap.bitmap.inputGamma
								if classof gammaOrig == Float do(
									r.gamma = gammaOrig
								)
							)	
						)
						else(
							doNotConvert = true
						)
					)else(
						r.filename = ""
						--doNotConvert = true
					)
					r.output = copy origMap.output
					
					
					-- uv channel, environment mode
					r.uvwChannel = origMap.coords.mapChannel
					if origMap.coords.mappingType == 0 and origMap.coords.mapping == 1 then r.uvwChannel = 0
					
					if origMap.coords.mappingType == 1 then (
						case origMap.coords.mapping of (
							0: r.enviroMapping = 0
							1: r.enviroMapping = 0
							2: r.enviroMapping = 0
							3: r.enviroMapping = 1
						)
					)else(
						r.enviroMapping = 0
					)
					
					-- blur
					r.filteringBlur = origMap.coords.blur
					
					-- alpha source, mono channel out, rgb channel out
					r.alphaSource = origMap.alphaSource
					r.monoChannelOutput = origMap.monoOutput
					r.rgbChannelOutput = origMap.rgbOutput
					
					-- offset, tiling/scale, rotation, rw mapscale
					r.realWorldScale = origMap.coords.realWorldScale
					r.uvwOffset = [origMap.coords.U_Offset, origMap.coords.V_Offset, 0]
					if r.realWorldScale then (
						r.uvwScale = [origMap.coords.realWorldWidth, origMap.coords.realWorldHeight, 1]
					)else(
						r.uvwScale = [origMap.coords.U_Tiling, origMap.coords.V_Tiling, 1]
					)
					
					uM = origMap.coords.U_Mirror
					uT = origMap.coords.U_Tile
					case tileChkU of (
						(uM == false and uT == false): r.tilingU = 0
						(uM == true and uT == false): r.tilingU = 2
						(uM == false and uT == true): r.tilingU = 1
					)
					vM = origMap.coords.V_Mirror
					vT = origMap.coords.V_Tile
					case tileChkV of (
						(vM == false and vT == false): r.tilingV = 0
						(vM == true and vT == false): r.tilingV = 2
						(vM == false and vT == true): r.tilingV = 1
					)
					r.wAngle = origMap.coords.W_angle
					
					-- crop/place
					r.clippingOn = origMap.apply
					r.clippingMode = origMap.cropPlace
					r.clippingU = origMap.clipu
					r.clippingV = origMap.clipv
					r.clippingWidth = origMap.clipw
					r.clippingHeight = origMap.cliph
					
					
					if doNotConvert then r = #NoReplacement
					
					r
				),	
				
				-- ############## FStormBitmap ################
				fn convertFrom_FStormBitmap origMap =(
					r = CoronaBitmap()
					r.name = origMap.name
					
					-- filename
					if origMap.bitmap != "" and origMap.bitmap != undefined then
					( 
						r.filename = origMap.bitmap.filename
					)

					-- Gamma handling
					if origMap.gamma == 2.2 then
					(
                        r.gamma = 1.0
					)
					else
					(
                        r.gamma = 2.2
					)
                    
					-- World XYZ
					-- Object XYZ
					-- Object UVW
					
					-- Spherical
					if origMap.mapping == 3 then
					(
						r.enviroMapping = 0
						r.uvwScale = origMap.tiling *= [-1,1,1]
						r.uvwOffset = origMap.offset += [0.28,0,0]
                    )
					
					-- Screen
					if origMap.mapping == 4 then
					(
						r.enviroMapping = 1
                    )
					
					-- uv channel
					r.uvwChannel = origMap.map_channel
					
					-- real world button
					r.realWorldScale = origMap.real_world
					
					-- offset, tiling/scale, rotation, rw mapscale
					if r.realWorldScale == on then
					(
						r.uvwScale = origMap.tiling_world
					)
					else
					(
						r.uvwScale = origMap.tiling
					)
					
					-- offset
					if r.realWorldScale == on then
					(
						r.uvwOffset = origMap.offset_world
					)
					else
					(
						r.uvwOffset = origMap.offset
					)
					
					-- Tiling modes
					-- Repeat Tiling
					if origMap.border[1] == 0 then (
					r.tilingU = 1
					)
					
					if origMap.border[2] == 0 then (
					r.tilingV = 1
					)
					
					-- Mirror Tiling
					if origMap.border[1] == 1 then (
					r.tilingU = 2
					)
					
					if origMap.border[2] == 1 then (
					r.tilingV = 2
					)

					-- rotation angle
					r.wAngle = origMap.rotation[3]
					
					-- invert
					r.output.invert = origMap.inverted
					
					-- crop
					r.clippingOn = origMap.crop_on
					r.clippingU = origMap.crop_u
					r.clippingV = origMap.crop_v
					r.clippingWidth = origMap.crop_w
					r.clippingHeight = origMap.crop_h
					
					r.filteringBlur = 0.01
					
					r
				),
				
				-- ############## FStormMix ################
				fn convertFrom_FStormMix origMap = (
					r = CoronaMix()
					r.name = origMap.name
					
					r.mixInSRgb = off
					
					r.colorBottom = origMap.color1
					r.colorTop = origMap.color2
					r.mixAmount = origMap.mask_color.value/255
					
					r.texmapBottom = origMap.texture1
					r.texmapTop = origMap.texture2
					r.texmapMix = origMap.mask_texture
					
					r.texmapBottomOn = origMap.texture1_on
					r.texmapTopOn = origMap.texture2_on
					r.texmapMixOn = origMap.mask_texture_on
					
					-- normal
					if origMap.mix_mod == 0 then
					(
						r.mixOperation = 6
					)
					
					-- addition
					if origMap.mix_mod == 1 then
					(
						r.mixOperation = 0
					)
					
					-- subtract
					if origMap.mix_mod == 2 then
					(
						r.mixOperation = 1
					)
					
					-- multiply
					if origMap.mix_mod == 3 then
					(
						r.mixOperation = 2
					)
					
					-- divide
					if origMap.mix_mod == 4 then
					(
						r.mixOperation = 3
					)
					
					-- darken
					if origMap.mix_mod == 5 then
					(
						r.mixOperation = 4
					)
					
					-- lighten
					if origMap.mix_mod == 6 then
					(
						r.mixOperation = 5
					)
					
					-- screen
					if origMap.mix_mod == 7 then
					(
						r.mixOperation = 9
					)
					
					-- overlay
					if origMap.mix_mod == 8 then
					(
						r.mixOperation = 10
					)
					
					-- hard light
					if origMap.mix_mod == 9 then
					(
						r.mixOperation = 16
					)
					
					-- soft light
					if origMap.mix_mod == 10 then
					(
						r.mixOperation = 15
					)
					
					-- color burn
					if origMap.mix_mod == 11 then
					(
						r.mixOperation = 12
					)
					
					-- color dodge
					if origMap.mix_mod == 12 then
					(
						r.mixOperation = 11
					)
					
					r
				),
				
				-- ############## FStormMultiTex ################
				fn convertFrom_FStormMultiTex origMap = (
					r = CoronaMultiMap()
					r.name = origMap.name
					
					r.items = origMap.num_ids
					
					-- material id
					if origMap.id_source == 0 then
					(
						r.mode = 3
					)
					
					-- object id
					if origMap.id_source == 1 then
					(
						r.mode = 5
					)
					
					for i = 0 to origMap.num_ids do
					(
						r.colors[i+1] = origMap.colors[i+1]
						r.texmaps[i+1] = origMap.textures[i+1]
					)
						
					r
				),
				
				-- ############## FStormNoise ################
				fn convertFrom_FStormNoise origMap = (
					r = Noise()
					r.name = origMap.name
					
					r.type = 1
					
					r.coords.offset = origMap.offset
					
					r.coords.tiling = origMap.tiling

					r.coords.angle = origMap.rotation
					
					r.size = origMap.size
					
					r.Levels = origMap.iterations

					r
				),
				
				-- ############## FStormSky ################
				fn convertFrom_FStormSky origMap = (
					r = CoronaSky()
					r.name = origMap.name
					
					r
				),
				
				-- ############## FStormColor ################
				fn convertFrom_FStormColor origMap = (
					r = CoronaColor()
					r.name = origMap.name
					
					r.color = origMap.color
					r.colorHdr = origMap.rgb
					r.temperature = origMap.temperature
					r.multiplier = origMap.multiplier
					
					r
				),
				
				-- ############## FStormColorCorrection ################
				fn convertFrom_FStormColorCorrection origMap = (
					r = Color_Correction()
					r.name = origMap.name
					
					r.map = origMap.input
					
					-- Advanced Mode
					r.lightnessMode = 1
					
					-- Invert
					if origMap.invert == on then
					(
						r.rewireMode = 2
						r.rewireR = 4
						r.rewireG = 5
						r.rewireB = 6
						r.rewireA = 3
					)
					
					r.gammaRGB = origMap.gamma
					
					-- Saturation
					if origMap.saturation == 1 then
					(
						r.saturation = 0
					)
					else if origMap.saturation == 0 then
					(
						r.saturation = -100
					)
					else
					(
						r.saturation = 1 - (100 - (origMap.saturation * 100))
					)
					
					-- Offset
					if origMap.offset == 0.5 then
					(
						r.gainRGB = 100
					)
					else if origMap.offset == 0.001 then
					(
						r.gainRGB = 0
					)
					else if origMap.offset < 0.5 then
					(
						r.gainRGB = origMap.offset * 130
					)
					else
					(
						r.gainRGB = origMap.offset * 235
					)
					
					r
				),
				
				-- ############## FStormDirt ################
				fn convertFrom_FStormDirt origMap = (
					r = CoronaAO()
					r.name = origMap.name
					
					r.maxDistance = origMap.radius
					r.normalMode = 2
					r.texmapDistance = origMap.radius_texture
					r.texmapDistanceOn = origMap.radius_texture_on
					r.directionOffsets = origMap.direction
					
					r
				),
				
				-- ############## FStormFalloff ################
				fn convertFrom_FStormFalloff origMap = (
					r = Falloff()
					r.name = origMap.name
					
					r.type = 2
					
					if origMap.type == 1 then
					(
						r.ior = origMap.ior
					)
					
					if origMap.type == 0 then
					(
						r.ior = 1.15
						r.texture_output.invert = true
					)
					
					r
				),
				
				-- ############## FStormGradient ################
				fn convertFrom_FStormGradient origMap = (
					r = Gradient_Ramp()
					r.name = origMap.name
					
					-- world XYZ
					if origMap.mapping == 0 then
					(
						r.coordinates.mapping = 3
					)
					
					-- object XYZ
					if origMap.mapping == 1 then
					(
						r.coordinates.mapping = 2
					)
					
					-- object UVW
					if origMap.mapping == 2 then
					(
						r.coordinates.mapping = 0
					)
					
					-- spherical environment
					if origMap.mapping == 3 then
					(
						r.coordinates.mappingType = 1 -- Environ
						r.coordinates.mapping = 0 -- spherical
					)
					
					r.coordinates.mapChannel = origMap.map_channel
					
					r.coordinates.U_Offset = origMap.offset[1]
					r.coordinates.V_Offset = origMap.offset[2]
					
					r.coordinates.U_Tiling = origMap.tiling[1]
					r.coordinates.V_Tiling = origMap.tiling[2]
					
					if origMap.mirror[1] == on then
					(
						r.coordinates.U_Mirror = true
					)
					
					if origMap.mirror[2] == on then
					(
						r.coordinates.V_Mirror = true
					)

					r.coordinates.U_Angle = origMap.rotation[1]
					r.coordinates.V_Angle = origMap.rotation[2]
					r.coordinates.W_Angle = origMap.rotation[3]
				
					-- type linear
					if origMap.type == 0 then
					(
						r.Gradient_Type = 4
					)
					
					-- type box
					if origMap.type == 1 then
					(
						r.Gradient_Type = 1
					)
					
					-- type radial
					if origMap.type == 2 then
					(
						r.Gradient_Type = 8
					)
					
					-- type spiral
					if origMap.type == 3 then
					(
						r.Gradient_Type = 9
					)
					
					r
				),
				
				-- ############## VrayHDRI ################
				fn convertFrom_VrayHDRI origMap =(
					r = BitmapTexture()
					r.name = origMap.name
					doNotConvert = false
					
					-- filename, output
					if origMap.HDRIMapName != "" and origMap.HDRIMapName != undefined then(
						--doNotConvert = true
						r.fileName = origMap.HDRIMapName
					)
					
					r.output = copy origMap.Output
					if hasproperty origMap #coords then(
						r.coords = origMap.coords
					)
					
					-- Gamma handling
					if (maxversion())[1] >= 16000 and origMap.gamma != 1 then(
						try(r.bitmap = openBitmap r.bitmap.filename gamma:(1.0/origMap.gamma))catch()
					)
					
					if origMap.mapType == 2 then(   -- spherical mode
						r.coords.mapping = 0 -- spherical
						r.coords.mappingType = 1 -- Environ
						r.coords.U_Offset = 0.25 + origMap.horizontalRotation / 360.0
						r.coords.V_Offset = origMap.verticalRotation / 180.0
						
						if origMap.horizontalFlip then(
							r.coords.U_Offset = 0.25 - origMap.horizontalRotation / 360.0
							r.coords.U_Tiling = -r.coords.U_Tiling
						)
						if origMap.verticalFlip then r.coords.V_Tiling = -r.coords.V_Tiling
					)
					
					-- alpha source, mono channel out, rgb channel out
					r.alphaSource = origMap.alphaSource
					r.monoOutput = origMap.monoOutput
					r.rgbOutput = if origMap.rgbOutput > 1 then 0 else origMap.rgbOutput
					
					-- crop/place
					r.apply = origMap.cropplace_on
					r.cropPlace = origMap.cropplace_mode
					r.clipu = origMap.cropplace_u
					r.clipv = origMap.cropplace_v
					r.clipw = origMap.cropplace_width
					r.cliph = origMap.cropplace_height
					
					r.output.output_amount *= origMap.multiplier * origMap.renderMultiplier
					
					if doNotConvert then r = #NoReplacement
					
					r
				),	
				
				-- ############## CoronaBitmap ################
				fn convertFrom_CoronaBitmap origMap =(
					r = Bitmaptexture()
					r.name = origMap.name
					doNotConvert = false
					
					-- filename, output
					if origMap.filename != "" and origMap.filename != undefined then(
						r.fileName = origMap.filename
						
						-- gamma handling, ONLY max 2014+
						if (maxVersion())[1] >= 16000 then (
							local gammaOrig = origMap.gamma
							if gammaOrig != -1.0 do(
								r.bitmap = openBitmap origMap.filename gamma:gammaOrig
							)
						)	
					)else(
						doNotConvert = true
					)
					r.output = copy origMap.output
					
					-- uv channel, environment mode
					if origMap.uvwChannel == 0 then (
						r.coords.mapping = 1
					)else(
						r.coords.mapChannel = origMap.uvwChannel
					)
					
					-- blur
					r.coords.blur = origMap.filteringBlur
					
					-- alpha source, mono channel out, rgb channel out
					r.alphaSource = origMap.alphaSource
					r.monoOutput = origMap.monoChannelOutput
					r.rgbOutput = origMap.rgbChannelOutput
					
					-- offset, tiling/scale, rotation, rw mapscale
					r.coords.realWorldScale = origMap.realWorldScale
					
					r.coords.U_Offset = origMap.uvwOffset[1]
					r.coords.V_Offset = origMap.uvwOffset[2]
					
					if origMap.realWorldScale then (
						r.coords.realWorldWidth = origMap.uvwScale[1]
						r.coords.realWorldHeight = origMap.uvwScale[2]
					)else(
						r.coords.U_Tiling = origMap.uvwScale[1]
						r.coords.V_Tiling = origMap.uvwScale[2]
					)
					
					case origMap.tilingU of (
						0: (r.coords.U_Mirror = false; r.coords.U_Tile = false)
						2: (r.coords.U_Mirror = true; r.coords.U_Tile = false)
						1: (r.coords.U_Mirror = false; r.coords.U_Tile = true)
					)
					case origMap.tilingV of (
						0: (r.coords.V_Mirror = false; r.coords.V_Tile = false)
						2: (r.coords.V_Mirror = true; r.coords.V_Tile = false)
						1: (r.coords.V_Mirror = false; r.coords.V_Tile = true)
					)
					r.coords.W_angle = origMap.wAngle
					
					-- crop/place
					r.apply = origMap.clippingOn
					r.cropPlace = origMap.clippingMode
					r.clipu = origMap.clippingU
					r.clipv = origMap.clippingV
					r.clipw = origMap.clippingWidth
					r.cliph = origMap.clippingHeight
					
					if doNotConvert then r = #NoReplacement
					
					r
				),	
				
				-- ############## VrayColor ################
				fn convertFrom_VrayColor origMap = (
					r = CoronaColor()
					r.name = origMap.name
					
					r.color = origMap.color 
					r.name = origMap.name 
					r.multiplier = origMap.rgb_multiplier
					
					r
				),
				
				-- ############## Vray Dirt ################
				fn convertFrom_VrayDirt origMap =(
					r = CoronaAo()
					r.name = origMap.name
					
					fn validate val =(
						val = val / 10.0
						if val < -10.0 do return -10.0
						if val > 10.0 do return 10.0
						val
					)
					
					r.colorOccluded = origMap.occluded_color 
					r.colorUnoccluded = origMap.unoccluded_color 
					r.maxDistance = origMap.radius 
					if origMap.invert_normal then r.normalMode = 1 else r.normalMode = 0
					r.texmapDistance = origMap.texmap_radius 
					r.texmapOccluded = origMap.texmap_occluded_color 
					r.texmapUnoccluded = origMap.texmap_unoccluded_color 
					r.excludeMode = 0
					
					r.directionOffsets = [validate origMap.bias.x, validate origMap.bias.y, validate origMap.bias.z]
					
					if origMap.includeList != undefined and origMap.includeList.count != 0 then(
						r.includeMod = true
						r.excludeList = origMap.includeList
						r.excludeMode = 1
					)
					if origMap.excludeList != undefined and origMap.excludeList.count != 0 then(
						r.includeMod = false
						r.excludeList = origMap.excludeList
						r.excludeMode = 1
					)
					if origMap.consider_same_object_only then r.excludeMode = 3
						
					r
				),
				
				-- ############## Ambient_Reflective_Occlusion__3dsmax ################
				fn convertFrom_Ambient_Reflective_Occlusion__3dsmax origMap =(
					r = CoronaAo()
					r.name = origMap.name
					
					r.colorOccluded = origMap.dark 
					r.colorUnoccluded = origMap.bright 
					r.maxDistance = origMap.max_distance 
					if origMap.output_mode == 5 then r.normalMode = 1 else r.normalMode = 0
					r.texmapDistance = origMap.max_distance_shader 
					r.texmapOccluded = origMap.dark_shader
					r.texmapUnoccluded = origMap.bright_shader
						
					r
				),
				
				-- ############## Normal_Bump ################
				fn convertFrom_Normal_Bump origMap = (
					r = CoronaNormal()
					r.name = origMap.name
					
					r.multiplier = origMap.mult_spin 
					r.normalMap = origMap.normal_map
					
					r.flipRed = origMap.flipRed
					r.flipGreen = origMap.flipGreen
					r.swapRedGreen = origMap.swap_rg
					
					r.additionalBump = origMap.bump_map
					r.additionalBumpOn = origMap.map2on
					r.additionalBumpStrength = origMap.bump_spin
					
					r
				),
				
				-- ############## VrayNormalMap ################
				fn convertFrom_VrayNormalMap origMap = (
					r = CoronaNormal()
					r.name = origMap.name
					
					r.multiplier = 1.0
					r.normalMap = origMap.normal_map
					
					if hasproperty origMap #flip_red then(
						r.flipred =  origMap.flip_red
						r.flipgreen =  origMap.flip_green
						r.swapRedGreen =  origMap.swap_red_and_green
					)
					
					if hasProperty origMap #bump_map then(  -- Vray 3.3
						r.additionalBump = origMap.bump_map
						if r.additionalBump != undefined do(
							r.additionalBumpOn = origMap.bump_map_on
							r.additionalBumpStrength = origMap.bump_map_multiplier * owner.converterSettings.vrayBumpMultiplier
						)
					)
					
					
					r
				),
				
				-- ############## VraySky ################
				fn convertFrom_VraySky origMap = (
					r = CoronaSky()
					r.name = origMap.name
					
					r
				),
				
				-- ############## VRayCompTex ################ 
				fn convertFrom_VRayCompTex origMap = (
					r = CoronaMix()
					r.name = origMap.name
					
					r.texmapBottom = origMap.sourceA
					r.texmapTop = origMap.sourceB
					r.mixOperation = case origMap.operator of(
						0: 0 -- Add
						1: 1 -- subtract
						2: 8 -- difference
						3: 2 -- multiply
						4: 3 -- divide
						5: 4 -- minimum
						6: 5 -- maximum
						default:0
					)
					
					r
				),
				
				-- ############## VRayEdgesTex ################
				fn convertFrom_VRayEdgesTex origMap = (
					r = CoronaWire()
					r.name = origMap.name
					
					r.edgeColor = origMap.edgesColor 
					r.widthMode = (abs (origMap.widthType-1))
					r.edgeWidthWorld = origMap.thickness 
					r.edgeWidthPixels = origMap.pixelWidth 
					
					r
				),
				
				-- ############## VRayTriplanarTex ################
				fn convertFrom_VRayTriplanarTex origMap = (
					r = CoronaTriplanar()
					r.name = origMap.name
					
					r.scale = 1.0 / origMap.scale
					if origMap.texture_mode == 0 then( -- same texture on all axis
						r.onlyTexmapX = true
						r.texmapX = origMap.texture
					)else(
						r.onlyTexmapX = false
						r.texmapX = origMap.texture
						r.texmapY = origMap.texture_y
						r.texmapZ = origMap.texture_z
					)
					
					r.blend = origMap.blend
					r.offset = origMap.frame_offset
					r.rotation = origMap.texture_rotation
					
					case origMap.space of(
						0: r.space = 0
						1: (
							r.space = 2 
							r.referenceNode = origMap.reference_node
						)
					)
					
					r
				),
				
				-- ############## VRayGLSLTex ################
				fn convertFrom_VRayGLSLTex origMap = (
					r = CoronaColor()
					r.name = origMap.name
					
					r.color = (color 127 127 127)
					
					r
				),
				
				-- ############## VRaySoftbox ################
				fn convertFrom_VRaySoftbox origMap = (
					r = CoronaColor()
					r.name = origMap.name
					
					r.color = (color 255 255 255)
					
					r
				),
				
				-- ############## VRayColor2Bump ################
				fn convertFrom_VRayColor2Bump origMap = (
					r = CoronaBumpConverter()
					r.name = origMap.name
					
					r.input = origMap.map
					
					r
				),
				
				-- ############## Autodesk_Map ################
				fn convertFrom_Autodesk_Map origMap = (
					r 
					if hasProperty origMap "Parameters_Source" then(
						r = Bitmaptexture()
						r.name = origMap.name
						
						try(  -- Whacky, need bug testscene to solve further issues
							r.bitmap = origMap.Parameters_Source
						)
						catch()
						r.coords.realWorldScale = true
						r.coords.realWorldWidth = origMap.Scale_Width --/ 100
						r.coords.realWorldHeight  = origMap.Scale_Height --/ 100
						--r.coords.U_Offset = origMap.Position_X  -- broken in AD maps, thanks autodesk!
						--r.coords.V_Offset = origMap.Position_Y  -- broken in AD maps, thanks autodesk!
						
						r.coords.U_Tile = origMap.Repeat_Horizontal
						r.coords.V_Tile = origMap.Repeat_Vertical
						r.coords.mapChannel = origMap.Advanced_Parameters_Map_Channel
					)else(
						r = CoronaColor()
						r.name = origMap.name
						r.color = (color 127 127 127)
					)
					
					r
				),
				
				-- ############## Multi_Sub_Map ################
				fn convertFrom_Multi_Sub_Map origMap = (
					r = CoronaMultiMap()
					r.name = origMap.name
					
					r.items = origMap.num_colors +1
					r.mode = case origMap.mode of(
						0: 5 -- ObjectID
						1: 3 -- Material ID
						2: 5 -- smoothing group does not exist in corona -> ObjectID
						3: 2 -- random -> Instance
						default: 5
					)
					
					if r.mode == 5 then(
						r.items = origMap.num_colors +1
						r.texmaps[1] = origMap.id_out_of_range_color_shader
						r.colors[1] = origMap.id_out_of_range_color
						for i = 0 to origMap.num_colors - 1 do(
							r.texmaps[i+2] = getProperty origMap ("id_" + i as string + "_color_shader")
							r.colors[i+2] = getProperty origMap ("id_" + i as string + "_color")
						)
					)else(
						r.items = origMap.num_colors
						for i = 0 to origMap.num_colors - 1 do(
							r.texmaps[i+1] = getProperty origMap ("id_" + i as string + "_color_shader")
							r.colors[i+1] = getProperty origMap ("id_" + i as string + "_color")
						)
					)
					
					r
				)
			)
			mapConvMethods owner:this
		),
		
		cameraConvMethods =(
			struct cameraConvMethods 
			(
				owner,
				
				-- ############## FStormCamera ################
				fn convertFrom_FStormCamera origCamera = (
					r=PhysCamera()
					r.name=origCamera.name
					
					r
				)
			)
			cameraConvMethods owner:this
		),
				
		lightConvMethods =(
			struct lightConvMethods 
			(
				owner,
				
				-- ############## FStormLight ################
				fn convertFrom_FStormLight origLight = (
					r=CoronaLight()
					r.name=(if owner.converterSettings.addCoronaPrefix then owner.converterSettings.userPrefixStr else "") + origLight.name
					doNotConvert = false
					
					r.intensityUnits = 0
					r.on = origLight.enabled
					r.visibleDirectly = origLight.visible
					r.targeted = origLight.targeted
					
					-- color
					if origLight.color_type == 0 then
					(
						r.colorMode = 0
						r.color = origLight.color
					)
					
					-- temperature
					if origLight.color_type == 1 then
					(
						r.colorMode = 1
						r.blackbodyTemp = origLight.temperature
					)
					
					-- texture
					if origLight.color_type == 2 then
					(
						r.colorMode = 2
						r.texmap = origLight.texture
					)
					
					-- plane
					if origLight.shape == 0 then
					(
						r.shape = 1
						r.width = origLight.size_x
						r.height = origLight.size_y
						r.twosidedEmission = origLight.double_sided
						
						if origLight.directional == on then
						(
							r.directionality = 1-origLight.directional_angle*0.0055555555555556
						)
					)
					
					-- disk
					if origLight.shape == 1 then
					(
						r.shape = 2
						r.width = origLight.size_x
						r.twosidedEmission = origLight.double_sided
						
						if origLight.directional == on then
						(
							r.directionality = 1-origLight.directional_angle*0.0055555555555556
						)
					)
					
					-- sphere
					if origLight.shape == 2 then
					(
						r.shape = 0
						r.width = origLight.size_x
					)
					
					-- IES
					if origLight.shape == 3 then
					(
						r.shape = 0
						r.width = origLight.size_x
						
						r.iesOn = origLight.ies_enabled
						r.iesFile = origLight.ies
					)
					
					r
				),
				
				-- ############## FStormSunLight ################
				fn convertFrom_FStormSunLight origLight = (
					r=CoronaSun()
					r.name=(if owner.converterSettings.addCoronaPrefix then owner.converterSettings.userPrefixStr else "") + origLight.name
					doNotConvert = false
					
					r.on = origLight.enabled
					r.targeted = origLight.targeted
					r.intensity = origLight.power
					r.sizeMultiplier = origLight.size
					
					r
				),
				
				-- ############## VrayLight ################
				fn convertFrom_VrayLight origLight = (
					r=CoronaLight intensityUnits:0
					r.name=(if owner.converterSettings.addCoronaPrefix then owner.converterSettings.userPrefixStr else "") + origLight.name
					doNotConvert = false
					
					-- OnOff, Include/exclude
					r.on = origLight.on
					r.targeted = origLight.targeted
					case of (
						(origLight.includeList != undefined and origLight.includeList.count != 0): (
							r.excludeIncludeMod = true
							r.excludeList = origLight.includeList
						)
						(origLight.excludeList != undefined and origLight.excludeList.count != 0): (
							r.excludeIncludeMod = false
							r.excludeList = origLight.excludeList
						)
						default: ()
					)
					
					/*
					Corona: 0: Default W/(sr .m^2), 1: Lumen(lm), 2: candela (cd), 3:Lux (lx)
					Vray:   0: Default (image), 1 : luminous (lm), 2: lumincance (lm/m^2/sr), 3: radiant power (w), 4: radiance (w/m^2/sr)
					*/
					
					case origLight.normalizeColor of (
						0: ( -- vray default (image)
							r.intensity = origLight.multiplier
						)
						1: ( -- vray luminous (lm)
							r.intensityUnits = 1 -- corona lumen
							r.intensity = origLight.multiplier
						)
						2: ( -- vray luminance (lm/m^2/sr)
							r.intensityUnits = 0 -- corona default
							r.intensity = origLight.multiplier / 683.0 --/ 477.465 
						)
						3: ( -- vray radiant power (w)
							r.intensityUnits = 1 -- corona lumen
							r.intensity = origLight.multiplier * 683.0
						)
						4: ( -- vray radiance (w/m^2/sr)
							r.intensityUnits = 0 -- corona default
							r.intensity = origLight.multiplier -- / 0.699 
						)
					)
					
					
					r.colorMode = origLight.color_mode -- 0: direct color, 1: kelvin temp, 2: texmap
					r.color = origLight.color
					if r.colorMode == 1 do r.blackbodyTemp = origLight.color_temperature -- kelvin
					if origLight.texmap_on and origLight.texmap != undefined do(
						r.colorMode = 2
						r.texmap = origLight.texmap
					)
					
					fn getCoronaDirectionality vrVal curve =(
						local out
						local vrInt = ((vrVal * 100) as integer)
						
						local run = true
						for dataPoint in curve while run do(
							if ((dataPoint.x * 100) as integer) == vrInt then(
								out = dataPoint.y
								run = false
							)
						)
						out
					)
					
					--r.directionality = logit origLight.lightDistribution 10
					r.directionality = getCoronaDirectionality origLight.lightDistribution owner.converterSettings.vrayDirectionalityToCoronaDirectionality
					
					-- visibility
					r.twosidedEmission = origLight.DoubleSided
					r.visibleDirectly = not origLight.invisible
					r.visibleRefl = origLight.affect_reflections
					r.occludeOtherLights = origLight.castShadows
					
					-- shape   -- 0: plane, 1: dome, 2: sphere, 3: mesh, 4: disc
					case origLight.type of (
						0: ( r.shape = 1  -- Plane
							r.width = origLight.size0 * 2.0 
							r.height = origLight.size1 * 2.0
							
							if origLight.skylightPortal then(
								delete r
								if owner.converterTempData.crnSkyPortalMtl == undefined do(
									owner.converterTempData.crnSkyPortalMtl = CoronaPortalMtl()
								)
								owner.converterTempData.foundPortals = true
								
								r = Plane()
								r.width = origLight.size0 * 2
								r.length = origLight.size1 * 2
								r.lengthsegs = 1
								r.widthsegs = 1
								
								InstanceMgr.GetInstances origLight &rptInstances
								trueInstances = for n in rptInstances where (areNodesInstances origLight n) collect n
								for i in trueInstances do instanceReplace i r
								trueInstances.material = owner.converterTempData.crnSkyPortalMtl
								doNotConvert = true
							)
						)							
						1: doNotConvert = true -- dome
						2: ( r.shape = 0-- Sphere
							r.width = origLight.size0 
						)
						3:( -- mesh
							if hasproperty origLight #Shape_mesh do(
								delete r
								r = copy origLight
								mtl
								
								if origLight.skylightPortal then(
									if owner.converterTempData.crnSkyPortalMtl == undefined do(
										owner.converterTempData.crnSkyPortalMtl = CoronaPortalMtl()
									)
									owner.converterTempData.foundPortals = true
									mtl = owner.converterTempData.crnSkyPortalMtl
								)
								else(
									mtl = CoronaLightMtl()
									mtl.color = origLight.color
									mtl.intensity = origLight.multiplier
									mtl.emitLight = true
								)
								
								r.baseobject = r.Shape_mesh
								InstanceMgr.GetInstances origLight &rptInstances
								trueInstances = for n in rptInstances where (areNodesInstances origLight n) collect n
								for i in trueInstances do instanceReplace i r
								trueInstances.material = mtl
							)
							doNotConvert = true
						)
						4:(
							r.shape = 2  -- Disc
							r.width = origLight.size0  
						)
					)
					
					
					if doNotConvert then(
						delete r
						r = #NoReplacement
					)
					
					r
				),
				
				
				-- ############## StandardLights ################
				fn convertFrom_StandardLights origLight = (
					crnShd = CoronaShadows()
					useAS 
					asRad
					
					if (classof origLight.shadowgenerator) == VRayShadow do (
						useAS = origLight.AreaShadow
						asRad = origLight.usize
					)
					
					if (classof origLight.shadowgenerator) != CoronaShadows do(
						origLight.shadowgenerator = crnShd
						if useAS != undefined do origLight.areaShadows = useAS
						if asRad != undefined do origLight.areaRadius = asRad
					)
					
					origLight
				),
				
				
				-- ############## MR Area lights ################
				fn convertFrom_miAreaLight origLight = (
					if owner.converterSettings.miLightsToCrnLights then(  -- converts to coronaLights
						r=CoronaLight()
						r.name=(if owner.converterSettings.addCoronaPrefix then owner.converterSettings.userPrefixStr else "") + origLight.name
						
						r.on = origLight.on
						try(r.targeted = origLight.targeted)catch()
						case of (
							(origLight.includeList != undefined and origLight.includeList.count != 0): (
								r.excludeIncludeMod = true
								r.excludeList = origLight.includeList
							)
							(origLight.excludeList != undefined and origLight.excludeList.count != 0): (
								r.excludeIncludeMod = false
								r.excludeList = origLight.excludeList
							)
							default: ()
						)
						
						r.intensity = origLight.multiplier
						r.colorMode = 0
						r.color = origLight.rgb
						
						if origLight.Area_Enable then(
							case (classof origLight) of (
								miAreaLight:(
									case origLight.Area_Type of (
										1:( r.shape = 1  --Rectangle
											r.width = origLight.Rectangle_Width 
											r.height = origLight.Rectangle_Height 
										)
										2:( r.shape = 2  -- Disc
											r.width = origLight.Disc_Radius
										)
									)
								)
								miAreaLightomni:(
									case origLight.Area_Type of (
										1:( r.shape = 0  --Sphere
											r.width = origLight.Sphere_Radius
										)
										2:( r.shape = 3  -- Cylinder
											r.width = origLight.Sphere_Radius
											r.height = origLight.Cylinder_Height
										)
									)
								)
								default:()
							)
						)
						
						r
					)
					else(  -- converts to standard lights
						r 
						origLight.name=(if owner.converterSettings.addCoronaPrefix then owner.converterSettings.userPrefixStr else "") + origLight.name
						
						case of (
							(hasproperty origLight "Free_Spot") : r = origLight.Free_Spot
							(hasproperty origLight "Target_Spot") : r = origLight.Target_Spot
							(hasproperty origLight "Free_Directional_Light") : r = origLight.Free_Directional_Light
							(hasproperty origLight "Target_Directional_Light") : r = origLight.Target_Directional_Light
							(hasproperty origLight "Omni_Light") : r = origLight.Omni_Light
							default: ()
						)
						
						crnShd = CoronaShadows()
						crnShd.areaShadows = origLight.Area_Enable
						
						if origLight.Area_Enable then(
							case (classof origLight) of (
								miAreaLight:(
									case origLight.Area_Type of (
										1: crnShd.areaRadius = origLight.Rectangle_Width / 2.0 --Rectangle
										2: crnShd.areaRadius = origLight.Disc_Radius -- Disc
									)
								)
								miAreaLightomni:(
									case origLight.Area_Type of (
										1: crnShd.areaRadius = origLight.Sphere_Radius --Sphere	
										2: crnShd.areaRadius = origLight.Sphere_Radius  -- Cylinder
									)
								)
								default:()
							)
						)
						r.shadowgenerator = crnShd
						
						r
					)
					
				),
				
				-- ############## fR RectLight ################
				fn convertFrom_fRRectLight origLight = (
					r=CoronaLight()
					r.name=(if owner.converterSettings.addCoronaPrefix then owner.converterSettings.userPrefixStr else "") + origLight.name
					doNotConvert = false
					
					-- OnOff, Include/exclude
					r.on = origLight.on
					r.targeted = origLight.isTargeted
					-- include exclude is using some freaky fR Sh*t again... will support later
					
					if origLight.lightPortal != 0 do doNotConvert = true
					
					-- Intensitiy, Color, Texmap
					r.intensity = origLight.multiplier
					r.shape = 1 
					r.width = origLight.width
					r.height = origLight.length
					
					r.color = origLight.color
					
					-- visibility
					r.visibleDirectly = not origLight.renderIcon
					
					if doNotConvert then(
						delete r
						r = #NoReplacement
					)
					
					r
				),
				
				
				-- ############## VrayIES ################
				fn convertFrom_VrayIES origLight = (
					r=CoronaLight()
					r.name=(if owner.converterSettings.addCoronaPrefix then owner.converterSettings.userPrefixStr else "") + origLight.name
					
					-- OnOff, Include/exclude
					r.on = origLight.enabled
					r.targeted = origLight.targeted
					case of (
						(origLight.includeList != undefined and origLight.includeList.count != 0): (
							r.excludeIncludeMod = true
							r.excludeList = origLight.includeList
						)
						(origLight.excludeList != undefined and origLight.excludeList.count != 0): (
							r.excludeIncludeMod = false
							r.excludeList = origLight.excludeList
						)
						default: ()
					)
					
					-- Intensitiy, Color, Texmap
					r.intensity = origLight.power
					r.intensityUnits = 1 -- luminous (lm)
					
					
					r.colorMode = origLight.color_mode -- 0: direct color, 1: kelvin temp
					r.color = origLight.color
					if r.colorMode == 1 do r.blackbodyTemp = origLight.color_temperature -- kelvin
					
					-- shape   -- 0: sphere, 1: Rectangle, 2: Disk, 3: Cylinder
					case origLight.shape of (
						0:( r.shape = 0 -- point
							r.iesSharpnessFake = true
							r.width = 5
							r.height = 5
						)
						1:( r.shape = 1 -- Rectangle
							r.width = if origLight.width != 0 then origLight.width else 5.0
							r.height = if origLight.length != 0 then origLight.length else 5.0
						)
						2:( r.shape = 2 -- circle
							r.width = if origLight.diameter != 0 then origLight.diameter / 2.0 else 5.0
						) 
						3:( r.shape = 0 -- sphere 
							r.width = if origLight.diameter != 0 then origLight.diameter / 2.0 else 5.0
						) 
						4:( r.shape = 2 -- vertical cylinder
							r.width = if origLight.diameter != 0 then origLight.diameter / 2.0 else 5.0
						) 
						default:(
							r.shape = 0 -- for everything else
							r.iesSharpnessFake = true
							r.width = 5
							r.height = 5
						)
					)
					
					-- visibility
					r.visibleDirectly = false
					r.occludeOtherLights = origLight.castShadows
					
					-- IES
	 				r.iesOn = true
					if origLight.ies_file != undefined do(
						r.iesFile = origLight.ies_file
					)
					
					r
				),
				
				
				-- ############## VraySun ################
				fn convertFrom_VraySun origLight = (
					r=CoronaSun()
					
					-- OnOff, Include/exclude
					r.on = origLight.enabled
					
					-- Intensitiy, Color, Texmap
					r.intensity = origLight.intensity_multiplier
					
					if hasProperty origLight "color_mode" then(
						if origLight.color_mode == 1 do ( -- 0:filter 1:direct 2:override
							r.colorDirect = origLight.filter_Color
							r.colorMode = 0
						)
					)
					
					-- visibility
					r.visibleDirectly = not origLight.invisible
					
					r 
				),
				
				-- ############## mrSun (Daylight assemblies only) ################
				fn convertFrom_mrSun origLight = (
					r=CoronaSun()
					
					r.on = origLight.on
					r.intensity = origLight.skymult
					
					r 
				),
				
				-- ############## mr_Sky_Portal ################
				fn convertFrom_mrSkyPortal origLight = (
					if origLight.mode == 1 then( -- if custom color source is defined convert to CoronaLight
						r=CoronaLight()
						r.name=(if owner.converterSettings.addCoronaPrefix then owner.converterSettings.userPrefixStr else "") + origLight.name
						
						r.on = origLight.on
						r.intensity = origLight.multiplier
						r.color = origLight.rgbFilter
						r.shape = 1  -- Plane
						r.width = origLight.light_Width 
						r.height = origLight.light_length 
						r.visibleDirectly = origLight.Area_Visible
						
						r
					)
					else(  -- if it's a normal portal without custom color source
						if owner.converterTempData.crnSkyPortalMtl == undefined do(
							owner.converterTempData.crnSkyPortalMtl = CoronaPortalMtl()
						)
						owner.converterTempData.foundPortals = true				
						
						r = Plane()
						r.width = origLight.light_Width
						r.length = origLight.light_length
						r.lengthsegs = 1
						r.widthsegs = 1
						
						InstanceMgr.GetInstances origLight &rptInstances
						trueInstances = for n in rptInstances where (areNodesInstances origLight n) collect n
						for i in trueInstances do instanceReplace i r
						trueInstances.material = owner.converterTempData.crnSkyPortalMtl
						delete r
						r = #NoReplacement
						
						r 
					)
				)
			)
			lightConvMethods owner:this
		),
		
		
		-- conversion core methods
		fn createCoronaMap orig_map =(
			if ((superclassof orig_map)!=textureMap) then return orig_map  -- check if this is a material; if not, just return the value
			
			local i=findItem converterTempData.orig_maps orig_map -- check if we have already converted this map
			if i>0 then return converterTempData.new_maps[i]  --if yes, just return the already converted one	
			
			-- recurse into sub-maps, if any
			local sub_count=getNumSubTexmaps orig_map
			if sub_count >= 1 then (
				for i=1 to sub_count do (
					newMap = createCoronaMap (getSubTexmap orig_map i)
					if newMap != #NoReplacement then(
						setSubTexmap orig_map i newMap
					)
				)
			)
			
			cls=classof orig_map
			
			local new_map=case cls of (
				FStormBitmap: errorCatching mapConvMethods.convertFrom_FStormBitmap orig_map
				FStormMix: errorCatching mapConvMethods.convertFrom_FStormMix orig_map
				FStormMultiTex: errorCatching mapConvMethods.convertFrom_FStormMultiTex orig_map
				FStormColor: errorCatching mapConvMethods.convertFrom_FStormColor orig_map
				FStormColorCorrection: errorCatching mapConvMethods.convertFrom_FStormColorCorrection orig_map
				FStormDirt: errorCatching mapConvMethods.convertFrom_FStormDirt orig_map
				FStormFalloff: errorCatching mapConvMethods.convertFrom_FStormFalloff orig_map
				FStormGradient: errorCatching mapConvMethods.convertFrom_FStormGradient orig_map
				FStormNoise: errorCatching mapConvMethods.convertFrom_FStormNoise orig_map
				FStormSky: errorCatching mapConvMethods.convertFrom_FStormSky orig_map
				VrayColor: errorCatching mapConvMethods.convertFrom_VrayColor orig_map
				VrayDirt: errorCatching mapConvMethods.convertFrom_VrayDirt orig_map
				VrayNormalMap: errorCatching mapConvMethods.convertFrom_VrayNormalMap orig_map
				VraySky: errorCatching mapConvMethods.convertFrom_VraySky orig_map
				VRayCompTex: errorCatching mapConvMethods.convertFrom_VRayCompTex orig_map
				VRayEdgesTex: errorCatching mapConvMethods.convertFrom_VRayEdgesTex orig_map 
				VRayGLSLTex: errorCatching mapConvMethods.convertFrom_VRayGLSLTex orig_map
				VRaySoftbox: errorCatching mapConvMethods.convertFrom_VRaySoftbox orig_map
				VRayHDRI: (if converterSettings.VrayHDRIToBitmaptexture then errorCatching mapConvMethods.convertFrom_VrayHDRI orig_map else orig_map)
				VRayTriplanarTex: errorCatching mapConvMethods.convertFrom_VRayTriplanarTex orig_map
				VRayColor2Bump:  errorCatching mapConvMethods.convertFrom_VRayColor2Bump orig_map
				
				Bitmaptexture: (if converterSettings.bitmapTextureToCoronaBitmap then errorCatching mapConvMethods.convertFrom_BitmapTexture orig_map else orig_map)
				Normal_Bump: errorCatching mapConvMethods.convertFrom_Normal_Bump orig_map
				Autodesk_Map: errorCatching mapConvMethods.convertFrom_Autodesk_Map orig_map
				Ambient_Reflective_Occlusion__3dsmax: errorCatching mapConvMethods.convertFrom_Ambient_Reflective_Occlusion__3dsmax orig_map
				Multi_Sub_Map: errorCatching mapConvMethods.convertFrom_Multi_Sub_Map orig_map
				
				default: orig_map
			)
			
			if new_map!=orig_map then ( 		-- if converted, add to the list of converted materials
				append converterTempData.orig_maps orig_map
				append converterTempData.new_maps new_map
			)
			new_map
		),
		
		fn createCoronaMtl orig_mtl processMaps:true =(
			if ((superclassof orig_mtl)!=material) then return orig_mtl  -- check if this is a material; if not, just return the value
			
			local i=findItem converterTempData.orig_mtls orig_mtl -- check if we have already converted this material
			if i>0 then return converterTempData.new_mtls[i]  --if yes, just return the already converted one	
			
			-- recurse into sub-materials, if any
			local sub_count=getNumSubMtls orig_mtl
			if sub_count >= 1 then (
				for i=1 to sub_count do (
					setSubMtl orig_mtl i (createCoronaMtl (getSubMtl orig_mtl i) processMaps:processMaps )
				)
			)
			
			if processMaps do( -- check if there are maps in this material and recurse into all subtexmaps
				local sub_count=getNumSubTexmaps orig_mtl
				if sub_count >= 1 then (
					for i=1 to sub_count do (
						newMap = createCoronaMap (getSubTexmap orig_mtl i)
						if newMap != #NoReplacement then(
							setSubTexmap orig_mtl i newMap
						)
					)
				)
			)
			
			cls=classof orig_mtl
			local new_mtl=case cls of (
				StandardMaterial: errorCatching matConvMethods.convertFrom_Standard orig_mtl
				FStorm: errorCatching matConvMethods.convertFrom_FStorm orig_mtl
				FStormMixMat: errorCatching matConvMethods.convertFrom_FStormMixMat orig_mtl
				FStormOverrideMat: errorCatching matConvMethods.convertFrom_FStormOverrideMat orig_mtl
				FStormPortal: errorCatching matConvMethods.convertFrom_FStormPortal orig_mtl
				VRayMtl: errorCatching matConvMethods.convertFrom_VrayMtl orig_mtl
				VRayBlendMtl: errorCatching matConvMethods.convertFrom_VrayBlendMtl orig_mtl
				VRayLightMtl: errorCatching matConvMethods.convertFrom_VrayLightMtl orig_mtl 
				VRay2SidedMtl: errorCatching matConvMethods.convertFrom_Vray2sidedMtl orig_mtl 
				VRayCarPaintMtl: errorCatching matConvMethods.convertFrom_VRayCarPaintMtl orig_mtl 
				VrayOverrideMtl: errorCatching matConvMethods.convertFrom_VrayOverrideMtl orig_mtl 
				VrayMtlWrapper: errorCatching matConvMethods.convertFrom_VrayMtlWrapper orig_mtl 
				VRayFastSSS2: errorCatching matConvMethods.convertFrom_VRayFastSSS2 orig_mtl 
				VRayHairMtl: errorCatching matConvMethods.convertFrom_VRayHairMtl orig_mtl 
				VRaySkinMtl: errorCatching matConvMethods.convertFrom_VRaySkinMtl orig_mtl 
				VRayBumpMtl: errorCatching matConvMethods.convertFrom_VRayBumpMtl orig_mtl
				Arch___Design__mi: errorCatching matConvMethods.convertFrom_ArchAndDesign orig_mtl 
				Car_Paint_Material__mi: errorCatching matConvMethods.convertFrom_MRCarPaintMaterial orig_mtl 
				fR_Advanced: errorCatching matConvMethods.convertFrom_fR_Advanced orig_mtl 
				fR_Architectural: errorCatching matConvMethods.convertFrom_fR_Architectural orig_mtl 
				Shellac: errorCatching matConvMethods.convertFrom_Shellac orig_mtl 
				Autodesk_Material: errorCatching matConvMethods.convertFrom_AutodeskMtl orig_mtl 
				Architectural: errorCatching matConvMethods.convertFrom_Architectural orig_mtl
				iray_Material: errorCatching matConvMethods.convertFrom_iray_Material orig_mtl
				
				--following materials will be replaced with default gray corona mat, will be supported later
				VRayFastSSS: errorCatching matConvMethods.convertFrom_VRayFastSSS orig_mtl 
				RaytraceMaterial: errorCatching matConvMethods.CreateDefaultCoronaMtl orig_mtl 
				fR_Metal: errorCatching matConvMethods.CreateDefaultCoronaMtl orig_mtl 
				fR_Glass: errorCatching matConvMethods.CreateDefaultCoronaMtl orig_mtl 
				
				default: orig_mtl
			)
			
			if new_mtl!=orig_mtl then ( 		-- if converted, add to the list of converted materials
				append converterTempData.orig_mtls orig_mtl
				append converterTempData.new_mtls new_mtl
			)
			
			new_mtl
		),
		
		fn createCoronaLights orig_light =(
			if ((superclassof orig_light)!=light) then return orig_light  -- check if this is a light; if not, just return the value
			
			local i=findItem converterTempData.orig_lights orig_light -- check if we have already converted this light
			if i>0 then return converterTempData.new_lights[i]  --if yes, just return the already converted one	
			
			cls=classof orig_light
			local new_light=case cls of (
				Free_Light: errorCatching lightConvMethods.convertFrom_StandardLights orig_light
				Free_Linear: errorCatching lightConvMethods.convertFrom_StandardLights orig_light
				Free_Area: errorCatching lightConvMethods.convertFrom_StandardLights orig_light
				Free_Disc: errorCatching lightConvMethods.convertFrom_StandardLights orig_light
				Free_Sphere: errorCatching lightConvMethods.convertFrom_StandardLights orig_light
				Free_Cylinder: errorCatching lightConvMethods.convertFrom_StandardLights orig_light
				Target_Light: errorCatching lightConvMethods.convertFrom_StandardLights orig_light 
				Target_Linear: errorCatching lightConvMethods.convertFrom_StandardLights orig_light 
				Target_Area: errorCatching lightConvMethods.convertFrom_StandardLights orig_light 
				Target_Disc: errorCatching lightConvMethods.convertFrom_StandardLights orig_light 
				Target_Sphere: errorCatching lightConvMethods.convertFrom_StandardLights orig_light 
				Target_Cylinder: errorCatching lightConvMethods.convertFrom_StandardLights orig_light 
				
				TargetDirectionallight: errorCatching lightConvMethods.convertFrom_StandardLights orig_light 
				freeSpot: errorCatching lightConvMethods.convertFrom_StandardLights orig_light 
				Directionallight: errorCatching lightConvMethods.convertFrom_StandardLights orig_light 
				Omnilight: errorCatching lightConvMethods.convertFrom_StandardLights orig_light 
				targetSpot: errorCatching lightConvMethods.convertFrom_StandardLights orig_light 
				
				VrayLight: errorCatching lightConvMethods.convertFrom_VrayLight orig_light
				VRayIES: errorCatching lightConvMethods.convertFrom_VrayIES orig_light
				VraySun: errorCatching lightConvMethods.convertFrom_VraySun orig_light
				FStormLight: errorCatching lightConvMethods.convertFrom_FStormLight orig_light
				FStormSunLight: errorCatching lightConvMethods.convertFrom_FStormSunLight orig_light
				miAreaLight: errorCatching lightConvMethods.convertFrom_miAreaLight orig_light 
				miAreaLightomni: errorCatching lightConvMethods.convertFrom_miAreaLight orig_light 
				mr_Sky_Portal: errorCatching lightConvMethods.convertFrom_mrSkyPortal orig_light
				RectLight: errorCatching lightConvMethods.convertFrom_fRRectLight orig_light
				
				default: orig_light
			)
			
			if new_light != orig_light then ( 		-- if converted, add to the list of converted lights
				append converterTempData.orig_lights orig_light
				append converterTempData.new_lights new_light
			)
			
			new_light
		),
		
		fn cleanUpConversionData =(
			converterTempData.orig_mtls=#()
			converterTempData.new_mtls=#()
			converterTempData.orig_maps=#()
			converterTempData.new_maps=#()
			converterTempData.orig_lights=#()
			converterTempData.new_lights=#()
			
			if converterTempData.AD_mats_found then(
				selectionSets["converted_AD_mtls"] = converterTempData.foundAdskMtls 
				converterTempData.foundAdskMtls = #()
				scenematerialsUpdateHack()
				converterTempData.AD_mats_found = false
				
				warningMessage = "Autodesk Materials were used in this scene and have been converted, it is STRONGLY recommended to check all those materials before rendering! \nObjects using these Materials have been added to a \"converted_AD_mtls\" selection set"
				if not converterSettings.silent do messageBox warningMessage title:"Warning"
			)
			
			if converterTempData.foundPortals then(
				converterTempData.foundPortals = false
				warningMessage = "Portals (mr_sky_Portal or VrayLight) were found and have been converted to planes with CoronaPortal materials. For best results check the position and coverage of your portals."
				if not converterSettings.silent do messageBox warningMessage title:"Warning"
			)
			
			clearUndoBuffer()
			true
		),
		
		fn additionalSceneSetup =(
			if converterSettings.switchRenderEngine do (
				if substring (classof renderers.current as string) 1 6 != "Corona" then(
					renderers.current = CoronaRenderer()
					if not renderers.medit_locked do renderers.medit = CoronaRenderer()
				)
			)
		),
		
		
		-- High-level Converter functionality
		fn convertSceneLights ErrorReport:true =(
			start = timeStamp()
			if converterSettings.printInfo do format "INFO: Converting scene lights...\n"
			cntr = 0
			
			allLights = for o in objects where superclassof o == light collect o
			for i in allLights do(
				if isValidNode i do(
					if i.parent != undefined and classof i.parent == DaylightAssemblyHead then() else(
						newLight = createCoronaLights i
						if newLight != #NoReplacement do(
							replaceInstances i newLight
						)
						cntr += 1
					)
				)
			)
			for o in (getclassinstances DaylightAssemblyHead) do (
				cntr += 1
				orig_light = o.sun
				cls=classof orig_light
				local new_light=case cls of (
					VraySun: lightConvMethods.convertFrom_VraySun orig_light
					mr_Sun: lightConvMethods.convertFrom_mrSun orig_light 
					IES_Sun: (CoronaSun())
					Directionallight: (CoronaSun())
					default: orig_light
				)
				o.sun = new_light
				if new_light != orig_light do(delete new_light)
				o.sky=undefined
			)
			
			delete (for elem in converterTempData.new_lights where (superclassof elem == light) and isvalidnode elem collect elem) 
			end = timeStamp()
			cTime = ("Light conversion took " +  ((end - start) / 1000.0) as string + " seconds ")
			append converterTempData.conversionTimeInfo cTime
			if converterSettings.printInfo do format "INFO: %\n" cTime
				
			itLts = ("Iterations: " + cntr as string)
			append converterTempData.conversionTimeInfo itLts
			if converterSettings.printInfo do format "INFO: %\n" itLts
			
			additionalSceneSetup()
			cleanUpConversionData()
			if ErrorReport do createErrorReports()
		),
		
		fn convertSceneMtlsMaps ErrorReport:true =(
			-- material conversion
			start = timeStamp()
			if converterSettings.printInfo do format "INFO: Converting scene materials...\n"
			cntr = 0
			
			for c in converterTempData.supportedMtlClasses do( --where c.creatable 
				cls = execute c
				if classof cls == material do(
					clssInst = getclassinstances cls processAllAnimatables:false processChildren:false asTrackViewPick:false -- HUGE SLOW DOWN!!!!!!!!!!!!!
					for i in clssInst do(
						replaceInstances i (createCoronaMtl i processMaps:false)
						cntr += 1
					)
				)
			)
			
			end = timeStamp()
			cMtlTime = ("Material conversion took " +  ((end - start) / 1000.0) as string + " seconds ")
			append converterTempData.conversionTimeInfo cMtlTime
			if converterSettings.printInfo do format "INFO: %\n" cMtlTime
				
			itMtl = ("Iterations: " + cntr as string + ", converted: " + converterTempData.new_mtls.count as string)
			append converterTempData.conversionTimeInfo itMtl
			if converterSettings.printInfo do format "INFO: %\n" itMtl
			
			-- map conversion
			start = timeStamp()
			if converterSettings.printInfo do format "INFO: Converting scene maps...\n"
			cntr = 0
			
			for c in converterTempData.supportedMapClasses do(
				cls = execute c
				if classof cls == textureMap do(
					classInst = getclassinstances cls processAllAnimatables:false processChildren:false asTrackViewPick:false -- HUGE SLOW DOWN!!!!!!!!!!!!!
					for i in classInst do(
						newMap = createCoronaMap i
						if newMap != #NoReplacement then(
							replaceInstances i newMap
						)
						cntr += 1
					)
				)
			)
			
			end = timeStamp()
			cMapTime = ("Map conversion took " +  ((end - start) / 1000.0) as string + " seconds ")
			append converterTempData.conversionTimeInfo cMapTime
			if converterSettings.printInfo do format "INFO: %\n" cMapTime
			
			itMap = ("Iterations: " + cntr as string + ", converted: " + converterTempData.new_maps.count as string)
			append converterTempData.conversionTimeInfo itMap
			if converterSettings.printInfo do format "INFO: %\n" itMap			
			
			additionalSceneSetup()
			cleanUpConversionData()
			if ErrorReport do createErrorReports()
		),
		
		fn convertScene =(
			convertSceneMtlsMaps ErrorReport:false
			convertSceneLights ErrorReport:false
			createErrorReports()
		),
		
		fn convertNodeArray nodeArray ErrorReport:true =(
			start = timeStamp()
			if converterSettings.printInfo do format "INFO: Converting scene materials...\n"
			cntr = 0
			
			for obj in nodeArray do(
				mat = obj.material
				if mat != undefined do(
					replaceInstances mat (createCoronaMtl mat processMaps:true)
					cntr += 1
				)
			)
			
			end = timeStamp()
			cMtlTime = ("Material conversion took " +  ((end - start) / 1000.0) as string + " seconds ")
			append converterTempData.conversionTimeInfo cMtlTime
			if converterSettings.printInfo do format "INFO: %\n" cMtlTime
				
			itMtl = ("Iterations: " + cntr as string + ", converted: " + converterTempData.new_mtls.count as string)
			append converterTempData.conversionTimeInfo itMtl
			if converterSettings.printInfo do format "INFO: %\n" itMtl
			
			additionalSceneSetup()
			cleanUpConversionData()
			if ErrorReport do createErrorReports()
		),
		
		fn convertMaterialArray matArray ErrorReport:true =(
			start = timeStamp()
			if converterSettings.printInfo do format "INFO: Converting scene materials...\n"
			cntr = 0
			
			for mat in matArray do(
				replaceInstances mat (createCoronaMtl mat processMaps:true)
				cntr += 1
			)
			
			end = timeStamp()
			cMtlTime = ("Material conversion took " +  ((end - start) / 1000.0) as string + " seconds ")
			append converterTempData.conversionTimeInfo cMtlTime
			if converterSettings.printInfo do format "INFO: %\n" cMtlTime
				
			itMtl = ("Iterations: " + cntr as string + ", converted: " + converterTempData.new_mtls.count as string)
			append converterTempData.conversionTimeInfo itMtl
			if converterSettings.printInfo do format "INFO: %\n" itMtl
			
			additionalSceneSetup()
			cleanUpConversionData()
			if ErrorReport do createErrorReports()
		),
		
		
		-- Converter Dialog
		CoronaConverterRoll = rollout CoronaConverterRoll ("Corona Converter v" + converterTools.getVersion() ) width:466  height:437 (
			local owner = if owner != undefined do owner
			
			
			-- Conversion settings Group
			local lastPos = [8,8]
			groupBox grpStd "Standard" pos:(lastPos += [0,0]) width:186 height:40
			checkbox chkReflstandardMat "convert specular to reflection" pos:(lastPos += [8,18]) width:168 height:16 checked:owner.converterSettings.standardMatSpecToRefl tooltip:"Convert specular intensitiy and glossiness to reflection values in a CoronaMtl"
			
			groupBox grpVray "Vray" pos:(lastPos += [-8,26]) width:186 height:60
			checkbox chkUseAdvVrayBlinnToCoronaGgx "adv. VRayBlinn to CoronaGGX" pos:(lastPos += [8,17]) width:168 height:16 checked:owner.converterSettings.vrayUseAdvBlinnToCoronaGgxConversion tooltip:"If checked uses a conversion table and an output map for converting VrayBlinn glossiness to new Corona GGX, will convert 1:1 otherwise"
			checkbox chkConvVrayHDRI "convert VrayHDRI" pos:(lastPos += [0,20]) width:168 height:16 checked:owner.converterSettings.VrayHDRIToBitmaptexture tooltip:"Converts VrayHDRI texture to standard BitmapTexture"
			
			groupBox grpOptions "Options" pos:(lastPos += [-8,26]) width:186 height:168
			checkbox chkCorPrefix "add prefix to converted mtls" pos:(lastPos += [8,18]) width:174 height:16 checked:owner.converterSettings.addCoronaPrefix tooltip:"converted materials will have the prefix added to their name" --pos:(lastPos += [0,52])
			edittext edtPrefix "" pos:(lastPos += [14,18]) width:144 height:17 tooltip:"converted materials will have the prefix added to their name"
			checkbox chkClampIOR "999 fresnel IOR to" pos:(lastPos += [-14,22]) width:106 height:16 checked:owner.converterSettings.clampIor tooltip:"Materials that would be converted to a 999.0 fresnel IOR (e.g. VrayMtls without fresnel reflections activated) can be clamped to a lower IOR with this setting."
			spinner spnClampedIOR "" pos:(lastPos + [112,0]) width:46 height:32 range:[1.0,999.0,owner.converterSettings.clampIorAmount] enabled:false type:#float tooltip:"Materials that would be converted to a 999.0 fresnel IOR (e.g. VrayMtls without fresnel reflections activated) can be clamped to a lower IOR with this setting."
			checkbox chkmiLightsToCrn "miAreaLight to CoronaLight" pos:(lastPos += [0,22]) width:168 height:16 checked:owner.converterSettings.miLightsToCrnLights tooltip:"Converts \"mr Area Omni\" and \"mr Area Spot\" to CoronaLights instead of leaving them standard lights"
			checkbox chkBitmapToCrnBitmap "Bitmap to CoronaBitmap" pos:(lastPos += [0,22]) width:168 height:16 checked:owner.converterSettings.bitmapTextureToCoronaBitmap tooltip:"Converts Bitmaptexture maps to CoronaBitmap"
			checkbox chkConvertProxies "convert Proxies (popup dialog)" pos:(lastPos += [0,22]) width:176  checked:owner.converterSettings.convertProxies tooltip:"Converts VrayProxy to CoronaProxy, opens a popup dialog"
			checkbox chkSwitchRen "switch renderer to Corona" pos:(lastPos += [0,22]) width:168 height:16 checked:owner.converterSettings.switchRenderEngine tooltip:"Assigns Corona as the current active renderer"
			
			groupBox grpConv "Conversion" pos:([8, grpOptions.pos.y + grpOptions.height + 4]) width:186 height:142
			radiobuttons rdoMode "" pos:(grpConv.pos + [8, 19]) width:82 height:48 labels:#("All (materials, maps, lights)", "only scene materials and maps", "only scene lights", "materials of selected objects", "selected material editor slot") columns:1 tooltip:"selection modes will convert materials and maps without breaking instancing, so be aware that other materials can be affected!"
			button btnStartConverting "START CONVERSION" pos:(grpConv.pos + [8,102]) width:170 height:32  -- pos:(lastPos += [0,24]) 
			
			
			-- Tools Group
			local lastPos = [202,8]
			groupBox grpTools "Tools" pos:(lastPos += [0,0]) width:256 height:322 -- +16
			button btnResetMtlEdit "Reset MatEdit to CoronaMtls" pos:(lastPos += [8,20]) width:160 height:20 tooltip:"Resets all Material editor materials to Standard Corona Mats"
			button btnStatistics "Statistics" pos:(lastPos += [165,0]) width:75 height:20 tooltip:"Show statistics about the current CoronaMtls in the scene"
			
			button btnDisableDisplace "disable Displacement maps" pos:(lastPos += [-165,24]) width:140 height:20 tooltip:"Disables Displacement maps in Corona materials"
			button btnConvertClass "convert by class" pos:(lastPos += [145,0]) width:95 height:20 tooltip:"Tool for converting specific unsupported material classes to default Corona Mtls (e.g. missing_mtl or Maxwell materials)"
			
			button btnRemoveOldGlossinessConversionMaps "remove old glossiness conversion maps" width:240 height:20 pos:(lastPos += [-145,24]) tooltip:"Removes glossiness conversion output maps from already converted older scenes"
			label lblShowMaps "Show maps in VP (selected obj):" pos:(lastPos += [5,26]) 
			button btnShowMapsInVP "On" pos:(lastPos += [155,-2]) width:40 height:20 tooltip:"Workaround for displaying diffuse maps in the viewport - can be VERY SLOW!"
			button btnUnShowMapsInVP "Off" pos:(lastPos += [40,0]) width:40 height:20 tooltip:"Workaround for turning display of diffuse maps in the viewport off"
			
			label lblPBRMode "CoronaMtl PBR Mode:" pos:(lastPos += [-195,26]) -- pos:(lastPos += [0,24]) 
			button btnPbrModeOn "On" pos:(lastPos += [155,-2]) width:40 height:20 tooltip:"Enables PBR mode on all CoronaMtls"
			button btnPbrModeOff "Off" pos:(lastPos += [40,0]) width:40 height:20 tooltip:"Disables PBR mode on all CoronaMtls"
			
			label lblEnergyCons "Legacy mode:" pos:(lastPos += [-195,28]) -- pos:(lastPos += [0,24]) 
			button btnLegacyModeNrm "disable" pos:(lastPos += [115,-4]) width:120 height:20 tooltip:"Disables legacy mode in CoronaMtls and CoronaLightMtls"
			label lblRoundCrns "RoundEdges map legacy mode:" pos:(lastPos += [-115,26]) -- pos:(lastPos += [0,24]) 
			button btnRndCrnsModeOn "On" pos:(lastPos += [155,-2]) width:40 height:20 tooltip:"Enables Legacy mode on all CoronaRoundEdges maps"
			button btnRndCrnsModeOff "Off" pos:(lastPos += [40,0]) width:40 height:20 tooltip:"Disables Legacy mode on all CoronaRoundEdges maps"
			
			button btnFixOpacityMapsMono "Fix opacity maps w. \"Mono Channel Output\" on" pos:(lastPos += [-200,26]) width:240  height:20 tooltip:"Opacity bitmaps that are using the \"Mono Channel Output\" option are rendered using the RGB channels (not the alpha) in Corona. This tool tries to fix those issue where possible. \nPrimarily used in materials for leafs."
			button btnFixCoronaNormalGamma "Fix CoronaNormal gamma value" pos:(lastPos += [0,24]) width:240  height:20 tooltip:"Checks if the gamma warning is displayed and switches the \"Add gamma to input\" checkbox on or off. Only works if input gamma is either 1.0 or 2.2"
			button btnConvertVrayDisplacementMods "Convert VrayDisplacementMod modifiers" pos:(lastPos += [0,24]) width:240  height:20 tooltip:"Replaces VrayDisplacementMod modifiers with CoronaDisplacementMod modifiers"
			button btnConvertFStormDisplacement "Convert fStorm Displacement modifiers" pos:(lastPos += [0,24]) width:240  height:20 tooltip:"Replaces fStormDisplacement modifiers with CoronaDisplacementMod modifiers"
			button btnConvBitmapToCoronaBitmap "Bitmap > CoronaBitmap" pos:(lastPos += [0,24]) width:120  height:20 tooltip:"Converts Bitmaptexture maps to CoronaBitmap"
			button btnConvCoronaBitmapToBitmap "CoronaBitmap > Bitmap" pos:(lastPos + [120,0]) width:120  height:20 tooltip:"Converts CoronaBitmap maps back to Bitmaptexture maps"
			button btnOnlineCheck "Check online for new converter versions" pos:(lastPos += [0,24]) width:240  height:20 tooltip:"Opens a window with info about available converter versions"
			
			
			-- Readme Group
			groupBox grpReaddMe "Things to check after conversion:"  width:256 height:92 pos:[grpTools.pos.x, grpTools.pos.y + grpTools.height + 7]--pos:[202,268]
			label lblDesc "" pos:(grpReaddMe.pos + [10,20]) width:240 height:70
			hyperlink hlAlbedo "see the helpdesk article" address:"https://corona-renderer.com/link/4000" visitedColor:owner.converterSettings.uiLinkColor color:owner.converterSettings.uiLinkColor pos:[grpReaddMe.pos.x + 99, (lblDesc.pos.y + 13 * 0)] -- last num is linenumber
			hyperlink hlperfDebg "performance debugging FAQ" address:"https://corona-renderer.com/link/4002" visitedColor:owner.converterSettings.uiLinkColor color:owner.converterSettings.uiLinkColor pos:[grpReaddMe.pos.x + 64, (lblDesc.pos.y + 13)]
			hyperlink hlconvThread "Corona forum thread" address:"https://corona-renderer.com/link/4003" visitedColor:owner.converterSettings.uiLinkColor color:owner.converterSettings.uiLinkColor pos:[grpReaddMe.pos.x + 146, (lblDesc.pos.y + 27)]
			hyperlink hlmxsDoc "Maxscript Documentation" address:"https://corona-renderer.com/link/4004" visitedColor:owner.converterSettings.uiLinkColor color:owner.converterSettings.uiLinkColor pos:[grpReaddMe.pos.x + 95 ,(lblDesc.pos.y + 52)]
			
 			-- DEBUG 
			checkBox chkErrorCatching "use try/catch bug reporting" offset:[0,80] checked:owner.converterSettings.useTryCatchBugReporting
			on chkErrorCatching changed state do(
				owner.converterSettings.useTryCatchBugReporting = state
			)
			
			
			-- Gui handler
			on chkReflstandardMat changed state do(
				owner.converterSettings.standardMatSpecToRefl = state
			)
			
			on chkUseAdvVrayBlinnToCoronaGgx changed state do(
				owner.converterSettings.vrayUseAdvBlinnToCoronaGgxConversion = state
			)
			
			on chkConvVrayHDRI changed state do(
				owner.converterSettings.VrayHDRIToBitmaptexture = state
			)
			
			on chkVrBltoMLBl changed state do(
				owner.converterSettings.vrayblendToMultilayerdBlend = state
			)
			
			on chkCorPrefix changed state do(
				owner.converterSettings.addCoronaPrefix = state
			)
			
			on edtPrefix changed txt do(
				owner.converterSettings.userPrefixStr = txt
			)
			
			on chkClampIOR changed state do(
				spnClampedIOR.enabled = state
				owner.converterSettings.clampIor = state
			)
			
			on spnClampedIOR changed val do(
				owner.converterSettings.clampIorAmount = val
			)
			
			on chkmiLightsToCrn changed state do(
				owner.converterSettings.miLightsToCrnLights = state
			)
			
			on chkBitmapToCrnBitmap changed state do(
				owner.converterSettings.bitmapTextureToCoronaBitmap = state
			)
			
			on chkSwitchRen changed state do(
				owner.converterSettings.switchRenderEngine = state
			)
			
			
			-- Tools
			on btnResetMtlEdit pressed do(
				owner.converterTools.resetMtlEdit()
			)
			
			on btnStatistics pressed do(
				owner.converterTools.CoronaMtlStats()
			)
			
			on btnRemoveOldGlossinessConversionMaps pressed do(
				owner.converterTools.removeOldGlossinessConversionMaps()
			)
			
			on btnPbrModeOn pressed do(
				owner.converterTools.setPBRMode true
			)
			
			on btnPbrModeOff pressed do(
				owner.converterTools.setPBRMode false
			)
			
			on btnRndCrnsModeOn pressed do(
				owner.converterTools.setRoundCornerLegacyMode true
			)
			
			on btnRndCrnsModeOff pressed do(
				owner.converterTools.setRoundCornerLegacyMode false
			)
			
			on btnLegacyModeNrm pressed do(
				owner.converterTools.setLegacyMode false
			)
			
			on btnShowMapsInVP pressed do(
				owner.converterTools.showMapsInVP true selected:true
			)
			
			on btnUnShowMapsInVP pressed do(
				owner.converterTools.showMapsInVP false selected:true
			)
			
			on btnDisableDisplace pressed do(
				owner.converterTools.DisableDisplacementTex()
			)
			
			on btnConvertClass pressed do(
				owner.converterTools.convertClass()
			)
			
			on btnFixOpacityMapsMono pressed do(
				owner.converterTools.fixOpacityMapsUsingMonoChannel()
			)
			
			on btnFixCoronaNormalGamma pressed do(
				owner.converterTools.fixCoronaNormalGamma()
			)
			
			on btnConvertVrayDisplacementMods pressed do(
				owner.converterTools.convertVrayDisplacementMods()
			)
			
			on btnConvertFStormDisplacement pressed do(
				owner.converterTools.convertFStormDisplacement()
			)
			
			on btnConvBitmapToCoronaBitmap pressed do(
				owner.converterTools.convertBitmapToCoronaBitmap()
			)
			
			on btnConvCoronaBitmapToBitmap pressed do(
				owner.converterTools.convertCoronaBitmapToBitmap()
			)
			
			on btnOnlineCheck pressed do(
				owner.converterTools.checkForNewVersion() 
			)
			
			-- start conversion button
			on btnStartConverting pressed do(
				max create mode
				with animate off (
					case rdoMode.state of(
						1: owner.convertScene()
						2: owner.convertSceneMtlsMaps()
						3: owner.convertSceneLights()
						4: owner.convertNodeArray (selection as array)
						5: owner.convertMaterialArray #(meditmaterials[activeMeditSlot]) 
					)
				)
				
				if chkConvertProxies.checked then(
					if (getClassInstances VrayProxy).count != 0 then(
						CoronaProxyConverter.openGui() 
					)
				)
				format "Conversion done.\n"
			)
			
			on CoronaConverterRoll open do(
				
				fn getIniSet sectionStr keyStr default =(
					out = (getinisetting owner.converterSettings.iniPath sectionStr keyStr) as string
					if out == "" then out = default as string
					out
				)
				
				cc = owner.converterSettings
				
				chkReflstandardMat.checked = cc.standardMatSpecToRefl = if (getIniSet "Standard" "SpecToRefl_Checked" cc.standardMatSpecToRefl) == "true" then true else false
				chkUseAdvVrayBlinnToCoronaGgx.checked = cc.vrayUseAdvBlinnToCoronaGgxConversion = if (getIniSet "Vray" "AdvBlinnToCoronaGGX" cc.vrayUseAdvBlinnToCoronaGgxConversion) == "true" then true else false
				chkConvVrayHDRI.checked = cc.VrayHDRIToBitmaptexture = if (getIniSet "Vray" "VrayHDRI_Checked" cc.VrayHDRIToBitmaptexture) == "true" then true else false
				
				edtPrefix.text = cc.userPrefixStr = (getIniSet "Options" "userString_String" cc.userPrefixStr) as string
				chkCorPrefix.checked = cc.addCoronaPrefix = if (getIniSet "Options" "userString_Checked" cc.addCoronaPrefix) == "true" then true else false
				chkClampIOR.checked = cc.clampIor = if (getIniSet "Options" "ClampIor_Checked" cc.clampIor) == "true" then true else false
				spnClampedIOR.value = cc.clampIorAmount = (getIniSet "Options" "ClampIor_Value" cc.clampIorAmount) as float
				spnClampedIOR.enabled = chkClampIOR.checked
				chkmiLightsToCrn.checked = cc.miLightsToCrnLights = if (getIniSet "Options" "MiLightsToCrn_Checked" cc.miLightsToCrnLights) == "true" then true else false
				chkBitmapToCrnBitmap.checked = cc.bitmapTextureToCoronaBitmap = if (getIniSet "Options" "BitmapToCrnBitmap_Checked" cc.bitmapTextureToCoronaBitmap) == "true" then true else false
				chkConvertProxies.checked = cc.convertProxies = if (getIniSet "Options" "ConvertProxies_Checked" cc.convertProxies) == "true" then true else false
				chkSwitchRen.checked = cc.switchRenderEngine = if (getIniSet "Options" "SwitchEngine_Checked" cc.switchRenderEngine) == "true" then true else false
				
				
				cc.dialogPosX = (getIniSet "DialogPos" "pos_x" cc.dialogPosX) as float 
				cc.dialogPosY = (getIniSet "DialogPos" "pos_y" cc.dialogPosY) as float 
				if cc.dialogPosX != 0.0 and cc.dialogPosY != 0.0 then (
					if (cc.dialogPosX > 0 and cc.dialogPosX < sysInfo.desktopSize.x - 200) do(
						if (cc.dialogPosY > 0 and cc.dialogPosY < sysInfo.desktopSize.y - 100) do(
							SetDialogPos CoronaConverterRoll [cc.dialogPosX, cc.dialogPosY]
						)
					)
				)
				
				if cc.exposeDebugSettings then CoronaConverterRoll.height += 60
				
				lblDesc.text += "* Material albedo:\n"
				lblDesc.text += "* read the \n"
				lblDesc.text += "* grab latest script version:\n"
				lblDesc.text += "* info about how to use the converter functions\n"
				lblDesc.text += "   with maxscript: \n"
				
			)
			
			on CoronaConverterRoll close do(
				ini = owner.converterSettings.iniPath
				
				setINISetting ini "Standard" "SpecToRefl_Checked" (chkReflstandardMat.checked as string)
				setINISetting ini "Vray" "AdvBlinnToCoronaGGX" (chkUseAdvVrayBlinnToCoronaGgx.checked as string)
				setINISetting ini "Vray" "VrayHDRI_Checked" (chkConvVrayHDRI.checked as string)
				
				setINISetting ini "Options" "userString_String" edtPrefix.text
				setINISetting ini "Options" "userString_Checked" (chkCorPrefix.checked as string)
				setINISetting ini "Options" "ClampIor_Checked" (chkClampIOR.checked as string)
				setINISetting ini "Options" "ClampIor_Value" (spnClampedIOR.value as string)
				setINISetting ini "Options" "MiLightsToCrn_Checked" (chkmiLightsToCrn.checked as string)
				setINISetting ini "Options" "BitmapToCrnBitmap_Checked" (chkBitmapToCrnBitmap.checked as string)
				setINISetting ini "Options" "ConvertProxies_Checked" (chkConvertProxies.checked as string)
				setINISetting ini "Options" "SwitchEngine_Checked" (chkSwitchRen.checked as string)
				
				try(setINISetting ini "DialogPos" "pos_x" ((GetDialogPos owner.CoronaConverterRoll).x as string) )catch()
				try(setINISetting ini "DialogPos" "pos_y" ((GetDialogPos owner.CoronaConverterRoll).y as string) )catch()
			)
		),
		
		fn openGui =(
			createDialog CoronaConverterRoll style:#(#style_titlebar, #style_sysmenu, #style_minimizebox)
		),
		
		fn destroyGui =(
			try(destroydialog CoronaConverterRoll)catch()
			try(destroydialog CoronaMtlConvStatsRoll)catch()
			try(destroydialog CoronaMtlConvClassRoll)catch()
		),
		
		on create do(
			CoronaConverterRoll.owner = this
			try(deleteItem selectionsets (selectionSets["converted_AD_mtls"]))catch()
		)
		
	)
	
	
	
	CoronaConverter = CoronaConverterStr()
	CoronaProxyConverter = CoronaProxyConverterStr()

	
	
	if CoronaConverterSuppressGui == false or CoronaConverterSuppressGui == undefined do(
		try(windows.sendMessage (windows.getChildHWND 0 ("Corona Converter v" + CoronaConverter.CoronaConverterVersion) parent:#max)[1] 0x0010 0 0)catch()
		try(windows.sendMessage (windows.getChildHWND 0 "Corona Mtl Statistics" parent:#max)[1] 0x0010 0 0)catch()
		try(windows.sendMessage (windows.getChildHWND 0 "Convert by class" parent:#max)[1] 0x0010 0 0)catch()
		
		convVers = CoronaConverter.converterTools.getVersion()  -- this script's version
		instCorBuild = CoronaConverter.converterTempData.coronaBuildTimestamp  -- installed corona build
		reqCorBuild = CoronaConverter.converterSettings.requiredBuildDate  -- lowest corona build version accepted
		req = #((substring (reqCorBuild as string) 1 4), (substring (reqCorBuild as string) 5 2), (substring (reqCorBuild as string) 7 2)) -- yyyy/mm/dd
		
		if instCorBuild[7] < reqCorBuild then(
			msg = "" as stringstream
			format "CoronaConverter v.% requires a Corona build of date %/%/% (Year/Month/Day) or later to work properly.\nYour currently installed Corona version is %/%/%" \
			convVers req[1] req[2] req[3] instCorBuild[1] instCorBuild[2] instCorBuild[3] to:msg
			messagebox msg title:"Version mismatch!"
		)
		CoronaConverter.openGui()
	)
)



