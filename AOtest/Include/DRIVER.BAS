Attribute VB_Name = "Module1"
'***************************************************************************
' Module Name: DRIVER.BAS
' Purpose: the declaration of functions, data structures, status codes,
'          constants, and messages
' Version: 3.01
' Date: 04/16/1998
' Copyright (c) 1996 Advantech Corp. Ltd.
' All rights reserved.
'****************************************************************************

'****************************************************************************
'    Constant Definition
'****************************************************************************
Global Const MaxDev = 255 ' max. # of devices
Global Const MaxDevNameLen = 49           ' original is 64; max lenght of device name
Global Const MaxGroup = 6
Global Const MaxPort = 3
Global Const MaxszErrMsgLen = 80
Global Const MAX_DEVICE_NAME_LEN = 64
Global Const MAX_DRIVER_NAME_LEN = 16
Global Const MAX_DAUGHTER_NUM = 16
Global Const MAX_DIO_PORT = 48
Global Const MAX_AO_RANGE = 16

Global Const REMOTE = 1
Global Const REMOTE1 = REMOTE + 1                     ' For PCL-818L JP7 = 5V
Global Const REMOTE2 = REMOTE1 + 1                    ' For PCL-818L JP7 =10V
Global Const NONPROG = 0
Global Const PROG = REMOTE
Global Const INTERNAL = 0
Global Const EXTERNAL = 1
Global Const SINGLEENDD = 0
Global Const DIFFERENTIAL = 1
Global Const BIPOLAR = 0
Global Const UNIPOLAR = 1
Global Const PORTA = 0
Global Const PORTB = 1
Global Const PORTC = 2
Global Const INPORT = 0
Global Const OUTPORT = 1

'***************************************************************************
'    Define board vendor ID
'***************************************************************************
Global Const AAC = &H0                            'Advantech
Global Const MB = &H1000                          'Keithley/MetraByte
Global Const BB = &H2000                          'Burr Brown
Global Const GRAYHILL = &H3000                    'Grayhill
Global Const KGS = &H4000

'****************************************************************************
'    Define DAS I/O CardType ID.
'****************************************************************************
Global Const NONE = &H0                           ' not available

'Advantech CardType ID
Global Const BD_DEMO = AAC Or &H0               ' demo board
Global Const BD_PCL711 = AAC Or &H1             ' PCL-711 board
Global Const BD_PCL812 = AAC Or &H2             ' PCL-812 board
Global Const BD_PCL812PG = AAC Or &H3           ' PCL-812PG board
Global Const BD_PCL718 = AAC Or &H4             ' PCL-718 board
Global Const BD_PCL818 = AAC Or &H5             ' PCL-818 board
Global Const BD_PCL814 = AAC Or &H6             ' PCL-814 board
Global Const BD_PCL720 = AAC Or &H7             ' PCL-722 board
Global Const BD_PCL722 = AAC Or &H8             ' PCL-720 board
Global Const BD_PCL724 = AAC Or &H9             ' PCL-724 board
Global Const BD_AD4011 = AAC Or &HA             ' ADAM 4011 Module
Global Const BD_AD4012 = AAC Or &HB             ' ADAM 4012 Module
Global Const BD_AD4013 = AAC Or &HC             ' ADAM 4013 Module
Global Const BD_AD4021 = AAC Or &HD             ' ADAM 4021 Module
Global Const BD_AD4050 = AAC Or &HE             ' ADAM 4050 Module
Global Const BD_AD4060 = AAC Or &HF             ' ADAM 4060 Module
Global Const BD_PCL711B = AAC Or &H10           ' PCL-711B
Global Const BD_PCL818H = AAC Or &H11           ' PCL-818H
Global Const BD_PCL814B = AAC Or &H12           ' PCL-814B
Global Const BD_PCL816 = AAC Or &H13            ' PCL-816
Global Const BD_814_DIO_1 = AAC Or &H14         ' PCL-816/814B 8255 DIO module
Global Const BD_814_DA_1 = AAC Or &H15          ' PCL-816/814B 12 bit D/A module
Global Const BD_816_DA_1 = AAC Or &H16          ' PCL-816/814B 16 bit D/A module
Global Const BD_PCL830 = AAC Or &H17            ' PCL-830 9513A Counter Card
Global Const BD_PCL726 = AAC Or &H18            ' PCL-726 D/A card
Global Const BD_PCL727 = AAC Or &H19            ' PCL-727 D/A card
Global Const BD_PCL728 = AAC Or &H1A            ' PCL-728 D/A card
Global Const BD_AD4052 = AAC Or &H1B            ' ADAM 4052 Module
Global Const BD_AD4014D = AAC Or &H1C           ' ADAM 4014D Module
Global Const BD_AD4017 = AAC Or &H1D            ' ADAM 4017 Module
Global Const BD_AD4080D = AAC Or &H1E           ' ADAM 4080D Module
Global Const BD_PCL721 = AAC Or &H1F            ' PCL-721 32-bit Digital in
Global Const BD_PCL723 = AAC Or &H20            ' PCL-723 24-bit Digital in
Global Const BD_PCL818L = AAC Or &H21           ' PCL-818L
Global Const BD_PCL818HG = AAC Or &H22          ' PCL-818HG
Global Const BD_PCL1800 = AAC Or &H23           ' PCL-1800
Global Const BD_PAD71A = AAC Or &H24            ' PCIA-71A
Global Const BD_PAD71B = AAC Or &H25            ' PCIA-71B
Global Const BD_PCR420 = AAC Or &H26            ' PCR-420
Global Const BD_PCL731 = AAC Or &H27            ' PCL-731 48-bit Digital I/O card
Global Const BD_PCL730 = AAC Or &H28            ' PCL-730 board
Global Const BD_PCL813 = AAC Or &H29            ' PCL-813 32-channel A/D card
Global Const BD_PCL813B = AAC Or &H2A           ' PCL-813B 32-channel A/D card
Global Const BD_PCL818HD = AAC Or &H2B          ' PCL-818HD
Global Const BD_PCL725 = AAC Or &H2C            ' PCL-725 digital I/O card
Global Const BD_PCL732 = AAC Or &H2D            ' PCL-732 high speed DIO card
Global Const BD_AD4018 = AAC Or &H2E            ' ADAM 4018 Module
Global Const BD_814_TC_1 = AAC Or &H2F          ' PCL-816/814B 16 bit TC module
Global Const BD_PAD71C = AAC Or &H30            ' PCIA-71C
Global Const BD_AD4024 = AAC Or &H31            ' ADAM 4024
Global Const BD_AD5017 = AAC Or &H32            ' ADAM 5017
Global Const BD_AD5018 = AAC Or &H33            ' ADAM 5018
Global Const BD_AD5024 = AAC Or &H34            ' ADAM 5024
Global Const BD_AD5051 = AAC Or &H35            ' ADAM 5051
Global Const BD_AD5060 = AAC Or &H36            ' ADAM 5060
Global Const BD_PCM3718 = AAC Or &H37           ' PCM-3718
Global Const BD_PCM3724 = AAC Or &H38           ' PCM-3724
Global Const BD_MIC2718 = AAC Or &H39           ' MIC-2718
Global Const BD_MIC2728 = AAC Or &H3A           ' MIC-2728
Global Const BD_MIC2730 = AAC Or &H3B           ' MIC-2730
Global Const BD_MIC2732 = AAC Or &H3C           ' MIC-2732
Global Const BD_MIC2750 = AAC Or &H3D           ' MIC-2750
Global Const BD_MIC2752 = AAC Or &H3E           ' MIC-2752
Global Const BD_PCL733 = AAC Or &H3F            ' PCL-733
Global Const BD_PCL734 = AAC Or &H40            ' PCL-734
Global Const BD_PCL735 = AAC Or &H41            ' PCL-735
Global Const BD_AD4018M = AAC Or &H42           ' ADAM 4018M Module
Global Const BD_AD4080 = AAC Or &H43            ' ADAM 4080 Module
Global Const BD_PCL833 = AAC Or &H44            ' PCL-833
Global Const BD_PCA6157 = AAC Or &H45           ' PCA-6157
Global Const BD_PCA6149 = AAC Or &H46           ' PCA-6149
Global Const BD_PCA6147 = AAC Or &H47           ' PCA-6147
Global Const BD_PCA6137 = AAC Or &H48           ' PCA-6137
Global Const BD_PCA6145 = AAC Or &H49           ' PCA-6145
Global Const BD_PCA6144 = AAC Or &H4A           ' PCA-6144
Global Const BD_PCA6143 = AAC Or &H4B           ' PCA-6143
Global Const BD_PCA6134 = AAC Or &H4C           ' PCA-6134
Global Const BD_AD5056 = AAC Or &H4D            ' ADAM 5056
Global Const BD_DN5017 = AAC Or &H4E            ' ADAM 5017
Global Const BD_DN5018 = AAC Or &H4F            ' ADAM 5018
Global Const BD_DN5024 = AAC Or &H50            ' ADAM 5024
Global Const BD_DN5051 = AAC Or &H51            ' ADAM 5051
Global Const BD_DN5056 = AAC Or &H52            ' ADAM 5056
Global Const BD_DN5060 = AAC Or &H53            ' ADAM 5060
Global Const BD_PCL836 = AAC Or &H54            ' PCL-836
Global Const BD_PCL841 = AAC Or &H55            ' PCL-841
Global Const BD_DN5050 = AAC Or &H56            ' ADAM 5050
Global Const BD_DN5052 = AAC Or &H57            ' ADAM 5052
Global Const BD_AD5050 = AAC Or &H58            ' ADAM 5050 for RS-485
Global Const BD_AD5052 = AAC Or &H59            ' ADAM 5052 for RS-485
Global Const BD_PCM3730 = AAC Or &H5A           ' PCM-3730
Global Const BD_AD4011D = AAC Or &H5B           ' ADAM 4011D
Global Const BD_AD4016 = AAC Or &H5C            ' ADAM 4016
Global Const BD_AD4053 = AAC Or &H5D            ' ADAM 4053
Global Const BD_PCI1750 = AAC Or &H5E           ' PCI-1750
Global Const BD_PCI1751 = AAC Or &H5F           ' PCI-1751
Global Const BD_PCI1710 = AAC Or &H60           ' PCI-1710
Global Const BD_PCI1712 = AAC Or &H61           ' PCI-1712
Global Const BD_AD5068 = AAC Or &H62                            ' ADAM 5068
Global Const BD_AD5013 = AAC Or &H63                            ' ADAM 5013
Global Const BD_AD5017H = AAC Or &H64                           ' ADAM 5017H
Global Const BD_AD5080 = AAC Or &H65                            ' ADAM 5080
Global Const BD_MIC2760 = AAC Or &H66                   ' MIC-2760
Global Const BD_PCI1710HG = AAC Or &H67                 ' PCI-1710HG
Global Const BD_PCI1713 = AAC Or &H68                   ' PCI-1713
Global Const BD_PCI1753 = AAC Or &H69                   ' PCI-1753
Global Const BD_PCI1760 = AAC Or &H6A                   ' PCI-1760
Global Const BD_PCI1720 = AAC Or &H6B                   ' PCI-1720
Global Const BD_PCL752 = AAC Or &H6C                    ' PCL-752
Global Const BD_PCM3718H = AAC Or &H6D                  ' PCM-3718H
Global Const BD_PCM3718HG = AAC Or &H6E                 ' PCM-3718HG
Global Const BD_DN5068 = AAC Or &H6F                    ' ADAM 5068 for Device Net
Global Const BD_DN5013 = AAC Or &H70                    ' ADAM 5013 for Device Net
Global Const BD_DN5017H = AAC Or &H71                   ' ADAM 5017H for Device Net
Global Const BD_DN5080 = AAC Or &H72                    ' ADAM 5080(unavailable)  for Device Net
Global Const BD_PCI1711 = AAC Or &H73                   ' PCI-1711
'\\\\\\\\\\\\\\\\\\\\\\\\\\ V2.0b //////////////////////////////
Global Const BD_PCI1711L = AAC Or &H75                  ' PCI-1711
'////////////////////////// V2.0b //////////////////////////////
Global Const BD_PCI1716 = AAC Or &H74                   ' PCI-1716
Global Const BD_PCI1731 = AAC Or &H75                   ' PCI-1731
Global Const BD_AD5051D = AAC Or &H76                   ' ADAM 5051D
Global Const BD_AD5056D = AAC Or &H77                   ' ADAM 5056D
Global Const BD_DN5051D = AAC Or &H78                   ' ADAM 5051D for Device Net
Global Const BD_DN5056D = AAC Or &H79                   ' ADAM 5056D for Device Net
Global Const BD_SIMULATE = AAC Or &H7A                  ' Simulate IO
Global Const BD_PCI1754 = AAC Or &H7B                   ' PCI-1754
Global Const BD_PCI1752 = AAC Or &H7C                   ' PCI-1754
Global Const BD_PCI1756 = AAC Or &H7D                   ' PCI-1754
Global Const BD_PCL839 = AAC Or &H7E                    ' PCL-839
Global Const BD_PCM3725 = AAC Or &H7F                   ' PCM-3725
Global Const BD_PCI1762 = AAC Or &H80                   ' PCI-1762
Global Const BD_PCI1721 = AAC Or &H81                   ' PCI-1721
Global Const BD_PCI1761 = AAC Or &H82                   ' PCI-1761
Global Const BD_PCI1723 = AAC Or &H83                   ' PCI-1723
Global Const BD_AD4019 = AAC Or &H84                    ' ADAM 4019 Module
Global Const BD_AD5055 = AAC Or &H85                    ' ADAM 5055 Module
Global Const BD_AD4015 = AAC Or &H86                    ' ADAM 4015 Module
Global Const BD_PCI1730 = AAC Or &H87                   ' PCI-1730
Global Const BD_PCI1733 = AAC Or &H88                   ' PCI-1733
Global Const BD_PCI1734 = AAC Or &H89                   ' PCI-1734
Global Const BD_MIC2750A = AAC Or &H8A                  ' MIC-2750A
Global Const BD_MIC2718A = AAC Or &H8B                  ' MIC-2718A
Global Const BD_AD4017P = AAC Or &H8C                   ' ADAM 4017P Module
Global Const BD_AD4051 = AAC Or &H8D                    ' ADAM 4051 Module
Global Const BD_AD4055 = AAC Or &H8E                    ' ADAM 4055 Module
Global Const BD_AD4018P = AAC Or &H8F                   ' ADAM 4018P Module
Global Const BD_PCI1710L = AAC Or &H90                  ' PCI-1710L
Global Const BD_PCI1710HGL = AAC Or &H91                ' PCI-1710HGL
Global Const BD_AD4068 = AAC Or &H92                    ' ADAM 4068
Global Const BD_PCM3712 = AAC Or &H93                   ' PCM-3712
Global Const BD_PCM3723 = AAC Or &H94                   ' PCM-3723

