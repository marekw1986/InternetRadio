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
SOURCEFILES_QUOTED_IF_SPACED=config/config.c delay/delay.c fatfs/ff.c fatfs/ffsystem.c fatfs/ffunicode.c fatfs/SPIFlash.c fatfs/diskio.c fatfs/sd.c net/Announce.c net/ARCFOUR.c net/ARP.c net/AutoIP.c net/BerkeleyAPI.c net/BigInt.c CustomHTTPApp.c net/DHCP.c net/DNS.c net/ENC28J60.c net/FTP.c net/GenericTCPServer.c net/Hashes.c net/Helpers.c net/HTTP2.c net/ICMP.c net/IP.c net/MPFS2.c MPFSImg2.c net/NBNS.c net/Random.c net/Reboot.c net/RSA.c net/SMTP.c net/SNTP.c net/SSL.c net/StackTsk.c net/TCP.c net/Telnet.c net/Tick.c net/UDP.c net/ZeroconfHelper.c net/ZeroconfLinkLocal.c net/ZeroconfMulticastDNS.c nvram/nvram.c time/time.c uart/uart.c usb/event.c usb/usb_config.c usb/usb_host.c usb/usb_host_msd.c usb/usb_host_msd_scsi.c vs1003/vs1003.c ../../InternetRadio_PIC32_DP83848/code/vs1003/ringbuffer.c main.c common.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/config/config.o ${OBJECTDIR}/delay/delay.o ${OBJECTDIR}/fatfs/ff.o ${OBJECTDIR}/fatfs/ffsystem.o ${OBJECTDIR}/fatfs/ffunicode.o ${OBJECTDIR}/fatfs/SPIFlash.o ${OBJECTDIR}/fatfs/diskio.o ${OBJECTDIR}/fatfs/sd.o ${OBJECTDIR}/net/Announce.o ${OBJECTDIR}/net/ARCFOUR.o ${OBJECTDIR}/net/ARP.o ${OBJECTDIR}/net/AutoIP.o ${OBJECTDIR}/net/BerkeleyAPI.o ${OBJECTDIR}/net/BigInt.o ${OBJECTDIR}/CustomHTTPApp.o ${OBJECTDIR}/net/DHCP.o ${OBJECTDIR}/net/DNS.o ${OBJECTDIR}/net/ENC28J60.o ${OBJECTDIR}/net/FTP.o ${OBJECTDIR}/net/GenericTCPServer.o ${OBJECTDIR}/net/Hashes.o ${OBJECTDIR}/net/Helpers.o ${OBJECTDIR}/net/HTTP2.o ${OBJECTDIR}/net/ICMP.o ${OBJECTDIR}/net/IP.o ${OBJECTDIR}/net/MPFS2.o ${OBJECTDIR}/MPFSImg2.o ${OBJECTDIR}/net/NBNS.o ${OBJECTDIR}/net/Random.o ${OBJECTDIR}/net/Reboot.o ${OBJECTDIR}/net/RSA.o ${OBJECTDIR}/net/SMTP.o ${OBJECTDIR}/net/SNTP.o ${OBJECTDIR}/net/SSL.o ${OBJECTDIR}/net/StackTsk.o ${OBJECTDIR}/net/TCP.o ${OBJECTDIR}/net/Telnet.o ${OBJECTDIR}/net/Tick.o ${OBJECTDIR}/net/UDP.o ${OBJECTDIR}/net/ZeroconfHelper.o ${OBJECTDIR}/net/ZeroconfLinkLocal.o ${OBJECTDIR}/net/ZeroconfMulticastDNS.o ${OBJECTDIR}/nvram/nvram.o ${OBJECTDIR}/time/time.o ${OBJECTDIR}/uart/uart.o ${OBJECTDIR}/usb/event.o ${OBJECTDIR}/usb/usb_config.o ${OBJECTDIR}/usb/usb_host.o ${OBJECTDIR}/usb/usb_host_msd.o ${OBJECTDIR}/usb/usb_host_msd_scsi.o ${OBJECTDIR}/vs1003/vs1003.o ${OBJECTDIR}/_ext/1227002292/ringbuffer.o ${OBJECTDIR}/main.o ${OBJECTDIR}/common.o
POSSIBLE_DEPFILES=${OBJECTDIR}/config/config.o.d ${OBJECTDIR}/delay/delay.o.d ${OBJECTDIR}/fatfs/ff.o.d ${OBJECTDIR}/fatfs/ffsystem.o.d ${OBJECTDIR}/fatfs/ffunicode.o.d ${OBJECTDIR}/fatfs/SPIFlash.o.d ${OBJECTDIR}/fatfs/diskio.o.d ${OBJECTDIR}/fatfs/sd.o.d ${OBJECTDIR}/net/Announce.o.d ${OBJECTDIR}/net/ARCFOUR.o.d ${OBJECTDIR}/net/ARP.o.d ${OBJECTDIR}/net/AutoIP.o.d ${OBJECTDIR}/net/BerkeleyAPI.o.d ${OBJECTDIR}/net/BigInt.o.d ${OBJECTDIR}/CustomHTTPApp.o.d ${OBJECTDIR}/net/DHCP.o.d ${OBJECTDIR}/net/DNS.o.d ${OBJECTDIR}/net/ENC28J60.o.d ${OBJECTDIR}/net/FTP.o.d ${OBJECTDIR}/net/GenericTCPServer.o.d ${OBJECTDIR}/net/Hashes.o.d ${OBJECTDIR}/net/Helpers.o.d ${OBJECTDIR}/net/HTTP2.o.d ${OBJECTDIR}/net/ICMP.o.d ${OBJECTDIR}/net/IP.o.d ${OBJECTDIR}/net/MPFS2.o.d ${OBJECTDIR}/MPFSImg2.o.d ${OBJECTDIR}/net/NBNS.o.d ${OBJECTDIR}/net/Random.o.d ${OBJECTDIR}/net/Reboot.o.d ${OBJECTDIR}/net/RSA.o.d ${OBJECTDIR}/net/SMTP.o.d ${OBJECTDIR}/net/SNTP.o.d ${OBJECTDIR}/net/SSL.o.d ${OBJECTDIR}/net/StackTsk.o.d ${OBJECTDIR}/net/TCP.o.d ${OBJECTDIR}/net/Telnet.o.d ${OBJECTDIR}/net/Tick.o.d ${OBJECTDIR}/net/UDP.o.d ${OBJECTDIR}/net/ZeroconfHelper.o.d ${OBJECTDIR}/net/ZeroconfLinkLocal.o.d ${OBJECTDIR}/net/ZeroconfMulticastDNS.o.d ${OBJECTDIR}/nvram/nvram.o.d ${OBJECTDIR}/time/time.o.d ${OBJECTDIR}/uart/uart.o.d ${OBJECTDIR}/usb/event.o.d ${OBJECTDIR}/usb/usb_config.o.d ${OBJECTDIR}/usb/usb_host.o.d ${OBJECTDIR}/usb/usb_host_msd.o.d ${OBJECTDIR}/usb/usb_host_msd_scsi.o.d ${OBJECTDIR}/vs1003/vs1003.o.d ${OBJECTDIR}/_ext/1227002292/ringbuffer.o.d ${OBJECTDIR}/main.o.d ${OBJECTDIR}/common.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/config/config.o ${OBJECTDIR}/delay/delay.o ${OBJECTDIR}/fatfs/ff.o ${OBJECTDIR}/fatfs/ffsystem.o ${OBJECTDIR}/fatfs/ffunicode.o ${OBJECTDIR}/fatfs/SPIFlash.o ${OBJECTDIR}/fatfs/diskio.o ${OBJECTDIR}/fatfs/sd.o ${OBJECTDIR}/net/Announce.o ${OBJECTDIR}/net/ARCFOUR.o ${OBJECTDIR}/net/ARP.o ${OBJECTDIR}/net/AutoIP.o ${OBJECTDIR}/net/BerkeleyAPI.o ${OBJECTDIR}/net/BigInt.o ${OBJECTDIR}/CustomHTTPApp.o ${OBJECTDIR}/net/DHCP.o ${OBJECTDIR}/net/DNS.o ${OBJECTDIR}/net/ENC28J60.o ${OBJECTDIR}/net/FTP.o ${OBJECTDIR}/net/GenericTCPServer.o ${OBJECTDIR}/net/Hashes.o ${OBJECTDIR}/net/Helpers.o ${OBJECTDIR}/net/HTTP2.o ${OBJECTDIR}/net/ICMP.o ${OBJECTDIR}/net/IP.o ${OBJECTDIR}/net/MPFS2.o ${OBJECTDIR}/MPFSImg2.o ${OBJECTDIR}/net/NBNS.o ${OBJECTDIR}/net/Random.o ${OBJECTDIR}/net/Reboot.o ${OBJECTDIR}/net/RSA.o ${OBJECTDIR}/net/SMTP.o ${OBJECTDIR}/net/SNTP.o ${OBJECTDIR}/net/SSL.o ${OBJECTDIR}/net/StackTsk.o ${OBJECTDIR}/net/TCP.o ${OBJECTDIR}/net/Telnet.o ${OBJECTDIR}/net/Tick.o ${OBJECTDIR}/net/UDP.o ${OBJECTDIR}/net/ZeroconfHelper.o ${OBJECTDIR}/net/ZeroconfLinkLocal.o ${OBJECTDIR}/net/ZeroconfMulticastDNS.o ${OBJECTDIR}/nvram/nvram.o ${OBJECTDIR}/time/time.o ${OBJECTDIR}/uart/uart.o ${OBJECTDIR}/usb/event.o ${OBJECTDIR}/usb/usb_config.o ${OBJECTDIR}/usb/usb_host.o ${OBJECTDIR}/usb/usb_host_msd.o ${OBJECTDIR}/usb/usb_host_msd_scsi.o ${OBJECTDIR}/vs1003/vs1003.o ${OBJECTDIR}/_ext/1227002292/ringbuffer.o ${OBJECTDIR}/main.o ${OBJECTDIR}/common.o

# Source Files
SOURCEFILES=config/config.c delay/delay.c fatfs/ff.c fatfs/ffsystem.c fatfs/ffunicode.c fatfs/SPIFlash.c fatfs/diskio.c fatfs/sd.c net/Announce.c net/ARCFOUR.c net/ARP.c net/AutoIP.c net/BerkeleyAPI.c net/BigInt.c CustomHTTPApp.c net/DHCP.c net/DNS.c net/ENC28J60.c net/FTP.c net/GenericTCPServer.c net/Hashes.c net/Helpers.c net/HTTP2.c net/ICMP.c net/IP.c net/MPFS2.c MPFSImg2.c net/NBNS.c net/Random.c net/Reboot.c net/RSA.c net/SMTP.c net/SNTP.c net/SSL.c net/StackTsk.c net/TCP.c net/Telnet.c net/Tick.c net/UDP.c net/ZeroconfHelper.c net/ZeroconfLinkLocal.c net/ZeroconfMulticastDNS.c nvram/nvram.c time/time.c uart/uart.c usb/event.c usb/usb_config.c usb/usb_host.c usb/usb_host_msd.c usb/usb_host_msd_scsi.c vs1003/vs1003.c ../../InternetRadio_PIC32_DP83848/code/vs1003/ringbuffer.c main.c common.c



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
${OBJECTDIR}/config/config.o: config/config.c  .generated_files/flags/default/f868739b40c23196f0b8646b3896677e69bfb063 .generated_files/flags/default/3a7ff55a6cb9e565cc82ee7521042155d62a01fd
	@${MKDIR} "${OBJECTDIR}/config" 
	@${RM} ${OBJECTDIR}/config/config.o.d 
	@${RM} ${OBJECTDIR}/config/config.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -D_SUPPRESS_PLIB_WARNING -DSYSCLK=80000000L -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -MP -MMD -MF "${OBJECTDIR}/config/config.o.d" -o ${OBJECTDIR}/config/config.o config/config.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -G 2   
	
