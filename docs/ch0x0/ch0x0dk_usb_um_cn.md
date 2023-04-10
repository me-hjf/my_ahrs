# CH0X0DK_USB用户手册

<p style="text-align: right;">CH0X0系列姿态模块调试板, Rev 1.0
<p style="text-align: right;"> 适用于 CH010(M)/CH020(M)/CH040(MP)











<div align="center"><img src="figures/ch040dk_usb.png"  width="50%" height="50%" /</div>







<div style="width:100%">
    <div style="float:left;width 50%" >	文件：CH0X0DK_USB_UM_CN <br><br>     
    									属性：公开</div>  
	<div style="float:right;width 50%">	技术支持：support@hipnuc.com<br><br>
					                	网站：www.hipnuc.com<br></div> 		
</div> 	










<div ><img src="common_figures/logo.png" style="float:right" width="30%" height="30%" /></div>






© 2016-2022, 北京超核电子科技有限公司版权所有，本文档所包含的信息在没有通知的情况下可能会发生更改。

<div STYLE="page-break-after: always;"></div>

文档变更历史

| 版本 | 日期          | 作者   | 变更内容 |
| ---- | ------------- | ------ | -------- |
| V1.0 | 2022年8月18日 | HiPNUC | 初始版本 |

<div STYLE="page-break-after: always;"></div>

[TOC]



## 简介

​		CH0X0DK_USB是专门设计适配CH010(M)、CH020(M)、CH040(MP)姿态模块的调试板，方便客户与自己的设备主机相连接，对模块进行配置，观测数据。产品拥有如下特点：

-  板载USB转UART转换器（CP2102N）
-  2.54排针数据接口 
- 板载CH010(M)、CH020(M)、CH040(MP)模组
- 静电防护IEC61000-4-2 ESD 15KV Air, 8KV contact compliance

### 基本信息

<div align="center"><img src="/figures/ch0x0dk_usb.png"  width="80%" height="80%" /</div>

### 订购信息

| 料号       | 名称                    | 型号          |
| ---------- | ----------------------- | ------------- |
| AE01-11003 | CH010带调试板 USB输出   | CH010DK_USB   |
| AE01-11004 | CH010M带调试板USB输出   | CH010MDK_USB  |
| AE03-13003 | CH020带调试板 USB输出   | CH020DK_USB   |
| AE03-13004 | CH020M带调试板 USB输出  | CH020MDK_USB  |
| AE03-13007 | CH040带调试板 USB输出   | CH040DK_USB   |
| AE03-13008 | CH040MP带调试板 USB输出 | CH040MPDK_USB |

<div STYLE="page-break-after: always;"></div>		

## 机械与电气特性

### CH010DK_USB/CH020DK_USB尺寸

所有标注单位均为mm

<div align="center"><img src="/figures/ch020dk_3v.png"  width="100%" height="100%" /</div>

### CH040DK_USB尺寸

<div align="center"><img src="/figures/ch040dk_3v.png"  width="100%" height="100%" /</div>

<div STYLE="page-break-after: always;"></div>		

### 接口引脚说明

| 引脚 | 名称     | 类型 | 描述                                                         |
| ---- | -------- | ---- | ------------------------------------------------------------ |
| 1    | TXD1     | O    | 模块串口发送 UART TXD (接主机的接收)TTL电平                  |
| 2    | RXD1     | I    | 模块串口接收 UART RXD(接主机的发送) TTL电平                  |
| 3    | TXD2     | O    | 留作将来使用，当前必须悬空                                   |
| 4    | RXD2     | I    | 留作将来使用，当前必须悬空                                   |
| 5    | IO5      | I/O  | 留作将来使用，当前必须悬空                                   |
| 6    | NRST     | I    | 复位, 内部上拉。>10uS 低电平复位模块。无需外接阻容，建议连接主机的GPIO，也可悬空 |
| 7    | CAN_RX   | I    | CAN_RX                                                       |
| 8    | CAN_TX   | O    | CAN_TX                                                       |
| 9    | SYNC_OUT | O    | 数据同步输出, 内部上拉，无数据输出时为高电平 (空闲)，一帧数据开始发送时变为低电平，一帧数据发送完成后，返回高电平(空闲)。不使用时需悬空 |
| 10   | SYNC_IN  | I    | 数据同步输入，内部上拉，当模块检测到下降沿时, 会输出一帧数据。不使用时需悬空 |
| 11   | GND      | 电源 | GND                                                          |
| 12   | VCC      | 电源 | 电源输入                                                     |

### 电气与机械特性