'\\\\\\\\\\\\\\\\\\\ V2.0B /////////////////////
Global Const BD_PCI1780 = AAC Or &H95                    ' PCI-1780
Global Const BD_CPCI3756 = AAC Or &H96                   ' CPCI-3756
'//////////////////// V2.0B \\\\\\\\\\\\\\\\\\\\\
'\\\\\\\\\\\\\\\\\\\ V2.0C ////////////////////
Global Const BD_PCI1755 = AAC Or &H97                    ' PCI-1755
Global Const BD_PCI1714 = AAC Or &H98                    ' PCI-1714
'\\\\\\\\\\\\\\\\\\\ V2.0C ////////////////////

'\\\\\\\\\\\\\\\\\\\ V2.0C ////////////////////
Global Const BD_PCI1757 = AAC Or &H99                    ' PCI-1757
'\\\\\\\\\\\\\\\\\\\ V2.0C ////////////////////

'\\\\\\\\\\\\\\\\\\\ V2.1a /////////////////////
Global Const BD_MIC3716 = AAC Or &H9A                   ' MIC-3716
Global Const BD_MIC3761 = AAC Or &H9B                   ' MIC-3761
Global Const BD_MIC3753 = AAC Or &H9C                   ' MIC-3753
Global Const BD_MIC3780 = AAC Or &H9D                   ' MIC-3780
'///////////////////// V2.1a ////////////////////

Global Const BD_PCI1724 = AAC Or &H9E                   ' PCI-1724
Global Const BD_AD4015T = AAC Or &H9F                   ' ADAM 4015T Module
Global Const BD_UNO2052 = AAC Or &HA0                   ' UNO  2052 Module
Global Const BD_PCI1680 = AAC Or &HA1                   ' PCI-1680

'\\\\\\\\\\\\\\\\\\\ V2.2 /////////////////////
Global Const BD_PCL839P = AAC Or &HA2                   ' PCI-839+
Global Const BD_PCI1758UDIO = AAC Or &HA8               ' PCI-1758UDIO
Global Const BD_PCI1758UDI = AAC Or &HA3                ' PCI-1758UDI
Global Const BD_PCI1758UDO = AAC Or &HA4                ' PCI-1758UDO
Global Const BD_PCI1747 = AAC Or &HA5                   ' PCI-1747
Global Const BD_PCM3780 = AAC Or &HA6                   ' PCM-3780
Global Const BD_MIC3747 = AAC Or &HA7                   ' MIC-3747
Global Const BD_PCI1712L = AAC Or &HA9                  ' PCI-1712L
Global Const BD_AD4056S = AAC Or &HAA                   ' ADAM 4056S Module
Global Const BD_AD4056SO = AAC Or &HAB                  ' ADAM 4056SO Module
Global Const BD_PCI1763UP = AAC Or &HAC                  ' PCI-1763UP
Global Const BD_PCI1736UP = AAC Or &HAD                  ' PCI-1736UP
Global Const BD_PCI1714UL = AAC Or &HAE                 ' PCI-1714UL
Global Const BD_MIC3714 = AAC Or &HAF                   ' MIC-3714
Global Const BD_AD5069 = AAC Or &HB0                    ' ADAM 5069 Module
Global Const BD_PCM3718HO = AAC Or &HB1                 ' PCM-3718HO
Global Const BD_PCI1741U = AAC Or &HB3                  ' PCI-1741U
Global Const BD_MIC3723 = AAC Or &HB4                   ' MIC-3723
Global Const BD_PCI1718HDU = AAC Or &HB5                ' PCI-1718HDU
Global Const BD_MIC3758DIO = AAC Or &HB6                ' MIC-3758DIO
Global Const BD_PCI1727U = AAC Or &HB7                  ' PCI-1727U
Global Const BD_PCI1718HGU = AAC Or &HB8                ' PCI-1718HGU
'///////////////////// V2.2 ////////////////////

Global Const BD_PCI1715U = AAC Or &HB9                  ' PCI-1715U
Global Const BD_PCI1716L = AAC Or &HBA                  ' PCI-1716L
Global Const BD_PCI1735U = AAC Or &HBB                  ' PCI-1735U

Global Const BD_USB4711 = AAC Or &HBC                   ' USB-4711
Global Const BD_PCI1737U = AAC Or &HBD                  ' PCI-1737U
Global Const BD_PCI1739U = AAC Or &HBE                  ' PCI-1739U
Global Const BD_AD4069 = AAC Or &HBF                    ' ADAM 4069 Module
Global Const BD_PCI1742U = AAC Or &HC0                  ' PCI-1742U
Global Const BD_AD4117 = AAC Or &HC1                    ' ADAM 4117 Module
Global Const BD_AD4118 = AAC Or &HC2                    ' ADAM 4118 Module
Global Const BD_AD4150 = AAC Or &HC3                    ' ADAM 4150 Module
Global Const BD_AD4168 = AAC Or &HC4                    ' ADAM 4168 Module
Global Const BD_AD4022T = AAC Or &HC5                   ' ADAM 4022T Module
Global Const BD_USB4718 = AAC Or &HC6                   ' USB-4718
Global Const BD_MIC3755 = AAC Or &HC7                   ' MIC-3755
Global Const BD_USB4761 = AAC Or &HC8                   ' USB-4761
Global Const BD_AD4019P = AAC Or &HC9                   ' ADAM 4019 Plus Module
Global Const BD_AD5056S = AAC Or &HCA                   ' ADAM 5056S Module
Global Const BD_AD5056SO = AAC Or &HCB                  ' ADAM 5056SO Module
Global Const BD_PCI1784 = AAC Or &HCC                   ' PCI-1784
Global Const BD_USB4716 = AAC Or &HCD                   ' USB4716
Global Const BD_PCI1752U = AAC Or &HCE                  ' PCI-1752U
Global Const BD_PCI1752USO = AAC Or &HCF                ' PCI-1752USO
Global Const BD_USB4751 = AAC Or &HD0                                                                   ' USB4751
Global Const BD_USB4751L = AAC Or &HD1                                                          ' USB4751L
Global Const BD_USB4750 = AAC Or &HD2                                                           ' USB4750
Global Const BD_MIC3713 = AAC Or &HD3                   ' MIC-3713
Global Const BD_USB4813 = AAC Or &HD4                                                                   ' USB4813
Global Const BD_USB4823 = AAC Or &HD5                                                                   ' USB4823
Global Const BD_USB4878 = AAC Or &HD6                                                                   ' USB4878
Global Const BD_USB4879 = AAC Or &HD7                                                                   ' USB4879
Global Const BD_USB4711A = AAC Or &HD8                   'USB4711A
Global Const BD_PCM3753P = AAC Or &HD9                   'PCM3753P
Global Const BD_PCM3784 = AAC Or &HDA                    'PCM3784
Global Const BD_PCM3761I = AAC Or &HDB                   'PCM3761I
Global Const BD_MIC3751 = AAC Or &HDC                    'MIC3751
Global Const BD_PCM3730I = AAC Or &HDD                    'PCM3730I
Global Const BD_PCM3813I = AAC Or &HE0

Global Const BD_MICRODAC = GRAYHILL Or &H1 ' Grayhill MicroDAC Board ID
Global Const BD_GIA10 = KGS Or &H1              ' KGS GIA-10 module Board ID
Global Const BD_PCIE1744 = AAC Or &HE1           'PCIE-1744
Global Const BD_PCI1730U = AAC Or &HE2           'PCI-1730U
Global Const BD_PCI1760U = AAC Or &HE3                                  'PCI-1760U
Global Const BD_MIC3720 = AAC Or &HE4           'MIC-3720

Global Const BD_USB4913 = AAC Or &HE5           'USB-4913
Global Const BD_USB4916 = AAC Or &HE6           'USB-4916
Global Const BD_USB4919 = AAC Or &HE7           'USB-4919
Global Const BD_USB4923 = AAC Or &HE8           'USB-4923

Global Const BD_PCM3810I = AAC Or &HE9          'PCM-3810I
Global Const BD_USB4702 = AAC Or &HEA           'USB-4702
Global Const BD_USB4704 = AAC Or &HEB           'USB-4704
Global Const BD_PCM3810I_HG = AAC Or &HEC          'PCM-3810I_HG
Global Const BD_PCI1713U = AAC Or &HED          'PCI-1713U

'*****************************************************************************
'    Define Expansion Board ID.
'*****************************************************************************
Global Const AAC_EXP = AAC Or &H100                'Advantech expansion bits

'define Advantech expansion board ID.
Global Const BD_PCLD780 = &H0                       ' PCLD-780
Global Const BD_PCLD789 = AAC_EXP Or &H0            ' PCLD-789
Global Const BD_PCLD779 = AAC_EXP Or &H1            ' PCLD-779
Global Const BD_PCLD787 = AAC_EXP Or &H2            ' PCLD-787
Global Const BD_PCLD8115 = AAC_EXP Or &H3           ' PCLD-8115
Global Const BD_PCLD770 = AAC_EXP Or &H4            ' PCLD-770
Global Const BD_PCLD788 = AAC_EXP Or &H5            ' PCLD-788
Global Const BD_PCLD8710 = AAC_EXP Or &H6           ' PCLD-8710

'****************************************************************************
'    Define subsection identifier
'****************************************************************************
Global Const DAS_AISECTION = &H1                ' A/D subsection
Global Const DAS_AOSECTION = &H2                ' D/A sbusection
Global Const DAS_DISECTION = &H3                ' Digital input subsection
Global Const DAS_DOSECTION = &H4                ' Digital output sbusection
Global Const DAS_TEMPSECTION = &H5              ' thermocouple section
Global Const DAS_ECSECTION = &H6                ' Event count subsection
Global Const DAS_FMSECTION = &H7                ' frequency measurement section
Global Const DAS_POSECTION = &H8                ' pulse output section
Global Const DAS_ALSECTION = &H9                ' alarm section
Global Const MT_AISECTION = &HA                 ' monitoring A/D subsection
Global Const MT_DISECTION = &HB                 ' monitoring D/I subsection

'***************************************************************************
'    Define Transfer Mode
'***************************************************************************
Global Const POLLED_MODE = &H0                   ' software transfer
Global Const DMA_MODE = &H1                      ' DMA transfer
Global Const INTERRUPT_MODE = &H2                ' Interrupt transfer

'***************************************************************************
'    Define Acquisition Mode
'***************************************************************************
Global Const FREE_RUN = 0
Global Const PRE_TRIG = 1
Global Const POST_TRIG = 2
Global Const POSITION_TRIG = 3

'***************************************************************************
'    Define Comparator's Condition
'***************************************************************************
Global Const NOCONDITION = 0
Global Const LESS = 1
Global Const BETWEEN = 2
Global Const GREATER = 3
Global Const OUTSIDE = 4

'**************************************************************************
'    Define Status Code
'**************************************************************************
Global Const SUCCESS = 0
Global Const DrvErrorCode = 1
Global Const KeErrorCode = 100
Global Const DnetErrorCode = 200
Global Const USBErrorCode = 500
Global Const OPCErrorCode = 1000
Global Const MemoryAllocateFailed = (DrvErrorCode + 0)
Global Const ConfigDataLost = (DrvErrorCode + 1)
Global Const InvalidDeviceHandle = (DrvErrorCode + 2)
Global Const AIConversionFailed = (DrvErrorCode + 3)
Global Const AIScaleFailed = (DrvErrorCode + 4)
Global Const SectionNotSupported = (DrvErrorCode + 5)
Global Const InvalidChannel = (DrvErrorCode + 6)
Global Const InvalidGain = (DrvErrorCode + 7)
Global Const DataNotReady = (DrvErrorCode + 8)
Global Const InvalidInputParam = (DrvErrorCode + 9)
Global Const NoExpansionBoardConfig = (DrvErrorCode + 10)
Global Const InvalidAnalogOutValue = (DrvErrorCode + 11)
Global Const ConfigIoPortFailed = (DrvErrorCode + 12)
Global Const CommOpenFailed = (DrvErrorCode + 13)
Global Const CommTransmitFailed = (DrvErrorCode + 14)
Global Const CommReadFailed = (DrvErrorCode + 15)
Global Const CommReceiveFailed = (DrvErrorCode + 16)
Global Const CommConfigFailed = (DrvErrorCode + 17)
Global Const CommChecksumError = (DrvErrorCode + 18)
Global Const InitError = (DrvErrorCode + 19)
Global Const DMABufAllocFailed = (DrvErrorCode + 20)
Global Const IllegalSpeed = (DrvErrorCode + 21)
Global Const ChanConflict = (DrvErrorCode + 22)
Global Const BoardIDNotSupported = (DrvErrorCode + 23)
Global Const FreqMeasurementFailed = (DrvErrorCode + 24)
Global Const CreateFileFailed = (DrvErrorCode + 25)
Global Const FunctionNotSupported = (DrvErrorCode + 26)
Global Const LoadLibraryFailed = (DrvErrorCode + 27)
Global Const GetProcAddressFailed = (DrvErrorCode + 28)
Global Const InvalidDriverHandle = (DrvErrorCode + 29)
Global Const InvalidModuleType = (DrvErrorCode + 30)
Global Const InvalidInputRange = (DrvErrorCode + 31)
Global Const InvalidWindowsHandle = (DrvErrorCode + 32)
Global Const InvalidCountNumber = (DrvErrorCode + 33)
Global Const InvalidInterruptCount = (DrvErrorCode + 34)
Global Const InvalidEventCount = (DrvErrorCode + 35)
Global Const OpenEventFailed = (DrvErrorCode + 36)
Global Const InterruptProcessFailed = (DrvErrorCode + 37)
Global Const InvalidDOSetting = (DrvErrorCode + 38)
Global Const InvalidEventType = (DrvErrorCode + 39)
Global Const EventTimeOut = (DrvErrorCode + 40)
Global Const InvalidDmaChannel = (DrvErrorCode + 41)
Global Const IntDamChannelBusy = (DrvErrorCode + 42)