${OBJECTDIR}/delay/delay.o: delay/delay.c  .generated_files/flags/default/2ed46e996b3dbc7e8fafcd66eb34ef325eb8b6e5 .generated_files/flags/default/3a7ff55a6cb9e565cc82ee7521042155d62a01fd
	@${MKDIR} "${OBJECTDIR}/delay" 
	@${RM} ${OBJECTDIR}/delay/delay.o.d 
	@${RM} ${OBJECTDIR}/delay/delay.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -D_SUPPRESS_PLIB_WARNING -DSYSCLK=80000000L -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -MP -MMD -MF "${OBJECTDIR}/delay/delay.o.d" -o ${OBJECTDIR}/delay/delay.o delay/delay.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -G 2   
	
${OBJECTDIR}/fatfs/ff.o: fatfs/ff.c  .generated_files/flags/default/bec74b757e45cba0aabf6867d3d174ae4f71a4ae .generated_files/flags/default/3a7ff55a6cb9e565cc82ee7521042155d62a01fd
	@${MKDIR} "${OBJECTDIR}/fatfs" 
	@${RM} ${OBJECTDIR}/fatfs/ff.o.d 
	@${RM} ${OBJECTDIR}/fatfs/ff.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -D_SUPPRESS_PLIB_WARNING -DSYSCLK=80000000L -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -MP -MMD -MF "${OBJECTDIR}/fatfs/ff.o.d" -o ${OBJECTDIR}/fatfs/ff.o fatfs/ff.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -G 2   
	
${OBJECTDIR}/fatfs/ffsystem.o: fatfs/ffsystem.c  .generated_files/flags/default/9a92b161d0492f36dfa38166f6eea88ca1ff8b1d .generated_files/flags/default/3a7ff55a6cb9e565cc82ee7521042155d62a01fd
	@${MKDIR} "${OBJECTDIR}/fatfs" 
	@${RM} ${OBJECTDIR}/fatfs/ffsystem.o.d 
	@${RM} ${OBJECTDIR}/fatfs/ffsystem.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -D_SUPPRESS_PLIB_WARNING -DSYSCLK=80000000L -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -MP -MMD -MF "${OBJECTDIR}/fatfs/ffsystem.o.d" -o ${OBJECTDIR}/fatfs/ffsystem.o fatfs/ffsystem.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -G 2   
	
${OBJECTDIR}/fatfs/ffunicode.o: fatfs/ffunicode.c  .generated_files/flags/default/f888105cfbb798f3cf66c92e11e46fd8ad86ebbc .generated_files/flags/default/3a7ff55a6cb9e565cc82ee7521042155d62a01fd
	@${MKDIR} "${OBJECTDIR}/fatfs" 
	@${RM} ${OBJECTDIR}/fatfs/ffunicode.o.d 
	@${RM} ${OBJECTDIR}/fatfs/ffunicode.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -D_SUPPRESS_PLIB_WARNING -DSYSCLK=80000000L -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -MP -MMD -MF "${OBJECTDIR}/fatfs/ffunicode.o.d" -o ${OBJECTDIR}/fatfs/ffunicode.o fatfs/ffunicode.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -G 2   
	
${OBJECTDIR}/fatfs/SPIFlash.o: fatfs/SPIFlash.c  .generated_files/flags/default/997f0940e09914da5fd0600c7bff75c5a785a8b0 .generated_files/flags/default/3a7ff55a6cb9e565cc82ee7521042155d62a01fd
	@${MKDIR} "${OBJECTDIR}/fatfs" 
	@${RM} ${OBJECTDIR}/fatfs/SPIFlash.o.d 
	@${RM} ${OBJECTDIR}/fatfs/SPIFlash.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -D_SUPPRESS_PLIB_WARNING -DSYSCLK=80000000L -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -MP -MMD -MF "${OBJECTDIR}/fatfs/SPIFlash.o.d" -o ${OBJECTDIR}/fatfs/SPIFlash.o fatfs/SPIFlash.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -G 2   
	
${OBJECTDIR}/fatfs/diskio.o: fatfs/diskio.c  .generated_files/flags/default/4b0b26df036cca75b0bfe38989cdbecc1b8967bd .generated_files/flags/default/3a7ff55a6cb9e565cc82ee7521042155d62a01fd
	@${MKDIR} "${OBJECTDIR}/fatfs" 
	@${RM} ${OBJECTDIR}/fatfs/diskio.o.d 
	@${RM} ${OBJECTDIR}/fatfs/diskio.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -D_SUPPRESS_PLIB_WARNING -DSYSCLK=80000000L -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -MP -MMD -MF "${OBJECTDIR}/fatfs/diskio.o.d" -o ${OBJECTDIR}/fatfs/diskio.o fatfs/diskio.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -G 2   
	
${OBJECTDIR}/fatfs/sd.o: fatfs/sd.c  .generated_files/flags/default/afd901afdc415389a0133c1366166127a6b98e3a .generated_files/flags/default/3a7ff55a6cb9e565cc82ee7521042155d62a01fd
	@${MKDIR} "${OBJECTDIR}/fatfs" 
	@${RM} ${OBJECTDIR}/fatfs/sd.o.d 
	@${RM} ${OBJECTDIR}/fatfs/sd.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -D_SUPPRESS_PLIB_WARNING -DSYSCLK=80000000L -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -MP -MMD -MF "${OBJECTDIR}/fatfs/sd.o.d" -o ${OBJECTDIR}/fatfs/sd.o fatfs/sd.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -G 2   
	
${OBJECTDIR}/net/Announce.o: net/Announce.c  .generated_files/flags/default/584fdbeddfec0d617a41ae8c7a989b97978ee58a .generated_files/flags/default/3a7ff55a6cb9e565cc82ee7521042155d62a01fd
	@${MKDIR} "${OBJECTDIR}/net" 
	@${RM} ${OBJECTDIR}/net/Announce.o.d 
	@${RM} ${OBJECTDIR}/net/Announce.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -D_SUPPRESS_PLIB_WARNING -DSYSCLK=80000000L -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -MP -MMD -MF "${OBJECTDIR}/net/Announce.o.d" -o ${OBJECTDIR}/net/Announce.o net/Announce.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -G 2   
	
${OBJECTDIR}/net/ARCFOUR.o: net/ARCFOUR.c  .generated_files/flags/default/25b3473b68df14844a69df6a03ded01c0c0462d5 .generated_files/flags/default/3a7ff55a6cb9e565cc82ee7521042155d62a01fd
	@${MKDIR} "${OBJECTDIR}/net" 
	@${RM} ${OBJECTDIR}/net/ARCFOUR.o.d 
	@${RM} ${OBJECTDIR}/net/ARCFOUR.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -D_SUPPRESS_PLIB_WARNING -DSYSCLK=80000000L -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -MP -MMD -MF "${OBJECTDIR}/net/ARCFOUR.o.d" -o ${OBJECTDIR}/net/ARCFOUR.o net/ARCFOUR.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -G 2   
	
${OBJECTDIR}/net/ARP.o: net/ARP.c  .generated_files/flags/default/775ba3da0df78f98dd1ab76ea350b9136dfd8fd7 .generated_files/flags/default/3a7ff55a6cb9e565cc82ee7521042155d62a01fd
	@${MKDIR} "${OBJECTDIR}/net" 
	@${RM} ${OBJECTDIR}/net/ARP.o.d 
	@${RM} ${OBJECTDIR}/net/ARP.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -D_SUPPRESS_PLIB_WARNING -DSYSCLK=80000000L -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -MP -MMD -MF "${OBJECTDIR}/net/ARP.o.d" -o ${OBJECTDIR}/net/ARP.o net/ARP.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -G 2   
	
${OBJECTDIR}/net/AutoIP.o: net/AutoIP.c  .generated_files/flags/default/4b92ff6f8f50b51de5ecb6a58ca14a3ac6f47381 .generated_files/flags/default/3a7ff55a6cb9e565cc82ee7521042155d62a01fd
	@${MKDIR} "${OBJECTDIR}/net" 
	@${RM} ${OBJECTDIR}/net/AutoIP.o.d 
	@${RM} ${OBJECTDIR}/net/AutoIP.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -D_SUPPRESS_PLIB_WARNING -DSYSCLK=80000000L -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -MP -MMD -MF "${OBJECTDIR}/net/AutoIP.o.d" -o ${OBJECTDIR}/net/AutoIP.o net/AutoIP.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -G 2   
	
${OBJECTDIR}/net/BerkeleyAPI.o: net/BerkeleyAPI.c  .generated_files/flags/default/80111e57e5206da7e8b08a732bb6d73b2ff4ddba .generated_files/flags/default/3a7ff55a6cb9e565cc82ee7521042155d62a01fd
	@${MKDIR} "${OBJECTDIR}/net" 
	@${RM} ${OBJECTDIR}/net/BerkeleyAPI.o.d 
	@${RM} ${OBJECTDIR}/net/BerkeleyAPI.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -D_SUPPRESS_PLIB_WARNING -DSYSCLK=80000000L -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -MP -MMD -MF "${OBJECTDIR}/net/BerkeleyAPI.o.d" -o ${OBJECTDIR}/net/BerkeleyAPI.o net/BerkeleyAPI.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -G 2   
	
${OBJECTDIR}/net/BigInt.o: net/BigInt.c  .generated_files/flags/default/e2786dca3e6c418b8dea1e453cd51585f7df080b .generated_files/flags/default/3a7ff55a6cb9e565cc82ee7521042155d62a01fd
	@${MKDIR} "${OBJECTDIR}/net" 
	@${RM} ${OBJECTDIR}/net/BigInt.o.d 
	@${RM} ${OBJECTDIR}/net/BigInt.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -D_SUPPRESS_PLIB_WARNING -DSYSCLK=80000000L -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -MP -MMD -MF "${OBJECTDIR}/net/BigInt.o.d" -o ${OBJECTDIR}/net/BigInt.o net/BigInt.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -G 2   
	
${OBJECTDIR}/CustomHTTPApp.o: CustomHTTPApp.c  .generated_files/flags/default/c4b9be23b462cbc897db8e138f964b0391734336 .generated_files/flags/default/3a7ff55a6cb9e565cc82ee7521042155d62a01fd
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/CustomHTTPApp.o.d 
	@${RM} ${OBJECTDIR}/CustomHTTPApp.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -D_SUPPRESS_PLIB_WARNING -DSYSCLK=80000000L -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -MP -MMD -MF "${OBJECTDIR}/CustomHTTPApp.o.d" -o ${OBJECTDIR}/CustomHTTPApp.o CustomHTTPApp.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -G 2   
	
${OBJECTDIR}/net/DHCP.o: net/DHCP.c  .generated_files/flags/default/cabeb478e97557d75f9a9eb835e3fcb7f3e39171 .generated_files/flags/default/3a7ff55a6cb9e565cc82ee7521042155d62a01fd
	@${MKDIR} "${OBJECTDIR}/net" 
	@${RM} ${OBJECTDIR}/net/DHCP.o.d 
	@${RM} ${OBJECTDIR}/net/DHCP.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -D_SUPPRESS_PLIB_WARNING -DSYSCLK=80000000L -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -MP -MMD -MF "${OBJECTDIR}/net/DHCP.o.d" -o ${OBJECTDIR}/net/DHCP.o net/DHCP.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -G 2   
	
