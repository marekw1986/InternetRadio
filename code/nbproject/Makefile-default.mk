#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Include project Makefile
ifeq "${IGNORE_LOCAL}" "TRUE"
# do not include local makefile. User is passing all local related variables already
else
include Makefile
# Include makefile containing local settings
ifeq "$(wildcard nbproject/Makefile-local-default.mk)" "nbproject/Makefile-local-default.mk"
include nbproject/Makefile-local-default.mk
endif
endif

# Environment
MKDIR=mkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=default
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
OUTPUT_SUFFIX=elf
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=${DISTDIR}/code.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=${DISTDIR}/code.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
endif

ifeq ($(COMPARE_BUILD), true)
COMPARISON_BUILD=-mafrlcsj
else
COMPARISON_BUILD=
endif

ifdef SUB_IMAGE_ADDRESS

else
SUB_IMAGE_ADDRESS_COMMAND=
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Source Files Quoted if spaced
SOURCEFILES_QUOTED_IF_SPACED=config/config.c delay/delay.c fatfs/ff.c fatfs/ffsystem.c fatfs/ffunicode.c fatfs/SPIFlash.c fatfs/diskio.c fatfs/sd.c net/Announce.c net/ARCFOUR.c net/ARP.c net/AutoIP.c net/BerkeleyAPI.c net/BigInt.c CustomHTTPApp.c net/DHCP.c net/DNS.c net/ENC28J60.c net/FTP.c net/GenericTCPServer.c net/Hashes.c net/Helpers.c net/HTTP2.c net/ICMP.c net/IP.c net/MPFS2.c MPFSImg2.c net/NBNS.c net/Random.c net/Reboot.c net/RSA.c net/SMTP.c net/SNTP.c net/SSL.c net/StackTsk.c net/TCP.c net/Telnet.c net/Tick.c net/UDP.c net/ZeroconfHelper.c net/ZeroconfLinkLocal.c net/ZeroconfMulticastDNS.c nvram/nvram.c time/time.c uart/uart.c usb/event.c usb/usb_config.c usb/usb_host.c usb/usb_host_msd.c usb/usb_host_msd_scsi.c vs1003/vs1003.c main.c common.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/config/config.o ${OBJECTDIR}/delay/delay.o ${OBJECTDIR}/fatfs/ff.o ${OBJECTDIR}/fatfs/ffsystem.o ${OBJECTDIR}/fatfs/ffunicode.o ${OBJECTDIR}/fatfs/SPIFlash.o ${OBJECTDIR}/fatfs/diskio.o ${OBJECTDIR}/fatfs/sd.o ${OBJECTDIR}/net/Announce.o ${OBJECTDIR}/net/ARCFOUR.o ${OBJECTDIR}/net/ARP.o ${OBJECTDIR}/net/AutoIP.o ${OBJECTDIR}/net/BerkeleyAPI.o ${OBJECTDIR}/net/BigInt.o ${OBJECTDIR}/CustomHTTPApp.o ${OBJECTDIR}/net/DHCP.o ${OBJECTDIR}/net/DNS.o ${OBJECTDIR}/net/ENC28J60.o ${OBJECTDIR}/net/FTP.o ${OBJECTDIR}/net/GenericTCPServer.o ${OBJECTDIR}/net/Hashes.o ${OBJECTDIR}/net/Helpers.o ${OBJECTDIR}/net/HTTP2.o ${OBJECTDIR}/net/ICMP.o ${OBJECTDIR}/net/IP.o ${OBJECTDIR}/net/MPFS2.o ${OBJECTDIR}/MPFSImg2.o ${OBJECTDIR}/net/NBNS.o ${OBJECTDIR}/net/Random.o ${OBJECTDIR}/net/Reboot.o ${OBJECTDIR}/net/RSA.o ${OBJECTDIR}/net/SMTP.o ${OBJECTDIR}/net/SNTP.o ${OBJECTDIR}/net/SSL.o ${OBJECTDIR}/net/StackTsk.o ${OBJECTDIR}/net/TCP.o ${OBJECTDIR}/net/Telnet.o ${OBJECTDIR}/net/Tick.o ${OBJECTDIR}/net/UDP.o ${OBJECTDIR}/net/ZeroconfHelper.o ${OBJECTDIR}/net/ZeroconfLinkLocal.o ${OBJECTDIR}/net/ZeroconfMulticastDNS.o ${OBJECTDIR}/nvram/nvram.o ${OBJECTDIR}/time/time.o ${OBJECTDIR}/uart/uart.o ${OBJECTDIR}/usb/event.o ${OBJECTDIR}/usb/usb_config.o ${OBJECTDIR}/usb/usb_host.o ${OBJECTDIR}/usb/usb_host_msd.o ${OBJECTDIR}/usb/usb_host_msd_scsi.o ${OBJECTDIR}/vs1003/vs1003.o ${OBJECTDIR}/main.o ${OBJECTDIR}/common.o
POSSIBLE_DEPFILES=${OBJECTDIR}/config/config.o.d ${OBJECTDIR}/delay/delay.o.d ${OBJECTDIR}/fatfs/ff.o.d ${OBJECTDIR}/fatfs/ffsystem.o.d ${OBJECTDIR}/fatfs/ffunicode.o.d ${OBJECTDIR}/fatfs/SPIFlash.o.d ${OBJECTDIR}/fatfs/diskio.o.d ${OBJECTDIR}/fatfs/sd.o.d ${OBJECTDIR}/net/Announce.o.d ${OBJECTDIR}/net/ARCFOUR.o.d ${OBJECTDIR}/net/ARP.o.d ${OBJECTDIR}/net/AutoIP.o.d ${OBJECTDIR}/net/BerkeleyAPI.o.d ${OBJECTDIR}/net/BigInt.o.d ${OBJECTDIR}/CustomHTTPApp.o.d ${OBJECTDIR}/net/DHCP.o.d ${OBJECTDIR}/net/DNS.o.d ${OBJECTDIR}/net/ENC28J60.o.d ${OBJECTDIR}/net/FTP.o.d ${OBJECTDIR}/net/GenericTCPServer.o.d ${OBJECTDIR}/net/Hashes.o.d ${OBJECTDIR}/net/Helpers.o.d ${OBJECTDIR}/net/HTTP2.o.d ${OBJECTDIR}/net/ICMP.o.d ${OBJECTDIR}/net/IP.o.d ${OBJECTDIR}/net/MPFS2.o.d ${OBJECTDIR}/MPFSImg2.o.d ${OBJECTDIR}/net/NBNS.o.d ${OBJECTDIR}/net/Random.o.d ${OBJECTDIR}/net/Reboot.o.d ${OBJECTDIR}/net/RSA.o.d ${OBJECTDIR}/net/SMTP.o.d ${OBJECTDIR}/net/SNTP.o.d ${OBJECTDIR}/net/SSL.o.d ${OBJECTDIR}/net/StackTsk.o.d ${OBJECTDIR}/net/TCP.o.d ${OBJECTDIR}/net/Telnet.o.d ${OBJECTDIR}/net/Tick.o.d ${OBJECTDIR}/net/UDP.o.d ${OBJECTDIR}/net/ZeroconfHelper.o.d ${OBJECTDIR}/net/ZeroconfLinkLocal.o.d ${OBJECTDIR}/net/ZeroconfMulticastDNS.o.d ${OBJECTDIR}/nvram/nvram.o.d ${OBJECTDIR}/time/time.o.d ${OBJECTDIR}/uart/uart.o.d ${OBJECTDIR}/usb/event.o.d ${OBJECTDIR}/usb/usb_config.o.d ${OBJECTDIR}/usb/usb_host.o.d ${OBJECTDIR}/usb/usb_host_msd.o.d ${OBJECTDIR}/usb/usb_host_msd_scsi.o.d ${OBJECTDIR}/vs1003/vs1003.o.d ${OBJECTDIR}/main.o.d ${OBJECTDIR}/common.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/config/config.o ${OBJECTDIR}/delay/delay.o ${OBJECTDIR}/fatfs/ff.o ${OBJECTDIR}/fatfs/ffsystem.o ${OBJECTDIR}/fatfs/ffunicode.o ${OBJECTDIR}/fatfs/SPIFlash.o ${OBJECTDIR}/fatfs/diskio.o ${OBJECTDIR}/fatfs/sd.o ${OBJECTDIR}/net/Announce.o ${OBJECTDIR}/net/ARCFOUR.o ${OBJECTDIR}/net/ARP.o ${OBJECTDIR}/net/AutoIP.o ${OBJECTDIR}/net/BerkeleyAPI.o ${OBJECTDIR}/net/BigInt.o ${OBJECTDIR}/CustomHTTPApp.o ${OBJECTDIR}/net/DHCP.o ${OBJECTDIR}/net/DNS.o ${OBJECTDIR}/net/ENC28J60.o ${OBJECTDIR}/net/FTP.o ${OBJECTDIR}/net/GenericTCPServer.o ${OBJECTDIR}/net/Hashes.o ${OBJECTDIR}/net/Helpers.o ${OBJECTDIR}/net/HTTP2.o ${OBJECTDIR}/net/ICMP.o ${OBJECTDIR}/net/IP.o ${OBJECTDIR}/net/MPFS2.o ${OBJECTDIR}/MPFSImg2.o ${OBJECTDIR}/net/NBNS.o ${OBJECTDIR}/net/Random.o ${OBJECTDIR}/net/Reboot.o ${OBJECTDIR}/net/RSA.o ${OBJECTDIR}/net/SMTP.o ${OBJECTDIR}/net/SNTP.o ${OBJECTDIR}/net/SSL.o ${OBJECTDIR}/net/StackTsk.o ${OBJECTDIR}/net/TCP.o ${OBJECTDIR}/net/Telnet.o ${OBJECTDIR}/net/Tick.o ${OBJECTDIR}/net/UDP.o ${OBJECTDIR}/net/ZeroconfHelper.o ${OBJECTDIR}/net/ZeroconfLinkLocal.o ${OBJECTDIR}/net/ZeroconfMulticastDNS.o ${OBJECTDIR}/nvram/nvram.o ${OBJECTDIR}/time/time.o ${OBJECTDIR}/uart/uart.o ${OBJECTDIR}/usb/event.o ${OBJECTDIR}/usb/usb_config.o ${OBJECTDIR}/usb/usb_host.o ${OBJECTDIR}/usb/usb_host_msd.o ${OBJECTDIR}/usb/usb_host_msd_scsi.o ${OBJECTDIR}/vs1003/vs1003.o ${OBJECTDIR}/main.o ${OBJECTDIR}/common.o