Global Const CheckRunTimeClassFailed = (DrvErrorCode + 43)
Global Const CreateDllLibFailed = (DrvErrorCode + 44)
Global Const ExceptionError = (DrvErrorCode + 45)
Global Const RemoveDeviceFailed = (DrvErrorCode + 46)
Global Const BuildDeviceListFailed = (DrvErrorCode + 47)
Global Const NoIOFunctionSupport = (DrvErrorCode + 48)
'/\\\\\\\\\\\\\\\\\\\ V2.0B /////////////////////
Global Const ResourceConflict = (DrvErrorCode + 49)
'//////////////////// V2.0B \\\\\\\\\\\\\\\\\\\\\

'\\\\\\\\\\\\\\\\\\\ V2.1 //////////////////////
Global Const InvalidClockSource = (DrvErrorCode + 50)
Global Const InvalidPacerRate = (DrvErrorCode + 51)
Global Const InvalidTriggerMode = (DrvErrorCode + 52)
Global Const InvalidTriggerEdge = (DrvErrorCode + 53)
Global Const InvalidTriggerSource = (DrvErrorCode + 54)
Global Const InvalidTriggerVoltage = (DrvErrorCode + 55)
Global Const InvalidCyclicMode = (DrvErrorCode + 56)
Global Const InvalidDelayCount = (DrvErrorCode + 57)
Global Const InvalidBuffer = (DrvErrorCode + 58)
Global Const OverloadedPCIBus = (DrvErrorCode + 59)
Global Const OverloadedInterruptRequest = (DrvErrorCode + 60)
'/////////////////// V2.1 \\\\\\\\\\\\\\\\\\\\\\/
'/\\\\\\\\\\\\\\\\\\\ V2.0C /////////////////////
Global Const ParamNameNotSupported = (DrvErrorCode + 61)
'//////////////////// V2.0C \\\\\\\\\\\\\\\\\\\\\

'/\\\\\\\\\\\\\\\\\\\ V2.2B /////////////////////
Global Const CheckEventFailed = (DrvErrorCode + 62)
'//////////////////// V2.2B \\\\\\\\\\\\\\\\\\\\\

'/\\\\\\\\\\\\\\\\\\\ V2.2C /////////////////////
Global Const InvalidPort = (DrvErrorCode + 63)
Global Const DaShiftBusy = (DrvErrorCode + 64)
'//////////////////// V2.2C \\\\\\\\\\\\\\\\\\\\\
Global Const ThermoCoupleDisconnect = (DrvErrorCode + 65)




Global Const KeInvalidHandleValue = (KeErrorCode + 0)
Global Const KeFileNotFound = (KeErrorCode + 1)
Global Const KeInvalidHandle = (KeErrorCode + 2)
Global Const KeTooManyCmds = (KeErrorCode + 3)
Global Const KeInvalidParameter = (KeErrorCode + 4)
Global Const KeNoAccess = (KeErrorCode + 5)
Global Const KeUnsuccessful = (KeErrorCode + 6)
Global Const KeConInterruptFailure = (KeErrorCode + 7)
Global Const KeCreateNoteFailure = (KeErrorCode + 8)
Global Const KeInsufficientResources = (KeErrorCode + 9)
Global Const KeHalGetAdapterFailure = (KeErrorCode + 10)
Global Const KeOpenEventFailure = (KeErrorCode + 11)
Global Const KeAllocCommBufFailure = (KeErrorCode + 12)
Global Const KeAllocMdlFailure = (KeErrorCode + 13)
Global Const KeBufferSizeTooSmall = (KeErrorCode + 14)

Global Const DNInitFailed = (DnetErrorCode + 1)
Global Const DNSendMsgFailed = (DnetErrorCode + 2)
Global Const DNRunOutOfMsgID = (DnetErrorCode + 3)
Global Const DNInvalidInputParam = (DnetErrorCode + 4)
Global Const DNErrorResponse = (DnetErrorCode + 5)
Global Const DNNoResponse = (DnetErrorCode + 6)
Global Const DNBusyOnNetwork = (DnetErrorCode + 7)
Global Const DNUnknownResponse = (DnetErrorCode + 8)
Global Const DNNotEnoughBuffer = (DnetErrorCode + 9)
Global Const DNFragResponseError = (DnetErrorCode + 10)
Global Const DNTooMuchDataAck = (DnetErrorCode + 11)
Global Const DNFragRequestError = (DnetErrorCode + 12)
Global Const DNEnableEventError = (DnetErrorCode + 13)
Global Const DNCreateOrOpenEventError = (DnetErrorCode + 14)
Global Const DNIORequestError = (DnetErrorCode + 15)
Global Const DNGetEventNameError = (DnetErrorCode + 16)
Global Const DNTimeOutError = (DnetErrorCode + 17)
Global Const DNOpenFailed = (DnetErrorCode + 18)
Global Const DNCloseFailed = (DnetErrorCode + 19)
Global Const DNResetFailed = (DnetErrorCode + 20)

Global Const USBTransmitFailed = (USBErrorCode + 1)
Global Const USBInvalidCtrlCode = (USBErrorCode + 2)
Global Const USBInvalidDataSize = (USBErrorCode + 3)
Global Const USBAIChannelBusy = (USBErrorCode + 4)
Global Const USBAIDataNotReady = (USBErrorCode + 5)

' define user window message
Global Const WM_USER = &H400
Global Const WM_ATODNOTIFY = (WM_USER + 200)
Global Const WM_DTOANOTIFY = (WM_USER + 201)
Global Const WM_DIGINNOTIFY = (WM_USER + 202)
Global Const WM_DIGOUTNOTIFY = (WM_USER + 203)
Global Const WM_MTNOTIFY = (WM_USER + 204)
Global Const WM_CANTRANSMITCOMPLETE = (WM_USER + 205)
Global Const WM_CANMESSAGE = (WM_USER + 206)
Global Const WM_CANERROR = (WM_USER + 207)

' define the wParam in user window message
Global Const AD_NONE = 0                 ' AD Section
Global Const AD_TERMINATE = 1
Global Const AD_INT = 2
Global Const AD_BUFFERCHANGE = 3
Global Const AD_OVERRUN = 4
Global Const AD_WATCHDOGACT = 5
Global Const AD_TIMEOUT = 6
Global Const DA_TERMINATE = 0            ' DA Section
Global Const DA_DMATC = 1
Global Const DA_INT = 2
Global Const DA_BUFFERCHANGE = 3
Global Const DA_OVERRUN = 4
Global Const DI_TERMINATE = 0            ' DI Section
Global Const DI_DMATC = 1
Global Const DI_INT = 2
Global Const DI_BUFFERCHANGE = 3
Global Const DI_OVERRUN = 4
Global Const DI_WATCHDOGACT = 5
Global Const DO_TERMINATE = 0            ' DO Section
Global Const DO_DMATC = 1
Global Const DO_INT = 2
Global Const DO_BUFFERCHANGE = 3
Global Const DO_OVERRUN = 4
Global Const MT_ATOD = 0                 ' MT Section
Global Const MT_DIGIN = 1

Global Const CAN_TRANSFER = 0            ' CAN Section
Global Const CAN_RECEIVE = 1
Global Const CAN_ERROR = 2

'****************************************************************************
'    define thermocopule type J, K, S, T, B, R, E
'****************************************************************************
Global Const BTC = 4
Global Const ETC = 6
Global Const JTC = 0
Global Const KTC = 1
Global Const RTC = 5
Global Const STC = 2
Global Const TTC = 3

'****************************************************************************
'    define  temperature scale
'****************************************************************************
Global Const C = 0          'Celsius
Global Const F = 1          'Fahrenheit
Global Const R = 2          ' Rankine
Global Const K = 3          ' Kelvin


'****************************************************************************
'    define service type for COMEscape()
'****************************************************************************
Global Const EscapeFlushInput = 1
Global Const EscapeFlushOutput = 2
Global Const EscapeSetBreak = 3
Global Const EscapeClearBreak = 4


'****************************************************************************
'    define  gate mode
'****************************************************************************
Global Const GATE_DISABLED = 0              ' no gating
Global Const GATE_HIGHLEVEL = 1             ' active high level
Global Const GATE_LOWLEVEL = 2              ' active low level
Global Const GATE_HIGHEDGE = 3              ' active high edge
Global Const GATE_LOWEDGE = 4               ' active low edge


'****************************************************************************
'    define input mode for PCL-833
'****************************************************************************
Global Const DISABLE = 0                    ' disable mode
Global Const ABPHASEX1 = 1                  ' Quadrature input X1
Global Const ABPHASEX2 = 2                  ' Quadrature input X2
Global Const ABPHASEX4 = 3                  ' Quadrature input X4
Global Const TWOPULSEIN = 4                 ' 2 pulse input
Global Const ONEPULSEIN = 5                 ' 1 pulse input

'****************************************************************************
'    define latch source for PCL-833
'****************************************************************************
Global Const SWLATCH = 0                    ' S/W read latch data
Global Const INDEXINLATCH = 1               ' Index-in latch data
Global Const DI0LATCH = 2                   ' DI0 latch data
Global Const DI1LATCH = 3                   ' DI1 latch data
Global Const TIMERLATCH = 4                 ' Timer latch data
Global Const DI2LATCH = 5
Global Const DI3LATCH = 6

'****************************************************************************
'    define timer base mode for PCL-1784
'****************************************************************************
Global Const T50KHZ = 0
Global Const T5KHZ = 1
Global Const T500HZ = 2
Global Const T50HZ = 3
Global Const T5HZ = 4

'****************************************************************************
'    define counter overflow mode for PCI-1784
'****************************************************************************
Global Const OVERFLOWLOCK = 1
Global Const UNDERFLOWLOCK = 2
Global Const OVERUNDERLOCK = 3

'****************************************************************************
'    define counter indicator type for PCL-1784
'****************************************************************************
Global Const OVERCOMPLEVEL = &H1
Global Const OVERCOMPPULSE = &H2
Global Const UNDERCOMPLEVEL = &H4
Global Const UNDERCOMPPULSE = &H8

'****************************************************************************
'    define timer base mode for PCL-833
'****************************************************************************
Global Const TPOINT1MS = 0            '    0.1 ms timer base
Global Const T1MS = 1                 '    1   ms timer base
Global Const T10MS = 2                '   10   ms timer base
Global Const T100MS = 3               '  100   ms timer base
Global Const T1000MS = 4              ' 1000   ms timer base

'****************************************************************************
'    define clock source for PCL-833
'****************************************************************************
Global Const SYS8MHZ = 0                 ' 8 MHZ system clock
Global Const SYS4MHZ = 1                 ' 4 MHZ system clock
Global Const SYS2MHZ = 2                 ' 2 MHZ system clock
Global Const SYS1MHZ = 3

'****************************************************************************
'    define cascade mode for PCL-833
'****************************************************************************
Global Const NOCASCADE = 0                  ' 24-bit(no cascade)
Global Const CASCADE = 1                    ' 48-bit(CH1, CH2 cascade)

'\\\\\\\\\\\\\\\\\\\\\\\\\\\\ V2.0b /////////////////////////////////////
'****************************************************************************
'     define parameters for PCI-1780
'****************************************************************************
' define the counter mode register parameter
Global Const PA_MODE_ACT_HIGH_TC_PULSE = &H0
Global Const PA_MODE_ACT_LOW_TC_PULSE = &H1
Global Const PA_MODE_TC_TOGGLE_FROM_LOW = &H2
Global Const PA_MODE_TC_TOGGLE_FROM_HIGH = &H3
Global Const PA_MODE_ENABLE_OUTPUT = &H4
Global Const PA_MODE_DISABLE_OUTPUT = &H0
Global Const PA_MODE_COUNT_DOWN = &H0
Global Const PA_MODE_COUNT_UP = &H8
Global Const PA_MODE_COUNT_RISE_EDGE = &H0
Global Const PA_MODE_COUNT_FALL_EDGE = &H80
Global Const PA_MODE_COUNT_SRC_OUT_N_M1 = &H100        ' N_M1 means n minus 1
Global Const PA_MODE_COUNT_SRC_CLK_N = &H200
Global Const PA_MODE_COUNT_SRC_CLK_N_M1 = &H300
Global Const PA_MODE_COUNT_SRC_FOUT_0 = &H400
Global Const PA_MODE_COUNT_SRC_FOUT_1 = &H500
Global Const PA_MODE_COUNT_SRC_FOUT_2 = &H600
Global Const PA_MODE_COUNT_SRC_FOUT_3 = &H700
Global Const PA_MODE_COUNT_SRC_GATE_N_M1 = &HC00
Global Const PA_MODE_COUNT_SRC_GATE_N = &HC00

Global Const PA_MODE_COUNT_SRC_20MHz = &H400
Global Const PA_MODE_COUNT_SRC_2MHz = &H500
Global Const PA_MODE_COUNT_SRC_200KHz = &H600
Global Const PA_MODE_COUNT_SRC_20KHz = &H700
Global Const PA_MODE_COUNT_SRC_2KHz = &H800
Global Const PA_MODE_COUNT_SRC_200Hz = &H900
Global Const PA_MODE_COUNT_SRC_20Hz = &HA00
Global Const PA_MODE_COUNT_SRC_2Hz = &HB00

Global Const PA_MODE_GATE_SRC_GATE_NO = &H0
Global Const PA_MODE_GATE_SRC_OUT_N_M1 = &H1000
Global Const PA_MODE_GATE_SRC_GATE_N = &H2000
Global Const PA_MODE_GATE_SRC_GATE_N_M1 = &H3000
Global Const PA_MODE_GATE_POSITIVE = &H0
Global Const PA_MODE_GATE_NEGATIVE = &H4000
' Counter Mode
Global Const MODE_A = &H0
Global Const MODE_B = &H0
Global Const MODE_C = &H8000
Global Const MODE_D = &H10
Global Const MODE_E = &H10
Global Const MODE_F = &H8010
Global Const MODE_G = &H20
Global Const MODE_H = &H20
Global Const MODE_I = &H8020
Global Const MODE_J = &H30
Global Const MODE_K = &H30
Global Const MODE_L = &H8030
Global Const MODE_O = &H8040
Global Const MODE_R = &H8050
Global Const MODE_U = &H8060
Global Const MODE_X = &H8070