${OBJECTDIR}/net/DNS.o: net/DNS.c  .generated_files/flags/default/f4f4809d0596686c7fbc9ae894982b880dfee69 .generated_files/flags/default/3a7ff55a6cb9e565cc82ee7521042155d62a01fd
	@${MKDIR} "${OBJECTDIR}/net" 
	@${RM} ${OBJECTDIR}/net/DNS.o.d 
	@${RM} ${OBJECTDIR}/net/DNS.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -D_SUPPRESS_PLIB_WARNING -DSYSCLK=80000000L -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -MP -MMD -MF "${OBJECTDIR}/net/DNS.o.d" -o ${OBJECTDIR}/net/DNS.o net/DNS.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -G 2   
	
${OBJECTDIR}/net/ENC28J60.o: net/ENC28J60.c  .generated_files/flags/default/75f3b307ed75f8950c179f8c3b182fe77032ed27 .generated_files/flags/default/3a7ff55a6cb9e565cc82ee7521042155d62a01fd
	@${MKDIR} "${OBJECTDIR}/net" 
	@${RM} ${OBJECTDIR}/net/ENC28J60.o.d 
	@${RM} ${OBJECTDIR}/net/ENC28J60.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -D_SUPPRESS_PLIB_WARNING -DSYSCLK=80000000L -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -MP -MMD -MF "${OBJECTDIR}/net/ENC28J60.o.d" -o ${OBJECTDIR}/net/ENC28J60.o net/ENC28J60.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -G 2   
	
${OBJECTDIR}/net/FTP.o: net/FTP.c  .generated_files/flags/default/87977c9102df7decce89146147ed9f73f2d6b8e3 .generated_files/flags/default/3a7ff55a6cb9e565cc82ee7521042155d62a01fd
	@${MKDIR} "${OBJECTDIR}/net" 
	@${RM} ${OBJECTDIR}/net/FTP.o.d 
	@${RM} ${OBJECTDIR}/net/FTP.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -D_SUPPRESS_PLIB_WARNING -DSYSCLK=80000000L -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -MP -MMD -MF "${OBJECTDIR}/net/FTP.o.d" -o ${OBJECTDIR}/net/FTP.o net/FTP.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -G 2   
	
${OBJECTDIR}/net/GenericTCPServer.o: net/GenericTCPServer.c  .generated_files/flags/default/169bae3a4c07e5da7458843a4a422f243164fbce .generated_files/flags/default/3a7ff55a6cb9e565cc82ee7521042155d62a01fd
	@${MKDIR} "${OBJECTDIR}/net" 
	@${RM} ${OBJECTDIR}/net/GenericTCPServer.o.d 
	@${RM} ${OBJECTDIR}/net/GenericTCPServer.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -D_SUPPRESS_PLIB_WARNING -DSYSCLK=80000000L -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -MP -MMD -MF "${OBJECTDIR}/net/GenericTCPServer.o.d" -o ${OBJECTDIR}/net/GenericTCPServer.o net/GenericTCPServer.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -G 2   
	
${OBJECTDIR}/net/Hashes.o: net/Hashes.c  .generated_files/flags/default/e76a3ffd469a4ae5b38cf88b48530084481b5f0e .generated_files/flags/default/3a7ff55a6cb9e565cc82ee7521042155d62a01fd
	@${MKDIR} "${OBJECTDIR}/net" 
	@${RM} ${OBJECTDIR}/net/Hashes.o.d 
	@${RM} ${OBJECTDIR}/net/Hashes.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -D_SUPPRESS_PLIB_WARNING -DSYSCLK=80000000L -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -MP -MMD -MF "${OBJECTDIR}/net/Hashes.o.d" -o ${OBJECTDIR}/net/Hashes.o net/Hashes.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -G 2   
	
${OBJECTDIR}/net/Helpers.o: net/Helpers.c  .generated_files/flags/default/c73b53fb7feae3b02e35a95ef51bd8c03f99c796 .generated_files/flags/default/3a7ff55a6cb9e565cc82ee7521042155d62a01fd
	@${MKDIR} "${OBJECTDIR}/net" 
	@${RM} ${OBJECTDIR}/net/Helpers.o.d 
	@${RM} ${OBJECTDIR}/net/Helpers.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -D_SUPPRESS_PLIB_WARNING -DSYSCLK=80000000L -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -MP -MMD -MF "${OBJECTDIR}/net/Helpers.o.d" -o ${OBJECTDIR}/net/Helpers.o net/Helpers.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -G 2   
	
${OBJECTDIR}/net/HTTP2.o: net/HTTP2.c  .generated_files/flags/default/e7de8f85b6d27d73d4b534f36041d019d30b1fa5 .generated_files/flags/default/3a7ff55a6cb9e565cc82ee7521042155d62a01fd
	@${MKDIR} "${OBJECTDIR}/net" 
	@${RM} ${OBJECTDIR}/net/HTTP2.o.d 
	@${RM} ${OBJECTDIR}/net/HTTP2.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -D_SUPPRESS_PLIB_WARNING -DSYSCLK=80000000L -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -MP -MMD -MF "${OBJECTDIR}/net/HTTP2.o.d" -o ${OBJECTDIR}/net/HTTP2.o net/HTTP2.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -G 2   
	
${OBJECTDIR}/net/ICMP.o: net/ICMP.c  .generated_files/flags/default/877e4d7916fec62162ea19caee2cd0997edc0b61 .generated_files/flags/default/3a7ff55a6cb9e565cc82ee7521042155d62a01fd
	@${MKDIR} "${OBJECTDIR}/net" 
	@${RM} ${OBJECTDIR}/net/ICMP.o.d 
	@${RM} ${OBJECTDIR}/net/ICMP.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -D_SUPPRESS_PLIB_WARNING -DSYSCLK=80000000L -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -MP -MMD -MF "${OBJECTDIR}/net/ICMP.o.d" -o ${OBJECTDIR}/net/ICMP.o net/ICMP.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -G 2   
	
${OBJECTDIR}/net/IP.o: net/IP.c  .generated_files/flags/default/c5c545b9d0af661e997984962aca0d218b792285 .generated_files/flags/default/3a7ff55a6cb9e565cc82ee7521042155d62a01fd
	@${MKDIR} "${OBJECTDIR}/net" 
	@${RM} ${OBJECTDIR}/net/IP.o.d 
	@${RM} ${OBJECTDIR}/net/IP.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -D_SUPPRESS_PLIB_WARNING -DSYSCLK=80000000L -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -MP -MMD -MF "${OBJECTDIR}/net/IP.o.d" -o ${OBJECTDIR}/net/IP.o net/IP.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -G 2   
	
${OBJECTDIR}/net/MPFS2.o: net/MPFS2.c  .generated_files/flags/default/7bef8b56d2aa6475e1c092f2c6d0b163579f829e .generated_files/flags/default/3a7ff55a6cb9e565cc82ee7521042155d62a01fd
	@${MKDIR} "${OBJECTDIR}/net" 
	@${RM} ${OBJECTDIR}/net/MPFS2.o.d 
	@${RM} ${OBJECTDIR}/net/MPFS2.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -D_SUPPRESS_PLIB_WARNING -DSYSCLK=80000000L -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -MP -MMD -MF "${OBJECTDIR}/net/MPFS2.o.d" -o ${OBJECTDIR}/net/MPFS2.o net/MPFS2.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -G 2   
	
${OBJECTDIR}/MPFSImg2.o: MPFSImg2.c  .generated_files/flags/default/de8917be2db8209269893575b48b2d86e8a4a7cd .generated_files/flags/default/3a7ff55a6cb9e565cc82ee7521042155d62a01fd
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/MPFSImg2.o.d 
	@${RM} ${OBJECTDIR}/MPFSImg2.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -D_SUPPRESS_PLIB_WARNING -DSYSCLK=80000000L -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -MP -MMD -MF "${OBJECTDIR}/MPFSImg2.o.d" -o ${OBJECTDIR}/MPFSImg2.o MPFSImg2.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -G 2   
	
${OBJECTDIR}/net/NBNS.o: net/NBNS.c  .generated_files/flags/default/80c030023be90ddb555ccb4c61ac000d107dd727 .generated_files/flags/default/3a7ff55a6cb9e565cc82ee7521042155d62a01fd
	@${MKDIR} "${OBJECTDIR}/net" 
	@${RM} ${OBJECTDIR}/net/NBNS.o.d 
	@${RM} ${OBJECTDIR}/net/NBNS.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -D_SUPPRESS_PLIB_WARNING -DSYSCLK=80000000L -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -MP -MMD -MF "${OBJECTDIR}/net/NBNS.o.d" -o ${OBJECTDIR}/net/NBNS.o net/NBNS.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -G 2   
	
${OBJECTDIR}/net/Random.o: net/Random.c  .generated_files/flags/default/4d5330f3a7d8dc4ef3ee15ea8da2d65b77675147 .generated_files/flags/default/3a7ff55a6cb9e565cc82ee7521042155d62a01fd
	@${MKDIR} "${OBJECTDIR}/net" 
	@${RM} ${OBJECTDIR}/net/Random.o.d 
	@${RM} ${OBJECTDIR}/net/Random.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -D_SUPPRESS_PLIB_WARNING -DSYSCLK=80000000L -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -MP -MMD -MF "${OBJECTDIR}/net/Random.o.d" -o ${OBJECTDIR}/net/Random.o net/Random.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -G 2   
	
${OBJECTDIR}/net/Reboot.o: net/Reboot.c  .generated_files/flags/default/6e720b6f7d8150b6eb9baecac7edaeef2e384171 .generated_files/flags/default/3a7ff55a6cb9e565cc82ee7521042155d62a01fd
	@${MKDIR} "${OBJECTDIR}/net" 
	@${RM} ${OBJECTDIR}/net/Reboot.o.d 
	@${RM} ${OBJECTDIR}/net/Reboot.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -D_SUPPRESS_PLIB_WARNING -DSYSCLK=80000000L -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -MP -MMD -MF "${OBJECTDIR}/net/Reboot.o.d" -o ${OBJECTDIR}/net/Reboot.o net/Reboot.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -G 2   
	
${OBJECTDIR}/net/RSA.o: net/RSA.c  .generated_files/flags/default/13ca789c80b661a14d0f337802286afe408d03f6 .generated_files/flags/default/3a7ff55a6cb9e565cc82ee7521042155d62a01fd
	@${MKDIR} "${OBJECTDIR}/net" 
	@${RM} ${OBJECTDIR}/net/RSA.o.d 
	@${RM} ${OBJECTDIR}/net/RSA.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -D_SUPPRESS_PLIB_WARNING -DSYSCLK=80000000L -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -MP -MMD -MF "${OBJECTDIR}/net/RSA.o.d" -o ${OBJECTDIR}/net/RSA.o net/RSA.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -G 2   
	
${OBJECTDIR}/net/SMTP.o: net/SMTP.c  .generated_files/flags/default/232faa79cc7d1cd3e4bf6b3afe7591d5a3deb2cd .generated_files/flags/default/3a7ff55a6cb9e565cc82ee7521042155d62a01fd
	@${MKDIR} "${OBJECTDIR}/net" 
	@${RM} ${OBJECTDIR}/net/SMTP.o.d 
	@${RM} ${OBJECTDIR}/net/SMTP.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -D_SUPPRESS_PLIB_WARNING -DSYSCLK=80000000L -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -MP -MMD -MF "${OBJECTDIR}/net/SMTP.o.d" -o ${OBJECTDIR}/net/SMTP.o net/SMTP.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -G 2   
	