# Source Files
SOURCEFILES=config/config.c delay/delay.c fatfs/ff.c fatfs/ffsystem.c fatfs/ffunicode.c fatfs/SPIFlash.c fatfs/diskio.c fatfs/sd.c net/Announce.c net/ARCFOUR.c net/ARP.c net/AutoIP.c net/BerkeleyAPI.c net/BigInt.c CustomHTTPApp.c net/DHCP.c net/DNS.c net/ENC28J60.c net/FTP.c net/GenericTCPServer.c net/Hashes.c net/Helpers.c net/HTTP2.c net/ICMP.c net/IP.c net/MPFS2.c MPFSImg2.c net/NBNS.c net/Random.c net/Reboot.c net/RSA.c net/SMTP.c net/SNTP.c net/SSL.c net/StackTsk.c net/TCP.c net/Telnet.c net/Tick.c net/UDP.c net/ZeroconfHelper.c net/ZeroconfLinkLocal.c net/ZeroconfMulticastDNS.c nvram/nvram.c time/time.c uart/uart.c usb/event.c usb/usb_config.c usb/usb_host.c usb/usb_host_msd.c usb/usb_host_msd_scsi.c vs1003/vs1003.c main.c common.c



CFLAGS=
ASFLAGS=
LDLIBSOPTIONS=

############# Tool locations ##########################################
# If you copy a project from one host to another, the path where the  #
# compiler is installed may be different.                             #
# If you open this project with MPLAB X in the new host, this         #
# makefile will be regenerated and the paths will be corrected.       #
#######################################################################
# fixDeps replaces a bunch of sed/cat/printf statements that slow down the build
FIXDEPS=fixDeps

.build-conf:  ${BUILD_SUBPROJECTS}
ifneq ($(INFORMATION_MESSAGE), )
	@echo $(INFORMATION_MESSAGE)
endif
	${MAKE}  -f nbproject/Makefile-default.mk ${DISTDIR}/code.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=32MX795F512L