Global Const MODE_M = &HC    'For PCM3810I
Global Const MODE_N = &HD    'For PCM3810I

' define the FOUT register parameter
Global Const PA_FOUT_SRC_EXTER_CLK = &H0
Global Const PA_FOUT_SRC_CLK_N = &H100
Global Const PA_FOUT_SRC_FOUT_N_M1 = &H200
Global Const PA_FOUT_SRC_CLK_10MHZ = &H300
Global Const PA_FOUT_SRC_CLK_1MHZ = &H400
Global Const PA_FOUT_SRC_CLK_100KHZ = &H500
Global Const PA_FOUT_SRC_CLK_10KHZ = &H600
Global Const PA_FOUT_SRC_CLK_1KHZ = &H700
'USB4751 parameter need.
Global Const PA_FOUT_SRC_CLK_20MHZ = &H800
Global Const PA_FOUT_SRC_CLK_5MHZ = &H900
'/////////////////////////////// V2.0b \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
'****************************************************************************
'   define event type for interrupt and DMA transfer
'****************************************************************************
Global Const ADS_EVT_INTERRUPT = &H1       ' interrupt
Global Const ADS_EVT_BUFCHANGE = &H2       ' buffer change
Global Const ADS_EVT_TERMINATED = &H4      ' termination
Global Const ADS_EVT_OVERRUN = &H8         ' overrun
Global Const ADS_EVT_WATCHDOG = &H10       ' watchdog actived
Global Const ADS_EVT_CHGSTATE = &H20       ' change state event
Global Const ADS_EVT_ALARM = &H40          ' alarm event
Global Const ADS_EVT_PORT0 = &H80          ' port 0 event
Global Const ADS_EVT_PORT1 = &H100         ' port 1 event
Global Const ADS_EVT_PORT2 = &H800         ' port 2 event
Global Const ADS_EVT_PATTERNMATCH = &H200  ' Pattern Match for DI
Global Const ADS_EVT_COUNTER = &H201       ' Persudo event for COUNTERMATCH and COUNTEROVERFLOW
Global Const ADS_EVT_COUNTERMATCH = &H202  ' Counter Match setting NO. for DI
Global Const ADS_EVT_COUNTEROVERFLOW = &H203 ' Counter Overflow for DI
Global Const ADS_EVT_STATUSCHANGE = &H204  ' Status Change for DI
Global Const ADS_EVT_FILTER = &H205        ' Filter Event
'\\\\\\\\\\\\\\\\\\\\\\\\\2.2/////////////////////////////
Global Const ADS_EVT_WATCHDOG_OVERRUN = &H206   ' Watchdong Event
'/////////////////////////2.2 \\\\\\\\\\\\\\\\\\\\\\\\\\\\

Global Const ADS_EVT_DEVREMOVED = &H400  ' for USB device


'****************************************************************************
'    define event name by device number
'****************************************************************************
Global Const ADS_EVT_INTERRUPT_NAME = "ADS_EVT_INTERRUPT"
Global Const ADS_EVT_BUFCHANGE_NAME = "ADS_EVT_BUFCHANGE"
Global Const ADS_EVT_TERMINATED_NAME = "ADS_EVT_TERMINATED"
Global Const ADS_EVT_OVERRUN_NAME = "ADS_EVT_OVERRUN"
Global Const ADS_EVT_WATCHDOG_NAME = "ADS_EVT_WATCHDOG"
Global Const ADS_EVT_CHGSTATE_NAME = "ADS_EVT_CHGSTATE"
Global Const ADS_EVT_ALARM_NAME = "ADS_EVT_ALARM"
Global Const ADS_EVT_PATTERNMATCH_NAME = "ADS_EVT_PATTERNMATCH"
Global Const ADS_EVT_COUNTERMATCH_NAME = "ADS_EVT_COUNTERMATCH"
Global Const ADS_EVT_COUNTEROVERFLOW_NAME = "ADS_EVT_COUNTEROVERFLOW"
Global Const ADS_EVT_STATUSCHANGE_NAME = "ADS_EVT_STATUSCHANGE"
'\\\\\\\\\\\\\\\\\\\\\\\\\2.2/////////////////////////////
Global Const ADS_EVT_WATCHDOG_OVERRUN_NAME = "ADS_EVT_WATCHDOG_OVERRUN"
'/////////////////////////2.2 \\\\\\\\\\\\\\\\\\\\\\\\\\\\
' ****************************************************************************
'    define FIFO size
' ****************************************************************************
Global Const FIFO_SIZE = 512                ' 1K FIFO size (512* 2byte/each data)

' ****************************************************************************
'    define Data Type ID
' ****************************************************************************
Global Const AI_BUFFER_DATATYPE32 = &H32B
'****************************************************************************
'    Function ID Definition
'****************************************************************************
Global Const FID_DeviceOpen = 0
Global Const FID_DeviceClose = 1
Global Const FID_DeviceGetFeatures = 2
Global Const FID_AIConfig = 3
Global Const FID_AIGetConfig = 4
Global Const FID_AIBinaryIn = 5
Global Const FID_AIScale = 6
Global Const FID_AIVoltageIn = 7
Global Const FID_AIVoltageInExp = 8
Global Const FID_MAIConfig = 9
Global Const FID_MAIBinaryIn = 10
Global Const FID_MAIVoltageIn = 11
Global Const FID_MAIVoltageInExp = 12
Global Const FID_TCMuxRead = 13
Global Const FID_AOConfig = 14
Global Const FID_AOBinaryOut = 15
Global Const FID_AOVoltageOut = 16
Global Const FID_AOScale = 17
Global Const FID_DioSetPortMode = 18
Global Const FID_DioGetConfig = 19
Global Const FID_DioReadPortByte = 20
Global Const FID_DioWritePortByte = 21
Global Const FID_DioReadBit = 22
Global Const FID_DioWriteBit = 23
Global Const FID_DioGetCurrentDOByte = 24
Global Const FID_DioGetCurrentDOBit = 25
Global Const FID_WritePortByte = 26
Global Const FID_WritePortWord = 27
Global Const FID_ReadPortByte = 28
Global Const FID_ReadPortWord = 29
Global Const FID_CounterEventStart = 30
Global Const FID_CounterEventRead = 31
Global Const FID_CounterFreqStart = 32
Global Const FID_CounterFreqRead = 33
Global Const FID_CounterPulseStart = 34
Global Const FID_CounterReset = 35
Global Const FID_QCounterConfig = 36
Global Const FID_QCounterConfigSys = 37
Global Const FID_QCounterStart = 38
Global Const FID_QCounterRead = 39
Global Const FID_AlarmConfig = 40
Global Const FID_AlarmEnable = 41
Global Const FID_AlarmCheck = 42
Global Const FID_AlarmReset = 43
Global Const FID_COMOpen = 44
Global Const FID_COMConfig = 45
Global Const FID_COMClose = 46
Global Const FID_COMRead = 47
Global Const FID_COMWrite232 = 48
Global Const FID_COMWrite485 = 49
Global Const FID_COMWrite85 = 50
Global Const FID_COMInit = 51
Global Const FID_COMLock = 52
Global Const FID_COMUnlock = 53
Global Const FID_WDTEnable = 54
Global Const FID_WDTRefresh = 55
Global Const FID_WDTReset = 56
Global Const FID_FAIIntStart = 57
Global Const FID_FAIIntScanStart = 58
Global Const FID_FAIDmaStart = 59
Global Const FID_FAIDmaScanStart = 60
Global Const FID_FAIDualDmaStart = 61
Global Const FID_FAIDualDmaScanStart = 62
Global Const FID_FAICheck = 63
Global Const FID_FAITransfer = 64
Global Const FID_FAIStop = 65
Global Const FID_FAIWatchdogConfig = 66
Global Const FID_FAIIntWatchdogStart = 67
Global Const FID_FAIDmaWatchdogStart = 68
Global Const FID_FAIWatchdogCheck = 69
Global Const FID_FAOIntStart = 70
Global Const FID_FAODmaStart = 71
Global Const FID_FAOScale = 72
Global Const FID_FAOLoad = 73
Global Const FID_FAOCheck = 74
Global Const FID_FAOStop = 75
Global Const FID_ClearOverrun = 76
Global Const FID_EnableEvent = 77
Global Const FID_CheckEvent = 78
Global Const FID_AllocateDMABuffer = 79
Global Const FID_FreeDMABuffer = 80
Global Const FID_EnableCANEvent = 81
Global Const FID_GetCANEventData = 82
Global Const FID_TimerCountSetting = 83
Global Const FID_CounterPWMSetting = 84
Global Const FID_CounterPWMEnable = 85
Global Const FID_DioTimerSetting = 86
Global Const FID_EnableEventEx = 87
Global Const FID_DICounterReset = 88
Global Const FID_FDITransfer = 89
Global Const FID_EnableSyncAO = 90
Global Const FID_WriteSyncAO = 91
Global Const FID_AOCurrentOut = 92
Global Const FID_ADAMCounterSetHWConfig = 93
Global Const FID_ADAMCounterGetHWConfig = 94
Global Const FID_ADAMAISetHWConfig = 95
Global Const FID_ADAMAIGetHWConfig = 96
Global Const FID_ADAMAOSetHWConfig = 97
Global Const FID_ADAMAOGetHWConfig = 98
Global Const FID_GetFIFOSize = 99
Global Const FID_PWMStartRead = 100
Global Const FID_FAIDmaExStart = 101
Global Const FID_FAOWaveFormStart = 102

'\\\\\\\\\\\\\\\\\\\ V2.0B /////////////////////
Global Const FID_FreqOutStart = 104
Global Const FID_FreqOutReset = 105
Global Const FID_CounterConfig = 106
Global Const FID_DeviceGetParam = 107
'/////////////////// V2.0B \\\\\\\\\\\\\\\\\\\\\

'\\\\\\\\\\\\\\\\\\\ V2.0C /////////////////////
Global Const FID_DeviceSetProperty = 108
Global Const FID_DeviceGetProperty = 109
Global Const FID_WritePortDword = 110
Global Const FID_ReadPortDword = 111
Global Const FID_FDIStart = 112
Global Const FID_FDICheck = 113
Global Const FID_FDIStop = 114
Global Const FID_FDOStart = 115
Global Const FID_FDOCheck = 116
Global Const FID_FDOStop = 117
Global Const FID_ClearFlag = 118
'/////////////////// V2.0C \\\\\\\\\\\\\\\\\\\\\

'\\\\\\\\\\\\\\\\\\\ V2.2 /////////////////////
Global Const FID_WatchdogStart = 119
Global Const FID_WatchdogFeed = 120
Global Const FID_WatchdogStop = 121
'///////////////////// V2.2/////////////////////

'\\\\\\\\\\\\\\\\\\\ V2.2C /////////////////////
Global Const FID_DioReadPortWord = 122
Global Const FID_DioWritePortWord = 123
Global Const FID_DioReadPortDword = 124
Global Const FID_DioWritePortDword = 125
Global Const FID_DioGetCurrentDOWord = 126
Global Const FID_DioGetCurrentDODword = 127
Global Const FID_FAODmaExStart = 128
Global Const FID_FAITerminate = 129
Global Const FID_FAOTerminate = 130
'///////////////////// V2.2C /////////////////////

Global Const FID_DioEnableEventAndSpecifyDiPorts = 131
Global Const FID_DioDisableEvent = 132
Global Const FID_DioGetLatestEventDiPortsState = 133
Global Const FID_DioReadDiPorts = 134
Global Const FID_DioWriteDoPorts = 135
Global Const FID_DioGetCurrentDoPortsState = 136

Global Const FID_FAOCheckEx = 137


Global Const FID_DioEnableEventAndSpecifyEventCounter = 138
Global Const FID_CntrEnableEventAndSpecifyEventCounter = 139
Global Const FID_CntrGetLatestEventCounterValue = 140
Global Const FID_CntrDisableEvent = 141

Global Const FID_CustomerDataRead = 142
Global Const FID_CustomerDataWrite = 143

'// For 32-bit Data structure
Global Const FID_AIBinaryIn32 = 144
Global Const FID_AIVoltageIn32 = 145
Global Const FID_MAIBinaryIn32 = 146
Global Const FID_MAIVoltageIn32 = 147
Global Const FID_FAIIntStart32 = 148
Global Const FID_FAIIntScanStart32 = 149
Global Const FID_FAIDmaExStart32 = 150

'*************************************************************************
'    define gain listing
'************************************************************************
Type GainList
    usGainCde     As Integer
    fMaxGainVal   As Single
    fMinGainVal   As Single
    szGainStr(0 To 15)     As Byte
End Type

'*************************************************************************
'    Define hardware board(device) features.
'
'    Note: definition for dwPermutaion member
'
'           Bit 0: Software AI
'           Bit 1: DMA AI
'           Bit 2: Interrupt AI
'           Bit 3: Condition AI
'           Bit 4: Software AO
'           Bit 5: DMA AO
'           Bit 6: Interrupt AO
'           Bit 7: Condition AO
'           Bit 8: Software DI
'           Bit 9: DMA DI
'           Bit 10: Interrupt DI
'           Bit 11: Condition DI
'           Bit 12: Software DO
'           Bit 13: DMA DO
'           Bit 14: Interrupt DO
'           Bit 15: Condition DO
'           Bit 16: High Gain
'           Bit 17: Auto Channel Scan
'           Bit 18: Pacer Trigger
'           Bit 19: External Trigger
'           Bit 20: Down Counter
'           Bit 21: Dual DMA
'           Bit 22: Monitoring
'           Bit 23: QCounter
'
'***********************************************************************
Type DEVFEATURES
    szDriverVer(0 To 7) As Byte    ' device driver version
    szDriverName(0 To (MAX_DRIVER_NAME_LEN - 1)) As Byte ' device driver name
    dwBoardID       As Long         ' board ID
    usMaxAIDiffChl  As Integer      ' Max. number of differential channel
    usMaxAISiglChl  As Integer      ' Max. number of single-end channel
    usMaxAOChl      As Integer      ' Max. number of D/A channel
    usMaxDOChl      As Integer      ' Max. number of digital out channel
    usMaxDIChl      As Integer      ' Max. number of digital input channel
    usDIOPort       As Integer      ' specifies if programmable or not
    usMaxTimerChl   As Integer      ' Max. number of Counter/Timer channel
    usMaxAlarmChl   As Integer      ' Max number of  alram channel
    usNumADBit      As Integer      ' number of bits for A/D converter
    usNumADByte     As Integer      ' A/D channel width in bytes.
    usNumDABit      As Integer      ' number of bits for D/A converter.
    usNumDAByte     As Integer      ' D/A channel width in bytes.
    usNumGain       As Integer      ' Max. number of gain code
    glGainList(15)  As GainList     ' Gain listing
    dwPermutation(3) As Long        ' Permutation