${OBJECTDIR}/net/SNTP.o: net/SNTP.c  .generated_files/flags/default/ebdfdbfcc602e7a3d8f5217823a2e365a05a4664 .generated_files/flags/default/3a7ff55a6cb9e565cc82ee7521042155d62a01fd
	@${MKDIR} "${OBJECTDIR}/net" 
	@${RM} ${OBJECTDIR}/net/SNTP.o.d 
	@${RM} ${OBJECTDIR}/net/SNTP.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -D_SUPPRESS_PLIB_WARNING -DSYSCLK=80000000L -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -MP -MMD -MF "${OBJECTDIR}/net/SNTP.o.d" -o ${OBJECTDIR}/net/SNTP.o net/SNTP.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -G 2   
	
${OBJECTDIR}/net/SSL.o: net/SSL.c  .generated_files/flags/default/7ad06ea6aa387eb3af9706fb06cb70c070cbf836 .generated_files/flags/default/3a7ff55a6cb9e565cc82ee7521042155d62a01fd
	@${MKDIR} "${OBJECTDIR}/net" 
	@${RM} ${OBJECTDIR}/net/SSL.o.d 
	@${RM} ${OBJECTDIR}/net/SSL.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -D_SUPPRESS_PLIB_WARNING -DSYSCLK=80000000L -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -MP -MMD -MF "${OBJECTDIR}/net/SSL.o.d" -o ${OBJECTDIR}/net/SSL.o net/SSL.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -G 2   
	
${OBJECTDIR}/net/StackTsk.o: net/StackTsk.c  .generated_files/flags/default/ef040f2d2c93718f7aa69283ef221a2615402ffa .generated_files/flags/default/3a7ff55a6cb9e565cc82ee7521042155d62a01fd
	@${MKDIR} "${OBJECTDIR}/net" 
	@${RM} ${OBJECTDIR}/net/StackTsk.o.d 
	@${RM} ${OBJECTDIR}/net/StackTsk.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -D_SUPPRESS_PLIB_WARNING -DSYSCLK=80000000L -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -MP -MMD -MF "${OBJECTDIR}/net/StackTsk.o.d" -o ${OBJECTDIR}/net/StackTsk.o net/StackTsk.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -G 2   
	
${OBJECTDIR}/net/TCP.o: net/TCP.c  .generated_files/flags/default/1ed4d816bd5c8f1cbbee7532fe756bf3331d71f9 .generated_files/flags/default/3a7ff55a6cb9e565cc82ee7521042155d62a01fd
	@${MKDIR} "${OBJECTDIR}/net" 
	@${RM} ${OBJECTDIR}/net/TCP.o.d 
	@${RM} ${OBJECTDIR}/net/TCP.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -D_SUPPRESS_PLIB_WARNING -DSYSCLK=80000000L -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -MP -MMD -MF "${OBJECTDIR}/net/TCP.o.d" -o ${OBJECTDIR}/net/TCP.o net/TCP.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -G 2   
	
${OBJECTDIR}/net/Telnet.o: net/Telnet.c  .generated_files/flags/default/583482900f52e426f00a1c4f520f3ccd4db8bd2d .generated_files/flags/default/3a7ff55a6cb9e565cc82ee7521042155d62a01fd
	@${MKDIR} "${OBJECTDIR}/net" 
	@${RM} ${OBJECTDIR}/net/Telnet.o.d 
	@${RM} ${OBJECTDIR}/net/Telnet.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -D_SUPPRESS_PLIB_WARNING -DSYSCLK=80000000L -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -MP -MMD -MF "${OBJECTDIR}/net/Telnet.o.d" -o ${OBJECTDIR}/net/Telnet.o net/Telnet.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -G 2   
	
${OBJECTDIR}/net/Tick.o: net/Tick.c  .generated_files/flags/default/ced702aca162ab8e7fe816fd39ce3b352dd43528 .generated_files/flags/default/3a7ff55a6cb9e565cc82ee7521042155d62a01fd
	@${MKDIR} "${OBJECTDIR}/net" 
	@${RM} ${OBJECTDIR}/net/Tick.o.d 
	@${RM} ${OBJECTDIR}/net/Tick.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -D_SUPPRESS_PLIB_WARNING -DSYSCLK=80000000L -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -MP -MMD -MF "${OBJECTDIR}/net/Tick.o.d" -o ${OBJECTDIR}/net/Tick.o net/Tick.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -G 2   
	
${OBJECTDIR}/net/UDP.o: net/UDP.c  .generated_files/flags/default/f08496865039d09c5eb157a6d4daace13f201961 .generated_files/flags/default/3a7ff55a6cb9e565cc82ee7521042155d62a01fd
	@${MKDIR} "${OBJECTDIR}/net" 
	@${RM} ${OBJECTDIR}/net/UDP.o.d 
	@${RM} ${OBJECTDIR}/net/UDP.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -D_SUPPRESS_PLIB_WARNING -DSYSCLK=80000000L -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -MP -MMD -MF "${OBJECTDIR}/net/UDP.o.d" -o ${OBJECTDIR}/net/UDP.o net/UDP.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -G 2   
	
${OBJECTDIR}/net/ZeroconfHelper.o: net/ZeroconfHelper.c  .generated_files/flags/default/cc4925cf129cdbe661f3e3110230f98245dd6cb9 .generated_files/flags/default/3a7ff55a6cb9e565cc82ee7521042155d62a01fd
	@${MKDIR} "${OBJECTDIR}/net" 
	@${RM} ${OBJECTDIR}/net/ZeroconfHelper.o.d 
	@${RM} ${OBJECTDIR}/net/ZeroconfHelper.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -D_SUPPRESS_PLIB_WARNING -DSYSCLK=80000000L -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -MP -MMD -MF "${OBJECTDIR}/net/ZeroconfHelper.o.d" -o ${OBJECTDIR}/net/ZeroconfHelper.o net/ZeroconfHelper.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -G 2   
	
${OBJECTDIR}/net/ZeroconfLinkLocal.o: net/ZeroconfLinkLocal.c  .generated_files/flags/default/97a7b5d5b65338cf83a2eec2ed1b69e35beebcd7 .generated_files/flags/default/3a7ff55a6cb9e565cc82ee7521042155d62a01fd
	@${MKDIR} "${OBJECTDIR}/net" 
	@${RM} ${OBJECTDIR}/net/ZeroconfLinkLocal.o.d 
	@${RM} ${OBJECTDIR}/net/ZeroconfLinkLocal.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -D_SUPPRESS_PLIB_WARNING -DSYSCLK=80000000L -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -MP -MMD -MF "${OBJECTDIR}/net/ZeroconfLinkLocal.o.d" -o ${OBJECTDIR}/net/ZeroconfLinkLocal.o net/ZeroconfLinkLocal.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -G 2   
	
${OBJECTDIR}/net/ZeroconfMulticastDNS.o: net/ZeroconfMulticastDNS.c  .generated_files/flags/default/e5b2421afffaf91414bff31fe4caba24b9e1717a .generated_files/flags/default/3a7ff55a6cb9e565cc82ee7521042155d62a01fd
	@${MKDIR} "${OBJECTDIR}/net" 
	@${RM} ${OBJECTDIR}/net/ZeroconfMulticastDNS.o.d 
	@${RM} ${OBJECTDIR}/net/ZeroconfMulticastDNS.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -D_SUPPRESS_PLIB_WARNING -DSYSCLK=80000000L -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -MP -MMD -MF "${OBJECTDIR}/net/ZeroconfMulticastDNS.o.d" -o ${OBJECTDIR}/net/ZeroconfMulticastDNS.o net/ZeroconfMulticastDNS.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -G 2   
	
${OBJECTDIR}/nvram/nvram.o: nvram/nvram.c  .generated_files/flags/default/b9ec0da79f589aed786aa54ff2d13640a0b638bf .generated_files/flags/default/3a7ff55a6cb9e565cc82ee7521042155d62a01fd
	@${MKDIR} "${OBJECTDIR}/nvram" 
	@${RM} ${OBJECTDIR}/nvram/nvram.o.d 
	@${RM} ${OBJECTDIR}/nvram/nvram.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -D_SUPPRESS_PLIB_WARNING -DSYSCLK=80000000L -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -MP -MMD -MF "${OBJECTDIR}/nvram/nvram.o.d" -o ${OBJECTDIR}/nvram/nvram.o nvram/nvram.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -G 2   
	
${OBJECTDIR}/time/time.o: time/time.c  .generated_files/flags/default/6500ce01b9d11a3463b089b6685b445030df1db .generated_files/flags/default/3a7ff55a6cb9e565cc82ee7521042155d62a01fd
	@${MKDIR} "${OBJECTDIR}/time" 
	@${RM} ${OBJECTDIR}/time/time.o.d 
	@${RM} ${OBJECTDIR}/time/time.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -D_SUPPRESS_PLIB_WARNING -DSYSCLK=80000000L -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -MP -MMD -MF "${OBJECTDIR}/time/time.o.d" -o ${OBJECTDIR}/time/time.o time/time.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -G 2   
	
${OBJECTDIR}/uart/uart.o: uart/uart.c  .generated_files/flags/default/b1630fc772e3373bae888aca64b56e5ce4978d75 .generated_files/flags/default/3a7ff55a6cb9e565cc82ee7521042155d62a01fd
	@${MKDIR} "${OBJECTDIR}/uart" 
	@${RM} ${OBJECTDIR}/uart/uart.o.d 
	@${RM} ${OBJECTDIR}/uart/uart.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -D_SUPPRESS_PLIB_WARNING -DSYSCLK=80000000L -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -MP -MMD -MF "${OBJECTDIR}/uart/uart.o.d" -o ${OBJECTDIR}/uart/uart.o uart/uart.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -G 2   
	
${OBJECTDIR}/usb/event.o: usb/event.c  .generated_files/flags/default/e01c1e80bb13073c28d15247eef1240c5439ff3c .generated_files/flags/default/3a7ff55a6cb9e565cc82ee7521042155d62a01fd
	@${MKDIR} "${OBJECTDIR}/usb" 
	@${RM} ${OBJECTDIR}/usb/event.o.d 
	@${RM} ${OBJECTDIR}/usb/event.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -D_SUPPRESS_PLIB_WARNING -DSYSCLK=80000000L -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -MP -MMD -MF "${OBJECTDIR}/usb/event.o.d" -o ${OBJECTDIR}/usb/event.o usb/event.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -G 2   
	
${OBJECTDIR}/usb/usb_config.o: usb/usb_config.c  .generated_files/flags/default/f6780e96a1d099441f5181d501956b3985692023 .generated_files/flags/default/3a7ff55a6cb9e565cc82ee7521042155d62a01fd
	@${MKDIR} "${OBJECTDIR}/usb" 
	@${RM} ${OBJECTDIR}/usb/usb_config.o.d 
	@${RM} ${OBJECTDIR}/usb/usb_config.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -D_SUPPRESS_PLIB_WARNING -DSYSCLK=80000000L -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -MP -MMD -MF "${OBJECTDIR}/usb/usb_config.o.d" -o ${OBJECTDIR}/usb/usb_config.o usb/usb_config.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -G 2   
	