<table>
    <tr align="center">
        <th >类型</th>
        <th>条件</th>
        <th>最小值</th>
        <th>典型值</th>
        <th>最大值</th>
        <th>单位</th>
    </tr>
    <tr align="center">
        <td>电源输入VCC</td>
        <td>-</td>
        <td>4.8</td>
        <td>5</td> 
        <td>5.25</td> 
        <td>V</td> 
    </tr>
     <tr align="center">
        <td rowspan = "3">功耗<i>P</i></td>
        <td>CH010(M)</td>
        <td>-</td>
        <td>-</td>
        <td>162</td>
        <td>mW</td>
       </tr>
    <tr align="center">
        <td>CH020(M)</td>
        <td>-</td>
        <td>-</td>
        <td>215</td>
        <td>mW</td>
       </tr>
       <tr align="center">
        <td>CH040(MP)</td>
        <td>-</td>
        <td>-</td>
        <td>252</td>
        <td>mW</td>
       </tr>
    <tr align="center">
        <td>IO电平</td>
        <td>-</td>
        <td>-0.3</td>
        <td>-</td>
        <td>3.6</td>
        <td>V</td>
       </tr>
          <tr align="center">
        <td>IO电平阈值<i>V</i><sub><i>IH</i></sub></td>
        <td>-</td>
        <td>1.7</td>
        <td>-</td>
        <td>5</td>
        <td>V</td>
       </tr>
      <tr align="center">
        <td>IO电平阈值<i>V</i><sub><i>IL</i></sub></td>
        <td>-</td>
        <td>-</td>
        <td>-</td>
        <td>0.6</td>
        <td>V</td>
       </tr>
      <tr align="center">
        <td>IO电流<i>V</i><sub><i>IO</i></sub></td>
        <td>-</td>
        <td>-20</td>
        <td>-</td>
        <td>20</td>
        <td>mA</td>
       </tr>
    <tr align="center">
     		<td>ESD</td>
        	<td>USB接口</td>
          	<td colspan = "4">±15KV</td>
       </tr>
      <tr align="center">
     		<td>工作储温度</td>
          	<td colspan = "5">-40℃-85℃</td>
       </tr>
    <tr align="center">
       	 	<td>振动冲击</td>
          	<td colspan = "5">2000g</td>
       </tr>
</table>

> 严禁用户在使用过程中超过上述所规定的电流电压范围

<div STYLE="page-break-after: always;"></div>		

## 使用方法

- 安装USB转串口驱动
- 通过USB数据线连接CH0X0DK与PC
- 下载上位机SDK
- 观察上位机数据

> 详细说明请参考CH0X0系列新手指南

<div STYLE="page-break-after: always;"></div>	

## 设计资料

### CH010/CH020DK_USB原理图

<div align="center"><img src="/figures/ch020dk_sch.jpg"  width="100%" height="100%" /</div>

<div STYLE="page-break-after: always;"></div>	

### CH040DK_USB原理图

<div align="center"><img src="/figures/ch040dk_sch.jpg"  width="100%" height="100%" /</div>

<div STYLE="page-break-after: always;"></div>

### CH0X0DK_USB BOM

| Quantity | Reference    | Part                          | Vendor     | Vendor P/N                    |
| -------- | ------------ | ----------------------------- | ---------- | ----------------------------- |
| 2        | C1,C3        | 1uF                           | YAGEO      | CC0402KRX5R7BB105             |
| 1        | C2           | 0.1uF                         | YAGEO      | CC0402KRX5R7BB104             |
| 1        | C13          | 1000pF 1KV                    | FH         | 1206B102K202NT                |
| 2        | C14,C15      | 4.7uF                         | YAGEO      | CC0402MRX5R7BB475             |
| 1        | DN1          | UET14A05L03                   | Brightking | UET14A05L03                   |
| 1        | D1           | RED                           | EVERLIGHT  | 16-213/SDRC/S530-A3/TR8       |
| 1        | F1           | Fuse                          | JK(金科)   | JK-SMD0603-035                |
| 1        | J1           | MICRO USB                     | MOLEX      | 1051640001                    |
| 4        | R1,R2,R3,R4, | 1K                            | YAGEO      | AC0402JR-071KL                |
| 1        | R21          | 1M                            | YAGEO      | RC1206FR-071ML                |
| 1        | U3           | CH010(M)  CH020(M)  CH040(MP) | 超核       | CH010(M)  CH020(M)  CH040(MP) |
| 1        | U2           | CP2012N                       | SiliconLab | CP2102N-A02-GQFN24R           |

<div STYLE="page-break-after: always;"></div>