End Type

'*************************************************************************
'    AOSET Definition
'************************************************************************
Type AOSET
    usAOSource As Integer       ' 0-internal, 1-external
    fAOMaxVol  As Single        ' maximum output voltage
    fAOMinVol  As Single        ' minimum output voltage
    fAOMaxCur  As Single        ' maximum output current
    fAOMinCur  As Single        ' minimum output current
End Type

Type AORANGESET
    usGainCount As Integer
    usAOSource As Integer       ' 0-internal, 1-external
    usAOType   As Integer       ' 0-voltage, 1-current
    usChan     As Integer
    fAOMax     As Single        ' manimum output
    fAOMin     As Single        ' miximum output
End Type

'\\\\\\\\\\\\\\\\\\\ V2.0B /////////////////////
'Type PT_DeviceGetParam
'    nID As Integer
'    nSize As Long                    'pointer
'    pBuffer As Long                  'pointer
'End Type
'/////////////////// V2.0B \\\\\\\\\\\\\\\\\\\\\

'*************************************************************************
'    DaughterSet Definition
'*************************************************************************
Type DAUGHTERSET
    dwBoardID As Long                   ' expansion board ID
    usNum     As Integer                ' available expansion channels
    fGain     As Single                 ' gain for expansion channel
    usCards   As Integer                ' number of expansion cards
End Type

'**************************************************************************
'    Analog Input Configuration Definition
'**************************************************************************
Type DEVCONFIG_AI
    dwBoardID     As Long          ' board ID code
    ulChanConfig  As Long          ' 0-single ended, 1-differential
    usGainCtrMode As Integer       ' 1-by jumper, 0-programmable
    usPolarity    As Integer       ' 0-bipolar, 1-unipolar
    usDasGain     As Integer       ' not used if GainCtrMode = 1
    usNumExpChan  As Integer       ' DAS channels attached expansion board
    usCjcChannel  As Integer       ' cold junction channel
    Daughter(MAX_DAUGHTER_NUM - 1) As DAUGHTERSET  ' expansion board settings
    ulChanConfigEx(3) As Long      ' Extension the channel configuration, so we can max support 128 AI channels' setting.

End Type

'**************************************************************************
'    DEVCONFIG_COM Definition
'**************************************************************************
Type DEVCONFIG_COM
    usCommPort    As Integer                    ' serial port
    dwBaudRate    As Long                       ' baud rate
    usParity      As Integer                    ' parity check
    usDataBits    As Integer                    ' data bits
    usStopBits    As Integer                    ' stop bits
    usTxMode      As Integer                    ' transmission mode
    usPortAddress As Integer                    ' communication port address
End Type

'**************************************************************************
'    TRIGLEVEL Definition
'**************************************************************************
Type TRIGLEVEL
  fLow  As Single
  fHigh As Single
End Type


Type PT_DEVLIST
    dwDeviceNum  As Long
    szDeviceName(0 To 49) As Byte
    nNumOfSubdevices As Integer
End Type

Type PT_DeviceGetFeatures
    buffer As Long        ' LPDEVFEATURES
    size   As Integer
End Type

Type PT_AIConfig
    DasChan As Integer
    DasGain As Integer
End Type

Type PT_AIGetConfig
    buffer As Long        ' LPDEVCONFIG_AI
    size   As Integer
End Type

Type PT_AIScale
    reading  As Integer
    MaxVolt  As Single
    MaxCount As Integer
    offset   As Integer
    voltage  As Long      ' FLOAT far *voltage
End Type

Type PT_AIVoltageIn
    chan     As Integer
    gain     As Integer
    TrigMode As Integer
    voltage  As Long      ' FLOAT far *voltage
End Type

Type PT_AIVoltageInExp
    DasChan As Integer
    DasGain As Integer
    ExpChan As Integer
    voltage As Long       ' FLOAT far *voltage
End Type

Type PT_MAIConfig
    NumChan   As Integer
    StartChan As Integer
    GainArray As Long    ' USHORT far *GainArray
End Type

Type PT_MAIVoltageIn
    NumChan      As Integer
    StartChan    As Integer
    GainArray    As Long  'USHORT far *GainArray
    TrigMode     As Integer
    VoltageArray As Long  'FLOAT far *VoltageArray
End Type

Type PT_MAIVoltageInExp
    NumChan      As Integer
    DasChanArray As Long  ' USHORT far *DasChanArray
    DasGainArray As Long  ' USHORT far *DasGainArray
    ExpChanArray As Long  ' USHORT far *ExpChanArray
    VoltageArray As Long  ' FLOAT  far *VoltageArray
End Type

Type PT_TCMuxRead
    DasChan   As Integer
    DasGain   As Integer
    ExpChan   As Integer
    TCType    As Integer
    TempScale As Integer
    temp      As Long     ' FLOAT far *temp
End Type

Type PT_AOConfig
    chan     As Integer
    RefSrc   As Integer
    MaxValue As Single
    MinValue As Single
End Type

Type PT_AOBinaryOut
    chan    As Integer
    BinData As Integer
End Type

Type PT_AOVoltageOut
    chan        As Integer
    OutputValue As Single
End Type

Type PT_AOScale
    chan        As Integer
    OutputValue As Single
    BinData     As Long   ' USHORT far *BinData
End Type

Type PT_DioSetPortMode
    Port As Integer
    dir  As Integer
End Type

Type PT_DioGetConfig
    PortArray  As Long     ' SHORT far *PortArray
    NumOfPorts As Integer
End Type

Type PT_DioReadPortByte
    Port As Integer
    value As Long         ' USHORT far *value
End Type

Type PT_DioWritePortByte
    Port  As Integer
    Mask  As Integer
    state As Integer
End Type

Type PT_DioReadBit
    Port  As Integer
    bit   As Integer
    state As Long        ' USHORT far *state
End Type

Type PT_DioWriteBit
    Port  As Integer
    bit   As Integer
    state As Integer
End Type

Type PT_DioGetCurrentDOByte
    Port  As Integer
    value As Long         ' USHORT far *value
End Type

Type PT_DioGetCurrentDOBit
    Port  As Integer
    bit   As Integer
    state As Long         ' USHORT far *state
End Type

Type PT_WritePortByte
    Port     As Integer
    ByteData As Integer
End Type

Type PT_WritePortWord
    Port     As Integer
    WordData As Integer
End Type

'////////////////////////// V2.0C \\\\\\\\\\\\\\\\\\\\\\\\
Type PT_WritePortDword
    Port As Integer
    DwordData As Long
End Type
'////////////////////////// V2.0C \\\\\\\\\\\\\\\\\\\\\\\\


Type PT_ReadPortByte
    Port     As Integer
    ByteData As Long      ' USHORT far *ByteData
End Type

Type PT_ReadPortWord
    Port     As Integer
    WordData As Long      ' USHORT far *WordData
End Type

'////////////////////////// V2.0C \\\\\\\\\\\\\\\\\\\\\\\\
Type PT_ReadPortDword
    Port     As Integer
    DwordData As Long
End Type
'////////////////////////// V2.0C \\\\\\\\\\\\\\\\\\\\\\\\

Type PT_CounterEventStart
    counter  As Integer
    GateMode As Integer
End Type

Type PT_CounterEventRead
    counter  As Integer
    overflow As Long      ' USHORT far *overflow
    Count    As Long      ' ULONG  far *count
End Type

Type PT_CounterFreqStart
    counter    As Integer
    GatePeriod As Integer
    GateMode   As Integer
End Type

Type PT_CounterFreqRead
    counter As Integer
    freq    As Long       'FLOAT far *freq
End Type

Type PT_CounterPulseStart
    counter  As Integer
    Period   As Single
    UpCycle  As Single
    GateMode As Integer
End Type

Type PT_QCounterConfig
    counter       As Integer
    LatchSrc      As Integer
    LatchOverflow As Integer
    ResetOnLatch  As Integer
    ResetValue    As Integer
End Type

Type PT_QCounterConfigSys
    SysClock    As Integer
    TimeBase    As Integer
    TimeDivider As Integer
    CascadeMode As Integer
End Type

Type PT_QCounterStart
    counter   As Integer
    InputMode As Integer
End Type

Type PT_QCounterRead
    counter  As Integer
    overflow As Long      ' USHORT far *overflow
    LoCount  As Long      ' ULONG  far *LoCount
    HiCount  As Long      ' ULONG  far *HiCount
End Type

Type PT_AlarmConfig
    chan    As Integer
    LoLimit As Single
    HiLimit As Single
End Type

Type PT_AlarmEnable
    chan      As Integer
    LatchMode As Integer
    Enabled   As Integer
End Type

Type PT_AlarmCheck
    chan    As Integer
    LoState As Long       ' USHORT far *LoState
    HiState As Long       ' USHORT far *HiState
End Type

Type PT_WDTEnable
    message     As Integer
    Destination As Long   ' HWND Destination
End Type

Type PT_FAIDmaStart
    TrigSrc     As Integer
    SampleRate  As Long
    chan        As Integer
    gain        As Integer
    buffer      As Long
    Count       As Long
End Type

Type PT_FAIDmaScanStart
    TrigSrc     As Integer
    SampleRate  As Long
    NumChans    As Integer
    StartChan   As Integer
    GainList    As Long
    buffer      As Long
    Count       As Long
End Type

Type PT_FAIDualDmaStart
    TrigSrc     As Integer
    SampleRate  As Long
    chan        As Integer
    gain        As Integer
    BufferA     As Long
    BufferB     As Long
    Count       As Long
    cyclic      As Integer
End Type

Type PT_FAIDualDmaScanStart
    TrigSrc     As Integer
    SampleRate  As Long
    NumChans    As Integer
    StartChan   As Integer
    GainList    As Long
    BufferA     As Long
    BufferB     As Long
    Count       As Long
    cyclic      As Integer
End Type

Type PT_FAITransfer
    ActiveBuf   As Integer
    DataBuffer  As Long
    DataType    As Integer
    start       As Long
    Count       As Long
    Overrun     As Long
End Type

Type PT_FAICheck
    ActiveBuf   As Long
    Stopped     As Long
    retrieved   As Long
    Overrun     As Long
    HalfReady   As Long
End Type

Type PT_FAIWatchdogConfig
    TrigMode    As Integer
    NumChans    As Integer
    StartChan   As Integer
    GainList    As Long
    CondList    As Long
    LevelList   As Long
End Type

Type PT_FAIIntWatchdogStart
    TrigSrc     As Integer
    SampleRate  As Long
    buffer      As Long
    Count       As Long
    cyclic      As Integer
    IntrCount   As Integer
End Type

Type PT_FAIDmaWatchdogStart
    TrigSrc     As Integer
    SampleRate  As Long
    BufferA     As Long
    BufferB     As Long
    Count       As Long
End Type

Type PT_FAIWatchdogCheck
    DataType    As Integer
    ActiveBuf   As Long
    triggered   As Long
    TrigChan    As Long
    TrigIndex   As Long
    TrigData    As Long
End Type

Type PT_FAOIntStart
    TrigSrc     As Integer
    SampleRate  As Long
    chan        As Integer
    buffer      As Long
    Count       As Long
    cyclic      As Integer
End Type

Type PT_FAODmaStart
    TrigSrc     As Integer
    SampleRate  As Long
    chan        As Integer
    buffer      As Long
    Count       As Long
End Type

Type PT_FAODmaExStart
    TrigSrc     As Integer
    SampleRate  As Long
    StartChan   As Integer
    NumChans    As Integer
    buffer      As Long
    Count       As Long
    CyclicMode  As Integer
    PacerSource As Integer
    Reserved(0 To 3) As Long
    pReserved(0 To 3) As Long
End Type

Type PT_FAOScale
    chan        As Integer
    Count       As Long
    VoltArray   As Long
    BinArray    As Long
End Type

Type PT_FAOLoad
    ActiveBuf   As Integer
    DataBuffer  As Long
    start       As Integer
    Count       As Long
End Type

Type PT_FAOCheck
   ActiveBuf As Long
   Stopped As Long
   CurrentCount As Long
   Overrun As Long
   HalfReady As Long
End Type

Type PT_FAOCheckEx
   ActiveBuf As Long
   Stopped As Long
   Transfered As Long
   Underrun As Long
   HalfReady As Long
End Type


Type PT_EnableEvent
    EventType    As Integer
    Enabled      As Integer
    Count        As Integer
End Type

Type PT_CheckEvent
    EventType    As Long
    Milliseconds As Long
End Type

Type PT_AllocateDMABuffer
    CyclicMode     As Integer
    RequestBufSize As Long
    ActualBufSize  As Long
    buffer         As Long
End Type

Type PT_TimerCountSetting
    counter        As Integer
    Count          As Long
End Type

Type PT_DIFilter
   EventType    As Integer
   EventEnabled As Integer
   Count        As Integer
   
   EnableMask   As Integer      ' Filter enable data
   HiValue      As Long         ' USHORT far * HiValue;  // Filter value array pointer
   LowValue     As Long
End Type

Type PT_DIPattern
   EventType    As Integer
   EventEnabled As Integer
   Count        As Integer
   
   EnableMask   As Integer      ' Pattern Match enable data
   PatternValue As Integer      ' Pattern Match pre_setting value;
End Type

Type PT_DICounter
   EventType    As Integer
   EventEnabled As Integer
   Count        As Integer

   EnableMask         As Integer      ' Counter enable data
   TrigEdge           As Integer      ' Counter Trigger edge 0: Rising edge  1:Falling edge
   PresetValue        As Long         ' USHORT far * usPreset;    // counter pre_setting value
   MatchEnableMask    As Integer      ' Counter match enable data
   MatchValue         As Long         ' USHORT far * usValue;     // counter match value
   OverflowEnableMask As Integer      ' Counter overflow data
   Direction          As Integer      ' Up/Down counter direction
End Type

Type PT_DIStatus
   EventType    As Integer
   EventEnabled As Integer
   Count        As Integer
   
   EnableMask   As Integer      ' Status change enable data
   RisingEdge   As Integer      ' Record Rising edge trigger type
   FallingEdge  As Integer      ' Record Falling edge trigger type
End Type

Type PT_CounterPWMSetting
   Port As Integer               ' Counter port
   Period As Single              ' Period unit -> 0.1ms
   HiPeriod As Single            ' UpCycle period unit -> 0.1 ms
   OutCount As Long              ' Stop count
   GateMode As Integer
End Type

Type PT_DioTimerSetting
   Port As Integer               ' Counter port
   TimerOnEnable As Integer
   TimerOffEnable As Integer
   OnDuration As Long            ' Timer on duration
   OffDuration As Long           ' Timer off duration
End Type

Type PT_FDITransfer
   EventType As Integer
   RetData As Long
End Type

Type PT_AOCurrentOut
    chan As Integer
    OutputValue As Single
End Type

Type PT_ADAMCounterSetHWConfig
        CounterMode As Integer
        DataFormat As Integer   ' Only for adam5080
        GateTime As Integer             ' Only for adam4080,4080D
End Type

Type PT_ADAMCounterGetHWConfig
        CounterMode As Long
        DataFormat As Long  ' Only for adam5080
        GateTime As Long        ' Only for adam4080,4080D
End Type

Type PT_ADAMAISetHWConfig
        InputRange As Integer
        DataFormat As Integer
        IntegrationTime As Integer
End Type

Type PT_ADAMAIGetHWConfig
        InputRange As Long
        DataFormat As Long
        IntegrationTime As Long
End Type

Type PT_ADAMAOSetHWConfig
        chan As Integer
        OutputRange As Integer
        DataFormat As Integer
        SlewRate As Integer
End Type

Type PT_ADAMAOGetHWConfig
        chan As Integer
        OutputRange As Long
        DataFormat As Long
        SlewRate As Long
End Type

Type PT_PWMStartRead
    usChan         As Integer    'USHORT usChan
    flHiperiod     As Long       'FLOAT far *flHiperiod
    flLowperiod    As Long       'FLOAT far *flLowperiod
End Type

Type PT_FAOWaveFormStart
    TrigSrc             As Integer
    SampleRate          As Long
    WaveCount           As Long
    Count               As Long
    buffer              As Long
    EnabledChannel      As Long
End Type

'\\\\\\\\\\\\\\\\\\\ V2.0B /////////////////////
Type PT_CounterConfig
   usCounter          As Integer
   usInitValue        As Integer
   usCountMode        As Integer
   usCountDirect      As Integer
   usCountEdge        As Integer
   usOutputEnable     As Integer
   usOutputMode       As Integer
   usClkSrc           As Integer
   usGateSrc          As Integer
   usGatePolarity     As Integer
End Type

Type PT_FreqOutStart
  usChannel    As Integer
  usDivider    As Integer
  usFoutSrc    As Integer
End Type
'///////////////////// V2.0B \\\\\\\\\\\\\\\\\\\\\

'\\\\\\\\\\\\\\\\\\\ V2.0C /////////////////////
Type PT_DeviceSetParam         'PCI-1755
  nID As Integer         'IN, Paramarter name ID
  Length As Long         'IN: buffer length
  pData As Long          'IN, buffer for trandsferring in.
End Type

Type PT_DeviceGetParam         'PCI-1755
  nID As Integer         'IN, Paramarter name ID
  Length As Long         'IN: buffer length, out data length required.
  pData As Long          'OUT, data return buffer.
End Type
'///////////////////// V2.0C \\\\\\\\\\\\\\\\\\\\\

'///////////////////// V2.2 \\\\\\\\\\\\\\\\\\\\\
Type PT_WatchdogStart    'PCI-1758
  Reserved0 As Long
  Reserved1 As Long
End Type
'///////////////////// V2.2 \\\\\\\\\\\\\\\\\\\\\

'///////////////////// V2.2C \\\\\\\\\\\\\\\\\\\\\
Type PT_DioReadPortWord
    Port As Integer
    value As Long         ' USHORT far *value
    ValidChannelMask As Long  'Xi'an added
End Type

Type PT_DioWritePortWord
    Port  As Integer
    Mask  As Integer
    state As Integer
End Type

Type PT_DioReadPortDword
    Port As Integer
    value As Long         ' USHORT far *value
    ValidChannelMask As Long  'Xi'an added
End Type

Type PT_DioWritePortDword
    Port  As Integer
    Mask  As Long
    state As Long
End Type

Type PT_DioGetCurrentDOWord
    Port  As Integer
    value As Long         ' USHORT far *value
    ValidChannelMask As Long  'Xi'an added
End Type

Type PT_DioGetCurrentDODword
    Port  As Integer
    value As Long         ' ULONG far *value
    ValidChannelMask As Long  'Xi'an added
End Type
'///////////////////// V2.2C \\\\\\\\\\\\\\\\\\\\\

'// For 32-bit Data Structure ************************************
Type PT_AIBinaryIn
    chan     As Integer
    TrigMode As Integer
    reading  As Long      ' PVOID reading
    typeID   As Integer
End Type

Type PT_MAIBinaryIn
    NumChan      As Integer
    StartChan    As Integer
    TrigMode     As Integer
    ReadingArray As Long  'PVOID Reading
    typeID       As Integer
End Type

Type PT_FAIIntStart
    TrigSrc     As Integer
    SampleRate  As Long
    chan        As Integer
    gain        As Integer
    buffer      As Long   'PVOID Reading
    Count       As Long
    cyclic      As Integer
    IntrCount   As Integer
    typeID      As Integer
End Type

Type PT_FAIIntScanStart
    TrigSrc     As Integer
    SampleRate  As Long
    NumChans    As Integer
    StartChan   As Integer
    GainList    As Long
    buffer      As Long   'PVOID buffer
    Count       As Long
    cyclic      As Integer
    IntrCount   As Integer
    typeID      As Integer
End Type

Type PT_FAIDmaExStart
    TrigSrc     As Integer
    TrigMode    As Integer
    ClockSrc    As Integer
    TrigEdge    As Integer
    SRCType     As Integer
    TrigVol     As Single
    CyclicMode  As Integer
    NumChans    As Integer
    StartChan   As Integer
    ulDelayCnt  As Long
    Count       As Long
    SampleRate  As Long
    GainList    As Long
    CondList    As Long
    LevelList   As Long
    buffer0     As Long
    Buffer1     As Long
    pPt1        As Long
    pPt2        As Long
    pPt3        As Long
    typeID      As Integer
End Type


'**************************************************************************
'    Function Declaration for ADSAPI32
'**************************************************************************
Declare Function DRV_SelectDevice Lib "adsapi32.dll" (ByVal hCaller As Long, ByVal GetModule As Boolean, DeviceNum As Long, ByVal Description As String) As Long
Declare Function DRV_DeviceGetNumOfList Lib "adsapi32.dll" (NumOfDevices As Integer) As Long
Declare Function DRV_DeviceGetList Lib "adsapi32.dll" (ByVal devicelist As Long, ByVal MaxEntries As Integer, nOutEntries As Integer) As Long
Declare Function DRV_DeviceGetSubList Lib "adsapi32.dll" (ByVal DeviceNum As Long, ByVal SubDevList As Long, ByVal MaxEntries As Integer, nOutEntries As Integer) As Long
Declare Function DRV_DeviceOpen Lib "adsapi32.dll" (ByVal DeviceNum As Long, DriverHandle As Long) As Long
Declare Function DRV_DeviceClose Lib "adsapi32.dll" (DriverHandle As Long) As Long
Declare Function DRV_DeviceGetFeatures Lib "adsapi32.dll" (ByVal DriverHandle As Long, lpDevFeatures As PT_DeviceGetFeatures) As Long
'//////////////////// V2.0C \\\\\\\\\\\\\\\\\\\\
Declare Function DRV_DeviceSetProperty Lib "adsapi32.dll" (ByVal DriverHandle As Long, ByVal nID As Integer, ByRef pBuffer As Any, ByVal dwLength As Long) As Long
Declare Function DRV_DeviceGetProperty Lib "adsapi32.dll" (ByVal DriverHandle As Long, ByVal nID As Integer, ByRef pBuffer As Any, ByRef pLength As Long) As Long
'//////////////////// V2.0C \\\\\\\\\\\\\\\\\\\\
Declare Function DRV_BoardTypeMapBoardName Lib "adsapi32.dll" (ByVal BoardID As Long, ByVal ExpName As String) As Long
Declare Sub DRV_GetErrorMessage Lib "adsapi32.dll" (ByVal lError As Long, ByVal lpszszErrMsg As String)
Declare Function DRV_AIConfig Lib "adsapi32.dll" (ByVal DriverHandle As Long, AIConfig As PT_AIConfig) As Long
Declare Function DRV_AIGetConfig Lib "adsapi32.dll" (ByVal DriverHandle As Long, AIGetConfig As PT_AIGetConfig) As Long
'// support 32-bit data structure
Declare Function DRV_AIBinaryIn Lib "adsapi32.dll" (ByVal DriverHandle As Long, AIBinaryIn As PT_AIBinaryIn) As Long
Declare Function DRV_AIScale Lib "adsapi32.dll" (ByVal DriverHandle As Long, AIScale As PT_AIScale) As Long
Declare Function DRV_AIVoltageIn Lib "adsapi32.dll" (ByVal DriverHandle As Long, AIVoltageIn As PT_AIVoltageIn) As Long
Declare Function DRV_AIVoltageInExp Lib "adsapi32.dll" (ByVal DriverHandle As Long, AIVoltageInExp As PT_AIVoltageInExp) As Long
Declare Function DRV_MAIConfig Lib "adsapi32.dll" (ByVal DriverHandle As Long, MAIConfig As PT_MAIConfig) As Long
'// support 32-bit data structure
Declare Function DRV_MAIBinaryIn Lib "adsapi32.dll" (ByVal DriverHandle As Long, MAIBinaryIn As PT_MAIBinaryIn) As Long
Declare Function DRV_MAIVoltageIn Lib "adsapi32.dll" (ByVal DriverHandle As Long, MAIVoltageIn As PT_MAIVoltageIn) As Long
Declare Function DRV_MAIVoltageInExp Lib "adsapi32.dll" (ByVal DriverHandle As Long, MAIVoltageInExp As PT_MAIVoltageInExp) As Long
Declare Function DRV_TCMuxRead Lib "adsapi32.dll" (ByVal DriverHandle As Long, TCMuxRead As PT_TCMuxRead) As Long
Declare Function DRV_AOConfig Lib "adsapi32.dll" (ByVal DriverHandle As Long, AOConfig As PT_AOConfig) As Long
Declare Function DRV_AOBinaryOut Lib "adsapi32.dll" (ByVal DriverHandle As Long, AOBinaryOut As PT_AOBinaryOut) As Long
Declare Function DRV_AOVoltageOut Lib "adsapi32.dll" (ByVal DriverHandle As Long, AOVoltageOut As PT_AOVoltageOut) As Long
Declare Function DRV_AOScale Lib "adsapi32.dll" (ByVal DriverHandle As Long, AOScale As PT_AOScale) As Long
Declare Function DRV_DioSetPortMode Lib "adsapi32.dll" (ByVal DriverHandle As Long, DioSetPortMode As PT_DioSetPortMode) As Long
Declare Function DRV_DioGetConfig Lib "adsapi32.dll" (ByVal DriverHandle As Long, DioGetConfig As PT_DioGetConfig) As Long
Declare Function DRV_DioReadPortByte Lib "adsapi32.dll" (ByVal DriverHandle As Long, DioReadPortByte As PT_DioReadPortByte) As Long
Declare Function DRV_DioWritePortByte Lib "adsapi32.dll" (ByVal DriverHandle As Long, DioWritePortByte As PT_DioWritePortByte) As Long
Declare Function DRV_DioReadBit Lib "adsapi32.dll" (ByVal DriverHandle As Long, DioReadBit As PT_DioReadBit) As Long
Declare Function DRV_DioWriteBit Lib "adsapi32.dll" (ByVal DriverHandle As Long, DioWriteBit As PT_DioWriteBit) As Long
Declare Function DRV_DioGetCurrentDOByte Lib "adsapi32.dll" (ByVal DriverHandle As Long, DioGetCurrentDOByte As PT_DioGetCurrentDOByte) As Long
Declare Function DRV_DioGetCurrentDOBit Lib "adsapi32.dll" (ByVal DriverHandle As Long, DioGetCurrentDOBit As PT_DioGetCurrentDOBit) As Long
Declare Function DRV_WritePortByte Lib "adsapi32.dll" (ByVal DriverHandle As Long, WritePortByte As PT_WritePortByte) As Long
Declare Function DRV_WritePortWord Lib "adsapi32.dll" (ByVal DriverHandle As Long, WritePortWord As PT_WritePortWord) As Long
'\\\\\\\\\\\\\\\\\\\ V2.0C /////////////////////
Declare Function DRV_WritePortDword Lib "adsapi32.dll" (ByVal DriverHandle As Long, WritePortDword As PT_WritePortDword) As Long
'/////////////////// V2.0C \\\\\\\\\\\\\\\\\\\\\

Declare Function DRV_ReadPortByte Lib "adsapi32.dll" (ByVal DriverHandle As Long, ReadPortByte As PT_ReadPortByte) As Long
Declare Function DRV_ReadPortWord Lib "adsapi32.dll" (ByVal DriverHandle As Long, ReadPortWord As PT_ReadPortWord) As Long
'\\\\\\\\\\\\\\\\\\\ V2.0C /////////////////////
Declare Function DRV_ReadPortDword Lib "adsapi32.dll" (ByVal DriverHandle As Long, ReadPortDword As PT_ReadPortDword) As Long
'/////////////////// V2.0C \\\\\\\\\\\\\\\\\\\\\

Declare Function DRV_CounterEventStart Lib "adsapi32.dll" (ByVal DriverHandle As Long, CounterEventStart As PT_CounterEventStart) As Long
Declare Function DRV_CounterEventRead Lib "adsapi32.dll" (ByVal DriverHandle As Long, CounterEventRead As PT_CounterEventRead) As Long
Declare Function DRV_CounterFreqStart Lib "adsapi32.dll" (ByVal DriverHandle As Long, CounterFreqStart As PT_CounterFreqStart) As Long
Declare Function DRV_CounterFreqRead Lib "adsapi32.dll" (ByVal DriverHandle As Long, CounterFreqRead As PT_CounterFreqRead) As Long
Declare Function DRV_CounterPulseStart Lib "adsapi32.dll" (ByVal DriverHandle As Long, CounterPulseStart As PT_CounterPulseStart) As Long
Declare Function DRV_CounterReset Lib "adsapi32.dll" (ByVal DriverHandle As Long, ByVal counter As Integer) As Long
'\\\\\\\\\\\\\\\\\\\ V2.0B /////////////////////
Declare Function DRV_CounterConfig Lib "adsapi32.dll" (ByVal DriverHandle As Long, CounterConfig As PT_CounterConfig) As Long
Declare Function DRV_FreqOutStart Lib "adsapi32.dll" (ByVal DriverHandle As Long, FreqOutStart As PT_FreqOutStart) As Long
Declare Function DRV_FreqOutReset Lib "adsapi32.dll" (ByVal DriverHandle As Long, ByVal channel As Integer) As Long
'/////////////////// V2.0B \\\\\\\\\\\\\\\\\\\\\
Declare Function DRV_QCounterConfig Lib "adsapi32.dll" (ByVal DriverHandle As Long, QCounterConfig As PT_QCounterConfig) As Long
Declare Function DRV_QCounterConfigSys Lib "adsapi32.dll" (ByVal DriverHandle As Long, QCounterConfigSys As PT_QCounterConfigSys) As Long
Declare Function DRV_QCounterStart Lib "adsapi32.dll" (ByVal DriverHandle As Long, QCounterStart As PT_QCounterStart) As Long
Declare Function DRV_QCounterRead Lib "adsapi32.dll" (ByVal DriverHandle As Long, QCounterRead As PT_QCounterRead) As Long
Declare Function DRV_AlarmConfig Lib "adsapi32.dll" (ByVal DriverHandle As Long, AlarmConfig As PT_AlarmConfig) As Long
Declare Function DRV_AlarmEnable Lib "adsapi32.dll" (ByVal DriverHandle As Long, AlarmEnable As PT_AlarmEnable) As Long
Declare Function DRV_AlarmCheck Lib "adsapi32.dll" (ByVal DriverHandle As Long, AlarmCheck As PT_AlarmCheck) As Long
Declare Function DRV_AlarmReset Lib "adsapi32.dll" (ByVal DriverHandle As Long, ByVal chan As Integer) As Long
Declare Function DRV_WDTEnable Lib "adsapi32.dll" (ByVal DriverHandle As Long, WDTEnable As PT_WDTEnable) As Long
Declare Function DRV_WDTRefresh Lib "adsapi32.dll" (ByVal DriverHandle As Long) As Long
Declare Function DRV_WDTReset Lib "adsapi32.dll" (ByVal DriverHandle As Long) As Long
Declare Function DRV_GetAddress Lib "adsapi32.dll" (lpVoid As Any) As Long
Declare Function DRV_TimerCountSetting Lib "adsapi32.dll" (ByVal DriverHandle As Long, TimerCountSetting As PT_TimerCountSetting) As Long
Declare Function DRV_CounterPWMSetting Lib "adsapi32.dll" (ByVal DriverHandle As Long, lpCounterPWMSetting As PT_CounterPWMSetting) As Long
Declare Function DRV_CounterPWMEnable Lib "adsapi32.dll" (ByVal DriverHandle As Long, ByVal Port As Integer) As Long
Declare Function DRV_DICounterReset Lib "adsapi32.dll" (ByVal DriverHandle As Long, ByVal counter As Integer) As Long
Declare Function DRV_EnableSyncAO Lib "adsapi32.dll" (ByVal DriverHandle As Long, ByVal Enableas As Integer) As Long
Declare Function DRV_WriteSyncAO Lib "adsapi32.dll" (ByVal DriverHandle As Long) As Long
Declare Function DRV_AOCurrentOut Lib "adsapi32.dll" (ByVal DriverHandle As Long, lpAOCurrentOut As PT_AOCurrentOut) As Long
Declare Function DRV_DeviceNumToDeviceName Lib "adsapi32.dll" (ByVal DeviceNum As Long, ByVal DeviceName As String)
Declare Function DRV_GetFIFOSize Lib "adsapi32.dll" (ByVal DriverHandle As Long, lSize As Long) As Long
Declare Function DRV_PWMStartRead Lib "adsapi32.dll" (ByVal DriverHandle As Long, lpPWMStartRead As PT_PWMStartRead) As Long

' ADAM Configuration Function Declaration
Declare Function DRV_ADAMCounterSetHWConfig Lib "adsapi32.dll" (ByVal DriverHandle As Long, lpADAMCounterSetHWConfig As PT_ADAMCounterSetHWConfig) As Long
Declare Function DRV_ADAMCounterGetHWConfig Lib "adsapi32.dll" (ByVal DriverHandle As Long, lpADAMCounterGetHWConfig As PT_ADAMCounterGetHWConfig) As Long
Declare Function DRV_ADAMAISetHWConfig Lib "adsapi32.dll" (ByVal DriverHandle As Long, lpADAMAISetHWConfig As PT_ADAMAISetHWConfig) As Long
Declare Function DRV_ADAMAIGetHWConfig Lib "adsapi32.dll" (ByVal DriverHandle As Long, lpADAMAIGetHWConfig As PT_ADAMAIGetHWConfig) As Long
Declare Function DRV_ADAMAOSetHWConfig Lib "adsapi32.dll" (ByVal DriverHandle As Long, lpADAMAOSetHWConfig As PT_ADAMAOSetHWConfig) As Long
Declare Function DRV_ADAMAOGetHWConfig Lib "adsapi32.dll" (ByVal DriverHandle As Long, lpADAMAOGetHWConfig As PT_ADAMAOGetHWConfig) As Long
' Direct I/O Functions List
Declare Function DRV_outp Lib "adsapi32.dll" (ByVal DeviceNum As Long, ByVal Port As Integer, ByVal ByteData As Long) As Long
Declare Function DRV_outpw Lib "adsapi32.dll" (ByVal DeviceNum As Long, ByVal Port As Integer, ByVal ByteData As Long) As Long
Declare Function DRV_inp Lib "adsapi32.dll" (ByVal DeviceNum As Long, ByVal Port As Integer, ByteData As Long) As Long
Declare Function DRV_inpw Lib "adsapi32.dll" (ByVal DeviceNum As Long, ByVal Port As Integer, ByteData As Long) As Long
'/////////////////// V2.2 \\\\\\\\\\\\\\\\\\\\\
Declare Function DRV_inpdw Lib "adsapi32.dll" (ByVal DeviceNum As Long, ByVal Port As Integer, DwordData As Long) As Long
Declare Function DRV_outpdw Lib "adsapi32.dll" (ByVal DeviceNum As Long, ByVal Port As Integer, ByVal DwordData As Long) As Long
'/////////////////// V2.2 \\\\\\\\\\\\\\\\\\\\\
' High speed function declaration
Declare Function DRV_FAIWatchdogConfig Lib "adsapi32.dll" (ByVal DriverHandle As Long, FAIWatchdogConfig As PT_FAIWatchdogConfig) As Long
'// support 32-bit data structure
Declare Function DRV_FAIIntStart Lib "adsapi32.dll" (ByVal DriverHandle As Long, FAIIntStart As PT_FAIIntStart) As Long
'// support 32-bit data structure
Declare Function DRV_FAIIntScanStart Lib "adsapi32.dll" (ByVal DriverHandle As Long, FAIIntScanStart As PT_FAIIntScanStart) As Long
Declare Function DRV_FAIDmaStart Lib "adsapi32.dll" (ByVal DriverHandle As Long, FAIDmaStart As PT_FAIDmaStart) As Long
Declare Function DRV_FAIDmaScanStart Lib "adsapi32.dll" (ByVal DriverHandle As Long, FAIDmaScanStart As PT_FAIDmaScanStart) As Long
Declare Function DRV_FAIDualDmaStart Lib "adsapi32.dll" (ByVal DriverHandle As Long, FAIDualDmaStart As PT_FAIDualDmaStart) As Long
Declare Function DRV_FAIDualDmaScanStart Lib "adsapi32.dll" (ByVal DriverHandle As Long, FAIDualDmaScanStart As PT_FAIDualDmaScanStart) As Long
Declare Function DRV_FAIIntWatchdogStart Lib "adsapi32.dll" (ByVal DriverHandle As Long, FAIIntWatchdogStart As PT_FAIIntWatchdogStart) As Long
Declare Function DRV_FAIDmaWatchdogStart Lib "adsapi32.dll" (ByVal DriverHandle As Long, FAIDmaWatchdogStart As PT_FAIDmaWatchdogStart) As Long
Declare Function DRV_FAICheck Lib "adsapi32.dll" (ByVal DriverHandle As Long, FAICheck As PT_FAICheck) As Long
Declare Function DRV_FAIWatchdogCheck Lib "adsapi32.dll" (ByVal DriverHandle As Long, FAIWatchdogCheck As PT_FAIWatchdogCheck) As Long
Declare Function DRV_FAITransfer Lib "adsapi32.dll" (ByVal DriverHandle As Long, FAITransfer As PT_FAITransfer) As Long
Declare Function DRV_FAIStop Lib "adsapi32.dll" (ByVal DriverHandle As Long) As Long
Declare Function DRV_FAOIntStart Lib "adsapi32.dll" (ByVal DriverHandle As Long, FAOIntStart As PT_FAOIntStart) As Long
Declare Function DRV_FAODmaStart Lib "adsapi32.dll" (ByVal DriverHandle As Long, FAODmaStart As PT_FAODmaStart) As Long
Declare Function DRV_FAODmaExStart Lib "adsapi32.dll" (ByVal DriverHandle As Long, FAODmaExStart As PT_FAODmaExStart) As Long
Declare Function DRV_FAOScale Lib "adsapi32.dll" (ByVal DriverHandle As Long, FAOScale As PT_FAOScale) As Long
Declare Function DRV_FAOLoad Lib "adsapi32.dll" (ByVal DriverHandle As Long, FAOLoad As PT_FAOLoad) As Long
Declare Function DRV_FAOCheck Lib "adsapi32.dll" (ByVal DriverHandle As Long, FAOCheck As PT_FAOCheck) As Long
Declare Function DRV_FAOCheckEx Lib "adsapi32.dll" (ByVal DriverHandle As Long, FAOCheckEx As PT_FAOCheckEx) As Long
Declare Function DRV_FAOStop Lib "adsapi32.dll" (ByVal DriverHandle As Long) As Long
Declare Function DRV_ClearOverrun Lib "adsapi32.dll" (ByVal DriverHandle As Long) As Long
Declare Function DRV_EnableEvent Lib "adsapi32.dll" (ByVal DriverHandle As Long, EnableEvent As PT_EnableEvent) As Long
Declare Function DRV_CheckEvent Lib "adsapi32.dll" (ByVal DriverHandle As Long, CheckEvent As PT_CheckEvent) As Long
Declare Function DRV_AllocateDMABuffer Lib "adsapi32.dll" (ByVal DriverHandle As Long, AllocateDMABuffer As PT_AllocateDMABuffer) As Long
Declare Function DRV_FreeDMABuffer Lib "adsapi32.dll" (ByVal DriverHandle As Long, ByVal buffer As Long) As Long
Declare Function DRV_FDITransfer Lib "adsapi32.dll" (ByVal DriverHandle As Long, FDITransfer As PT_FDITransfer) As Long
Declare Function DRV_EnableEventEx Lib "adsapi32.dll" (ByVal DriverHandle As Long, EnableEventEx As Any) As Long
'// support 32-bit data structure
Declare Function DRV_FAIDmaExStart Lib "adsapi32.dll" (ByVal DriverHandle As Long, FAIDmaExStart As PT_FAIDmaExStart) As Long
Declare Function DRV_FAOWaveFormStart Lib "adsapi32.dll" (ByVal DriverHandle As Long, FAOWaveFormStart As PT_FAOWaveFormStart) As Long
'\\\\\\\\\\\\\\\\\\\ V2.0B ///////////////////////
Declare Function DRV_DeviceGetParam Lib "adsapi32.dll" (ByVal DriverHandle As Long, lpDeviceGetParam As PT_DeviceGetParam) As Long
'///////////////////// V2.0B \\\\\\\\\\\\\\\\\\\\\

'/////////////////// V2.0C \\\\\\\\\\\\\\\\\\\\\
Declare Function DRV_FDIStart Lib "adsapi32.dll" (ByVal DriverHandle As Long, ByVal wCyclic As Integer, ByVal dwCount As Long, ByVal pBuf As Long) As Long
Declare Function DRV_FDICheck Lib "adsapi32.dll" (ByVal DriverHandle As Long, ByRef pdwStatus As Long, ByRef pdwRetrieved As Long) As Long
Declare Function DRV_FDIStop Lib "adsapi32.dll" (ByVal DriverHandle As Long) As Long
Declare Function DRV_ClearFlag Lib "adsapi32.dll" (ByVal DriverHandle As Long, ByVal dwEventType As Long) As Long
Declare Function DRV_FDOStart Lib "adsapi32.dll" (ByVal DriverHandle As Long, ByVal wCyclic As Integer, ByVal dwCount As Long, ByVal pBuf As Long) As Long
Declare Function DRV_FDOCheck Lib "adsapi32.dll" (ByVal DriverHandle As Long, ByRef pdwStatus As Long, ByRef pdwRetrieved As Long) As Long
Declare Function DRV_FDOStop Lib "adsapi32.dll" (ByVal DriverHandle As Long) As Long
'/////////////////// V2.0C \\\\\\\\\\\\\\\\\\\\\
'/////////////////// V2.2 \\\\\\\\\\\\\\\\\\\\\
Declare Function DRV_WatchdogStart Lib "adsapi32.dll" (ByVal DriverHandle As Long, WatchdogStart As PT_WatchdogStart) As Long
Declare Function DRV_WatchdogFeed Lib "adsapi32.dll" (ByVal DriverHandle As Long) As Long
Declare Function DRV_WatchdogStop Lib "adsapi32.dll" (ByVal DriverHandle As Long) As Long
'/////////////////// V2.2 \\\\\\\\\\\\\\\\\\\\\

'/////////////////// V2.2C \\\\\\\\\\\\\\\\\\\\\
Declare Function DRV_DioReadPortWord Lib "adsapi32.dll" (ByVal DriverHandle As Long, DioReadPortWord As PT_DioReadPortWord) As Long
Declare Function DRV_DioWritePortWord Lib "adsapi32.dll" (ByVal DriverHandle As Long, DioWritePortWord As PT_DioWritePortWord) As Long
Declare Function DRV_DioReadPortDword Lib "adsapi32.dll" (ByVal DriverHandle As Long, DioReadPortDword As PT_DioReadPortDword) As Long
Declare Function DRV_DioWritePortDword Lib "adsapi32.dll" (ByVal DriverHandle As Long, DioWritePortDword As PT_DioWritePortDword) As Long
Declare Function DRV_DioGetCurrentDOWord Lib "adsapi32.dll" (ByVal DriverHandle As Long, DioGetCurrentDOWord As PT_DioGetCurrentDOWord) As Long
Declare Function DRV_DioGetCurrentDODword Lib "adsapi32.dll" (ByVal DriverHandle As Long, DioGetCurrentDODword As PT_DioGetCurrentDODword) As Long
Declare Function DRV_FAITerminate Lib "adsapi32.dll" (ByVal DriverHandle As Long) As Long
Declare Function DRV_FAOTerminate Lib "adsapi32.dll" (ByVal DriverHandle As Long) As Long
'/////////////////// V2.2C \\\\\\\\\\\\\\\\\\\\\

'=========================================================================
' Description:
'      Enable a specific DI event, and also specify a range of DI ports
'      that will be scanned (read) when the specified event occurs.
'
' Parameters:
' DriverHandle[in]:  Driver handle
' dwEventID[in]:     which DIO Event to enable. It can be one of
'                    ADS_EVT_DI_INTERRUPT0~184,
'                    ADS_EVT_DI_PATTERNMATCH_PORT0~31,
'                    ADS_EVT_DI_STATUSCHANGE_PORT0~31.
' dwScanStart[in]:   start port which will be scaned when the specified event occurs.
'                    this value must not exceed the max DI port the board supported.
' dwScanCount[in]:   port count to be scaned when the specified event occurs. The
'                    sum of this parameter plus the dwScanStart must not be bigger than
'                    the max DI port the board supported.
'
'---------------------------------------------------------------------------------
Declare Function AdxDioEnableEventAndSpecifyDiPorts Lib "adsapi32.dll" (ByVal DriverHandle As Long, ByVal dwEventID As Long, ByVal dwScanStart As Long, ByVal dwScanCount As Long) As Long

'=========================================================================
' Description:
'      Disable a specific enabled DI event. DI event can be enabled by
'      the function AdcDioEventEnableAndSpecifyDiPorts.
'      When the DI event is disabled, the related DI ports will also be released
'
' Parameters:
' DriverHandle[in]:  Driver handle
' dwEventID[in]:     which DI Interrupt Event to enable. It can be one of
'                    ADS_EVT_DI_INTERRUPT0 ~184,
'                    ADS_EVT_DI_PATTERNMATCH_PORT0~31,
'                    ADS_EVT_DI_STATUSCHANGE_PORT0~31.
'---------------------------------------------------------------------------------
Declare Function AdxDioDisableEvent Lib "adsapi32.dll" (ByVal DriverHandle As Long, ByVal dwEventID As Long) As Long

'=========================================================================
' Description:
'      Retrieve the stored input data of the specified DI event's most
'      recent occurrence. The event is enabled and the input range is defined
'      by AdcDioEnableEventAndSpecifyDiPorts.
'
' Parameters:
' DriverHandle[in]:  Driver handle
' dwEventID[in]:     DI Event ID which DI data will be retrieved. It can be one of
'                    ADS_EVT_DI_INTERRUPT0 ~184,
'                    ADS_EVT_DI_PATTERNMATCH_PORT0~31,
'                    ADS_EVT_DI_STATUSCHANGE_PORT0~31.
' pBuffer[out]:      pointer to the user buffer to receive the DI data.
' dwLength[in]:      length of the user buffer. IF the length is not enough to
'                    store all the DI ports data, only the 'dwLength' number will
'                    be stored.
'
'---------------------------------------------------------------------------------
Declare Function AdxDioGetLatestEventDiPortsState Lib "adsapi32.dll" (ByVal DriverHandle As Long, ByVal dwEventID As Long, ByRef pBuffer As Byte, ByVal dwLength As Long) As Long

'=========================================================================
' Descriptions:
'
'    read DI ports.
'
' Parameters:
' DriverHandle[in]:  Driver handle
' dwPortStart[in]:   start port to read.
' dwPortCount[in]:   port count to read.
' pBuffer[out]:      pointer to user buffer. The buffer must be big enough
'                    to store all DI data retrieved. The buffer size is equal
'                    the number of dwPortCount in byte.
'---------------------------------------------------------------------------------
Declare Function AdxDioReadDiPorts Lib "adsapi32.dll" (ByVal DriverHandle As Long, ByVal dwPortStart As Long, ByVal dwPortCount As Long, ByRef pBuffer As Byte) As Long

'=========================================================================
' Description:
'
'    Write DO ports.
'
' Parameters:
' DriverHandle[in]: Driver handle
' dwPortStart[in]:  start port to write.
' dwPortCount[in]:  port count to write.
' pBuffer[out]:     pointer to DO data buffer to output.
'---------------------------------------------------------------------------------
Declare Function AdxDioWriteDoPorts Lib "adsapi32.dll" (ByVal DriverHandle As Long, ByVal dwPortStart As Long, ByVal dwPortCount As Long, ByRef pBuffer As Byte) As Long

'=========================================================================
' Description:
'
'    Get current state of DO ports
'
' Parameters:
' DriverHandle[in]: Driver handle
' dwPortStart[in]:  start port to get.
' dwPortCount[in]:  port count to get.
' pBuffer[out]:     pointer to user buffer. The buffer must be big enough
'                   to store all DO data retrieved. The buffer size is equal
'                   the number of dwPortCount in byte.
'---------------------------------------------------------------------------------
Declare Function AdxDioGetCurrentDoPortsState Lib "adsapi32.dll" (ByVal DriverHandle As Long, ByVal dwPortStart As Long, ByVal dwPortCount As Long, ByRef pBuffer As Byte) As Long

'=========================================================================
' Description:
'
'    Call dll driver's configuration dialog box to configure the board.
'
' Parameters:
' DeviceNum[in]:  device number or fix number
' BoardID[in]:    board ID. It's a software defined board id,
'                 for example: BD_PCI1753, BD_MIC3753...
'
' hCaller[in]:    parent window handle
'
'---------------------------------------------------------------------------------
Declare Function AdxDeviceConfig Lib "adsapi32.dll" (ByVal DeviceNum As Long, ByVal BoardID As Long, ByVal hCaller As Long) As Long

Declare Function AdxDioEnableEventAndSpecifyEventCounter Lib "adsapi32.dll" (ByVal DriverHandle As Long, ByVal dwEventID As Long, ByVal dwScanStart As Long, ByVal dwScanCount As Long) As Long
Declare Function AdxCntrEnableEventAndSpecifyEventCounter Lib "adsapi32.dll" (ByVal DriverHandle As Long, ByVal dwEventID As Long, ByVal dwScanStart As Long, ByVal dwScanCount As Long) As Long
Declare Function AdxCntrDisableEvent Lib "adsapi32.dll" (ByVal DriverHandle As Long, ByVal dwEventID As Long) As Long
Declare Function AdxCntrGetLatestEventCounterValue Lib "adsapi32.dll" (ByVal DriverHandle As Long, ByVal dwEventID As Long, ByRef pBuffer As Long, ByVal dwLength As Long) As Long

Declare Function AdxPrivateHWRegionRead Lib "adsapi32.dll" (ByVal DriverHandle As Long, ByVal StartAddress As Long, ByVal DataCount As Long, ByRef pBuffer As Byte) As Long
Declare Function AdxPrivateHWRegionWrite Lib "adsapi32.dll" (ByVal DriverHandle As Long, ByVal StartAddress As Long, ByVal DataCount As Long, ByRef pBuffer As Byte) As Long
' CAN bus function declaration
Declare Function CANPortOpen Lib "ads841.dll" (ByVal DevNum As Integer, wPort As Integer, wHostID As Integer, wBaudRate As Integer) As Long
Declare Function CANPortClose Lib "ads841.dll" (ByVal wPort As Integer) As Long
Declare Function CANInit Lib "ads841.dll" (ByVal Port As Integer, ByVal BTR0 As Integer, ByVal BTR1 As Integer, ByVal usMask As Byte) As Long
Declare Function CANReset Lib "ads841.dll" (ByVal Port As Integer) As Long
Declare Function CANInpb Lib "ads841.dll" (ByVal Port As Integer, ByVal offset As Integer, Data As Byte) As Long
Declare Function CANOutpb Lib "ads841.dll" (ByVal Port As Integer, ByVal offset As Integer, ByVal value As Byte) As Long
Declare Function CANSetBaud Lib "ads841.dll" (ByVal Port As Integer, ByVal BTR0 As Integer, ByVal BTR1 As Integer) As Long
Declare Function CANGetBaudRate Lib "ads841.dll" (ByVal Port As Integer, wBaudRate As Integer) As Long
Declare Function CANSetAcp Lib "ads841.dll" (ByVal Port As Integer, ByVal Acp As Integer, ByVal Mask As Integer) As Long
Declare Function CANSetOutCtrl Lib "ads841.dll" (ByVal Port As Integer, ByVal OutCtrl As Integer) As Long
Declare Function CANSetNormal Lib "ads841.dll" (ByVal Port As Integer) As Long
Declare Function CANHwReset Lib "ads841.dll" (ByVal Port As Integer) As Long
Declare Function CANSendMsg Lib "ads841.dll" (ByVal Port As Integer, ByVal TxBuf As String, ByVal Wait As Long) As Long
Declare Function CANQueryMsg Lib "ads841.dll" (ByVal Port As Integer, Ready As Long, ByVal RcvBuf As String) As Long
Declare Function CANWaitForMsg Lib "ads841.dll" (ByVal Port As Integer, ByVal RcvBuf As String, ByVal uTimeValue As Long) As Long
Declare Function CANQueryID Lib "ads841.dll" (ByVal Port As Integer, Ready As Long, IDBuf As Byte) As Long
Declare Function CANWaitForID Lib "ads841.dll" (ByVal Port As Integer, IDBuf As Byte, ByVal uTimeValue As Long) As Long
Declare Function CANEnableMessaging Lib "ads841.dll" (ByVal Port As Integer, ByVal Type1 As Integer, ByVal Enabled As Long, ByVal AppWnd As Long, RcvBuf As String) As Long
Declare Function CANGetEventName Lib "ads841.dll" (ByVal Port As Integer, RcvBuf As Byte) As Long
Declare Function CANEnableEvent Lib "ads841.dll" (ByVal Port As Integer, ByVal Enabled As Long) As Long
Declare Function CANCheckEvent Lib "ads841.dll" (ByVal Port As Integer, ByVal Milliseconds As Long) As Long
Declare Function CANPortOpenX Lib "ads841.dll" (ByVal wPort As Integer, ByVal dwMemoryAddress As Long, ByVal IRQ As Long) As Long

'**************************************************************************
'    Function Declaration for PCL-839
'**************************************************************************
Declare Function set_base Lib "ads839.dll" (ByVal address As Long) As Long
Declare Function set_mode Lib "ads839.dll" (ByVal chan As Long, ByVal mode As Long) As Long
Declare Function set_speed Lib "ads839.dll" (ByVal chan As Long, ByVal low_speed As Long, ByVal high_speed As Long, ByVal accelerate As Long) As Long
Declare Function status Lib "ads839.dll" (ByVal chan As Long) As Long
Declare Function m_stop Lib "ads839.dll" (ByVal chan As Long) As Long
Declare Function slowdown Lib "ads839.dll" (ByVal chan As Long) As Long
Declare Function sldn_stop Lib "ads839.dll" (ByVal chan As Long) As Long
Declare Function waitrdy Lib "ads839.dll" (ByVal chan As Long) As Long
Declare Function chkbusy Lib "ads839.dll" () As Long
Declare Function out_port Lib "ads839.dll" (ByVal port_no As Long, ByVal value As Long) As Long
Declare Function in_port Lib "ads839.dll" (ByVal port_no As Long) As Long
Declare Function In_byte Lib "ads839.dll" (ByVal offset As Long) As Long
Declare Function Out_byte Lib "ads839.dll" (ByVal offset As Long, ByVal value As Long) As Long
Declare Function org Lib "ads839.dll" (ByVal chan As Long, ByVal dir1 As Long, ByVal speed1 As Long, ByVal dir2 As Long, ByVal speed2 As Long, ByVal dir3 As Long, ByVal speed3 As Long) As Long
Declare Function cmove Lib "ads839.dll" (ByVal chan As Long, ByVal dir1 As Long, ByVal speed1 As Long, ByVal dir2 As Long, ByVal speed2 As Long, ByVal dir3 As Long, ByVal speed3 As Long) As Long
Declare Function pmove Lib "ads839.dll" (ByVal chan As Long, ByVal dir1 As Long, ByVal speed1 As Long, ByVal step1 As Long, ByVal dir2 As Long, ByVal speed2 As Long, ByVal step2 As Long, ByVal dir3 As Long, ByVal speed3 As Long, ByVal step3 As Long) As Long
Declare Function line Lib "ads839.dll" (ByVal plan_ch As Long, ByVal dx As Long, ByVal dy As Long) As Long
Declare Function line3D Lib "ads839.dll" (ByVal plan_ch As Long, ByVal dx As Long, ByVal dy As Long, ByVal dz As Long) As Long
Declare Function arc Lib "ads839.dll" (ByVal plan_ch As Long, ByVal dirc As Long, ByVal x1 As Long, ByVal y1 As Long, ByVal x2 As Long, ByVal y2 As Long) As Long