${OBJECTDIR}/usb/usb_host.o: usb/usb_host.c  .generated_files/flags/default/984fcfaa7e56fc6bbc7761cf8dad200697e33ad8 .generated_files/flags/default/3a7ff55a6cb9e565cc82ee7521042155d62a01fd
	@${MKDIR} "${OBJECTDIR}/usb" 
	@${RM} ${OBJECTDIR}/usb/usb_host.o.d 
	@${RM} ${OBJECTDIR}/usb/usb_host.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -D_SUPPRESS_PLIB_WARNING -DSYSCLK=80000000L -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -MP -MMD -MF "${OBJECTDIR}/usb/usb_host.o.d" -o ${OBJECTDIR}/usb/usb_host.o usb/usb_host.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -G 2   
	
${OBJECTDIR}/usb/usb_host_msd.o: usb/usb_host_msd.c  .generated_files/flags/default/b7f81031705565ab71237fb4f32f45dc49621b8c .generated_files/flags/default/3a7ff55a6cb9e565cc82ee7521042155d62a01fd
	@${MKDIR} "${OBJECTDIR}/usb" 
	@${RM} ${OBJECTDIR}/usb/usb_host_msd.o.d 
	@${RM} ${OBJECTDIR}/usb/usb_host_msd.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -D_SUPPRESS_PLIB_WARNING -DSYSCLK=80000000L -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -MP -MMD -MF "${OBJECTDIR}/usb/usb_host_msd.o.d" -o ${OBJECTDIR}/usb/usb_host_msd.o usb/usb_host_msd.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -G 2   
	
${OBJECTDIR}/usb/usb_host_msd_scsi.o: usb/usb_host_msd_scsi.c  .generated_files/flags/default/b5fd749b2924b9aeb5f8a4e3970b34bc7b6d045a .generated_files/flags/default/3a7ff55a6cb9e565cc82ee7521042155d62a01fd
	@${MKDIR} "${OBJECTDIR}/usb" 
	@${RM} ${OBJECTDIR}/usb/usb_host_msd_scsi.o.d 
	@${RM} ${OBJECTDIR}/usb/usb_host_msd_scsi.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -D_SUPPRESS_PLIB_WARNING -DSYSCLK=80000000L -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -MP -MMD -MF "${OBJECTDIR}/usb/usb_host_msd_scsi.o.d" -o ${OBJECTDIR}/usb/usb_host_msd_scsi.o usb/usb_host_msd_scsi.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -G 2   
	
${OBJECTDIR}/vs1003/vs1003.o: vs1003/vs1003.c  .generated_files/flags/default/8f0e27515c69d94e480850727fa9b8eec291d86d .generated_files/flags/default/3a7ff55a6cb9e565cc82ee7521042155d62a01fd
	@${MKDIR} "${OBJECTDIR}/vs1003" 
	@${RM} ${OBJECTDIR}/vs1003/vs1003.o.d 
	@${RM} ${OBJECTDIR}/vs1003/vs1003.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -D_SUPPRESS_PLIB_WARNING -DSYSCLK=80000000L -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -MP -MMD -MF "${OBJECTDIR}/vs1003/vs1003.o.d" -o ${OBJECTDIR}/vs1003/vs1003.o vs1003/vs1003.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -G 2   
	
${OBJECTDIR}/_ext/1227002292/ringbuffer.o: ../../InternetRadio_PIC32_DP83848/code/vs1003/ringbuffer.c  .generated_files/flags/default/70ae59a200c5a2194509809de7005a76fcb64ca2 .generated_files/flags/default/3a7ff55a6cb9e565cc82ee7521042155d62a01fd
	@${MKDIR} "${OBJECTDIR}/_ext/1227002292" 
	@${RM} ${OBJECTDIR}/_ext/1227002292/ringbuffer.o.d 
	@${RM} ${OBJECTDIR}/_ext/1227002292/ringbuffer.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -D_SUPPRESS_PLIB_WARNING -DSYSCLK=80000000L -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -MP -MMD -MF "${OBJECTDIR}/_ext/1227002292/ringbuffer.o.d" -o ${OBJECTDIR}/_ext/1227002292/ringbuffer.o ../../InternetRadio_PIC32_DP83848/code/vs1003/ringbuffer.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -G 2   
	
${OBJECTDIR}/main.o: main.c  .generated_files/flags/default/727867b8d81971b3c7e4f51745a72f7392e50ffd .generated_files/flags/default/3a7ff55a6cb9e565cc82ee7521042155d62a01fd
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/main.o.d 
	@${RM} ${OBJECTDIR}/main.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -D_SUPPRESS_PLIB_WARNING -DSYSCLK=80000000L -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -MP -MMD -MF "${OBJECTDIR}/main.o.d" -o ${OBJECTDIR}/main.o main.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -G 2   
	
${OBJECTDIR}/common.o: common.c  .generated_files/flags/default/9a559e7499880a32b67c13044729cd59be1d10aa .generated_files/flags/default/3a7ff55a6cb9e565cc82ee7521042155d62a01fd
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/common.o.d 
	@${RM} ${OBJECTDIR}/common.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -D_SUPPRESS_PLIB_WARNING -DSYSCLK=80000000L -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -MP -MMD -MF "${OBJECTDIR}/common.o.d" -o ${OBJECTDIR}/common.o common.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -G 2   
	
else
${OBJECTDIR}/config/config.o: config/config.c  .generated_files/flags/default/eaa4964f37f950389e915e826b991990b1907da7 .generated_files/flags/default/3a7ff55a6cb9e565cc82ee7521042155d62a01fd
	@${MKDIR} "${OBJECTDIR}/config" 
	@${RM} ${OBJECTDIR}/config/config.o.d 
	@${RM} ${OBJECTDIR}/config/config.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -D_SUPPRESS_PLIB_WARNING -DSYSCLK=80000000L -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -MP -MMD -MF "${OBJECTDIR}/config/config.o.d" -o ${OBJECTDIR}/config/config.o config/config.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -G 2   
	
${OBJECTDIR}/delay/delay.o: delay/delay.c  .generated_files/flags/default/f3cd5bb797d674b9a9b0c2729fcc734522fbfef8 .generated_files/flags/default/3a7ff55a6cb9e565cc82ee7521042155d62a01fd
	@${MKDIR} "${OBJECTDIR}/delay" 
	@${RM} ${OBJECTDIR}/delay/delay.o.d 
	@${RM} ${OBJECTDIR}/delay/delay.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -D_SUPPRESS_PLIB_WARNING -DSYSCLK=80000000L -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -MP -MMD -MF "${OBJECTDIR}/delay/delay.o.d" -o ${OBJECTDIR}/delay/delay.o delay/delay.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -G 2   
	
${OBJECTDIR}/fatfs/ff.o: fatfs/ff.c  .generated_files/flags/default/de9311a9309c7588a595cbbe86b404207fe3a427 .generated_files/flags/default/3a7ff55a6cb9e565cc82ee7521042155d62a01fd
	@${MKDIR} "${OBJECTDIR}/fatfs" 
	@${RM} ${OBJECTDIR}/fatfs/ff.o.d 
	@${RM} ${OBJECTDIR}/fatfs/ff.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -D_SUPPRESS_PLIB_WARNING -DSYSCLK=80000000L -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -MP -MMD -MF "${OBJECTDIR}/fatfs/ff.o.d" -o ${OBJECTDIR}/fatfs/ff.o fatfs/ff.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -G 2   
	
${OBJECTDIR}/fatfs/ffsystem.o: fatfs/ffsystem.c  .generated_files/flags/default/c0301d0a241ea2bf31b6c5955ff02b8df395a129 .generated_files/flags/default/3a7ff55a6cb9e565cc82ee7521042155d62a01fd
	@${MKDIR} "${OBJECTDIR}/fatfs" 
	@${RM} ${OBJECTDIR}/fatfs/ffsystem.o.d 
	@${RM} ${OBJECTDIR}/fatfs/ffsystem.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -D_SUPPRESS_PLIB_WARNING -DSYSCLK=80000000L -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -MP -MMD -MF "${OBJECTDIR}/fatfs/ffsystem.o.d" -o ${OBJECTDIR}/fatfs/ffsystem.o fatfs/ffsystem.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -G 2   
	
${OBJECTDIR}/fatfs/ffunicode.o: fatfs/ffunicode.c  .generated_files/flags/default/520bf8cba55518b5a836bb33c56528f4d05673d3 .generated_files/flags/default/3a7ff55a6cb9e565cc82ee7521042155d62a01fd
	@${MKDIR} "${OBJECTDIR}/fatfs" 
	@${RM} ${OBJECTDIR}/fatfs/ffunicode.o.d 
	@${RM} ${OBJECTDIR}/fatfs/ffunicode.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -D_SUPPRESS_PLIB_WARNING -DSYSCLK=80000000L -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -MP -MMD -MF "${OBJECTDIR}/fatfs/ffunicode.o.d" -o ${OBJECTDIR}/fatfs/ffunicode.o fatfs/ffunicode.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -G 2   
	
${OBJECTDIR}/fatfs/SPIFlash.o: fatfs/SPIFlash.c  .generated_files/flags/default/cd5c5180ebd1d648f525f9da1df995396cfa7877 .generated_files/flags/default/3a7ff55a6cb9e565cc82ee7521042155d62a01fd
	@${MKDIR} "${OBJECTDIR}/fatfs" 
	@${RM} ${OBJECTDIR}/fatfs/SPIFlash.o.d 
	@${RM} ${OBJECTDIR}/fatfs/SPIFlash.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -D_SUPPRESS_PLIB_WARNING -DSYSCLK=80000000L -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -MP -MMD -MF "${OBJECTDIR}/fatfs/SPIFlash.o.d" -o ${OBJECTDIR}/fatfs/SPIFlash.o fatfs/SPIFlash.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -G 2   
	
${OBJECTDIR}/fatfs/diskio.o: fatfs/diskio.c  .generated_files/flags/default/c9c8e97593268c0fa4346390e7a5865b007867d8 .generated_files/flags/default/3a7ff55a6cb9e565cc82ee7521042155d62a01fd
	@${MKDIR} "${OBJECTDIR}/fatfs" 
	@${RM} ${OBJECTDIR}/fatfs/diskio.o.d 
	@${RM} ${OBJECTDIR}/fatfs/diskio.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -D_SUPPRESS_PLIB_WARNING -DSYSCLK=80000000L -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -MP -MMD -MF "${OBJECTDIR}/fatfs/diskio.o.d" -o ${OBJECTDIR}/fatfs/diskio.o fatfs/diskio.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -G 2   
	
${OBJECTDIR}/fatfs/sd.o: fatfs/sd.c  .generated_files/flags/default/d8b87439be73b51e0a0f0429e0c7adcfe96f7664 .generated_files/flags/default/3a7ff55a6cb9e565cc82ee7521042155d62a01fd
	@${MKDIR} "${OBJECTDIR}/fatfs" 
	@${RM} ${OBJECTDIR}/fatfs/sd.o.d 
	@${RM} ${OBJECTDIR}/fatfs/sd.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -D_SUPPRESS_PLIB_WARNING -DSYSCLK=80000000L -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -MP -MMD -MF "${OBJECTDIR}/fatfs/sd.o.d" -o ${OBJECTDIR}/fatfs/sd.o fatfs/sd.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -G 2   
	