MP_LINKER_FILE_OPTION=
# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assembleWithPreprocess
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/config/config.o: config/config.c  .generated_files/flags/default/70fb06c07695bc05fb249c6eeb8dec1f7b4dec00 .generated_files/flags/default/3a7ff55a6cb9e565cc82ee7521042155d62a01fd
	@${MKDIR} "${OBJECTDIR}/config" 
	@${RM} ${OBJECTDIR}/config/config.o.d 
	@${RM} ${OBJECTDIR}/config/config.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -D_SUPPRESS_PLIB_WARNING -DSYSCLK=80000000L -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -MP -MMD -MF "${OBJECTDIR}/config/config.o.d" -o ${OBJECTDIR}/config/config.o config/config.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/delay/delay.o: delay/delay.c  .generated_files/flags/default/9b66f89cdba9b6f90fca3395b9074387c125d706 .generated_files/flags/default/3a7ff55a6cb9e565cc82ee7521042155d62a01fd
	@${MKDIR} "${OBJECTDIR}/delay" 
	@${RM} ${OBJECTDIR}/delay/delay.o.d 
	@${RM} ${OBJECTDIR}/delay/delay.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -D_SUPPRESS_PLIB_WARNING -DSYSCLK=80000000L -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -MP -MMD -MF "${OBJECTDIR}/delay/delay.o.d" -o ${OBJECTDIR}/delay/delay.o delay/delay.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/fatfs/ff.o: fatfs/ff.c  .generated_files/flags/default/b12fd87670075ba418861da57c3009563845ffac .generated_files/flags/default/3a7ff55a6cb9e565cc82ee7521042155d62a01fd
	@${MKDIR} "${OBJECTDIR}/fatfs" 
	@${RM} ${OBJECTDIR}/fatfs/ff.o.d 
	@${RM} ${OBJECTDIR}/fatfs/ff.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -D_SUPPRESS_PLIB_WARNING -DSYSCLK=80000000L -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -MP -MMD -MF "${OBJECTDIR}/fatfs/ff.o.d" -o ${OBJECTDIR}/fatfs/ff.o fatfs/ff.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/fatfs/ffsystem.o: fatfs/ffsystem.c  .generated_files/flags/default/eebe2803fca774950911830cb65694b9fc19817e .generated_files/flags/default/3a7ff55a6cb9e565cc82ee7521042155d62a01fd
	@${MKDIR} "${OBJECTDIR}/fatfs" 
	@${RM} ${OBJECTDIR}/fatfs/ffsystem.o.d 
	@${RM} ${OBJECTDIR}/fatfs/ffsystem.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -D_SUPPRESS_PLIB_WARNING -DSYSCLK=80000000L -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -MP -MMD -MF "${OBJECTDIR}/fatfs/ffsystem.o.d" -o ${OBJECTDIR}/fatfs/ffsystem.o fatfs/ffsystem.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/fatfs/ffunicode.o: fatfs/ffunicode.c  .generated_files/flags/default/a310ebf4eb38fec84841690d65816ac2197521b1 .generated_files/flags/default/3a7ff55a6cb9e565cc82ee7521042155d62a01fd
	@${MKDIR} "${OBJECTDIR}/fatfs" 
	@${RM} ${OBJECTDIR}/fatfs/ffunicode.o.d 
	@${RM} ${OBJECTDIR}/fatfs/ffunicode.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -D_SUPPRESS_PLIB_WARNING -DSYSCLK=80000000L -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -MP -MMD -MF "${OBJECTDIR}/fatfs/ffunicode.o.d" -o ${OBJECTDIR}/fatfs/ffunicode.o fatfs/ffunicode.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/fatfs/SPIFlash.o: fatfs/SPIFlash.c  .generated_files/flags/default/30dee5165ce1cf442cad24b447ab68ecb3a58b7d .generated_files/flags/default/3a7ff55a6cb9e565cc82ee7521042155d62a01fd
	@${MKDIR} "${OBJECTDIR}/fatfs" 
	@${RM} ${OBJECTDIR}/fatfs/SPIFlash.o.d 
	@${RM} ${OBJECTDIR}/fatfs/SPIFlash.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -D_SUPPRESS_PLIB_WARNING -DSYSCLK=80000000L -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -MP -MMD -MF "${OBJECTDIR}/fatfs/SPIFlash.o.d" -o ${OBJECTDIR}/fatfs/SPIFlash.o fatfs/SPIFlash.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/fatfs/diskio.o: fatfs/diskio.c  .generated_files/flags/default/402d6b0cb5c017089b10f1b0b0066d70dfe59162 .generated_files/flags/default/3a7ff55a6cb9e565cc82ee7521042155d62a01fd
	@${MKDIR} "${OBJECTDIR}/fatfs" 
	@${RM} ${OBJECTDIR}/fatfs/diskio.o.d 
	@${RM} ${OBJECTDIR}/fatfs/diskio.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -D_SUPPRESS_PLIB_WARNING -DSYSCLK=80000000L -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -MP -MMD -MF "${OBJECTDIR}/fatfs/diskio.o.d" -o ${OBJECTDIR}/fatfs/diskio.o fatfs/diskio.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/fatfs/sd.o: fatfs/sd.c  .generated_files/flags/default/b1a058fa6e1893b04699bf1e229bc4591131b52f .generated_files/flags/default/3a7ff55a6cb9e565cc82ee7521042155d62a01fd
	@${MKDIR} "${OBJECTDIR}/fatfs" 
	@${RM} ${OBJECTDIR}/fatfs/sd.o.d 
	@${RM} ${OBJECTDIR}/fatfs/sd.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -D_SUPPRESS_PLIB_WARNING -DSYSCLK=80000000L -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -MP -MMD -MF "${OBJECTDIR}/fatfs/sd.o.d" -o ${OBJECTDIR}/fatfs/sd.o fatfs/sd.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/net/Announce.o: net/Announce.c  .generated_files/flags/default/d0b859b31f584bed9e8b03e4d16e5c3043df8b8 .generated_files/flags/default/3a7ff55a6cb9e565cc82ee7521042155d62a01fd
	@${MKDIR} "${OBJECTDIR}/net" 
	@${RM} ${OBJECTDIR}/net/Announce.o.d 
	@${RM} ${OBJECTDIR}/net/Announce.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -D_SUPPRESS_PLIB_WARNING -DSYSCLK=80000000L -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -MP -MMD -MF "${OBJECTDIR}/net/Announce.o.d" -o ${OBJECTDIR}/net/Announce.o net/Announce.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/net/ARCFOUR.o: net/ARCFOUR.c  .generated_files/flags/default/a8955a8c146a542cb14e685fabecc9c8707f5abf .generated_files/flags/default/3a7ff55a6cb9e565cc82ee7521042155d62a01fd
	@${MKDIR} "${OBJECTDIR}/net" 
	@${RM} ${OBJECTDIR}/net/ARCFOUR.o.d 
	@${RM} ${OBJECTDIR}/net/ARCFOUR.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -D_SUPPRESS_PLIB_WARNING -DSYSCLK=80000000L -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -MP -MMD -MF "${OBJECTDIR}/net/ARCFOUR.o.d" -o ${OBJECTDIR}/net/ARCFOUR.o net/ARCFOUR.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/net/ARP.o: net/ARP.c  .generated_files/flags/default/533592f2d8eb8133f200e65a5425e3389681d6a4 .generated_files/flags/default/3a7ff55a6cb9e565cc82ee7521042155d62a01fd
	@${MKDIR} "${OBJECTDIR}/net" 
	@${RM} ${OBJECTDIR}/net/ARP.o.d 
	@${RM} ${OBJECTDIR}/net/ARP.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -D_SUPPRESS_PLIB_WARNING -DSYSCLK=80000000L -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -MP -MMD -MF "${OBJECTDIR}/net/ARP.o.d" -o ${OBJECTDIR}/net/ARP.o net/ARP.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/net/AutoIP.o: net/AutoIP.c  .generated_files/flags/default/981df1d81982d343c092fbfac754136ee90989a2 .generated_files/flags/default/3a7ff55a6cb9e565cc82ee7521042155d62a01fd
	@${MKDIR} "${OBJECTDIR}/net" 
	@${RM} ${OBJECTDIR}/net/AutoIP.o.d 
	@${RM} ${OBJECTDIR}/net/AutoIP.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -D_SUPPRESS_PLIB_WARNING -DSYSCLK=80000000L -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -MP -MMD -MF "${OBJECTDIR}/net/AutoIP.o.d" -o ${OBJECTDIR}/net/AutoIP.o net/AutoIP.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/net/BerkeleyAPI.o: net/BerkeleyAPI.c  .generated_files/flags/default/7f380dd55516f4f2498216cd29c088c104e9d462 .generated_files/flags/default/3a7ff55a6cb9e565cc82ee7521042155d62a01fd
	@${MKDIR} "${OBJECTDIR}/net" 
	@${RM} ${OBJECTDIR}/net/BerkeleyAPI.o.d 
	@${RM} ${OBJECTDIR}/net/BerkeleyAPI.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -D_SUPPRESS_PLIB_WARNING -DSYSCLK=80000000L -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -MP -MMD -MF "${OBJECTDIR}/net/BerkeleyAPI.o.d" -o ${OBJECTDIR}/net/BerkeleyAPI.o net/BerkeleyAPI.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/net/BigInt.o: net/BigInt.c  .generated_files/flags/default/4bef10844f568d14c7de393c4dbc6facd164a0a3 .generated_files/flags/default/3a7ff55a6cb9e565cc82ee7521042155d62a01fd
	@${MKDIR} "${OBJECTDIR}/net" 
	@${RM} ${OBJECTDIR}/net/BigInt.o.d 
	@${RM} ${OBJECTDIR}/net/BigInt.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -D_SUPPRESS_PLIB_WARNING -DSYSCLK=80000000L -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -MP -MMD -MF "${OBJECTDIR}/net/BigInt.o.d" -o ${OBJECTDIR}/net/BigInt.o net/BigInt.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/CustomHTTPApp.o: CustomHTTPApp.c  .generated_files/flags/default/cfa7572b50c99760cdf4178210d4586b7ccea36 .generated_files/flags/default/3a7ff55a6cb9e565cc82ee7521042155d62a01fd
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/CustomHTTPApp.o.d 
	@${RM} ${OBJECTDIR}/CustomHTTPApp.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -D_SUPPRESS_PLIB_WARNING -DSYSCLK=80000000L -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -MP -MMD -MF "${OBJECTDIR}/CustomHTTPApp.o.d" -o ${OBJECTDIR}/CustomHTTPApp.o CustomHTTPApp.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/net/DHCP.o: net/DHCP.c  .generated_files/flags/default/fd1b61d462cf434b14b3a230a1b87710de705c79 .generated_files/flags/default/3a7ff55a6cb9e565cc82ee7521042155d62a01fd
	@${MKDIR} "${OBJECTDIR}/net" 
	@${RM} ${OBJECTDIR}/net/DHCP.o.d 
	@${RM} ${OBJECTDIR}/net/DHCP.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -D_SUPPRESS_PLIB_WARNING -DSYSCLK=80000000L -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -MP -MMD -MF "${OBJECTDIR}/net/DHCP.o.d" -o ${OBJECTDIR}/net/DHCP.o net/DHCP.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/net/DNS.o: net/DNS.c  .generated_files/flags/default/1e5d86e9d44752a05af6c6ca2b1cdac1ff74fdd8 .generated_files/flags/default/3a7ff55a6cb9e565cc82ee7521042155d62a01fd
	@${MKDIR} "${OBJECTDIR}/net" 
	@${RM} ${OBJECTDIR}/net/DNS.o.d 
	@${RM} ${OBJECTDIR}/net/DNS.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -D_SUPPRESS_PLIB_WARNING -DSYSCLK=80000000L -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -MP -MMD -MF "${OBJECTDIR}/net/DNS.o.d" -o ${OBJECTDIR}/net/DNS.o net/DNS.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/net/ENC28J60.o: net/ENC28J60.c  .generated_files/flags/default/c69a46c8e79f2da4761ea389068acece8c160061 .generated_files/flags/default/3a7ff55a6cb9e565cc82ee7521042155d62a01fd
	@${MKDIR} "${OBJECTDIR}/net" 
	@${RM} ${OBJECTDIR}/net/ENC28J60.o.d 
	@${RM} ${OBJECTDIR}/net/ENC28J60.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -D_SUPPRESS_PLIB_WARNING -DSYSCLK=80000000L -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -MP -MMD -MF "${OBJECTDIR}/net/ENC28J60.o.d" -o ${OBJECTDIR}/net/ENC28J60.o net/ENC28J60.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/net/FTP.o: net/FTP.c  .generated_files/flags/default/6e0abefb935adc7d538015c946ec8dce50f04f58 .generated_files/flags/default/3a7ff55a6cb9e565cc82ee7521042155d62a01fd
	@${MKDIR} "${OBJECTDIR}/net" 
	@${RM} ${OBJECTDIR}/net/FTP.o.d 
	@${RM} ${OBJECTDIR}/net/FTP.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -D_SUPPRESS_PLIB_WARNING -DSYSCLK=80000000L -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -MP -MMD -MF "${OBJECTDIR}/net/FTP.o.d" -o ${OBJECTDIR}/net/FTP.o net/FTP.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/net/GenericTCPServer.o: net/GenericTCPServer.c  .generated_files/flags/default/99eda4082ab55d5b9b08f715386e1ebf363c5e2d .generated_files/flags/default/3a7ff55a6cb9e565cc82ee7521042155d62a01fd
	@${MKDIR} "${OBJECTDIR}/net" 
	@${RM} ${OBJECTDIR}/net/GenericTCPServer.o.d 
	@${RM} ${OBJECTDIR}/net/GenericTCPServer.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -D_SUPPRESS_PLIB_WARNING -DSYSCLK=80000000L -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -MP -MMD -MF "${OBJECTDIR}/net/GenericTCPServer.o.d" -o ${OBJECTDIR}/net/GenericTCPServer.o net/GenericTCPServer.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/net/Hashes.o: net/Hashes.c  .generated_files/flags/default/d3592e27e8eb0993f2c13bb1e8f621a0c03eae42 .generated_files/flags/default/3a7ff55a6cb9e565cc82ee7521042155d62a01fd
	@${MKDIR} "${OBJECTDIR}/net" 
	@${RM} ${OBJECTDIR}/net/Hashes.o.d 
	@${RM} ${OBJECTDIR}/net/Hashes.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -D_SUPPRESS_PLIB_WARNING -DSYSCLK=80000000L -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -MP -MMD -MF "${OBJECTDIR}/net/Hashes.o.d" -o ${OBJECTDIR}/net/Hashes.o net/Hashes.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/net/Helpers.o: net/Helpers.c  .generated_files/flags/default/90d2cb4239d413b85b6e1cc30462768b1c3ccef2 .generated_files/flags/default/3a7ff55a6cb9e565cc82ee7521042155d62a01fd
	@${MKDIR} "${OBJECTDIR}/net" 
	@${RM} ${OBJECTDIR}/net/Helpers.o.d 
	@${RM} ${OBJECTDIR}/net/Helpers.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -D_SUPPRESS_PLIB_WARNING -DSYSCLK=80000000L -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -MP -MMD -MF "${OBJECTDIR}/net/Helpers.o.d" -o ${OBJECTDIR}/net/Helpers.o net/Helpers.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/net/HTTP2.o: net/HTTP2.c  .generated_files/flags/default/d0e50b410dda122b136b7c225ce85ba2ef28e81e .generated_files/flags/default/3a7ff55a6cb9e565cc82ee7521042155d62a01fd
	@${MKDIR} "${OBJECTDIR}/net" 
	@${RM} ${OBJECTDIR}/net/HTTP2.o.d 
	@${RM} ${OBJECTDIR}/net/HTTP2.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -D_SUPPRESS_PLIB_WARNING -DSYSCLK=80000000L -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -MP -MMD -MF "${OBJECTDIR}/net/HTTP2.o.d" -o ${OBJECTDIR}/net/HTTP2.o net/HTTP2.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/net/ICMP.o: net/ICMP.c  .generated_files/flags/default/6d10f924e5b8b927fd03f7a5b112236e5d2d64a6 .generated_files/flags/default/3a7ff55a6cb9e565cc82ee7521042155d62a01fd
	@${MKDIR} "${OBJECTDIR}/net" 
	@${RM} ${OBJECTDIR}/net/ICMP.o.d 
	@${RM} ${OBJECTDIR}/net/ICMP.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -D_SUPPRESS_PLIB_WARNING -DSYSCLK=80000000L -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -MP -MMD -MF "${OBJECTDIR}/net/ICMP.o.d" -o ${OBJECTDIR}/net/ICMP.o net/ICMP.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/net/IP.o: net/IP.c  .generated_files/flags/default/11e1d7e8b7ea9405606ba0b06ee4faea53797e6b .generated_files/flags/default/3a7ff55a6cb9e565cc82ee7521042155d62a01fd
	@${MKDIR} "${OBJECTDIR}/net" 
	@${RM} ${OBJECTDIR}/net/IP.o.d 
	@${RM} ${OBJECTDIR}/net/IP.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -D_SUPPRESS_PLIB_WARNING -DSYSCLK=80000000L -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -MP -MMD -MF "${OBJECTDIR}/net/IP.o.d" -o ${OBJECTDIR}/net/IP.o net/IP.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/net/MPFS2.o: net/MPFS2.c  .generated_files/flags/default/de5c0d91f0871ed06c23581237435ee53a500b58 .generated_files/flags/default/3a7ff55a6cb9e565cc82ee7521042155d62a01fd
	@${MKDIR} "${OBJECTDIR}/net" 
	@${RM} ${OBJECTDIR}/net/MPFS2.o.d 
	@${RM} ${OBJECTDIR}/net/MPFS2.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -D_SUPPRESS_PLIB_WARNING -DSYSCLK=80000000L -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -MP -MMD -MF "${OBJECTDIR}/net/MPFS2.o.d" -o ${OBJECTDIR}/net/MPFS2.o net/MPFS2.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/MPFSImg2.o: MPFSImg2.c  .generated_files/flags/default/3e2c200576245cd1a715131fe533f0aebc229354 .generated_files/flags/default/3a7ff55a6cb9e565cc82ee7521042155d62a01fd
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/MPFSImg2.o.d 
	@${RM} ${OBJECTDIR}/MPFSImg2.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -D_SUPPRESS_PLIB_WARNING -DSYSCLK=80000000L -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -MP -MMD -MF "${OBJECTDIR}/MPFSImg2.o.d" -o ${OBJECTDIR}/MPFSImg2.o MPFSImg2.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/net/NBNS.o: net/NBNS.c  .generated_files/flags/default/80e648ca5a8f8655482288f539fb7cbecde6b2ad .generated_files/flags/default/3a7ff55a6cb9e565cc82ee7521042155d62a01fd
	@${MKDIR} "${OBJECTDIR}/net" 
	@${RM} ${OBJECTDIR}/net/NBNS.o.d 
	@${RM} ${OBJECTDIR}/net/NBNS.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -D_SUPPRESS_PLIB_WARNING -DSYSCLK=80000000L -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -MP -MMD -MF "${OBJECTDIR}/net/NBNS.o.d" -o ${OBJECTDIR}/net/NBNS.o net/NBNS.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/net/Random.o: net/Random.c  .generated_files/flags/default/525f57ac36e8b78b55d747e7b2317d7d7af7d3e9 .generated_files/flags/default/3a7ff55a6cb9e565cc82ee7521042155d62a01fd
	@${MKDIR} "${OBJECTDIR}/net" 
	@${RM} ${OBJECTDIR}/net/Random.o.d 
	@${RM} ${OBJECTDIR}/net/Random.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -D_SUPPRESS_PLIB_WARNING -DSYSCLK=80000000L -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -MP -MMD -MF "${OBJECTDIR}/net/Random.o.d" -o ${OBJECTDIR}/net/Random.o net/Random.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/net/Reboot.o: net/Reboot.c  .generated_files/flags/default/86e4d4d85603bd2b7a32bd633d64097d13089018 .generated_files/flags/default/3a7ff55a6cb9e565cc82ee7521042155d62a01fd
	@${MKDIR} "${OBJECTDIR}/net" 
	@${RM} ${OBJECTDIR}/net/Reboot.o.d 
	@${RM} ${OBJECTDIR}/net/Reboot.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -D_SUPPRESS_PLIB_WARNING -DSYSCLK=80000000L -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -MP -MMD -MF "${OBJECTDIR}/net/Reboot.o.d" -o ${OBJECTDIR}/net/Reboot.o net/Reboot.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/net/RSA.o: net/RSA.c  .generated_files/flags/default/e3bb3d4eb66aaa32f43f071b9e2b8acbd4e40f41 .generated_files/flags/default/3a7ff55a6cb9e565cc82ee7521042155d62a01fd
	@${MKDIR} "${OBJECTDIR}/net" 
	@${RM} ${OBJECTDIR}/net/RSA.o.d 
	@${RM} ${OBJECTDIR}/net/RSA.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -D_SUPPRESS_PLIB_WARNING -DSYSCLK=80000000L -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -MP -MMD -MF "${OBJECTDIR}/net/RSA.o.d" -o ${OBJECTDIR}/net/RSA.o net/RSA.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/net/SMTP.o: net/SMTP.c  .generated_files/flags/default/227f20c8e8bebb5d431a81bf8f21a4198fb3c0df .generated_files/flags/default/3a7ff55a6cb9e565cc82ee7521042155d62a01fd
	@${MKDIR} "${OBJECTDIR}/net" 
	@${RM} ${OBJECTDIR}/net/SMTP.o.d 
	@${RM} ${OBJECTDIR}/net/SMTP.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -D_SUPPRESS_PLIB_WARNING -DSYSCLK=80000000L -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -MP -MMD -MF "${OBJECTDIR}/net/SMTP.o.d" -o ${OBJECTDIR}/net/SMTP.o net/SMTP.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/net/SNTP.o: net/SNTP.c  .generated_files/flags/default/33ea2d52a850980a153f7e0f9aea34380093086a .generated_files/flags/default/3a7ff55a6cb9e565cc82ee7521042155d62a01fd
	@${MKDIR} "${OBJECTDIR}/net" 
	@${RM} ${OBJECTDIR}/net/SNTP.o.d 
	@${RM} ${OBJECTDIR}/net/SNTP.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -D_SUPPRESS_PLIB_WARNING -DSYSCLK=80000000L -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -MP -MMD -MF "${OBJECTDIR}/net/SNTP.o.d" -o ${OBJECTDIR}/net/SNTP.o net/SNTP.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/net/SSL.o: net/SSL.c  .generated_files/flags/default/87d8fdd2efcb0761b676200e36aea93de88dac02 .generated_files/flags/default/3a7ff55a6cb9e565cc82ee7521042155d62a01fd
	@${MKDIR} "${OBJECTDIR}/net" 
	@${RM} ${OBJECTDIR}/net/SSL.o.d 
	@${RM} ${OBJECTDIR}/net/SSL.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -D_SUPPRESS_PLIB_WARNING -DSYSCLK=80000000L -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -MP -MMD -MF "${OBJECTDIR}/net/SSL.o.d" -o ${OBJECTDIR}/net/SSL.o net/SSL.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/net/StackTsk.o: net/StackTsk.c  .generated_files/flags/default/eaf648ce83cf00e9923f20cbbee6c00a42c27b37 .generated_files/flags/default/3a7ff55a6cb9e565cc82ee7521042155d62a01fd
	@${MKDIR} "${OBJECTDIR}/net" 
	@${RM} ${OBJECTDIR}/net/StackTsk.o.d 
	@${RM} ${OBJECTDIR}/net/StackTsk.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -D_SUPPRESS_PLIB_WARNING -DSYSCLK=80000000L -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -MP -MMD -MF "${OBJECTDIR}/net/StackTsk.o.d" -o ${OBJECTDIR}/net/StackTsk.o net/StackTsk.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/net/TCP.o: net/TCP.c  .generated_files/flags/default/53cfa83ac4c66335bd3ede15c389d9a064864735 .generated_files/flags/default/3a7ff55a6cb9e565cc82ee7521042155d62a01fd
	@${MKDIR} "${OBJECTDIR}/net" 
	@${RM} ${OBJECTDIR}/net/TCP.o.d 
	@${RM} ${OBJECTDIR}/net/TCP.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -D_SUPPRESS_PLIB_WARNING -DSYSCLK=80000000L -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -MP -MMD -MF "${OBJECTDIR}/net/TCP.o.d" -o ${OBJECTDIR}/net/TCP.o net/TCP.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/net/Telnet.o: net/Telnet.c  .generated_files/flags/default/56daaee0376455707224ea26607feaa675eba1f7 .generated_files/flags/default/3a7ff55a6cb9e565cc82ee7521042155d62a01fd
	@${MKDIR} "${OBJECTDIR}/net" 
	@${RM} ${OBJECTDIR}/net/Telnet.o.d 
	@${RM} ${OBJECTDIR}/net/Telnet.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -D_SUPPRESS_PLIB_WARNING -DSYSCLK=80000000L -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -MP -MMD -MF "${OBJECTDIR}/net/Telnet.o.d" -o ${OBJECTDIR}/net/Telnet.o net/Telnet.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/net/Tick.o: net/Tick.c  .generated_files/flags/default/5a33cefc87bc5f065d80255c28a1bbbc5e92f914 .generated_files/flags/default/3a7ff55a6cb9e565cc82ee7521042155d62a01fd
	@${MKDIR} "${OBJECTDIR}/net" 
	@${RM} ${OBJECTDIR}/net/Tick.o.d 
	@${RM} ${OBJECTDIR}/net/Tick.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -D_SUPPRESS_PLIB_WARNING -DSYSCLK=80000000L -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -MP -MMD -MF "${OBJECTDIR}/net/Tick.o.d" -o ${OBJECTDIR}/net/Tick.o net/Tick.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/net/UDP.o: net/UDP.c  .generated_files/flags/default/775cc1be0c1600c0ccf893d825addf3853aa28fc .generated_files/flags/default/3a7ff55a6cb9e565cc82ee7521042155d62a01fd
	@${MKDIR} "${OBJECTDIR}/net" 
	@${RM} ${OBJECTDIR}/net/UDP.o.d 
	@${RM} ${OBJECTDIR}/net/UDP.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -D_SUPPRESS_PLIB_WARNING -DSYSCLK=80000000L -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -MP -MMD -MF "${OBJECTDIR}/net/UDP.o.d" -o ${OBJECTDIR}/net/UDP.o net/UDP.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/net/ZeroconfHelper.o: net/ZeroconfHelper.c  .generated_files/flags/default/dc3669dba76353f279847272ab338953c1f8c326 .generated_files/flags/default/3a7ff55a6cb9e565cc82ee7521042155d62a01fd
	@${MKDIR} "${OBJECTDIR}/net" 
	@${RM} ${OBJECTDIR}/net/ZeroconfHelper.o.d 
	@${RM} ${OBJECTDIR}/net/ZeroconfHelper.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -D_SUPPRESS_PLIB_WARNING -DSYSCLK=80000000L -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -MP -MMD -MF "${OBJECTDIR}/net/ZeroconfHelper.o.d" -o ${OBJECTDIR}/net/ZeroconfHelper.o net/ZeroconfHelper.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/net/ZeroconfLinkLocal.o: net/ZeroconfLinkLocal.c  .generated_files/flags/default/a713199ef257395581ca7991c0647807af6e9e55 .generated_files/flags/default/3a7ff55a6cb9e565cc82ee7521042155d62a01fd
	@${MKDIR} "${OBJECTDIR}/net" 
	@${RM} ${OBJECTDIR}/net/ZeroconfLinkLocal.o.d 
	@${RM} ${OBJECTDIR}/net/ZeroconfLinkLocal.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -D_SUPPRESS_PLIB_WARNING -DSYSCLK=80000000L -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -MP -MMD -MF "${OBJECTDIR}/net/ZeroconfLinkLocal.o.d" -o ${OBJECTDIR}/net/ZeroconfLinkLocal.o net/ZeroconfLinkLocal.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/net/ZeroconfMulticastDNS.o: net/ZeroconfMulticastDNS.c  .generated_files/flags/default/17c2110fd2446aed467aaafcd6a5583aec6c57de .generated_files/flags/default/3a7ff55a6cb9e565cc82ee7521042155d62a01fd
	@${MKDIR} "${OBJECTDIR}/net" 
	@${RM} ${OBJECTDIR}/net/ZeroconfMulticastDNS.o.d 
	@${RM} ${OBJECTDIR}/net/ZeroconfMulticastDNS.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -D_SUPPRESS_PLIB_WARNING -DSYSCLK=80000000L -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -MP -MMD -MF "${OBJECTDIR}/net/ZeroconfMulticastDNS.o.d" -o ${OBJECTDIR}/net/ZeroconfMulticastDNS.o net/ZeroconfMulticastDNS.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/nvram/nvram.o: nvram/nvram.c  .generated_files/flags/default/f69cad7144a4b41d54c4c4b8a8206640904b83d2 .generated_files/flags/default/3a7ff55a6cb9e565cc82ee7521042155d62a01fd
	@${MKDIR} "${OBJECTDIR}/nvram" 
	@${RM} ${OBJECTDIR}/nvram/nvram.o.d 
	@${RM} ${OBJECTDIR}/nvram/nvram.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -D_SUPPRESS_PLIB_WARNING -DSYSCLK=80000000L -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -MP -MMD -MF "${OBJECTDIR}/nvram/nvram.o.d" -o ${OBJECTDIR}/nvram/nvram.o nvram/nvram.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/time/time.o: time/time.c  .generated_files/flags/default/de92a46a55c813bb629ba986688b83977c6b2a6f .generated_files/flags/default/3a7ff55a6cb9e565cc82ee7521042155d62a01fd
	@${MKDIR} "${OBJECTDIR}/time" 
	@${RM} ${OBJECTDIR}/time/time.o.d 
	@${RM} ${OBJECTDIR}/time/time.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -D_SUPPRESS_PLIB_WARNING -DSYSCLK=80000000L -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -MP -MMD -MF "${OBJECTDIR}/time/time.o.d" -o ${OBJECTDIR}/time/time.o time/time.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/uart/uart.o: uart/uart.c  .generated_files/flags/default/35dc905e6b4760695ca80f9b48e7f2069b721797 .generated_files/flags/default/3a7ff55a6cb9e565cc82ee7521042155d62a01fd
	@${MKDIR} "${OBJECTDIR}/uart" 
	@${RM} ${OBJECTDIR}/uart/uart.o.d 
	@${RM} ${OBJECTDIR}/uart/uart.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -D_SUPPRESS_PLIB_WARNING -DSYSCLK=80000000L -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -MP -MMD -MF "${OBJECTDIR}/uart/uart.o.d" -o ${OBJECTDIR}/uart/uart.o uart/uart.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/usb/event.o: usb/event.c  .generated_files/flags/default/c93cec4f5c643bd3aa7aab1f0b554189d7d5932e .generated_files/flags/default/3a7ff55a6cb9e565cc82ee7521042155d62a01fd
	@${MKDIR} "${OBJECTDIR}/usb" 
	@${RM} ${OBJECTDIR}/usb/event.o.d 
	@${RM} ${OBJECTDIR}/usb/event.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -D_SUPPRESS_PLIB_WARNING -DSYSCLK=80000000L -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -MP -MMD -MF "${OBJECTDIR}/usb/event.o.d" -o ${OBJECTDIR}/usb/event.o usb/event.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/usb/usb_config.o: usb/usb_config.c  .generated_files/flags/default/e607b47c30840c17da7beb5a8a51909b4f151f4d .generated_files/flags/default/3a7ff55a6cb9e565cc82ee7521042155d62a01fd
	@${MKDIR} "${OBJECTDIR}/usb" 
	@${RM} ${OBJECTDIR}/usb/usb_config.o.d 
	@${RM} ${OBJECTDIR}/usb/usb_config.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -D_SUPPRESS_PLIB_WARNING -DSYSCLK=80000000L -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -MP -MMD -MF "${OBJECTDIR}/usb/usb_config.o.d" -o ${OBJECTDIR}/usb/usb_config.o usb/usb_config.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/usb/usb_host.o: usb/usb_host.c  .generated_files/flags/default/5e6d950e6252ac32715f240ca27762c953feb70f .generated_files/flags/default/3a7ff55a6cb9e565cc82ee7521042155d62a01fd
	@${MKDIR} "${OBJECTDIR}/usb" 
	@${RM} ${OBJECTDIR}/usb/usb_host.o.d 
	@${RM} ${OBJECTDIR}/usb/usb_host.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -D_SUPPRESS_PLIB_WARNING -DSYSCLK=80000000L -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -MP -MMD -MF "${OBJECTDIR}/usb/usb_host.o.d" -o ${OBJECTDIR}/usb/usb_host.o usb/usb_host.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/usb/usb_host_msd.o: usb/usb_host_msd.c  .generated_files/flags/default/6b7c15ad790e3613bc2ad1e6d95d15ab09c0f838 .generated_files/flags/default/3a7ff55a6cb9e565cc82ee7521042155d62a01fd
	@${MKDIR} "${OBJECTDIR}/usb" 
	@${RM} ${OBJECTDIR}/usb/usb_host_msd.o.d 
	@${RM} ${OBJECTDIR}/usb/usb_host_msd.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -D_SUPPRESS_PLIB_WARNING -DSYSCLK=80000000L -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -MP -MMD -MF "${OBJECTDIR}/usb/usb_host_msd.o.d" -o ${OBJECTDIR}/usb/usb_host_msd.o usb/usb_host_msd.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/usb/usb_host_msd_scsi.o: usb/usb_host_msd_scsi.c  .generated_files/flags/default/f96c1b7e3f4a30dc91a9ac729235d3f8d489ff57 .generated_files/flags/default/3a7ff55a6cb9e565cc82ee7521042155d62a01fd
	@${MKDIR} "${OBJECTDIR}/usb" 
	@${RM} ${OBJECTDIR}/usb/usb_host_msd_scsi.o.d 
	@${RM} ${OBJECTDIR}/usb/usb_host_msd_scsi.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -D_SUPPRESS_PLIB_WARNING -DSYSCLK=80000000L -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -MP -MMD -MF "${OBJECTDIR}/usb/usb_host_msd_scsi.o.d" -o ${OBJECTDIR}/usb/usb_host_msd_scsi.o usb/usb_host_msd_scsi.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/vs1003/vs1003.o: vs1003/vs1003.c  .generated_files/flags/default/b59a27aa733ae250bee9fe0e50a695446dc463eb .generated_files/flags/default/3a7ff55a6cb9e565cc82ee7521042155d62a01fd
	@${MKDIR} "${OBJECTDIR}/vs1003" 
	@${RM} ${OBJECTDIR}/vs1003/vs1003.o.d 
	@${RM} ${OBJECTDIR}/vs1003/vs1003.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -D_SUPPRESS_PLIB_WARNING -DSYSCLK=80000000L -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -MP -MMD -MF "${OBJECTDIR}/vs1003/vs1003.o.d" -o ${OBJECTDIR}/vs1003/vs1003.o vs1003/vs1003.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/main.o: main.c  .generated_files/flags/default/fb1bae2f0510533f29c66dea0c4a0702a0935cb9 .generated_files/flags/default/3a7ff55a6cb9e565cc82ee7521042155d62a01fd
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/main.o.d 
	@${RM} ${OBJECTDIR}/main.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -D_SUPPRESS_PLIB_WARNING -DSYSCLK=80000000L -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -MP -MMD -MF "${OBJECTDIR}/main.o.d" -o ${OBJECTDIR}/main.o main.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/common.o: common.c  .generated_files/flags/default/fdddf01d9db69d4bd8b6efca51825ed9ff373ff3 .generated_files/flags/default/3a7ff55a6cb9e565cc82ee7521042155d62a01fd
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/common.o.d 
	@${RM} ${OBJECTDIR}/common.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -D_SUPPRESS_PLIB_WARNING -DSYSCLK=80000000L -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -MP -MMD -MF "${OBJECTDIR}/common.o.d" -o ${OBJECTDIR}/common.o common.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)    
	