${OBJECTDIR}/net/Announce.o: net/Announce.c  .generated_files/flags/default/a0f65aaa3020e325d8fe956ce5cf6c042e4e61d .generated_files/flags/default/3a7ff55a6cb9e565cc82ee7521042155d62a01fd
	@${MKDIR} "${OBJECTDIR}/net" 
	@${RM} ${OBJECTDIR}/net/Announce.o.d 
	@${RM} ${OBJECTDIR}/net/Announce.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -D_SUPPRESS_PLIB_WARNING -DSYSCLK=80000000L -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -MP -MMD -MF "${OBJECTDIR}/net/Announce.o.d" -o ${OBJECTDIR}/net/Announce.o net/Announce.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -G 2   
	
${OBJECTDIR}/net/ARCFOUR.o: net/ARCFOUR.c  .generated_files/flags/default/60ff6363ede4068e0b8b0149c4c1fa2743368354 .generated_files/flags/default/3a7ff55a6cb9e565cc82ee7521042155d62a01fd
	@${MKDIR} "${OBJECTDIR}/net" 
	@${RM} ${OBJECTDIR}/net/ARCFOUR.o.d 
	@${RM} ${OBJECTDIR}/net/ARCFOUR.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -D_SUPPRESS_PLIB_WARNING -DSYSCLK=80000000L -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -MP -MMD -MF "${OBJECTDIR}/net/ARCFOUR.o.d" -o ${OBJECTDIR}/net/ARCFOUR.o net/ARCFOUR.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -G 2   
	
${OBJECTDIR}/net/ARP.o: net/ARP.c  .generated_files/flags/default/f21469ab2f299ba5eb2af25c8e8b4b67ab52b3b3 .generated_files/flags/default/3a7ff55a6cb9e565cc82ee7521042155d62a01fd
	@${MKDIR} "${OBJECTDIR}/net" 
	@${RM} ${OBJECTDIR}/net/ARP.o.d 
	@${RM} ${OBJECTDIR}/net/ARP.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -D_SUPPRESS_PLIB_WARNING -DSYSCLK=80000000L -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -MP -MMD -MF "${OBJECTDIR}/net/ARP.o.d" -o ${OBJECTDIR}/net/ARP.o net/ARP.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -G 2   
	
${OBJECTDIR}/net/AutoIP.o: net/AutoIP.c  .generated_files/flags/default/f11cc147128f57a87462536d2a4d2c58ec8da1bc .generated_files/flags/default/3a7ff55a6cb9e565cc82ee7521042155d62a01fd
	@${MKDIR} "${OBJECTDIR}/net" 
	@${RM} ${OBJECTDIR}/net/AutoIP.o.d 
	@${RM} ${OBJECTDIR}/net/AutoIP.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -D_SUPPRESS_PLIB_WARNING -DSYSCLK=80000000L -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -MP -MMD -MF "${OBJECTDIR}/net/AutoIP.o.d" -o ${OBJECTDIR}/net/AutoIP.o net/AutoIP.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -G 2   
	
${OBJECTDIR}/net/BerkeleyAPI.o: net/BerkeleyAPI.c  .generated_files/flags/default/c5ec2e8ca60c593122c95a280fdfa600d939137 .generated_files/flags/default/3a7ff55a6cb9e565cc82ee7521042155d62a01fd
	@${MKDIR} "${OBJECTDIR}/net" 
	@${RM} ${OBJECTDIR}/net/BerkeleyAPI.o.d 
	@${RM} ${OBJECTDIR}/net/BerkeleyAPI.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -D_SUPPRESS_PLIB_WARNING -DSYSCLK=80000000L -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -MP -MMD -MF "${OBJECTDIR}/net/BerkeleyAPI.o.d" -o ${OBJECTDIR}/net/BerkeleyAPI.o net/BerkeleyAPI.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -G 2   
	
${OBJECTDIR}/net/BigInt.o: net/BigInt.c  .generated_files/flags/default/106e84d8a74304a80706ee5e7c5f6e22aea51f48 .generated_files/flags/default/3a7ff55a6cb9e565cc82ee7521042155d62a01fd
	@${MKDIR} "${OBJECTDIR}/net" 
	@${RM} ${OBJECTDIR}/net/BigInt.o.d 
	@${RM} ${OBJECTDIR}/net/BigInt.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -D_SUPPRESS_PLIB_WARNING -DSYSCLK=80000000L -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -MP -MMD -MF "${OBJECTDIR}/net/BigInt.o.d" -o ${OBJECTDIR}/net/BigInt.o net/BigInt.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -G 2   
	
${OBJECTDIR}/CustomHTTPApp.o: CustomHTTPApp.c  .generated_files/flags/default/8f293f0d88e5eee117e00f98c8a13fc1ec6fcfa2 .generated_files/flags/default/3a7ff55a6cb9e565cc82ee7521042155d62a01fd
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/CustomHTTPApp.o.d 
	@${RM} ${OBJECTDIR}/CustomHTTPApp.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -D_SUPPRESS_PLIB_WARNING -DSYSCLK=80000000L -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -MP -MMD -MF "${OBJECTDIR}/CustomHTTPApp.o.d" -o ${OBJECTDIR}/CustomHTTPApp.o CustomHTTPApp.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -G 2   
	
${OBJECTDIR}/net/DHCP.o: net/DHCP.c  .generated_files/flags/default/a7cb0a1ea5abb3e8a69b240faa9822dcf2417cb8 .generated_files/flags/default/3a7ff55a6cb9e565cc82ee7521042155d62a01fd
	@${MKDIR} "${OBJECTDIR}/net" 
	@${RM} ${OBJECTDIR}/net/DHCP.o.d 
	@${RM} ${OBJECTDIR}/net/DHCP.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -D_SUPPRESS_PLIB_WARNING -DSYSCLK=80000000L -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -MP -MMD -MF "${OBJECTDIR}/net/DHCP.o.d" -o ${OBJECTDIR}/net/DHCP.o net/DHCP.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -G 2   
	
${OBJECTDIR}/net/DNS.o: net/DNS.c  .generated_files/flags/default/61b7476e3b00fbffd6ba4beda2a4fc116b7f654e .generated_files/flags/default/3a7ff55a6cb9e565cc82ee7521042155d62a01fd
	@${MKDIR} "${OBJECTDIR}/net" 
	@${RM} ${OBJECTDIR}/net/DNS.o.d 
	@${RM} ${OBJECTDIR}/net/DNS.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -D_SUPPRESS_PLIB_WARNING -DSYSCLK=80000000L -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -MP -MMD -MF "${OBJECTDIR}/net/DNS.o.d" -o ${OBJECTDIR}/net/DNS.o net/DNS.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -G 2   
	
${OBJECTDIR}/net/ENC28J60.o: net/ENC28J60.c  .generated_files/flags/default/1657277acafd2e914654fc074b3c77a29bd116a7 .generated_files/flags/default/3a7ff55a6cb9e565cc82ee7521042155d62a01fd
	@${MKDIR} "${OBJECTDIR}/net" 
	@${RM} ${OBJECTDIR}/net/ENC28J60.o.d 
	@${RM} ${OBJECTDIR}/net/ENC28J60.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -D_SUPPRESS_PLIB_WARNING -DSYSCLK=80000000L -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -MP -MMD -MF "${OBJECTDIR}/net/ENC28J60.o.d" -o ${OBJECTDIR}/net/ENC28J60.o net/ENC28J60.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -G 2   
	
${OBJECTDIR}/net/FTP.o: net/FTP.c  .generated_files/flags/default/62d46829d2ecfa2e4b7553930bfe6f4262661b13 .generated_files/flags/default/3a7ff55a6cb9e565cc82ee7521042155d62a01fd
	@${MKDIR} "${OBJECTDIR}/net" 
	@${RM} ${OBJECTDIR}/net/FTP.o.d 
	@${RM} ${OBJECTDIR}/net/FTP.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -D_SUPPRESS_PLIB_WARNING -DSYSCLK=80000000L -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -MP -MMD -MF "${OBJECTDIR}/net/FTP.o.d" -o ${OBJECTDIR}/net/FTP.o net/FTP.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -G 2   
	
${OBJECTDIR}/net/GenericTCPServer.o: net/GenericTCPServer.c  .generated_files/flags/default/f7a8dc6a52bc52c99f7a02b1fba3f937591564c3 .generated_files/flags/default/3a7ff55a6cb9e565cc82ee7521042155d62a01fd
	@${MKDIR} "${OBJECTDIR}/net" 
	@${RM} ${OBJECTDIR}/net/GenericTCPServer.o.d 
	@${RM} ${OBJECTDIR}/net/GenericTCPServer.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -D_SUPPRESS_PLIB_WARNING -DSYSCLK=80000000L -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -MP -MMD -MF "${OBJECTDIR}/net/GenericTCPServer.o.d" -o ${OBJECTDIR}/net/GenericTCPServer.o net/GenericTCPServer.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -G 2   
	
${OBJECTDIR}/net/Hashes.o: net/Hashes.c  .generated_files/flags/default/d45afe08301b037ffbfbb2ae3459f49f30586fe1 .generated_files/flags/default/3a7ff55a6cb9e565cc82ee7521042155d62a01fd
	@${MKDIR} "${OBJECTDIR}/net" 
	@${RM} ${OBJECTDIR}/net/Hashes.o.d 
	@${RM} ${OBJECTDIR}/net/Hashes.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -D_SUPPRESS_PLIB_WARNING -DSYSCLK=80000000L -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -MP -MMD -MF "${OBJECTDIR}/net/Hashes.o.d" -o ${OBJECTDIR}/net/Hashes.o net/Hashes.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -G 2   
	
${OBJECTDIR}/net/Helpers.o: net/Helpers.c  .generated_files/flags/default/bb5d805afd03258cef1fbd73797d67b271b8cd6e .generated_files/flags/default/3a7ff55a6cb9e565cc82ee7521042155d62a01fd
	@${MKDIR} "${OBJECTDIR}/net" 
	@${RM} ${OBJECTDIR}/net/Helpers.o.d 
	@${RM} ${OBJECTDIR}/net/Helpers.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -D_SUPPRESS_PLIB_WARNING -DSYSCLK=80000000L -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -MP -MMD -MF "${OBJECTDIR}/net/Helpers.o.d" -o ${OBJECTDIR}/net/Helpers.o net/Helpers.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -G 2   
	
${OBJECTDIR}/net/HTTP2.o: net/HTTP2.c  .generated_files/flags/default/c94ece4dfa565ef9cf8646de4a0775621135f921 .generated_files/flags/default/3a7ff55a6cb9e565cc82ee7521042155d62a01fd
	@${MKDIR} "${OBJECTDIR}/net" 
	@${RM} ${OBJECTDIR}/net/HTTP2.o.d 
	@${RM} ${OBJECTDIR}/net/HTTP2.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -D_SUPPRESS_PLIB_WARNING -DSYSCLK=80000000L -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -MP -MMD -MF "${OBJECTDIR}/net/HTTP2.o.d" -o ${OBJECTDIR}/net/HTTP2.o net/HTTP2.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -G 2   
	
${OBJECTDIR}/net/ICMP.o: net/ICMP.c  .generated_files/flags/default/1685d10deda47df7bc4a484a8c1e58a260bf106c .generated_files/flags/default/3a7ff55a6cb9e565cc82ee7521042155d62a01fd
	@${MKDIR} "${OBJECTDIR}/net" 
	@${RM} ${OBJECTDIR}/net/ICMP.o.d 
	@${RM} ${OBJECTDIR}/net/ICMP.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -D_SUPPRESS_PLIB_WARNING -DSYSCLK=80000000L -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -MP -MMD -MF "${OBJECTDIR}/net/ICMP.o.d" -o ${OBJECTDIR}/net/ICMP.o net/ICMP.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -G 2   
	
${OBJECTDIR}/net/IP.o: net/IP.c  .generated_files/flags/default/5202ccdead6fa1f16d6bc1e5bf0540e3ab5f51de .generated_files/flags/default/3a7ff55a6cb9e565cc82ee7521042155d62a01fd
	@${MKDIR} "${OBJECTDIR}/net" 
	@${RM} ${OBJECTDIR}/net/IP.o.d 
	@${RM} ${OBJECTDIR}/net/IP.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -D_SUPPRESS_PLIB_WARNING -DSYSCLK=80000000L -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -MP -MMD -MF "${OBJECTDIR}/net/IP.o.d" -o ${OBJECTDIR}/net/IP.o net/IP.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -G 2   
	
${OBJECTDIR}/net/MPFS2.o: net/MPFS2.c  .generated_files/flags/default/dbcededdbf14795001e28797288537eed48d780f .generated_files/flags/default/3a7ff55a6cb9e565cc82ee7521042155d62a01fd
	@${MKDIR} "${OBJECTDIR}/net" 
	@${RM} ${OBJECTDIR}/net/MPFS2.o.d 
	@${RM} ${OBJECTDIR}/net/MPFS2.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -D_SUPPRESS_PLIB_WARNING -DSYSCLK=80000000L -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -MP -MMD -MF "${OBJECTDIR}/net/MPFS2.o.d" -o ${OBJECTDIR}/net/MPFS2.o net/MPFS2.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -G 2   
	
${OBJECTDIR}/MPFSImg2.o: MPFSImg2.c  .generated_files/flags/default/29c36bf7ac1ae57afc23a1a67f0df8977aefbb7a .generated_files/flags/default/3a7ff55a6cb9e565cc82ee7521042155d62a01fd
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/MPFSImg2.o.d 
	@${RM} ${OBJECTDIR}/MPFSImg2.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -D_SUPPRESS_PLIB_WARNING -DSYSCLK=80000000L -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -MP -MMD -MF "${OBJECTDIR}/MPFSImg2.o.d" -o ${OBJECTDIR}/MPFSImg2.o MPFSImg2.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -G 2   
	
${OBJECTDIR}/net/NBNS.o: net/NBNS.c  .generated_files/flags/default/9128e4aacaa626643d86e4669580450847efed31 .generated_files/flags/default/3a7ff55a6cb9e565cc82ee7521042155d62a01fd
	@${MKDIR} "${OBJECTDIR}/net" 
	@${RM} ${OBJECTDIR}/net/NBNS.o.d 
	@${RM} ${OBJECTDIR}/net/NBNS.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -D_SUPPRESS_PLIB_WARNING -DSYSCLK=80000000L -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -MP -MMD -MF "${OBJECTDIR}/net/NBNS.o.d" -o ${OBJECTDIR}/net/NBNS.o net/NBNS.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -G 2   
	
${OBJECTDIR}/net/Random.o: net/Random.c  .generated_files/flags/default/6122dd0dd7d47d93a7cb573732bb0b9ac44ffb9b .generated_files/flags/default/3a7ff55a6cb9e565cc82ee7521042155d62a01fd
	@${MKDIR} "${OBJECTDIR}/net" 
	@${RM} ${OBJECTDIR}/net/Random.o.d 
	@${RM} ${OBJECTDIR}/net/Random.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -D_SUPPRESS_PLIB_WARNING -DSYSCLK=80000000L -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -MP -MMD -MF "${OBJECTDIR}/net/Random.o.d" -o ${OBJECTDIR}/net/Random.o net/Random.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -G 2   
	
${OBJECTDIR}/net/Reboot.o: net/Reboot.c  .generated_files/flags/default/eae7bd7c022309863fd9fb56f5d88ce490d7b096 .generated_files/flags/default/3a7ff55a6cb9e565cc82ee7521042155d62a01fd
	@${MKDIR} "${OBJECTDIR}/net" 
	@${RM} ${OBJECTDIR}/net/Reboot.o.d 
	@${RM} ${OBJECTDIR}/net/Reboot.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -D_SUPPRESS_PLIB_WARNING -DSYSCLK=80000000L -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -MP -MMD -MF "${OBJECTDIR}/net/Reboot.o.d" -o ${OBJECTDIR}/net/Reboot.o net/Reboot.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -G 2   
	
${OBJECTDIR}/net/RSA.o: net/RSA.c  .generated_files/flags/default/8119835cfbf3974b8f02c16e1259b8eccd91ec4b .generated_files/flags/default/3a7ff55a6cb9e565cc82ee7521042155d62a01fd
	@${MKDIR} "${OBJECTDIR}/net" 
	@${RM} ${OBJECTDIR}/net/RSA.o.d 
	@${RM} ${OBJECTDIR}/net/RSA.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -D_SUPPRESS_PLIB_WARNING -DSYSCLK=80000000L -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -MP -MMD -MF "${OBJECTDIR}/net/RSA.o.d" -o ${OBJECTDIR}/net/RSA.o net/RSA.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -G 2   
	
${OBJECTDIR}/net/SMTP.o: net/SMTP.c  .generated_files/flags/default/758febca904e21ae7e77a9871673221547f4dc2c .generated_files/flags/default/3a7ff55a6cb9e565cc82ee7521042155d62a01fd
	@${MKDIR} "${OBJECTDIR}/net" 
	@${RM} ${OBJECTDIR}/net/SMTP.o.d 
	@${RM} ${OBJECTDIR}/net/SMTP.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -D_SUPPRESS_PLIB_WARNING -DSYSCLK=80000000L -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -MP -MMD -MF "${OBJECTDIR}/net/SMTP.o.d" -o ${OBJECTDIR}/net/SMTP.o net/SMTP.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -G 2   
	
${OBJECTDIR}/net/SNTP.o: net/SNTP.c  .generated_files/flags/default/3beaa92aba8dc90fb1b5a453dc96b9f2c8d327dc .generated_files/flags/default/3a7ff55a6cb9e565cc82ee7521042155d62a01fd
	@${MKDIR} "${OBJECTDIR}/net" 
	@${RM} ${OBJECTDIR}/net/SNTP.o.d 
	@${RM} ${OBJECTDIR}/net/SNTP.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -D_SUPPRESS_PLIB_WARNING -DSYSCLK=80000000L -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -MP -MMD -MF "${OBJECTDIR}/net/SNTP.o.d" -o ${OBJECTDIR}/net/SNTP.o net/SNTP.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -G 2   
	
${OBJECTDIR}/net/SSL.o: net/SSL.c  .generated_files/flags/default/ec8f17c29f9a45822b5f57cc652e40669259eaf0 .generated_files/flags/default/3a7ff55a6cb9e565cc82ee7521042155d62a01fd
	@${MKDIR} "${OBJECTDIR}/net" 
	@${RM} ${OBJECTDIR}/net/SSL.o.d 
	@${RM} ${OBJECTDIR}/net/SSL.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -D_SUPPRESS_PLIB_WARNING -DSYSCLK=80000000L -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -MP -MMD -MF "${OBJECTDIR}/net/SSL.o.d" -o ${OBJECTDIR}/net/SSL.o net/SSL.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -G 2   
	
${OBJECTDIR}/net/StackTsk.o: net/StackTsk.c  .generated_files/flags/default/807e2e6168cf79fbd25ff5682c2b93247c34d262 .generated_files/flags/default/3a7ff55a6cb9e565cc82ee7521042155d62a01fd
	@${MKDIR} "${OBJECTDIR}/net" 
	@${RM} ${OBJECTDIR}/net/StackTsk.o.d 
	@${RM} ${OBJECTDIR}/net/StackTsk.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -D_SUPPRESS_PLIB_WARNING -DSYSCLK=80000000L -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -MP -MMD -MF "${OBJECTDIR}/net/StackTsk.o.d" -o ${OBJECTDIR}/net/StackTsk.o net/StackTsk.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -G 2   
	
${OBJECTDIR}/net/TCP.o: net/TCP.c  .generated_files/flags/default/4d2f7e5d27a4e5a320725ca46e6d97317f616e98 .generated_files/flags/default/3a7ff55a6cb9e565cc82ee7521042155d62a01fd
	@${MKDIR} "${OBJECTDIR}/net" 
	@${RM} ${OBJECTDIR}/net/TCP.o.d 
	@${RM} ${OBJECTDIR}/net/TCP.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -D_SUPPRESS_PLIB_WARNING -DSYSCLK=80000000L -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -MP -MMD -MF "${OBJECTDIR}/net/TCP.o.d" -o ${OBJECTDIR}/net/TCP.o net/TCP.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -G 2   
	
${OBJECTDIR}/net/Telnet.o: net/Telnet.c  .generated_files/flags/default/140f21929c83c433eb1f144c9b47c35d32e68b6a .generated_files/flags/default/3a7ff55a6cb9e565cc82ee7521042155d62a01fd
	@${MKDIR} "${OBJECTDIR}/net" 
	@${RM} ${OBJECTDIR}/net/Telnet.o.d 
	@${RM} ${OBJECTDIR}/net/Telnet.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -D_SUPPRESS_PLIB_WARNING -DSYSCLK=80000000L -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -MP -MMD -MF "${OBJECTDIR}/net/Telnet.o.d" -o ${OBJECTDIR}/net/Telnet.o net/Telnet.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -G 2   
	
${OBJECTDIR}/net/Tick.o: net/Tick.c  .generated_files/flags/default/f0b1ceea8f1aa1149bd6924324ec4bcf0bb4ca54 .generated_files/flags/default/3a7ff55a6cb9e565cc82ee7521042155d62a01fd
	@${MKDIR} "${OBJECTDIR}/net" 
	@${RM} ${OBJECTDIR}/net/Tick.o.d 
	@${RM} ${OBJECTDIR}/net/Tick.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -D_SUPPRESS_PLIB_WARNING -DSYSCLK=80000000L -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -MP -MMD -MF "${OBJECTDIR}/net/Tick.o.d" -o ${OBJECTDIR}/net/Tick.o net/Tick.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -G 2   
	
${OBJECTDIR}/net/UDP.o: net/UDP.c  .generated_files/flags/default/362fb2265d8bf2511b67c2d19829115f7ded4ee9 .generated_files/flags/default/3a7ff55a6cb9e565cc82ee7521042155d62a01fd
	@${MKDIR} "${OBJECTDIR}/net" 
	@${RM} ${OBJECTDIR}/net/UDP.o.d 
	@${RM} ${OBJECTDIR}/net/UDP.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -D_SUPPRESS_PLIB_WARNING -DSYSCLK=80000000L -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -MP -MMD -MF "${OBJECTDIR}/net/UDP.o.d" -o ${OBJECTDIR}/net/UDP.o net/UDP.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -G 2   
	
${OBJECTDIR}/net/ZeroconfHelper.o: net/ZeroconfHelper.c  .generated_files/flags/default/eb065a0a44d00108e9565838d552fb33a5bb7099 .generated_files/flags/default/3a7ff55a6cb9e565cc82ee7521042155d62a01fd
	@${MKDIR} "${OBJECTDIR}/net" 
	@${RM} ${OBJECTDIR}/net/ZeroconfHelper.o.d 
	@${RM} ${OBJECTDIR}/net/ZeroconfHelper.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -D_SUPPRESS_PLIB_WARNING -DSYSCLK=80000000L -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -MP -MMD -MF "${OBJECTDIR}/net/ZeroconfHelper.o.d" -o ${OBJECTDIR}/net/ZeroconfHelper.o net/ZeroconfHelper.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -G 2   
	
${OBJECTDIR}/net/ZeroconfLinkLocal.o: net/ZeroconfLinkLocal.c  .generated_files/flags/default/178061620734bcca5c1a623e6c40a95a1e176ff5 .generated_files/flags/default/3a7ff55a6cb9e565cc82ee7521042155d62a01fd
	@${MKDIR} "${OBJECTDIR}/net" 
	@${RM} ${OBJECTDIR}/net/ZeroconfLinkLocal.o.d 
	@${RM} ${OBJECTDIR}/net/ZeroconfLinkLocal.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -D_SUPPRESS_PLIB_WARNING -DSYSCLK=80000000L -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -MP -MMD -MF "${OBJECTDIR}/net/ZeroconfLinkLocal.o.d" -o ${OBJECTDIR}/net/ZeroconfLinkLocal.o net/ZeroconfLinkLocal.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -G 2   
	
${OBJECTDIR}/net/ZeroconfMulticastDNS.o: net/ZeroconfMulticastDNS.c  .generated_files/flags/default/8010de8e7dabd5f463566e6a8c6acd65cec7600f .generated_files/flags/default/3a7ff55a6cb9e565cc82ee7521042155d62a01fd
	@${MKDIR} "${OBJECTDIR}/net" 
	@${RM} ${OBJECTDIR}/net/ZeroconfMulticastDNS.o.d 
	@${RM} ${OBJECTDIR}/net/ZeroconfMulticastDNS.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -D_SUPPRESS_PLIB_WARNING -DSYSCLK=80000000L -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -MP -MMD -MF "${OBJECTDIR}/net/ZeroconfMulticastDNS.o.d" -o ${OBJECTDIR}/net/ZeroconfMulticastDNS.o net/ZeroconfMulticastDNS.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -G 2   
	
${OBJECTDIR}/nvram/nvram.o: nvram/nvram.c  .generated_files/flags/default/8c28c1bf23bc4af93637df5a2256ff5ccae9bcbc .generated_files/flags/default/3a7ff55a6cb9e565cc82ee7521042155d62a01fd
	@${MKDIR} "${OBJECTDIR}/nvram" 
	@${RM} ${OBJECTDIR}/nvram/nvram.o.d 
	@${RM} ${OBJECTDIR}/nvram/nvram.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -D_SUPPRESS_PLIB_WARNING -DSYSCLK=80000000L -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -MP -MMD -MF "${OBJECTDIR}/nvram/nvram.o.d" -o ${OBJECTDIR}/nvram/nvram.o nvram/nvram.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -G 2   
	
${OBJECTDIR}/time/time.o: time/time.c  .generated_files/flags/default/1f064c40b50d41ebcac2469b34f1e674860ba1f2 .generated_files/flags/default/3a7ff55a6cb9e565cc82ee7521042155d62a01fd
	@${MKDIR} "${OBJECTDIR}/time" 
	@${RM} ${OBJECTDIR}/time/time.o.d 
	@${RM} ${OBJECTDIR}/time/time.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -D_SUPPRESS_PLIB_WARNING -DSYSCLK=80000000L -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -MP -MMD -MF "${OBJECTDIR}/time/time.o.d" -o ${OBJECTDIR}/time/time.o time/time.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -G 2   
	
${OBJECTDIR}/uart/uart.o: uart/uart.c  .generated_files/flags/default/95423c92b9ac2b6b26af6148d11ff68f43c5e4a9 .generated_files/flags/default/3a7ff55a6cb9e565cc82ee7521042155d62a01fd
	@${MKDIR} "${OBJECTDIR}/uart" 
	@${RM} ${OBJECTDIR}/uart/uart.o.d 
	@${RM} ${OBJECTDIR}/uart/uart.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -D_SUPPRESS_PLIB_WARNING -DSYSCLK=80000000L -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -MP -MMD -MF "${OBJECTDIR}/uart/uart.o.d" -o ${OBJECTDIR}/uart/uart.o uart/uart.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -G 2   
	
${OBJECTDIR}/usb/event.o: usb/event.c  .generated_files/flags/default/e7c36cdb88b99fb8c4a3491fa2c626c41307f7b3 .generated_files/flags/default/3a7ff55a6cb9e565cc82ee7521042155d62a01fd
	@${MKDIR} "${OBJECTDIR}/usb" 
	@${RM} ${OBJECTDIR}/usb/event.o.d 
	@${RM} ${OBJECTDIR}/usb/event.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -D_SUPPRESS_PLIB_WARNING -DSYSCLK=80000000L -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -MP -MMD -MF "${OBJECTDIR}/usb/event.o.d" -o ${OBJECTDIR}/usb/event.o usb/event.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -G 2   
	
${OBJECTDIR}/usb/usb_config.o: usb/usb_config.c  .generated_files/flags/default/4908c0471982ea175c94abc823f763dfceb2e315 .generated_files/flags/default/3a7ff55a6cb9e565cc82ee7521042155d62a01fd
	@${MKDIR} "${OBJECTDIR}/usb" 
	@${RM} ${OBJECTDIR}/usb/usb_config.o.d 
	@${RM} ${OBJECTDIR}/usb/usb_config.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -D_SUPPRESS_PLIB_WARNING -DSYSCLK=80000000L -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -MP -MMD -MF "${OBJECTDIR}/usb/usb_config.o.d" -o ${OBJECTDIR}/usb/usb_config.o usb/usb_config.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -G 2   
	
${OBJECTDIR}/usb/usb_host.o: usb/usb_host.c  .generated_files/flags/default/75b08123c72220c538fdad079f15187ce2eb1856 .generated_files/flags/default/3a7ff55a6cb9e565cc82ee7521042155d62a01fd
	@${MKDIR} "${OBJECTDIR}/usb" 
	@${RM} ${OBJECTDIR}/usb/usb_host.o.d 
	@${RM} ${OBJECTDIR}/usb/usb_host.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -D_SUPPRESS_PLIB_WARNING -DSYSCLK=80000000L -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -MP -MMD -MF "${OBJECTDIR}/usb/usb_host.o.d" -o ${OBJECTDIR}/usb/usb_host.o usb/usb_host.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -G 2   
	
${OBJECTDIR}/usb/usb_host_msd.o: usb/usb_host_msd.c  .generated_files/flags/default/371e1ddee601113cdf7ccec10b5a7eed61a66058 .generated_files/flags/default/3a7ff55a6cb9e565cc82ee7521042155d62a01fd
	@${MKDIR} "${OBJECTDIR}/usb" 
	@${RM} ${OBJECTDIR}/usb/usb_host_msd.o.d 
	@${RM} ${OBJECTDIR}/usb/usb_host_msd.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -D_SUPPRESS_PLIB_WARNING -DSYSCLK=80000000L -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -MP -MMD -MF "${OBJECTDIR}/usb/usb_host_msd.o.d" -o ${OBJECTDIR}/usb/usb_host_msd.o usb/usb_host_msd.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -G 2   
	
${OBJECTDIR}/usb/usb_host_msd_scsi.o: usb/usb_host_msd_scsi.c  .generated_files/flags/default/d8457a53cbed5632595914ab246e59015aadb919 .generated_files/flags/default/3a7ff55a6cb9e565cc82ee7521042155d62a01fd
	@${MKDIR} "${OBJECTDIR}/usb" 
	@${RM} ${OBJECTDIR}/usb/usb_host_msd_scsi.o.d 
	@${RM} ${OBJECTDIR}/usb/usb_host_msd_scsi.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -D_SUPPRESS_PLIB_WARNING -DSYSCLK=80000000L -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -MP -MMD -MF "${OBJECTDIR}/usb/usb_host_msd_scsi.o.d" -o ${OBJECTDIR}/usb/usb_host_msd_scsi.o usb/usb_host_msd_scsi.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -G 2   
	
${OBJECTDIR}/vs1003/vs1003.o: vs1003/vs1003.c  .generated_files/flags/default/e16aa8c0ad84a5bac268acf98b4be293692f3900 .generated_files/flags/default/3a7ff55a6cb9e565cc82ee7521042155d62a01fd
	@${MKDIR} "${OBJECTDIR}/vs1003" 
	@${RM} ${OBJECTDIR}/vs1003/vs1003.o.d 
	@${RM} ${OBJECTDIR}/vs1003/vs1003.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -D_SUPPRESS_PLIB_WARNING -DSYSCLK=80000000L -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -MP -MMD -MF "${OBJECTDIR}/vs1003/vs1003.o.d" -o ${OBJECTDIR}/vs1003/vs1003.o vs1003/vs1003.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -G 2   
	
${OBJECTDIR}/_ext/1227002292/ringbuffer.o: ../../InternetRadio_PIC32_DP83848/code/vs1003/ringbuffer.c  .generated_files/flags/default/a98c1f7fda730a7a2c4f65ab293dec34f4fd9008 .generated_files/flags/default/3a7ff55a6cb9e565cc82ee7521042155d62a01fd
	@${MKDIR} "${OBJECTDIR}/_ext/1227002292" 
	@${RM} ${OBJECTDIR}/_ext/1227002292/ringbuffer.o.d 
	@${RM} ${OBJECTDIR}/_ext/1227002292/ringbuffer.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -D_SUPPRESS_PLIB_WARNING -DSYSCLK=80000000L -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -MP -MMD -MF "${OBJECTDIR}/_ext/1227002292/ringbuffer.o.d" -o ${OBJECTDIR}/_ext/1227002292/ringbuffer.o ../../InternetRadio_PIC32_DP83848/code/vs1003/ringbuffer.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -G 2   
	
${OBJECTDIR}/main.o: main.c  .generated_files/flags/default/21023a4d75e14ca7da410b32f8dc2a5902ddcb5a .generated_files/flags/default/3a7ff55a6cb9e565cc82ee7521042155d62a01fd
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/main.o.d 
	@${RM} ${OBJECTDIR}/main.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -D_SUPPRESS_PLIB_WARNING -DSYSCLK=80000000L -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -MP -MMD -MF "${OBJECTDIR}/main.o.d" -o ${OBJECTDIR}/main.o main.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -G 2   
	
${OBJECTDIR}/common.o: common.c  .generated_files/flags/default/9129799af4b2837bc7c5fd1da2772d32efcc869c .generated_files/flags/default/3a7ff55a6cb9e565cc82ee7521042155d62a01fd
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/common.o.d 
	@${RM} ${OBJECTDIR}/common.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -D_SUPPRESS_PLIB_WARNING -DSYSCLK=80000000L -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -MP -MMD -MF "${OBJECTDIR}/common.o.d" -o ${OBJECTDIR}/common.o common.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -G 2   
	
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
	${MP_CC} $(MP_EXTRA_LD_PRE) -g -mdebugger -D__MPLAB_DEBUGGER_PK3=1 -mprocessor=$(MP_PROCESSOR_OPTION)  -o ${DISTDIR}/code.${IMAGE_TYPE}.${OUTPUT_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}          -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)   -mreserve=data@0x0:0x1FC -mreserve=boot@0x1FC02000:0x1FC02FEF -mreserve=boot@0x1FC02000:0x1FC024FF  -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,-D=__DEBUG_D,--defsym=__MPLAB_DEBUGGER_PK3=1,--defsym=_min_heap_size=2048,--no-code-in-dinit,--no-dinit-in-serial-mem,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--memorysummary,${DISTDIR}/memoryfile.xml 
	
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