else
${OBJECTDIR}/config/config.o: config/config.c  .generated_files/flags/default/f1bb49dbd2f38ddac1bab6a0f054dae720ec3c99 .generated_files/flags/default/3a7ff55a6cb9e565cc82ee7521042155d62a01fd
	@${MKDIR} "${OBJECTDIR}/config" 
	@${RM} ${OBJECTDIR}/config/config.o.d 
	@${RM} ${OBJECTDIR}/config/config.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -D_SUPPRESS_PLIB_WARNING -DSYSCLK=80000000L -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -MP -MMD -MF "${OBJECTDIR}/config/config.o.d" -o ${OBJECTDIR}/config/config.o config/config.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/delay/delay.o: delay/delay.c  .generated_files/flags/default/6b5eb4d9b5b5722c0cd07e2ae082a6a267539044 .generated_files/flags/default/3a7ff55a6cb9e565cc82ee7521042155d62a01fd
	@${MKDIR} "${OBJECTDIR}/delay" 
	@${RM} ${OBJECTDIR}/delay/delay.o.d 
	@${RM} ${OBJECTDIR}/delay/delay.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -D_SUPPRESS_PLIB_WARNING -DSYSCLK=80000000L -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -MP -MMD -MF "${OBJECTDIR}/delay/delay.o.d" -o ${OBJECTDIR}/delay/delay.o delay/delay.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/fatfs/ff.o: fatfs/ff.c  .generated_files/flags/default/887813cb930ace871e20ca56523469561ea2515f .generated_files/flags/default/3a7ff55a6cb9e565cc82ee7521042155d62a01fd
	@${MKDIR} "${OBJECTDIR}/fatfs" 
	@${RM} ${OBJECTDIR}/fatfs/ff.o.d 
	@${RM} ${OBJECTDIR}/fatfs/ff.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -D_SUPPRESS_PLIB_WARNING -DSYSCLK=80000000L -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -MP -MMD -MF "${OBJECTDIR}/fatfs/ff.o.d" -o ${OBJECTDIR}/fatfs/ff.o fatfs/ff.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/fatfs/ffsystem.o: fatfs/ffsystem.c  .generated_files/flags/default/fea24601303272d39edac0c035d4771f24ee3ec .generated_files/flags/default/3a7ff55a6cb9e565cc82ee7521042155d62a01fd
	@${MKDIR} "${OBJECTDIR}/fatfs" 
	@${RM} ${OBJECTDIR}/fatfs/ffsystem.o.d 
	@${RM} ${OBJECTDIR}/fatfs/ffsystem.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -D_SUPPRESS_PLIB_WARNING -DSYSCLK=80000000L -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -MP -MMD -MF "${OBJECTDIR}/fatfs/ffsystem.o.d" -o ${OBJECTDIR}/fatfs/ffsystem.o fatfs/ffsystem.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/fatfs/ffunicode.o: fatfs/ffunicode.c  .generated_files/flags/default/d5a793313e82090b85df64b076349a525b00dc45 .generated_files/flags/default/3a7ff55a6cb9e565cc82ee7521042155d62a01fd
	@${MKDIR} "${OBJECTDIR}/fatfs" 
	@${RM} ${OBJECTDIR}/fatfs/ffunicode.o.d 
	@${RM} ${OBJECTDIR}/fatfs/ffunicode.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -D_SUPPRESS_PLIB_WARNING -DSYSCLK=80000000L -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -MP -MMD -MF "${OBJECTDIR}/fatfs/ffunicode.o.d" -o ${OBJECTDIR}/fatfs/ffunicode.o fatfs/ffunicode.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/fatfs/SPIFlash.o: fatfs/SPIFlash.c  .generated_files/flags/default/71fd98f8c79ad49ae65ab9241449bf38dd116831 .generated_files/flags/default/3a7ff55a6cb9e565cc82ee7521042155d62a01fd
	@${MKDIR} "${OBJECTDIR}/fatfs" 
	@${RM} ${OBJECTDIR}/fatfs/SPIFlash.o.d 
	@${RM} ${OBJECTDIR}/fatfs/SPIFlash.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -D_SUPPRESS_PLIB_WARNING -DSYSCLK=80000000L -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -MP -MMD -MF "${OBJECTDIR}/fatfs/SPIFlash.o.d" -o ${OBJECTDIR}/fatfs/SPIFlash.o fatfs/SPIFlash.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/fatfs/diskio.o: fatfs/diskio.c  .generated_files/flags/default/bddf93fd3d4e475066bbe6ef7a6d54e2c30a521 .generated_files/flags/default/3a7ff55a6cb9e565cc82ee7521042155d62a01fd
	@${MKDIR} "${OBJECTDIR}/fatfs" 
	@${RM} ${OBJECTDIR}/fatfs/diskio.o.d 
	@${RM} ${OBJECTDIR}/fatfs/diskio.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -D_SUPPRESS_PLIB_WARNING -DSYSCLK=80000000L -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -MP -MMD -MF "${OBJECTDIR}/fatfs/diskio.o.d" -o ${OBJECTDIR}/fatfs/diskio.o fatfs/diskio.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/fatfs/sd.o: fatfs/sd.c  .generated_files/flags/default/9cf036b9dc475c595e00c6b2098568ce15153bfc .generated_files/flags/default/3a7ff55a6cb9e565cc82ee7521042155d62a01fd
	@${MKDIR} "${OBJECTDIR}/fatfs" 
	@${RM} ${OBJECTDIR}/fatfs/sd.o.d 
	@${RM} ${OBJECTDIR}/fatfs/sd.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -D_SUPPRESS_PLIB_WARNING -DSYSCLK=80000000L -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -MP -MMD -MF "${OBJECTDIR}/fatfs/sd.o.d" -o ${OBJECTDIR}/fatfs/sd.o fatfs/sd.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/net/Announce.o: net/Announce.c  .generated_files/flags/default/63ad08408cc64ebf91f60b400d9b92724c934ca5 .generated_files/flags/default/3a7ff55a6cb9e565cc82ee7521042155d62a01fd
	@${MKDIR} "${OBJECTDIR}/net" 
	@${RM} ${OBJECTDIR}/net/Announce.o.d 
	@${RM} ${OBJECTDIR}/net/Announce.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -D_SUPPRESS_PLIB_WARNING -DSYSCLK=80000000L -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -MP -MMD -MF "${OBJECTDIR}/net/Announce.o.d" -o ${OBJECTDIR}/net/Announce.o net/Announce.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/net/ARCFOUR.o: net/ARCFOUR.c  .generated_files/flags/default/7f1f9e3cb86a8cda810b551750774ae2458de3c9 .generated_files/flags/default/3a7ff55a6cb9e565cc82ee7521042155d62a01fd
	@${MKDIR} "${OBJECTDIR}/net" 
	@${RM} ${OBJECTDIR}/net/ARCFOUR.o.d 
	@${RM} ${OBJECTDIR}/net/ARCFOUR.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -D_SUPPRESS_PLIB_WARNING -DSYSCLK=80000000L -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -MP -MMD -MF "${OBJECTDIR}/net/ARCFOUR.o.d" -o ${OBJECTDIR}/net/ARCFOUR.o net/ARCFOUR.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/net/ARP.o: net/ARP.c  .generated_files/flags/default/19bf002a9212e5de969ba85f53c0c90c32eac699 .generated_files/flags/default/3a7ff55a6cb9e565cc82ee7521042155d62a01fd
	@${MKDIR} "${OBJECTDIR}/net" 
	@${RM} ${OBJECTDIR}/net/ARP.o.d 
	@${RM} ${OBJECTDIR}/net/ARP.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -D_SUPPRESS_PLIB_WARNING -DSYSCLK=80000000L -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -MP -MMD -MF "${OBJECTDIR}/net/ARP.o.d" -o ${OBJECTDIR}/net/ARP.o net/ARP.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/net/AutoIP.o: net/AutoIP.c  .generated_files/flags/default/638009e93798f6d08ad50f930b9fe6af1e897a85 .generated_files/flags/default/3a7ff55a6cb9e565cc82ee7521042155d62a01fd
	@${MKDIR} "${OBJECTDIR}/net" 
	@${RM} ${OBJECTDIR}/net/AutoIP.o.d 
	@${RM} ${OBJECTDIR}/net/AutoIP.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -D_SUPPRESS_PLIB_WARNING -DSYSCLK=80000000L -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -MP -MMD -MF "${OBJECTDIR}/net/AutoIP.o.d" -o ${OBJECTDIR}/net/AutoIP.o net/AutoIP.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/net/BerkeleyAPI.o: net/BerkeleyAPI.c  .generated_files/flags/default/9ae190a90394067362d0fecce68f69746b58f19e .generated_files/flags/default/3a7ff55a6cb9e565cc82ee7521042155d62a01fd
	@${MKDIR} "${OBJECTDIR}/net" 
	@${RM} ${OBJECTDIR}/net/BerkeleyAPI.o.d 
	@${RM} ${OBJECTDIR}/net/BerkeleyAPI.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -D_SUPPRESS_PLIB_WARNING -DSYSCLK=80000000L -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -MP -MMD -MF "${OBJECTDIR}/net/BerkeleyAPI.o.d" -o ${OBJECTDIR}/net/BerkeleyAPI.o net/BerkeleyAPI.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/net/BigInt.o: net/BigInt.c  .generated_files/flags/default/545aa8174dc122b27aa94a386d6d68fe108922ff .generated_files/flags/default/3a7ff55a6cb9e565cc82ee7521042155d62a01fd
	@${MKDIR} "${OBJECTDIR}/net" 
	@${RM} ${OBJECTDIR}/net/BigInt.o.d 
	@${RM} ${OBJECTDIR}/net/BigInt.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -D_SUPPRESS_PLIB_WARNING -DSYSCLK=80000000L -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -MP -MMD -MF "${OBJECTDIR}/net/BigInt.o.d" -o ${OBJECTDIR}/net/BigInt.o net/BigInt.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/CustomHTTPApp.o: CustomHTTPApp.c  .generated_files/flags/default/67215d1489ed5f49c940bd9fae7da7de79a86647 .generated_files/flags/default/3a7ff55a6cb9e565cc82ee7521042155d62a01fd
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/CustomHTTPApp.o.d 
	@${RM} ${OBJECTDIR}/CustomHTTPApp.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -D_SUPPRESS_PLIB_WARNING -DSYSCLK=80000000L -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -MP -MMD -MF "${OBJECTDIR}/CustomHTTPApp.o.d" -o ${OBJECTDIR}/CustomHTTPApp.o CustomHTTPApp.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/net/DHCP.o: net/DHCP.c  .generated_files/flags/default/75dee0c901e7dc33775f58f01a9f09a75814290b .generated_files/flags/default/3a7ff55a6cb9e565cc82ee7521042155d62a01fd
	@${MKDIR} "${OBJECTDIR}/net" 
	@${RM} ${OBJECTDIR}/net/DHCP.o.d 
	@${RM} ${OBJECTDIR}/net/DHCP.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -D_SUPPRESS_PLIB_WARNING -DSYSCLK=80000000L -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -MP -MMD -MF "${OBJECTDIR}/net/DHCP.o.d" -o ${OBJECTDIR}/net/DHCP.o net/DHCP.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/net/DNS.o: net/DNS.c  .generated_files/flags/default/c0047743bfae6a0e9387868cb2c99c7ccef7c799 .generated_files/flags/default/3a7ff55a6cb9e565cc82ee7521042155d62a01fd
	@${MKDIR} "${OBJECTDIR}/net" 
	@${RM} ${OBJECTDIR}/net/DNS.o.d 
	@${RM} ${OBJECTDIR}/net/DNS.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -D_SUPPRESS_PLIB_WARNING -DSYSCLK=80000000L -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -MP -MMD -MF "${OBJECTDIR}/net/DNS.o.d" -o ${OBJECTDIR}/net/DNS.o net/DNS.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/net/ENC28J60.o: net/ENC28J60.c  .generated_files/flags/default/bfda0121d8e46467f4d071178659bd4ff3a7b687 .generated_files/flags/default/3a7ff55a6cb9e565cc82ee7521042155d62a01fd
	@${MKDIR} "${OBJECTDIR}/net" 
	@${RM} ${OBJECTDIR}/net/ENC28J60.o.d 
	@${RM} ${OBJECTDIR}/net/ENC28J60.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -D_SUPPRESS_PLIB_WARNING -DSYSCLK=80000000L -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -MP -MMD -MF "${OBJECTDIR}/net/ENC28J60.o.d" -o ${OBJECTDIR}/net/ENC28J60.o net/ENC28J60.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/net/FTP.o: net/FTP.c  .generated_files/flags/default/a880a6c6f969abbe93a1537c6ec7b1f1b9b78e7a .generated_files/flags/default/3a7ff55a6cb9e565cc82ee7521042155d62a01fd
	@${MKDIR} "${OBJECTDIR}/net" 
	@${RM} ${OBJECTDIR}/net/FTP.o.d 
	@${RM} ${OBJECTDIR}/net/FTP.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -D_SUPPRESS_PLIB_WARNING -DSYSCLK=80000000L -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -MP -MMD -MF "${OBJECTDIR}/net/FTP.o.d" -o ${OBJECTDIR}/net/FTP.o net/FTP.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/net/GenericTCPServer.o: net/GenericTCPServer.c  .generated_files/flags/default/dd662349df5deb2c57bdf2fab81ee5791c3d6bac .generated_files/flags/default/3a7ff55a6cb9e565cc82ee7521042155d62a01fd
	@${MKDIR} "${OBJECTDIR}/net" 
	@${RM} ${OBJECTDIR}/net/GenericTCPServer.o.d 
	@${RM} ${OBJECTDIR}/net/GenericTCPServer.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -D_SUPPRESS_PLIB_WARNING -DSYSCLK=80000000L -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -MP -MMD -MF "${OBJECTDIR}/net/GenericTCPServer.o.d" -o ${OBJECTDIR}/net/GenericTCPServer.o net/GenericTCPServer.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/net/Hashes.o: net/Hashes.c  .generated_files/flags/default/b87c0653dd46d5b67d46c76c31795851ef995e25 .generated_files/flags/default/3a7ff55a6cb9e565cc82ee7521042155d62a01fd
	@${MKDIR} "${OBJECTDIR}/net" 
	@${RM} ${OBJECTDIR}/net/Hashes.o.d 
	@${RM} ${OBJECTDIR}/net/Hashes.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -D_SUPPRESS_PLIB_WARNING -DSYSCLK=80000000L -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -MP -MMD -MF "${OBJECTDIR}/net/Hashes.o.d" -o ${OBJECTDIR}/net/Hashes.o net/Hashes.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/net/Helpers.o: net/Helpers.c  .generated_files/flags/default/633e3b225cd84d73762b407460371f10d4659b3b .generated_files/flags/default/3a7ff55a6cb9e565cc82ee7521042155d62a01fd
	@${MKDIR} "${OBJECTDIR}/net" 
	@${RM} ${OBJECTDIR}/net/Helpers.o.d 
	@${RM} ${OBJECTDIR}/net/Helpers.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -D_SUPPRESS_PLIB_WARNING -DSYSCLK=80000000L -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -MP -MMD -MF "${OBJECTDIR}/net/Helpers.o.d" -o ${OBJECTDIR}/net/Helpers.o net/Helpers.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/net/HTTP2.o: net/HTTP2.c  .generated_files/flags/default/870ac562db74e2f718337c578e56210a6d1bdb28 .generated_files/flags/default/3a7ff55a6cb9e565cc82ee7521042155d62a01fd
	@${MKDIR} "${OBJECTDIR}/net" 
	@${RM} ${OBJECTDIR}/net/HTTP2.o.d 
	@${RM} ${OBJECTDIR}/net/HTTP2.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -D_SUPPRESS_PLIB_WARNING -DSYSCLK=80000000L -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -MP -MMD -MF "${OBJECTDIR}/net/HTTP2.o.d" -o ${OBJECTDIR}/net/HTTP2.o net/HTTP2.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/net/ICMP.o: net/ICMP.c  .generated_files/flags/default/443d5b6be5a7dfefd6f1046bfb030615285e2d3 .generated_files/flags/default/3a7ff55a6cb9e565cc82ee7521042155d62a01fd
	@${MKDIR} "${OBJECTDIR}/net" 
	@${RM} ${OBJECTDIR}/net/ICMP.o.d 
	@${RM} ${OBJECTDIR}/net/ICMP.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -D_SUPPRESS_PLIB_WARNING -DSYSCLK=80000000L -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -MP -MMD -MF "${OBJECTDIR}/net/ICMP.o.d" -o ${OBJECTDIR}/net/ICMP.o net/ICMP.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/net/IP.o: net/IP.c  .generated_files/flags/default/3a25a4e6b37a7fc04f451463108224dc30e6e981 .generated_files/flags/default/3a7ff55a6cb9e565cc82ee7521042155d62a01fd
	@${MKDIR} "${OBJECTDIR}/net" 
	@${RM} ${OBJECTDIR}/net/IP.o.d 
	@${RM} ${OBJECTDIR}/net/IP.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -D_SUPPRESS_PLIB_WARNING -DSYSCLK=80000000L -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -MP -MMD -MF "${OBJECTDIR}/net/IP.o.d" -o ${OBJECTDIR}/net/IP.o net/IP.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/net/MPFS2.o: net/MPFS2.c  .generated_files/flags/default/465a86c38491445eb9cedcbb55658a842ec14754 .generated_files/flags/default/3a7ff55a6cb9e565cc82ee7521042155d62a01fd
	@${MKDIR} "${OBJECTDIR}/net" 
	@${RM} ${OBJECTDIR}/net/MPFS2.o.d 
	@${RM} ${OBJECTDIR}/net/MPFS2.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -D_SUPPRESS_PLIB_WARNING -DSYSCLK=80000000L -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -MP -MMD -MF "${OBJECTDIR}/net/MPFS2.o.d" -o ${OBJECTDIR}/net/MPFS2.o net/MPFS2.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/MPFSImg2.o: MPFSImg2.c  .generated_files/flags/default/4ef72405ddfafee3c450d48a9502c32ed6a39e2b .generated_files/flags/default/3a7ff55a6cb9e565cc82ee7521042155d62a01fd
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/MPFSImg2.o.d 
	@${RM} ${OBJECTDIR}/MPFSImg2.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -D_SUPPRESS_PLIB_WARNING -DSYSCLK=80000000L -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -MP -MMD -MF "${OBJECTDIR}/MPFSImg2.o.d" -o ${OBJECTDIR}/MPFSImg2.o MPFSImg2.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/net/NBNS.o: net/NBNS.c  .generated_files/flags/default/9c4841cad98f71cf0c88d128d5383c6eb5be2c55 .generated_files/flags/default/3a7ff55a6cb9e565cc82ee7521042155d62a01fd
	@${MKDIR} "${OBJECTDIR}/net" 
	@${RM} ${OBJECTDIR}/net/NBNS.o.d 
	@${RM} ${OBJECTDIR}/net/NBNS.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -D_SUPPRESS_PLIB_WARNING -DSYSCLK=80000000L -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -MP -MMD -MF "${OBJECTDIR}/net/NBNS.o.d" -o ${OBJECTDIR}/net/NBNS.o net/NBNS.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/net/Random.o: net/Random.c  .generated_files/flags/default/1d95bf82953dd624bdf62887431c2d7fd2f06800 .generated_files/flags/default/3a7ff55a6cb9e565cc82ee7521042155d62a01fd
	@${MKDIR} "${OBJECTDIR}/net" 
	@${RM} ${OBJECTDIR}/net/Random.o.d 
	@${RM} ${OBJECTDIR}/net/Random.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -D_SUPPRESS_PLIB_WARNING -DSYSCLK=80000000L -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -MP -MMD -MF "${OBJECTDIR}/net/Random.o.d" -o ${OBJECTDIR}/net/Random.o net/Random.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/net/Reboot.o: net/Reboot.c  .generated_files/flags/default/a209f2d1e1c9859cdcdc3c40e0d8da7345efe171 .generated_files/flags/default/3a7ff55a6cb9e565cc82ee7521042155d62a01fd
	@${MKDIR} "${OBJECTDIR}/net" 
	@${RM} ${OBJECTDIR}/net/Reboot.o.d 
	@${RM} ${OBJECTDIR}/net/Reboot.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -D_SUPPRESS_PLIB_WARNING -DSYSCLK=80000000L -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -MP -MMD -MF "${OBJECTDIR}/net/Reboot.o.d" -o ${OBJECTDIR}/net/Reboot.o net/Reboot.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/net/RSA.o: net/RSA.c  .generated_files/flags/default/7505313c3070c03bd6c0b1fc7ee6e49d2111a969 .generated_files/flags/default/3a7ff55a6cb9e565cc82ee7521042155d62a01fd
	@${MKDIR} "${OBJECTDIR}/net" 
	@${RM} ${OBJECTDIR}/net/RSA.o.d 
	@${RM} ${OBJECTDIR}/net/RSA.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -D_SUPPRESS_PLIB_WARNING -DSYSCLK=80000000L -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -MP -MMD -MF "${OBJECTDIR}/net/RSA.o.d" -o ${OBJECTDIR}/net/RSA.o net/RSA.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/net/SMTP.o: net/SMTP.c  .generated_files/flags/default/386707e1e4e6315bd62a6eb18b6315499bad13c9 .generated_files/flags/default/3a7ff55a6cb9e565cc82ee7521042155d62a01fd
	@${MKDIR} "${OBJECTDIR}/net" 
	@${RM} ${OBJECTDIR}/net/SMTP.o.d 
	@${RM} ${OBJECTDIR}/net/SMTP.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -D_SUPPRESS_PLIB_WARNING -DSYSCLK=80000000L -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -MP -MMD -MF "${OBJECTDIR}/net/SMTP.o.d" -o ${OBJECTDIR}/net/SMTP.o net/SMTP.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/net/SNTP.o: net/SNTP.c  .generated_files/flags/default/ee642610634bce56801d4229341186018fccb879 .generated_files/flags/default/3a7ff55a6cb9e565cc82ee7521042155d62a01fd
	@${MKDIR} "${OBJECTDIR}/net" 
	@${RM} ${OBJECTDIR}/net/SNTP.o.d 
	@${RM} ${OBJECTDIR}/net/SNTP.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -D_SUPPRESS_PLIB_WARNING -DSYSCLK=80000000L -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -MP -MMD -MF "${OBJECTDIR}/net/SNTP.o.d" -o ${OBJECTDIR}/net/SNTP.o net/SNTP.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/net/SSL.o: net/SSL.c  .generated_files/flags/default/f2892b59bd812ada428c31769738c53ab7e825d3 .generated_files/flags/default/3a7ff55a6cb9e565cc82ee7521042155d62a01fd
	@${MKDIR} "${OBJECTDIR}/net" 
	@${RM} ${OBJECTDIR}/net/SSL.o.d 
	@${RM} ${OBJECTDIR}/net/SSL.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -D_SUPPRESS_PLIB_WARNING -DSYSCLK=80000000L -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -MP -MMD -MF "${OBJECTDIR}/net/SSL.o.d" -o ${OBJECTDIR}/net/SSL.o net/SSL.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/net/StackTsk.o: net/StackTsk.c  .generated_files/flags/default/37248ea1974a137a346e5d6b101d909e83ec6a39 .generated_files/flags/default/3a7ff55a6cb9e565cc82ee7521042155d62a01fd
	@${MKDIR} "${OBJECTDIR}/net" 
	@${RM} ${OBJECTDIR}/net/StackTsk.o.d 
	@${RM} ${OBJECTDIR}/net/StackTsk.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -D_SUPPRESS_PLIB_WARNING -DSYSCLK=80000000L -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -MP -MMD -MF "${OBJECTDIR}/net/StackTsk.o.d" -o ${OBJECTDIR}/net/StackTsk.o net/StackTsk.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/net/TCP.o: net/TCP.c  .generated_files/flags/default/b6199f5282cc5209c63906b3d7e72590b73d4df7 .generated_files/flags/default/3a7ff55a6cb9e565cc82ee7521042155d62a01fd
	@${MKDIR} "${OBJECTDIR}/net" 
	@${RM} ${OBJECTDIR}/net/TCP.o.d 
	@${RM} ${OBJECTDIR}/net/TCP.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -D_SUPPRESS_PLIB_WARNING -DSYSCLK=80000000L -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -MP -MMD -MF "${OBJECTDIR}/net/TCP.o.d" -o ${OBJECTDIR}/net/TCP.o net/TCP.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/net/Telnet.o: net/Telnet.c  .generated_files/flags/default/5ec608bc09a9b486c95d966a348cc18b533ab52c .generated_files/flags/default/3a7ff55a6cb9e565cc82ee7521042155d62a01fd
	@${MKDIR} "${OBJECTDIR}/net" 
	@${RM} ${OBJECTDIR}/net/Telnet.o.d 
	@${RM} ${OBJECTDIR}/net/Telnet.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -D_SUPPRESS_PLIB_WARNING -DSYSCLK=80000000L -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -MP -MMD -MF "${OBJECTDIR}/net/Telnet.o.d" -o ${OBJECTDIR}/net/Telnet.o net/Telnet.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/net/Tick.o: net/Tick.c  .generated_files/flags/default/d034029af6bfff984170a940b5c0da390fbeeea7 .generated_files/flags/default/3a7ff55a6cb9e565cc82ee7521042155d62a01fd
	@${MKDIR} "${OBJECTDIR}/net" 
	@${RM} ${OBJECTDIR}/net/Tick.o.d 
	@${RM} ${OBJECTDIR}/net/Tick.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -D_SUPPRESS_PLIB_WARNING -DSYSCLK=80000000L -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -MP -MMD -MF "${OBJECTDIR}/net/Tick.o.d" -o ${OBJECTDIR}/net/Tick.o net/Tick.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/net/UDP.o: net/UDP.c  .generated_files/flags/default/6c4dec1d420f56326a47b849b37d3516de33962b .generated_files/flags/default/3a7ff55a6cb9e565cc82ee7521042155d62a01fd
	@${MKDIR} "${OBJECTDIR}/net" 
	@${RM} ${OBJECTDIR}/net/UDP.o.d 
	@${RM} ${OBJECTDIR}/net/UDP.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -D_SUPPRESS_PLIB_WARNING -DSYSCLK=80000000L -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -MP -MMD -MF "${OBJECTDIR}/net/UDP.o.d" -o ${OBJECTDIR}/net/UDP.o net/UDP.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/net/ZeroconfHelper.o: net/ZeroconfHelper.c  .generated_files/flags/default/25d30fe8e27ec2747333b9921811565de239864f .generated_files/flags/default/3a7ff55a6cb9e565cc82ee7521042155d62a01fd
	@${MKDIR} "${OBJECTDIR}/net" 
	@${RM} ${OBJECTDIR}/net/ZeroconfHelper.o.d 
	@${RM} ${OBJECTDIR}/net/ZeroconfHelper.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -D_SUPPRESS_PLIB_WARNING -DSYSCLK=80000000L -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -MP -MMD -MF "${OBJECTDIR}/net/ZeroconfHelper.o.d" -o ${OBJECTDIR}/net/ZeroconfHelper.o net/ZeroconfHelper.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/net/ZeroconfLinkLocal.o: net/ZeroconfLinkLocal.c  .generated_files/flags/default/9c56e75c471a6efb861e3422ed05ea15b48ca75c .generated_files/flags/default/3a7ff55a6cb9e565cc82ee7521042155d62a01fd
	@${MKDIR} "${OBJECTDIR}/net" 
	@${RM} ${OBJECTDIR}/net/ZeroconfLinkLocal.o.d 
	@${RM} ${OBJECTDIR}/net/ZeroconfLinkLocal.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -D_SUPPRESS_PLIB_WARNING -DSYSCLK=80000000L -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -MP -MMD -MF "${OBJECTDIR}/net/ZeroconfLinkLocal.o.d" -o ${OBJECTDIR}/net/ZeroconfLinkLocal.o net/ZeroconfLinkLocal.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/net/ZeroconfMulticastDNS.o: net/ZeroconfMulticastDNS.c  .generated_files/flags/default/b443de531907eaba2d65cdc65f71149a5b633961 .generated_files/flags/default/3a7ff55a6cb9e565cc82ee7521042155d62a01fd
	@${MKDIR} "${OBJECTDIR}/net" 
	@${RM} ${OBJECTDIR}/net/ZeroconfMulticastDNS.o.d 
	@${RM} ${OBJECTDIR}/net/ZeroconfMulticastDNS.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -D_SUPPRESS_PLIB_WARNING -DSYSCLK=80000000L -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -MP -MMD -MF "${OBJECTDIR}/net/ZeroconfMulticastDNS.o.d" -o ${OBJECTDIR}/net/ZeroconfMulticastDNS.o net/ZeroconfMulticastDNS.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/nvram/nvram.o: nvram/nvram.c  .generated_files/flags/default/f9c4a88b322394ffd14c09fcf9a8eb6ec73330b2 .generated_files/flags/default/3a7ff55a6cb9e565cc82ee7521042155d62a01fd
	@${MKDIR} "${OBJECTDIR}/nvram" 
	@${RM} ${OBJECTDIR}/nvram/nvram.o.d 
	@${RM} ${OBJECTDIR}/nvram/nvram.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -D_SUPPRESS_PLIB_WARNING -DSYSCLK=80000000L -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -MP -MMD -MF "${OBJECTDIR}/nvram/nvram.o.d" -o ${OBJECTDIR}/nvram/nvram.o nvram/nvram.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/time/time.o: time/time.c  .generated_files/flags/default/ec95fa873bc2408c84c45df6cff2c517e3110eb4 .generated_files/flags/default/3a7ff55a6cb9e565cc82ee7521042155d62a01fd
	@${MKDIR} "${OBJECTDIR}/time" 
	@${RM} ${OBJECTDIR}/time/time.o.d 
	@${RM} ${OBJECTDIR}/time/time.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -D_SUPPRESS_PLIB_WARNING -DSYSCLK=80000000L -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -MP -MMD -MF "${OBJECTDIR}/time/time.o.d" -o ${OBJECTDIR}/time/time.o time/time.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/uart/uart.o: uart/uart.c  .generated_files/flags/default/8a681e4875ae3fa5077552794c6e8b010cfe3275 .generated_files/flags/default/3a7ff55a6cb9e565cc82ee7521042155d62a01fd
	@${MKDIR} "${OBJECTDIR}/uart" 
	@${RM} ${OBJECTDIR}/uart/uart.o.d 
	@${RM} ${OBJECTDIR}/uart/uart.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -D_SUPPRESS_PLIB_WARNING -DSYSCLK=80000000L -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -MP -MMD -MF "${OBJECTDIR}/uart/uart.o.d" -o ${OBJECTDIR}/uart/uart.o uart/uart.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/usb/event.o: usb/event.c  .generated_files/flags/default/d16a42ef4a4059186b694b62b52307bc163481b .generated_files/flags/default/3a7ff55a6cb9e565cc82ee7521042155d62a01fd
	@${MKDIR} "${OBJECTDIR}/usb" 
	@${RM} ${OBJECTDIR}/usb/event.o.d 
	@${RM} ${OBJECTDIR}/usb/event.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -D_SUPPRESS_PLIB_WARNING -DSYSCLK=80000000L -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -MP -MMD -MF "${OBJECTDIR}/usb/event.o.d" -o ${OBJECTDIR}/usb/event.o usb/event.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/usb/usb_config.o: usb/usb_config.c  .generated_files/flags/default/cdf03e5ca643dd07d44afc82d201d84829d73818 .generated_files/flags/default/3a7ff55a6cb9e565cc82ee7521042155d62a01fd
	@${MKDIR} "${OBJECTDIR}/usb" 
	@${RM} ${OBJECTDIR}/usb/usb_config.o.d 
	@${RM} ${OBJECTDIR}/usb/usb_config.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -D_SUPPRESS_PLIB_WARNING -DSYSCLK=80000000L -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -MP -MMD -MF "${OBJECTDIR}/usb/usb_config.o.d" -o ${OBJECTDIR}/usb/usb_config.o usb/usb_config.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/usb/usb_host.o: usb/usb_host.c  .generated_files/flags/default/cdb8caacfccca06c221b84aad0a2a7953c6b1c43 .generated_files/flags/default/3a7ff55a6cb9e565cc82ee7521042155d62a01fd
	@${MKDIR} "${OBJECTDIR}/usb" 
	@${RM} ${OBJECTDIR}/usb/usb_host.o.d 
	@${RM} ${OBJECTDIR}/usb/usb_host.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -D_SUPPRESS_PLIB_WARNING -DSYSCLK=80000000L -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -MP -MMD -MF "${OBJECTDIR}/usb/usb_host.o.d" -o ${OBJECTDIR}/usb/usb_host.o usb/usb_host.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/usb/usb_host_msd.o: usb/usb_host_msd.c  .generated_files/flags/default/93244ed497fb8336f31c00506c20931f34fe1c51 .generated_files/flags/default/3a7ff55a6cb9e565cc82ee7521042155d62a01fd
	@${MKDIR} "${OBJECTDIR}/usb" 
	@${RM} ${OBJECTDIR}/usb/usb_host_msd.o.d 
	@${RM} ${OBJECTDIR}/usb/usb_host_msd.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -D_SUPPRESS_PLIB_WARNING -DSYSCLK=80000000L -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -MP -MMD -MF "${OBJECTDIR}/usb/usb_host_msd.o.d" -o ${OBJECTDIR}/usb/usb_host_msd.o usb/usb_host_msd.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/usb/usb_host_msd_scsi.o: usb/usb_host_msd_scsi.c  .generated_files/flags/default/da6c95e7551fee85a414ff73304a793620555cf8 .generated_files/flags/default/3a7ff55a6cb9e565cc82ee7521042155d62a01fd
	@${MKDIR} "${OBJECTDIR}/usb" 
	@${RM} ${OBJECTDIR}/usb/usb_host_msd_scsi.o.d 
	@${RM} ${OBJECTDIR}/usb/usb_host_msd_scsi.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -D_SUPPRESS_PLIB_WARNING -DSYSCLK=80000000L -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -MP -MMD -MF "${OBJECTDIR}/usb/usb_host_msd_scsi.o.d" -o ${OBJECTDIR}/usb/usb_host_msd_scsi.o usb/usb_host_msd_scsi.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/vs1003/vs1003.o: vs1003/vs1003.c  .generated_files/flags/default/5527302d17312be1d939fbeb60306d505c47d331 .generated_files/flags/default/3a7ff55a6cb9e565cc82ee7521042155d62a01fd
	@${MKDIR} "${OBJECTDIR}/vs1003" 
	@${RM} ${OBJECTDIR}/vs1003/vs1003.o.d 
	@${RM} ${OBJECTDIR}/vs1003/vs1003.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -D_SUPPRESS_PLIB_WARNING -DSYSCLK=80000000L -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -MP -MMD -MF "${OBJECTDIR}/vs1003/vs1003.o.d" -o ${OBJECTDIR}/vs1003/vs1003.o vs1003/vs1003.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/main.o: main.c  .generated_files/flags/default/6ff99d81b355dacdd4841cfa00bb8b2224e2df07 .generated_files/flags/default/3a7ff55a6cb9e565cc82ee7521042155d62a01fd
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/main.o.d 
	@${RM} ${OBJECTDIR}/main.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -D_SUPPRESS_PLIB_WARNING -DSYSCLK=80000000L -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -MP -MMD -MF "${OBJECTDIR}/main.o.d" -o ${OBJECTDIR}/main.o main.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/common.o: common.c  .generated_files/flags/default/3d548912b4b10cf348dc3f70f57e0ed6c9a0621b .generated_files/flags/default/3a7ff55a6cb9e565cc82ee7521042155d62a01fd
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/common.o.d 
	@${RM} ${OBJECTDIR}/common.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -D_SUPPRESS_PLIB_WARNING -DSYSCLK=80000000L -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -MP -MMD -MF "${OBJECTDIR}/common.o.d" -o ${OBJECTDIR}/common.o common.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)    
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compileCPP
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${DISTDIR}/code.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE) -g   -mprocessor=$(MP_PROCESSOR_OPTION)  -o ${DISTDIR}/code.${IMAGE_TYPE}.${OUTPUT_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}          -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)      -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,-D=__DEBUG_D,--defsym=_min_heap_size=2048,--no-code-in-dinit,--no-dinit-in-serial-mem,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--memorysummary,${DISTDIR}/memoryfile.xml 
	
else
${DISTDIR}/code.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -mprocessor=$(MP_PROCESSOR_OPTION)  -o ${DISTDIR}/code.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}          -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=_min_heap_size=2048,--no-code-in-dinit,--no-dinit-in-serial-mem,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--memorysummary,${DISTDIR}/memoryfile.xml 
	${MP_CC_DIR}/xc32-bin2hex ${DISTDIR}/code.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} 
endif


# Subprojects
.build-subprojects:


# Subprojects
.clean-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r ${OBJECTDIR}
	${RM} -r ${DISTDIR}

# Enable dependency checking
.dep.inc: .depcheck-impl

DEPFILES=$(shell "${PATH_TO_IDE_BIN}"mplabwildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif
