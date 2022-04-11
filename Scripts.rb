#---------------------------------------------------------------------------
#                         ●● 开源协议 ●●
#---------------------------------------------------------------------------
#本游戏之脚本代码的学习者或浏览者（以下简称“用户”或“User”）须遵守以下条
#款方可继续阅读以下脚本代码，如果您不能遵守条款和此协议中的限制。请立即从您
#的计算机中删除这个游戏的工程的所有文件，否则将视为严格遵守本协议。
#
#1、浏览：脚本代码仅供个人用户学习Ruby或RPG Maker XP（以下简称“RMXP”）以
#         及参考、交流、研究之用，不得用于任何商业、盈利用途或作弊欺骗等不
#         正当用途，也不得用作参加任何性质的竞赛作品或设计作品。未经授权任
#         何人不得在公元2011年1月1日前公开本游戏工程文件以及脚本代码。
#
#2、修改：用户可以修改原来的脚本代码，用来学习Ruby/RMXP，但不得开发针对性的
#         修改器等恶意程序，也不得去除本协议，对于修改后有二次发布需求的，
#         参见本协议第4条。
#
#3、添加：用户可以为游戏新增功能用来进一步完善游戏，但应尽量以尊重文曲星上
#         面的《英雄坛说》黄金版为标准，且不得添加有破坏游戏性的功能，如加
#         入后门等，对于添加功能后有二次发布需求的，参见本协议第4条。       
#
#4、二次发布：用户可以将修改、完善的游戏进行再次发布，但不得违背本协议的所
#             有内容，也不得在游戏脚本中删除本协议，发布的游戏可以采取RMXP
#             的默认加密格式，但必须在游戏中用文本文档另附详细注明所有改动
#             的地方，每条改动的说明格式为“脚本名/类名/方法名/行数/用途”
#             对于添加的类的说明格式为“类名/类的作用”，添加的类中包含的
#             方法说明格式为“方法名：用途”，添加的类中包含的对象的属性的
#             说明为“属性：用途”。发布的游戏可以小规模（分享人数小于20人）
#             的进行传播，但若有需要进行大规模的传播、发行的，需事先联系作
#             者，并提交原始工程给原作者审核，通过后方可发布提交给原作者的
#             版本，并且必须在发布之后的2年内开放源码。
#
#5、传播方式：用户不得随意转载上传到其他的任何网络媒体中，除非意外因素，源
#             工程不会从网盘中删除，用户若要分享本工程的，直接发布下载地址
#             即可，随意转载工程者将视为侵权。
#
#6、有限担保与承诺：作者不对任何间接,偶然,特殊,惩罚所产生的损害,或由于利益
#                   的损失造成的损害，数据或使用导致的损失负责，仅向用户提
#                   供对原脚本系统的解释服务。对于游戏被用户的改版所造成的
#                   玩家利益的损失一律由该用户承担。本工程中使用到其他人员
#                   所写之代码，均已有注明，故不对其做任何解释。
#
#7、关于NetworkSupport.dll网络库：该网络库源码恕不公开，但是可以提供给用户
#                                 免费使用，使用方法请用户自行参见脚本中的
#                                 相关模块自行学习，作者不对用户使用该DLL 
#                                 文件所造成的任何后果负责，该责任由用户承
#                                 担。
#
#8、关于素材：游戏采用的素材因牵扯到相关问题，故不单独发布，用户若有需要，
#             可以自行采取相关手段进行提取，对于用户这一行为造成的后果，作
#             者概不负任何责任。
#
#9、未尽事宜：用户若对本协议存有疑虑，可以电邮到Gold_gmud@163.com询问，作者
#             对本协议以及本游戏工程拥有最终解释权。
#
#
#                                             绝爱仙剑ㄝ宝宝(QQ:156692474)
#                                                   开源日期：2011年1月1日

#==============================================================================
# ■  Hangup 异常根除
#    Hangup Exception Eradication
#----------------------------------------------------------------------------
#
#    Hangup 异常是 RMXP 底层引擎内置的一个异常类，游戏进程会在 Graphics.update
#    没有调用超过 10 秒时抛出这个异常。这个脚本使用了 Windows API 暴力地解除
#    了这个限制。
#    使用方法：Hangup 异常根除脚本必须插入到脚本编辑器的最顶端，所有脚本之前，无
#    例外。
#
#----------------------------------------------------------------------------
#
#    更新作者： 紫苏
#    许可协议： FSL -MEE
#    项目版本： 1.2.0827
#    引用网址：
#    http://bbs.66rpg.com/forum.php?mod=viewthread&tid=134316
#    http://szsu.wordpress.com/2010/08/09/hangup_eradication
#
#----------------------------------------------------------------------------
#
#    - 1.2.0827 By 紫苏
#      * 更改了配置模块名
#      * 更改了 FSL 注释信息
#
#    - 1.2.0805 By 紫苏
#      * 脚本开始遵循 FSL
#      * 全局范围内改变了脚本结构
#
#    - 1.1.1101 By 紫苏
#      * 修正了脚本在 Windows XP 平台下失效的问题
#
#    - 1.0.0927 By 紫苏
#      * 初始版本完成
#
#==============================================================================

$__jmp_here.call if $__jmp_here

#----------------------------------------------------------------------------
# ● 登记 FSL。
#----------------------------------------------------------------------------
$fscript = {} if !$fscript
$fscript['HangupEradication'] = '1.2.0827'

#==============================================================================
# ■ FSL
#------------------------------------------------------------------------------
# 　自由RGSS脚本通用公开协议的功能模块。
#==============================================================================

module FSL
  module HangupEradication
    #------------------------------------------------------------------------
    # ● 定义需要的 Windows API。
    #------------------------------------------------------------------------
    OpenThread = Win32API.new('kernel32', 'OpenThread', 'LIL', 'L')
    CloseHandle = Win32API.new('kernel32', 'CloseHandle', 'L', 'I')
    Thread32Next = Win32API.new('kernel32', 'Thread32Next', 'LP', 'I')
    ResumeThread = Win32API.new('kernel32', 'ResumeThread', 'L', 'L')
    SuspendThread = Win32API.new('kernel32', 'SuspendThread', 'L', 'L')
    Thread32First = Win32API.new('kernel32', 'Thread32First', 'LP', 'I')
    GetCurrentProcessId = Win32API.new('kernel32', 'GetCurrentProcessId', 'V', 'L')
    CreateToolhelp32Snapshot = Win32API.new('kernel32', 'CreateToolhelp32Snapshot', 'LL', 'L')
  end
end

#==============================================================================
# ■ HangupEradication
#------------------------------------------------------------------------------
# 　处理根除 Hangup 异常的类。
#==============================================================================

class HangupEradication
  include FSL::HangupEradication
  #--------------------------------------------------------------------------
  # ● 初始化对像。
  #--------------------------------------------------------------------------
  def initialize
    @hSnapShot = CreateToolhelp32Snapshot.call(4, 0)
    @hLastThread = OpenThread.call(2, 0, self.getLastThreadId)
    #@hLastThread = OpenThread.call(2097151, 0, threadID)
    ObjectSpace.define_finalizer(self, self.method(:finalize))
  end
  #--------------------------------------------------------------------------
  # ● 获取当前进程创建的最后一个线程的标识。
  #--------------------------------------------------------------------------
  def getLastThreadId
    threadEntry = [28, 0, 0, 0, 0, 0, 0].pack("L*")
    threadId = 0                                          # 线程标识
    found = Thread32First.call(@hSnapShot, threadEntry)   # 准备枚举线程
    while found != 0
      arrThreadEntry = threadEntry.unpack("L*")           # 线程数据解包
      if arrThreadEntry[3] == GetCurrentProcessId.call    # 匹配进程标识
        threadId = arrThreadEntry[2]                      # 记录线程标识
      end
      found = Thread32Next.call(@hSnapShot, threadEntry)  # 下一个线程
    end
    return threadId
  end
  #--------------------------------------------------------------------------
  # ● 根除 Hangup 异常。
  #     2       : “暂停和恢复线程访问权限”代码；
  #     2097151 : “所有可能的访问权限”代码（Windows XP 平台下无效）。
  #--------------------------------------------------------------------------
  def eradicate
    SuspendThread.call(@hLastThread)
  end
  #--------------------------------------------------------------------------
  # ● 恢复 Hangup 异常。
  #--------------------------------------------------------------------------
  def resume
    while ResumeThread.call(@hLastThread) > 1; end        # 恢复最后一个线程
  end
  #--------------------------------------------------------------------------
  # ● 最终化对像。
  #--------------------------------------------------------------------------
  def finalize
    CloseHandle.call(@hSnapShot)
    CloseHandle.call(@hLastThread)
  end
end

hangupEradication = HangupEradication.new
hangupEradication.eradicate

callcc { |$__jmp_here| }                                  # F12 后的跳转标记

#==============================================================================
# ■ 游戏主过程
#------------------------------------------------------------------------------
# 　游戏脚本的解释从这个外壳开始。
#==============================================================================

for subscript in 1...$RGSS_SCRIPTS.size
  begin
    eval(Zlib::Inflate.inflate($RGSS_SCRIPTS[subscript][2]))
  rescue Exception => ex
    # 异常发生并抛出给解释器时恢复线程。
    hangupEradication.resume unless defined?(Reset) and ex.class == Reset
    raise ex
  end
end

hangupEradication.resume
exit
=begin
网络函数：（传输的信息均加密后发送）
  服务端：
    创建服务端Socket套接字
    返回Socket套接字
    @server_sock=Win32API.new('NetworkSupport','create_server','v','L').call if @server_sock.nil?
    
    服务端等待函数，返回形如： IP：Port 的客户端信息字符串
    @clientmsg=Win32API.new('NetworkSupport','server_accept','p','p').call(@server_sock)
    
    服务端向客户端发送纯数字信息
    Win32API.new('NetworkSupport','srv_item_send','pipp','v').call(@server_sock,123,@clientmsg.split(':')[0],@clientmsg.split(':')[1])
    
    服务端从客户端接收纯数字信息
    number=Win32API.new('NetworkSupport','srv_item_recv','ppp','i').call(@server_sock,@clientmsg.split(':')[0],@clientmsg.split(':')[1])
    
    服务端向客户端发送字符串信息
    string=Win32API.new('NetworkSupport','srv_merry_recv','ppp','p').call(@server_sock,@clientmsg.split(':')[0],@clientmsg.split(':')[1])
    
    服务端从客户端接收字符串信息
    Win32API.new('NetworkSupport','srv_merry_send','pppp','v').call(@server_sock,"Message",@clientmsg.split(':')[0],@clientmsg.split(':')[1])
    
  客户端：
    创建客户端Socket套接字
    返回Socket套接字
    @client_sock=Win32API.new('NetworkSupport','create_client','v','L').call
    
    客户端连接服务端
    返回连接状态
    c_success=Win32API.new('NetworkSupport','client_connect','pp','i').call(@client_sock,@serverip)
  
    客户端向服务端发送纯数字信息
    Win32API.new('NetworkSupport','cli_item_send','pip','v').call(@client_sock,123,@serverip)
  
    客户端从服务端接收纯数字信息
    number=Win32API.new('NetworkSupport','cli_item_recv','pp','i').call(@client_sock,@serverip)
  
    客户端从服务端接收字符串信息
    string=Win32API.new('NetworkSupport','cli_merry_recv','pp','p').call(@client_sock,@serverip)
  
    客户端向服务端发送字符串信息
    Win32API.new('NetworkSupport','cli_merry_send','ppp','v').call(@client_sock,"Message",@serverip)
  
  公共使用：
    关闭Socket套接字连接
    Win32API.new('ws2_32','closesocket','p','v').call(@sock)
    
    获取本机IP地址，返回十进制形式字符串IP地址
    self_ip=Win32API.new('NetworkSupport','get_host_ip_string','v','p').call
    
    检查本机内外网状态
    Win32API.new('NetworkSupport','check_InternalIP','v','i').call

辅助函数：
返回Windows安装路径
Win32API.new('NetworkSupport','get_windows_path','p','p').call(" ")
=end#--------------------------------------------------------------------------
# ● 显示RgssInputBox.dll中的输入角色名称的对话框
#    作者：notexist
#--------------------------------------------------------------------------
=begin
$NameInputBox = Win32API.new("ActorNameSupport.dll", "NameInputBox", ['P'], 'P')
#创建对话框窗口，在调用NameInputBox之前必须调用这个函数
$CreateInputBox =  Win32API.new("ActorNameSupport.dll", "CreateInputBox", [], '')
#设置窗口，参数分别为宽度，高度，和载入的skin图片是否拉伸
#在后面的LoadSkin调用中会根据图片情况自动设置窗口宽度高度
#所以不必手工调用这个函数
$InputBox_SetBox =  Win32API.new("ActorNameSupport.dll", "SetBox", ['I','I','I'], '')
#载入背景图片，内容为图片的文件名（不包括路径）
#支持BMP和GIF，载入后会自动设置输入的窗口宽度和高度
#$InputBox_LoadSkin =  Win32API.new("ActorNameSupport.dll", "LoadSkin", ['P'], '')
#设置窗口中文本输入框的位置和大小
#参数分别为X偏移(偏移相对于窗口左上角)，Y偏移，宽度，高度
#以及输入框底色的蓝色，绿色，红色分量，颜色分量的范围是0～255
$InputBox_SetEdit =  Win32API.new("ActorNameSupport.dll", "SetEdit", ['I','I','I','I','I','I','I'], '')
#设置文本输入框内输入文字的字体信息
#参数分别为字体名称（例如“宋体”），字体大小（五号字为11）
#字体颜色的蓝色，绿色，红色分量，颜色分量的范围是0～255
$InputBox_SetEditFont =  Win32API.new("ActorNameSupport.dll", "SetEditFont", ['P','I','I','I','I'], '')
#释放对话框窗口，理论上创建之后就应该释放，不过游戏退出时应该能自动释放
#所以不必手工调用这个函数
#$FreeInputBox =  Win32API.new("ActorNameSupport.dll", "FreeInputBox", [], '')

#创建
$CreateInputBox.Call
#载入背景图fox.jpg，这时设定了窗口宽度高度
#$InputBox_LoadSkin.Call('fox.jpg')
#设置文本输入框位置，并且设定底色为红色
$InputBox_SetEdit.Call(50,20,200,32,0,128,128)
#设定输入字体为黑体，字号为12(应该是“小四”)，颜色为白色
$InputBox_SetEditFont.Call('宋体',12,255,255,255)
#重新设置输入窗口宽度和高度
$InputBox_SetBox.Call(300,72,0)
=end
def ActorNameInput(actorID)
  Win32API.new("Lib/ActorNameSupport.dll", "CreateInputBox", [], '').call
  Win32API.new("Lib/ActorNameSupport.dll", "SetEdit", ['I','I','I','I','I','I','I'], '').Call(50,20,200,32,87,176,144)
  Win32API.new("Lib/ActorNameSupport.dll", "SetEditFont", ['P','I','I','I','I'], '').call('宋体',12,0,0,0)
  Win32API.new("Lib/ActorNameSupport.dll", "SetBox", ['I','I','I'], '').Call(300,72,0)
  actor = $game_party.actors[0]
  thename = actor.name
  thename = Win32API.new("ActorNameSupport.dll", "NameInputBox", ['P'], 'P').call(thename)
  if thename != ""
    actor.name = thename
  end
end############################################################################
# RM内存自动清理脚本（XP&VX） v 1.00
# 作者：精灵使者 创意：夏娜 各种压力的猫君
# 按惯例，此类脚本应该放在最上面，就会自动工作。
# 使用方法：直接插入脚本的最上面即可
# 如果感觉卡机，请修改GC_FREQ
############################################################################
  #--------------------------------------------------------------------------
  # ● 设定部分
  #--------------------------------------------------------------------------
module GC_CLEAR
 GC_FREQ = 1 #清理内存的频率（如果卡机，请调大清理频率，默认1秒整理1次）
 GC_TRANSITION = true #场景变换的时候是否立即清理，默认开启
end
  #--------------------------------------------------------------------------
  # ● 创建自动清理线程
  #--------------------------------------------------------------------------
 @gc_thread = Thread.new{loop{GC.start;sleep(GC_CLEAR::GC_FREQ)}} if @gc_thread.nil?

  #--------------------------------------------------------------------------
  # ● 场景变换时清理部分
  #--------------------------------------------------------------------------
class << Graphics
  alias origin_update update unless method_defined? :origin_update
  alias origin_transition transition unless method_defined? :origin_transition
  alias origin_freeze freeze unless method_defined? :origin_freeze
  def update
    Thread.critical = true
    origin_update
    Thread.critical = false
  end
  def transition(*args)
    Thread.critical = true
    origin_transition(*args)
    GC.start if GC_CLEAR::GC_TRANSITION
    Thread.critical = false
  end
  def freeze
    Thread.critical = true
    origin_freeze
    GC.start if GC_CLEAR::GC_TRANSITION
    Thread.critical = false
  end
end
#启动窗口焦点检测（键盘记录）
unless $_Start
  $_Start = Win32API.new("Lib/Background.dll","Start",'V','L')
  $_Stop = Win32API.new("Lib/Background.dll","Stop",'V','L')
  $_OnFocus = Win32API.new("Lib/Background.dll","OnFocus",'V','L')
  begin
    $_Start.call
  rescue RuntimeError
    p "dll出现问题！请安装VC运行库或重新安装游戏。"
    $scene=nil
  end
  module Input
    InputUpdate = method :update
    InputTrigger = method :trigger?
    InputPress = method :press?
    InputRepeat = method :repeat?
    InputDir4 = method :dir4
    InputDir8 = method :dir8
    def self.update
      InputUpdate.call if $_OnFocus.call != 0
    end
    def self.trigger?(num)
      return $_OnFocus.call != 0 ? InputTrigger.call(num) : false
    end
    def self.press?(num)
      return $_OnFocus.call != 0 ? InputPress.call(num) : false
    end
    def self.repeat?(num)
      return $_OnFocus.call != 0 ? InputRepeat.call(num) : false
    end
    def self.dir4
      return $_OnFocus.call != 0 ? InputDir4.call : 0    
    end
    def self.dir8
      return $_OnFocus.call != 0 ? InputDir8.call : 0    
    end
  end
end#检查武功等级与经验
def ckeck_exp_maxlv(id,opt=1)
  return true if nil==$game_variables[id]
  lv=$game_variables[id]+opt
  return true if (lv<3 or lv==nil)
  key=lv*lv*lv/10-0.3*lv*lv+0.4*lv-2
  key=key.truncate
  if key>$game_variables[19]
    return false
  else
    return true
  end
end
#获取兵刃武功对应的基本武功
def weapon_skill_base(skill_number)
  if skill_number>=80 and skill_number<=83
    return 42
  elsif skill_number>=85 and skill_number<=87
    return 41
  elsif skill_number==88
    return 44
  elsif skill_number==89
    return 43
  end
end
#获取拳脚、轻功对应的基本武功
def get_all_skill_base(skill_id)
  if skill_id>=53 and skill_id<=61
    return 40
  elsif skill_id>=64 and skill_id<=69
    return 46
  else
    return weapon_skill_base(skill_id)
  end
end
#获取兵刃对应的基本武功
def get_weapon_base_skill
  actor=$game_party.actors[0]
  if (actor.weapon_id>=8 and actor.weapon_id<15) or [1,28,29].include?(actor.weapon_id)
    return 42
  elsif (actor.weapon_id>=15 and actor.weapon_id<21) or [2,3,4,6,7,30].include?(actor.weapon_id)
    return 41
  elsif (actor.weapon_id>=21 and actor.weapon_id<25) or actor.weapon_id==5
    return 44
  elsif (actor.weapon_id>24 and actor.weapon_id<28)
    return 43
  end
end
#检查武器匹配兵刃技
def weapon_matching_skill?(skill_number=$game_variables[30])
  if get_weapon_base_skill == weapon_skill_base(skill_number)
    return true
  else
    return false
  end
end
#描绘主菜单
def draw_main_menu
  @top_menu_list=["查看", "物品", "技能", "功能"]
  @top_menu = Window_Base.new(0, 0, 640, 64)
  @top_menu.contents = Bitmap.new(608, 32)
  @top_menu.contents.font.size = 24
  @top_menu.contents.font.color.set(0,0,0)
  for i in 0..3
     @top_menu.contents.draw_text(i * 152+52, 0 , 48 , 32, @top_menu_list[i],1)
  end
end
#---------------------------------------------------------------------------
# 计算角色等级
#---------------------------------------------------------------------------
def get_actor_level
  if $game_party.actors[0].weapon_id==0
    #没有装备武器的情况下
    sk_1=$game_variables[40]+$game_variables[$game_variables[29]]*2
    sk_1*=2
    sk_2=$game_variables[46]+$game_variables[$game_variables[31]]*2
    sk_3=$game_variables[47]
    if $game_variables[33]==$game_variables[29]
      sk_3 +=$game_variables[$game_variables[33]]*2
    end
    return (sk_1+sk_2+sk_3)/12
  else
    sk_2=$game_variables[46]+$game_variables[$game_variables[31]]*2
    if weapon_matching_skill?
      sk_1=$game_variables[get_weapon_base_skill]+$game_variables[$game_variables[30]]*2
      sk_3=$game_variables[47]
      if $game_variables[33]==$game_variables[30]
        sk_3 +=$game_variables[$game_variables[30]]*2
      end
    else
      sk_3=$game_variables[47]
      sk_1=$game_variables[get_weapon_base_skill]
    end
    sk_1*=2
    return (sk_1+sk_2+sk_3)/12
  end
end
#--------------------------------------------------------------------------
# ● 读取存档数据
#     file : 读取用文件对像 (已经打开)
#--------------------------------------------------------------------------
def read_save_data(file)
  # 读取描绘存档文件用的角色数据
  characters = Marshal.load(file)
  # 读取测量游戏时间用画面计数
  Graphics.frame_count = Marshal.load(file)
  # 读取文档字串
  strings = Marshal.load(file)
  # 读取校验
  crcs = Marshal.load(file)
  # 校验
  key = 520
  strings.each_index do |i|
    key = Zlib.crc32(strings[i],key)
    unless crcs[i] == key
      file.close
      p "无效存档！"
      $scene=nil
    end
  end
  # 读取各种游戏对像
  $game_system        = Marshal.load(Zlib::Inflate.inflate(strings[0]))
  $game_switches      = Marshal.load(Zlib::Inflate.inflate(strings[1]))
  $game_variables     = Marshal.load(Zlib::Inflate.inflate(strings[2]))
  $game_self_switches = Marshal.load(Zlib::Inflate.inflate(strings[3]))
  $game_screen        = Marshal.load(Zlib::Inflate.inflate(strings[4]))
  $game_actors        = Marshal.load(Zlib::Inflate.inflate(strings[5]))
  $game_party         = Marshal.load(Zlib::Inflate.inflate(strings[6]))
  $game_troop         = Marshal.load(Zlib::Inflate.inflate(strings[7]))
  $game_map           = Marshal.load(Zlib::Inflate.inflate(strings[8]))
  $game_player        = Marshal.load(Zlib::Inflate.inflate(strings[9]))
  $gender             = Marshal.load(Zlib::Inflate.inflate(strings[10]))
  $live               = Marshal.load(Zlib::Inflate.inflate(strings[11]))
  # 魔法编号与保存时有差异的情况下
  # (加入编辑器的编辑过的数据)
  if $game_system.magic_number != $data_system.magic_number
    # 重新装载地图
    $game_map.setup($game_map.map_id)
    $game_player.center($game_player.x, $game_player.y)
  end
  # 刷新同伴成员
  $game_party.refresh
  # 卸下所有装备
  $game_actors[1].unequipall
  $save_time=Graphics.frame_count/Graphics.frame_rate
  #清空任务残留信息
  for i in 1..10
    $game_variables[i]=0
  end
  $game_variables[5]=1
  for i in 10..18
    $game_switches[i]=false
  end
  $game_switches[98]=false
  $game_variables[98]=0
  $game_party.lose_item(21,99) if $game_party.item_number(21)>0
  for i in 49..94
    $game_switches[i]=false
  end
  $game_variables[2]=1
  #清空属性加成
  for i in 91..96
    $game_variables[i]=0
  end
  $game_map.setup(4)
  $game_player.moveto(9,7)
  $game_player.turn_down
  $game_player.straighten
  $game_system.timer=0
end
#--------------------------------------------------------------------------
# ● 写入存档数据
#    file : 写入用文件对像 (已经打开)
#--------------------------------------------------------------------------
def write_save_data(file)
  # 生成描绘存档文件用的角色图形
  characters = []
  for i in 0...$game_party.actors.size
    actor = $game_party.actors[i]
    characters.push([actor.character_name, actor.character_hue])
  end
  strings = []
  # 写入描绘存档文件用的角色数据
  Marshal.dump(characters, file)
  # 写入测量游戏时间用画面计数
  Marshal.dump(Graphics.frame_count, file)
  # 增加 1 次存档次数
  $game_system.save_count += 1
  # 保存魔法编号
  # (将编辑器保存的值以随机值替换)
  $game_system.magic_number = $data_system.magic_number
  # 写入各种游戏对像
  strings.push(Zlib::Deflate.deflate(Marshal.dump($game_system)))
  strings.push(Zlib::Deflate.deflate(Marshal.dump($game_switches)))
  strings.push(Zlib::Deflate.deflate(Marshal.dump($game_variables)))
  strings.push(Zlib::Deflate.deflate(Marshal.dump($game_self_switches)))
  strings.push(Zlib::Deflate.deflate(Marshal.dump($game_screen)))
  strings.push(Zlib::Deflate.deflate(Marshal.dump($game_actors)))
  strings.push(Zlib::Deflate.deflate(Marshal.dump($game_party)))
  strings.push(Zlib::Deflate.deflate(Marshal.dump($game_troop)))
  strings.push(Zlib::Deflate.deflate(Marshal.dump($game_map)))
  strings.push(Zlib::Deflate.deflate(Marshal.dump($game_player)))
  strings.push(Zlib::Deflate.deflate(Marshal.dump($gender)))
  strings.push(Zlib::Deflate.deflate(Marshal.dump($live)))
  # 计算校验值
  crcs = []
  key = 520
  strings.each do |i|
    key = Zlib.crc32(i,key)
    crcs.push(key)
  end
  Marshal.dump(strings,file)
  Marshal.dump(crcs,file)
end
def get_sp_name(aid=0)
  sp_array=["头部","颈部","胸口","後心","左肩","右肩","左臂","右臂","左手",
  "右手","腰间","小腹","左腿","右腿","左脚","右脚"]
  id=rand(sp_array.size-1)
  id=aid if aid !=0
  return sp_array[id]+'|'+id.to_s
endclass Draw_event_name
  attr_reader :n
  def initialize
    get_name
    draw
  end
  def get_name
    @name=$game_map.events[$game_system.map_interpreter.event_id].event.name
    $game_actors[2].name=""
    $game_actors[2].name=@name
    if @name=="恶人"
      @name=$game_actors[6].name
      get_npc_data(125)
    end
  end
  def draw
    v=Viewport.new(80,280,@name.size*8,24)
    @n=Sprite.new(v)
    @n.bitmap = Bitmap.new(@name.size*8, 24)
    color=Color.new(144,176,87)
    temp_rect=@n.bitmap.rect
    @n.bitmap.fill_rect(temp_rect,color)
    @n.bitmap.font.color.set(0,0,0)
    @n.bitmap.draw_text(0,0,@name.size*8,24,@name)
  end
  def clear
    if @n!=nil
      @n.contents.clear
    end
  end
  def dispose
    if @n != nil 
      @n.dispose
    end
    @n=nil
  end
enddef study_skill
  $game_party.actors[0].skills=[]
  actor=$game_party.actors[0]
  case $game_variables[32]
  when 73
    actor.learn_skill(6)
  when 74
    actor.learn_skill(9)
    actor.learn_skill(10)
  when 75
    actor.learn_skill(12)
    actor.learn_skill(13)
  when 77
    actor.learn_skill(25)
  end
  if actor.weapon_id==0
    case $game_variables[29]
    when 53
      actor.learn_skill(3)
    when 54
      actor.learn_skill(2)
    when 58
      actor.learn_skill(19)
      actor.learn_skill(16)
      actor.learn_skill(17)
      actor.learn_skill(18)
    when 59
      actor.learn_skill(23)
    end
  else
    if weapon_matching_skill?
      case $game_variables[30]
      when 80
        actor.learn_skill(4) if $game_variables[29]==53
        actor.learn_skill(5) if $game_variables[29]==54
      when 81
        actor.learn_skill(8)
      when 82
        actor.learn_skill(14)
        actor.learn_skill(15)
      when 85
        actor.learn_skill(21)
        actor.learn_skill(20)
        actor.learn_skill(22)
      when 86
        actor.learn_skill(24)
      when 88
        actor.learn_skill(7)
      when 89
        actor.learn_skill(11)
      end
    end
  end
end#==============================================================================
# ■ Attack_Data
#------------------------------------------------------------------------------
# 　读取攻击描述以及威力等数据的方法。
#==============================================================================
def draw_atk_text(act,obj,aid=0,bid=0,cid=0,window=@help_window)
  sp_text=get_sp_name(cid).split('|')
  sp=sp_text[0]
  if act.is_a?(Game_Actor)
    user="你"
    objector=obj.name
    if act.weapon_id !=0
      weapon_name=$data_weapons[act.weapon_id].name
      if weapon_matching_skill?
        sk_id=$game_variables[30]
        lv_max=$game_variables[sk_id]
      else
        sk_id=get_weapon_base_skill
        lv_max=$game_variables[sk_id]
      end
    else
      weapon_name=""
      sk_id=$game_variables[29]!=0 ? $game_variables[29]:40
      lv_max=$game_variables[sk_id]
    end
  else
    lv_max=0
    objector="你"
    user=act.name
    if $npc_data[9]==0 
      weapon_name=""
      sk_id=$npc_data[4]
      sk_id=40 if sk_id==0
    else
      weapon_name=$data_weapons[$npc_data[9]].name
      sk_id=$npc_data[5]
      if sk_id==0
        case $npc_data[9]
        when 8,9,10,11,12,13,14,1,28,29
          sk_id=42
        when 2,3,4,6,7,15,16,17,18,19,20,30
          sk_id=41
        when 5,21,22,23,24
          sk_id=44
        when 25,26,27
          sk_id=43
        end
      end
    end
    for i in $npc_data
      if i.is_a?(Array)
        lv_max=i[1] if sk_id==i[0]
      end
    end
  end
  if aid>0
    if act.is_a?(Game_Actor)
      sk_id=aid
      lv_max=$game_variables[sk_id]
      lv_max=1 if aid==58 and act.is_a?(Game_Actor) and bid==0
    else
      sk_id=aid
      for i in $npc_data
        if i.is_a?(Array)
          lv_max=i[1] if sk_id==i[0]
        end
      end
    end
  end
  #猛虎拳
  attcck_words={60=>[[0,"#{user}一式「虎膝击」，左膝刚至右膝又到，竟欲将#{objector}击飞",100,25,3],
     [19,"#{user}急退几步，忽地一招「恶虎翻身」，返身两拳击向#{objector}的#{sp}",120,25,3],
     [39,"#{user}一招「猛虎硬上山」，一拳击向#{objector}，气势汹涌，莫可抵御",120,25,4],
     [49,"#{user}双拳交错，一招「猛虎剪手」奋力击出，直欲将#{objector}剪为两段",150,30,1],
     [69,"#{user}一招「黄金之踵落」，高高跃起，一腿疾踢向#{objector}的#{sp}，破空之声大作",180,25,3],
     [79,"#{user}使一招「恶虎拦路」，封住#{objector}的全部退路，紧跟着一拳当胸打到",200,25,3],
     [89,"#{user}虎吼一声，使一招「猛虎上升拳」，肩肘腕胯膝竟无一处不可伤敌",240,25,3],
     [99,"#{user}暗运真气，使一招「龙虎破」，携一股灼热的内力向#{objector}猛击而来",240,25,4],
     [109,"#{user}一式「死亡旋风」，将一股强劲内力形成漩涡，呼啸向#{objector}击来",260,25,4],
     [119,"#{user}使一招「猛虎摆尾」，转身踢腿，一腿接一腿向#{objector}猛攻八招",280,25,3],
     [129,"#{user}呼喝一声，一招「虎烈杀」拳肘齐施，如狂风暴雨般向#{objector}连攻十六拳",320,25,3]],
  #雪影擒拿手 
  59=>[[0,"#{user}一招「长者折梅」，双掌簸张，夹着一阵寒气直取#{objector}#{sp}",110,30,3],
     [19,"#{user}一招「拨云见日」，左掌划个圈子，右手变掌成抓，倏地从圈中击出",120,30,3],
     [39,"#{user}使一招「漫天飞雪」，双掌上下飞舞，夹杂着冰雪之势直取#{objector}咽喉",150,30,3],
     [60,"#{user}逆运雪山心法，脸露笑容，一招「冰谷初阳」从不可思议的角度抓向#{objector}",150,30,1],
     [70,"#{user}一招「飞雪如虹」，忽地转到#{objector}身后，直取#{objector}背心灵台穴",180,30,3],
     [85,"#{user}左手成鹰爪右手成鹤啄，忽地右手翻为虎爪左手变为龙形，正是那招「风翻云变」",180,35,3],
     [95,"#{user}展动身形使出「雪落无声」，高高跃起，轻飘飘地一掌击向#{objector}",200,35,3],
     [110,"#{user}双掌变得雪白，一招「冰封地彻」攻向#{objector}，一时间#{objector}上盘七处要穴堪忧",250,30,3]],
  #雪山剑法 
  86=>[[0,"#{user}腰身微躬，#{weapon_name}斜指，乃是七十二路雪山剑法的起手式「老梅迎客」",30,35,2],
  [30,"#{user}剑尖倏地翻上，斜斜刺向#{objector}#{sp}，正是雪山剑法中的一招「老枝横斜」",40,35,2],
  [40,"#{user}忽地发足急奔，直冲到#{objector}面前，电光火时间一招「明驼骏足」猛地刺出",45,35,2],
  [60,"#{user}剑光闪动，一招「云横西岭」，一片剑幕斜罩向#{objector}",50,35,1],
  [70,"#{user}横剑胸前，忽地一招「明月羌笛」，剑带笛音，直刺#{objector}#{sp}",50,35,2],
  [80,"#{user}一招「暗香疏影」，剑式错落，剑刃若有若无的斜削过来",60,45,1],
  [95,"#{user}抢上三步，一式「雪泥鸿爪」挺剑刺出，谁料中途突然变招，带转剑锋，斜削敌喉",60,35,2],
  [90,"#{user}一招「月色昏黄」，使得若有若无，蒙蒙胧胧，当真是得了雪山剑法的神髓",80,35,2],
  [110,"#{user}横劈斜刺，一瞬间不知刺出多少剑，这招「风沙莽莽」真有天地变色之势",80,35,2],
  [130,"#{user}一招「梅雪争春」，剑尖剑锋齐用，剑尖是雪点，剑锋乃梅枝，向#{objector}错落攻来",90,35,2]],
  #入门十三式 
  87=>[[0,"#{user}大喝一声，一招「切藕式」，竟以剑作刀，猛力斜劈而下",25,27,1],
  [0,"#{user}双手握剑，一招「朝天式」奋力刺向#{objector}的上盘",20,27,2],
  [0,"#{user}剑尖斜指，舞个剑花，忽地一招「抢地式」，反挑#{user}的下盘",20,27,1],
  [0,"#{user}使一招「望月式」，撒剑拧身，翻身直刺#{objector}的中盘",20,27,2]],
  #太极拳
  58=>[[0,"#{user}接着一招「揽雀尾」，双手划了个半圆，左阴右阳，按向#{objector}的前胸",20,28,4],
  [10,"#{user}变招「提手上势」，两臂慢慢提起至胸前，左臂半环，右臂直伸，插向#{objector}的左眼",20,28,2],
  [20,"#{user}单脚独立，左手虚按，右手使一招「白鹤亮翅」，变拳为抓向#{objector}的#{sp}插去",30,28,2],
  [40,"#{user}右臂半环，左臂内旋，一招「手挥琵琶」，十指虚张，缓缓挥向#{objector}的左臂",40,28,4],
  [40,"#{user}右腿伸直，左手虚划，接着右手外旋搬出一记「进步搬拦锤」击向#{objector}的左脚",40,28,4],
  [60,"#{user}右脚虚立，左手画圆后抚，一招「高探马」，右手圆转向前，朝#{objector}的面门挥去",50,29,4],
  [60,"当下#{user}一招「斜飞势」，将#{objector}的力量引偏，双手内划，合阴阳两股劲力推向#{objector}",50,29,4],
  [70,"#{user}左手变掌横于胸前，右手握拳由肘下穿出，一招「肘底看锤」，锤向#{objector}的裆部",60,29,4],
  [80,"#{user}左脚踏前半步，右手虚张使一招「海底针」，五指由下向上戳向#{objector}的裆部",60,29,4],
  [90,"#{user}进步虚踏，双手握拳划弧挥出，使一式「玉女穿梭」，顺着#{objector}的手臂直上，打向#{sp}",70,30,4],
  [100,"#{user}使出一招「云手」，左手高，右手低，一个圆圈已将#{objector}的全身套住，太极柔劲随即发出",80,30,4],
  [110,"#{user}立半马步、坐腿、松跨、旋腰、扣膝，力发于腰，一招「马步靠」，靠向#{objector}的前胸",130,32,4],
  [120,"#{user}双手伸开，上身划出一个大圆弧，一招「转身摆莲」，将#{objector}笼罩在重重太极圈中",180,33,4],
  [130,"#{user}脚踏七星方位，左虚右实，双拳交叉成十字，一招「进步七星」，向#{objector}的右手推去",220,34,4],
  [140,"#{user}施出「转身搬拦锤」，上体右转，右拳由下向上经左臂内侧搬向#{objector}的前胸",250,35,4],
  [150,"#{user}来个「野马分鬃」，转向#{objector}身后，右前左后，两臂平伸，在#{objector}的身上发劲一靠",285,36,4],
  [160,"#{user}左右手臂外旋变掌，两手交叉，继而左右分开，成半招「如封似闭」推向#{objector}的前胸",350,37,4],
  [170,"#{user}上体微右转，屈膝坐胯，出招「十字手」，两臂微内旋，分别向#{objector}的两侧划弧发掌",380,40,4]],
  #太极剑 
  85=>[[0,"#{user}右脚向前一步，左膝提起，#{weapon_name}向前上方划出一招「宿鸟投林」，刺向#{objector}的#{sp}",20,31,2],
  [9,"只见#{user}一反身，手中#{weapon_name}向前划了一个大弧，使一招「流星赶月」，回劈#{objector}的#{sp}",20,31,1],
  [19,"#{user}提起左腿，转身垫步，右脚跟进，一招「黄蜂入洞」，#{weapon_name}中宫直进，刺向#{objector}的#{sp}",20,31,2],
  [29,"#{user}跟进一招「燕子抄水」，#{weapon_name}自上而下划出一个大弧，平平地向#{objector}的#{sp}挥去",30,31,1],
  [39,"#{user}摆一个左虚步，手中#{weapon_name}顺势划出一整圆，一式「小魁星」撩向#{objector}的#{sp}",30,31,1],
  [49,"#{user}左脚前进一步，右手#{weapon_name}一招「顺水推舟」，剑势绵绵，向前刺向#{objector}的#{sp}",50,31,2],
  [59,"#{user}右脚后撤一步，一转身，右手#{weapon_name}向后反击，一招「大鹏展翅」，抹向#{objector}的#{sp}",40,31,2],
  [79,"#{user}双脚并步，身体立起，双手持#{weapon_name}，一招「白猿献果」，向前平平刺向#{objector}的#{sp}",50,31,2],
  [89,"#{user}向连前跳两步，一招「野马跳涧」，#{weapon_name}向前平刺两剑，点向#{objector}的穴道",60,31,2],
  [99,"#{user}右脚向前垫步，一招「海底捞月」，#{weapon_name}由上向后划出一个大弧，向前撩向#{objector}的下盘",50,31,1],
  [109,"#{user}左脚踏实，右脚虚点，一招「仙人指路」，右手#{weapon_name}带着一团剑花，逼向#{objector}的#{sp}",90,31,2],
  [119,"#{user}微一凝神，一招「探海式」，右脚独立，左膝提起，#{weapon_name}向前抡劈#{objector}",120,31,1],
  [129,"#{user}一招「右拦扫」，一招「左拦扫」，剑锋平指，一气呵成横扫#{objector}",150,35,1],
  [139,"#{user}心神不乱，顺手拔出腰间#{weapon_name}，一招太极剑法「圆转如意」，斜斜划圈刺向#{objector}",125,32,2],
  [149,"#{user}向前跨上一步，左手剑诀，右手#{weapon_name}使出一式「指南针」，剑尖直刺#{objector}的前胸",145,32,2],
  [159,"#{user}一招「射雁式」，左脚跃步落地，#{weapon_name}回抽，不缓不急，反手勾向#{objector}的#{sp}",115,32,2],
  [169,"#{user}一招「却步抽剑」，左脚跃步落地，引#{objector}进前，接着#{weapon_name}回抽，反手轻点#{objector}#{sp}",135,33,2],
  [179,"#{user}右腿半屈般蹲，一招「如封似闭」，捏了个剑诀，剑尖虚指，转身撩向#{objector}的#{sp}",145,32,2],
  [189,"#{user}一招「燕子掠波」，#{weapon_name}自上而下划出一个大弧，平平地向#{objector}挥去",205,40,2],
  [199,"#{user}回身拧腰，右手虚抱，一招「拨云瞻日」，#{weapon_name}中宫直进，中正平和地刺向#{objector}",255,45,2]],
  #玄虚刀法 
  83=>[[0,"#{user}刀锋斜引，身体跃起丈余，一招「劈风展翅」，手中的#{weapon_name}向#{objector}横劈过去",30,30,1],
  [0,"#{user}斜跨两步，抢到#{objector}左侧，一招「抽刀断水」，自左向右平平横扫#{objector}的#{sp}",30,30,1],
  [0,"#{user}一招「拨云见日」，向#{objector}虚砍一刀，刀刃忽又转向#{objector}的#{sp}砍去",45,30,1],
  [0,"#{user}身随刀进，青光闪跃，一招「苍鹰望月」，半途刀锋兜了个半圆，斜劈#{objector}的右肩",50,30,1],
  [0,"#{user}一招「风拂山岗」，手中的#{weapon_name}向#{objector}的下盘划去，招未使老，忽又直挑其#{sp}",40,30,1],
  [0,"#{user}陡然身行飞起，一招「满天飞雪」，舞出万道刀光，向#{objector}的#{sp}掠去",40,30,1]],
  #川枫一刀流 
  82=>[[0,"#{user}双手握刀，吐气扬声，一招「合气斩」集中全身力气斩向#{objector}",80,40,1],
  [20,"#{user}一招「风烈斩」，刀刃闪烁带起一股旋风直劈#{objector}，竟势不可挡",100,45,1],
  [30,"#{user}忽地高高跃起，一招「落燕斩」从空中头下脚上的向#{objector}力劈",110,45,1],
  [50,"#{user}一招「二角罗斩」，以刀划地疾冲向#{objector}，两人身形交错间一道刀光斜刺飞出",65,38,1],
  [60,"#{user}刀光闪动，竟不看#{objector}的武功来路，一式「弧光斩」在身前划一道光弧，竟后发先至",80,38,1],
  [70,"#{user}手中#{weapon_name}忽然脱手飞掷，竟然是一招「烈风手里剑」，当作暗器掷了过来",50,38,2],
  [80,"#{user}引刀向后，忽地为阳手，一招「樱华斩」带起漫天花雨由下而上斩向#{objector}",90,38,1],
  [90,"#{user}举刀过顶，大喝一声，一招「裂地斩」却砍在地上，#{objector}正诧异间一道刀气沿地而至",100,40,1]],
  #无法拳
  57=>[[0,"#{user}哈哈大笑，笑声中一招「无法无规」双拳分击#{objector}右脑与右臀，实是怪异",20,30,3],
  [0,"#{user}一招「无法无天」，左手虚晃右拳直击#{objector}前胸",40,30,3],
  [0,"#{user}一招「无章可寻」，左拳后发先至右拳先发后至，齐向#{objector}袭来",60,30,3],
  [0,"#{user}右拳一立，左拳一招「无法无章」竟不按常理反向挥出",40,30,3],
  [0,"#{user}一招「无依无据」双拳连环击向#{objector}#{sp}",30,30,3]],
  #乱披风杖法 
  89=>[[0,"#{user}一招「披风带雨」，手中#{weapon_name}搂头盖顶砸向#{objector}",80,40,3],
  [19,"#{user}使一招「细风斜雨」，舞动#{weapon_name}斜肩带背击向#{objector}#{sp}",120,45,3],
  [29,"#{user}手中#{weapon_name}一挺，一招「八面来风」连出八杖，杖杖不离#{objector}#{sp}",120,45,3],
  [39,"#{user}招式大开大阖，一式「泼墨写意」连消带打砸向#{objector}",120,45,3],
  [49,"#{user}一招「乱石嶙峋」，手中#{weapon_name}波波折折地攻向#{objector}",140,50,3],
  [59,"#{user}手握杖尾，#{weapon_name}自背后扳出，一招「断砸山」带动劲风挥向#{objector}",140,50,3],
  [69,"#{user}手中#{weapon_name}一抖，竟单凭腕力点出「画龙点睛」，杖尾刺向#{objector}#{sp}",80,40,2],
  [79,"#{user}一招「弯弓射雕」，手中#{weapon_name}脱手飞出，如箭矢般飞击#{objector}",130,45,3]],
  #太祖长拳 
  56=>[[0,"#{user}双臂直上直下连续三击，正合「击鼓三通」之拳理",80,31,3],
  [0,"#{user}左拳虚晃，右拳一招「黑虎偷心」直掏#{objector}胸口",60,31,0],
  [0,"#{user}一招「冲锋陷阵」，两拳虎口相对猛力撞向#{objector}",40,31,3],
  [0,"#{user}一招「帝斩白蛇」，右拳变掌向#{objector}#{sp}横扫过去",100,31,3],
  [0,"#{user}使一招「黄袍加身」，双拳一立垫步拧腰打向#{objector}",70,31,3],
  [0,"#{user}坐马沉腰，沉肩发力，一招「暮鼓晨钟」，拳劲大得异乎寻常",50,31,5]],
  #花团鞭法 
  88=>[[0,"#{user}使一招「山花烂漫」，手中#{weapon_name}划个圈子罩向#{objector}",40,37,3],
  [20,"#{user}展眸轻笑，一式「春花解语」，轻飘飘地向#{objector}的#{sp}连击数鞭",50,37,3],
  [40,"#{user}使一招「万紫嫣红」，鞭影错落鞭势杂踏，鞭稍刺向#{objector}的#{sp}",60,37,2],
  [50,"#{user}举鞭过顶手持鞭稍，一式「花落流红」，手中#{weapon_name}卷向#{objector}",60,37,3],
  [60,"#{user}使一招「飞花逐蝶」，前鞭未收次鞭又至，一瞬间连抽十几鞭",70,37,3],
  [70,"#{user}使一招「花调无声」，#{weapon_name}不带一点风声抽向#{objector}，快得不可思议",90,37,3],
  [80,"#{user}手中#{weapon_name}抖得笔直，一招「花径通幽」直刺向#{objector}，鞭到中途突然转向斜刺",100,37,2]],
  #柳叶刀法 
  81=>[[0,"#{user}使一招「春风拂人醉」，手中#{weapon_name}轻飘飘地向#{objector}的#{sp}斩去",20,37,1],
  [20,"#{user}轻舒玉手，#{weapon_name}随着一招「远山伴人痴」由下而上撩往#{objector}的#{sp}",40,37,1],
  [40,"#{user}身形微转，一招「飞花逐人香」#{weapon_name}刀光不定，刺向#{objector}的#{sp}",40,37,2],
  [50,"#{user}使一招「柳叶随人笑」，迅速无伦地劈向#{objector}的#{sp}",50,37,1],
  [60,"#{user}手中#{weapon_name}颤动，一招「倩影惹人怜」，往#{objector}的#{sp}斜斜砍出",60,37,1],
  [70,"#{user}提刀轻举，一招「芦雪碎人影」劈向#{objector}#{sp}",65,37,1],
  [80,"#{user}移步侧身，使一招「彩蝶灼人衣」刀光闪闪斩向#{objector}的#{sp}",70,37,1]],
  #一剪梅花手 
  55=>[[0,"#{user}使一招「轻解罗裳」，对准#{objector}的#{sp}轻飘飘的扫去",80,36,3],
  [0,"#{user}扬起右手，一招「独上兰舟」便往#{objector}的#{sp}拍去",60,36,3],
  [0,"#{user}左手微分，右手一长使出一招「雁字回时」，抓向#{objector}的#{sp}",100,36,5],
  [0,"#{user}左手虚晃，右手「月满西楼」，往#{objector}的#{sp}击出",0,36,3],
  [0,"#{user}倏地一个转身，双手一挑「一种相思」直掼#{objector}#{sp}",90,36,3],
  [0,"#{user}左手虚晃，右掌飘飘，一招「两处闲愁」击向#{objector}#{sp}",150,36,0,3],
  [0,"#{user}右手在#{objector}#{sp}划过，随后一招「才下眉头」左手又向同一方位抓到",60,36,5],
  [0,"#{user}左手虚晃，右手握成拳，一招「却上心头」，击向#{objector}的前胸",120,36,0]],
  #八阵八卦掌 
  54=>[[0,"#{user}走天阵跨乾位，使一招「天道无常」，抖臂发劲一掌攻向#{objector}",80,34,4],
  [19,"#{user}转地阵居坤位，一招「地震三岗」直取#{objector}",90,34,4],
  [29,"#{user}上风阵取巽位，一招「风起云涌」掌势变幻击向#{objector}",100,34,4],
  [39,"#{user}过云阵居震位，一式「云海茫茫」双掌交错击向#{objector}#{sp}",110,34,0],
  [49,"#{user}脚下方位变幻，一招「飞龙居坎」左掌斜引右掌穿出，拍向#{objector}#{sp}",120,34,4],
  [59,"#{user}脚踏八卦方位，一招「鸟翔归离」却步抽身双掌一前一后相继击向#{objector}",100,34,4],
  [69,"#{user}步法虽急但八卦方位丝毫不乱，一招「蜿盘退艮」守中带攻右掌划向#{objector}#{sp}",150,34,4],
  [79,"#{user}身法越转越快，一瞬间踏遍天地风云四门，「四正四奇」连攻八掌",180,34,4],
  [89,"#{user}默念口诀，由归寐转无妄，自同人趋大有，一招「四开四阖」连出十六掌",220,34,4]],
  #八卦刀 
  80=>[[0,"#{user}一招「回身劈山刀」左足踏上一步，蓦地里横刀转身，呼的一声，向#{objector}#{sp}削去",40,38,1],
  [19,"#{user}踏前数步「上步劈山」，刀带劲风由上而下劈向#{objector}",50,38,1],
  [29,"#{user}双手抱刀，急退两步翻身跃起，一招「童子拜佛」力劈#{objector}",60,38,1],
  [39,"#{user}一招「朝阳刀」直劈#{objector}#{sp}，刀身带动劲风直刮得#{objector}耳边生疼",75,38,1],
  [49,"#{user}一招「削耳撩腮」舞个刀花，#{objector}上盘要害尽被笼罩",80,38,1],
  [59,"#{user}急踏两步，一招「上步撩刀」由下而上撩向#{objector}小腹",90,38,1],
  [69,"#{user}刀交左手「仙人指路」直刺#{objector}，同时右手骈指点向#{objector}#{sp}",100,38,2],
  [79,"#{user}一招「夜叉探海」竟以刀做剑，中宫直进刺向#{objector}",120,38,2]],
  #八卦游身掌 
  53=>[[0,"#{user}大喝一声，身形下伏，一招「劈雷坠地」捶向#{objector}双腿",40,32,4],
  [0,"#{user}上步抢身，招中套招，一招「劈挂连环」连环攻向#{objector}",50,32,4],
  [0,"#{user}阴手翻起阳手跟进，一招「没遮拦」结结实实的捶向#{objector}#{sp}",70,32,4],
  [0,"#{user}一招「背心钉」转到#{objector}的身后一掌猛向#{objector}背心灵台穴拍去",80,32,4],
  [0,"#{user}一招「游空探爪」，飞起身形自半空中变掌为抓锁向#{objector}#{sp}",60,32,4],
  [0,"#{user}运气于掌，一瞬间掌心变得血红，一式「掌心雷」推向#{objector}",100,32,0]],
  #基本拳脚
  40=>[[0,"#{user}对准#{objector}的#{sp}用力挥出一拳",10,25,3],
  [0,"#{user}提起拳头往#{objector}的#{sp}捶去",15,25,3],
  [0,"#{user}挥拳攻击#{objector}的#{sp}",20,25,3],
  [0,"#{user}往#{objector}的#{sp}狠狠踢了一脚",10,25,3],
  [0,"#{user}往#{objector}的#{sp}一抓",20,25,5]],
  #基本兵刃——刀
  42=>[[0,"#{user}挥舞#{weapon_name},对准#{objector}的#{sp}一阵乱砍",20,30,1],
  [0,"#{user}用#{weapon_name}往#{objector}的#{sp}砍去",20,30,1],
  [0,"#{user}挥动#{weapon_name}，斩向#{objector}的#{sp}",25,30,1]],
  #  剑
  41=>[[0,"#{user}用#{weapon_name}往#{objector}的#{sp}刺去",25,30,2],
  [0,"#{user}挥动#{weapon_name}，斩向#{objector}的#{sp}",30,30,1],
  [0,"#{user}用#{weapon_name}往#{objector}的#{sp}砍去",25,30,1]],
  #  杖
  43=>[[0,"#{user}手握#{weapon_name}，眼露凶光，猛地对准#{objector}的#{sp}挥了过去",30,28,3],
  [0,"#{user}高高举起#{weapon_name}，往#{objector}的#{sp}当头砸下",25,28,3],
  [0,"#{user}挥舞#{weapon_name}，往#{objector}的#{sp}用力一击",30,28,0]],
  #  鞭
  44=>[[0,"#{user}将#{weapon_name}一扬，往#{objector}的#{sp}抽去",20,27,3]]}
  words=attcck_words[sk_id]
  diswords=[]
  for i in words
    diswords.push i if i[0]<=lv_max
  end
  lv=rand(diswords.size)
  lv=bid if bid !=0
  window.draw_words(diswords[lv][1])
  for i in 0..30
    Graphics.update
  end
  return diswords[lv][2].to_s+'|'+diswords[lv][3].to_s+'|'+diswords[lv][4].to_s+'|'+lv.to_s+'|'+sp_text[1].to_s
end
#==============================================================================
# ■ Defend_Data
#------------------------------------------------------------------------------
# 　读取防御描述的方法。
#==============================================================================
def draw_defend2_text(actor,bid=0)
  if actor.is_a?(Game_Actor)
    user="你"
  else
    user=actor.name
  end
  words=["但是#{user}身子一侧，用手中兵刃架开",
  "只听见「锵」一声，被#{user}格开了",
  "但是被#{user}用手中兵刃架开",
  "结果「当」地一声，被#{user}挡开了",
  "结果被#{user}挡开了",
  "#{user}没料到这一击却打空，原来打中的只是个影子"]
  id=rand(5)
  id=bid if bid !=0
  return words[id]+'|'+id.to_s
end
def draw_defend_text(act,obj,bid=0)
  if act.is_a?(Game_Actor)
    user="你"
    objector=obj.name
    key=$game_variables[31]==0 ?46:$game_variables[31]
  else
    user=act.name
    objector="你"
    key=$npc_data[6]==0 ?46:$npc_data[6]
  end
  defend_words={
  #基本轻功 
  46=>["但是被#{user}机灵地躲开了",
  "但是和#{user}偏了几寸",
  "但是#{user}身子一侧，闪了开去",
  "但是#{user}已有准备，不慌不忙地躲开",
  "但是被#{user}及时地避开"],
  #踏雪无痕 
  69=>["只见#{user}身影一晃，一式「开阳薄雾」早已避在七尺之外",
  "#{user}一招「夕阳残雪」轻轻巧巧地避了开去",
  "#{user}左足一点，一招「万里雪飘」腾空而起，避了开去",
  "可是#{user}一招「踏雪无痕」，身子轻轻飘了开去",
  "#{user}使出「信步闲庭」，轻轻松松地闪过",
  "#{user}身影微动，已经藉一招「雪影无踪」轻轻闪过"],
  #万流归一 
  68=>["只见#{user}一招「白鹤冲天」，身体向上笔直地纵起丈余，躲过了#{objector}这一招",
  "#{user}使一招「叶落归根」，上半身急向后仰，于间不容发之际闪了开去",
  "#{user}一招「溪流归海」，一个抢步跨出数尺，避开#{objector}这招",
  "#{user}使出「大鹏展翅」，向一旁飘然一纵，轻轻着地",
  "#{user}一个「鹞子翻身」，向后纵跃出数丈之远，避开了#{objector}的凌厉攻势"],
  #无影遁形 
  67=>["#{user}一招「移形换位」，不见迈步却避到七尺之外",
  "#{user}一跺脚，一招「天魔出世」，一阵烟幕后随即不知去向",
  "#{user}一招「无声无息」，一扭身与周围景色融成一体，#{objector}竟不知如何是好",
  "#{user}一招「无影无踪」倏地闪在一旁",
  "#{user}身形急转，一招「暗无天日」绕到#{objector}背后"],
  #鹤翔身法 
  66=>["#{user}展动身法，一招「鹤舞白沙」闪了开去",
  "#{user}一招「鹤影参云」，斜飞而起，半空中一个倒卷帘轻轻落下",
  "#{user}使一招「梅妻鹤子」，脚下倒踩梅花桩一下绕到#{objector}身后",
  "#{user}一招「鹤隐南山」急向后退，直退出丈外，忽又如大鸟般疾扑而回",
  "#{user}一招「鹤舞九天」冲天而起，跃出丈外",
  "#{user}斜身一让，一招「乳鹤归巢」斜飞数丈，脚一点地又飘了回去"],
  #飞蝶身法
  65=>["#{user}一招「乱花迷人眼」，身形微动，早闪在一旁",
  "#{user}衣袖轻扬一招「花痕思悉飞」，袖中飞出绚丽花瓣，一闪而过",
  "#{user}使一招「山野花自红」，轻轻飘出丈外",
  "#{user}以手支颐，长叹一声「春深芳草尽」闪了开去",
  "#{user}纤腰轻扭，一式「蝶逐花香语」，#{objector}的凌历攻式尽皆落空",
  "#{user}衣裙轻摆，一招「蝶舞绕梁归」避开这一招"],
  #游龙身法
  64=>["#{user}一招「游龙戏凤」，身形晃动早闪过一旁",
  "#{user}一式「龙翔在天」，急跃而起，在空中一个转折落在丈外",
  "#{user}暗运真气，一招「龙飞凤舞」远远避了开去",
  "#{user}身形连晃使一招「云龙三现」，连续三个空心斛斗跳了开去",
  "#{user}脚步错落，暗踩梅花桩，一招「龙游掠波」闪了开去"],
  #凌波微步
  70=>["#{user}闪动身形，翩然若惊飞的鸿雁，一式「翩若惊鸿」远远闪开",
  "#{user}丹田内丹急速运转二十四圈，一式「轻云蔽月」令身形渐渐模糊，#{objector}打了个空",
  "#{user}两掌下按，一招「体迅飞凫」，由四心发出强大外气压向地面，腾空而起",
  "#{user}内劲环绕脚上，连踩易经六十四卦奇妙步法「飘忽若神」，轻松闪避",
  "#{user}运气三十六转，不退反进，却莫名闪开，正是那招「流风回雪」",
  "#{user}一式「婉若游龙」，缓慢行进，惬意如龙，#{objector}却始终打不上#{user}"]}
  words=defend_words[key]
  index=rand(words.size)
  index=bid if bid !=0
  return words[index]+'|'+index.to_s
end#==============================================================================
# ■ Hit_Data
#------------------------------------------------------------------------------
# 　读取普通攻击击中目标的描述的方法。
#==============================================================================
def draw_hit_result(defender_name,type)
  type=type.to_i
  hit_result=[["结果只对#{defender_name}勉强造成轻微的伤害",
              "结果对#{defender_name}造成了轻微的伤害",
              "结果对#{defender_name}造成了一处伤害",
              "结果对#{defender_name}造成了颇为严重的伤害",
              "结果对#{defender_name}造成了相当严重的伤害",
              "结果对#{defender_name}造成了十分严重的伤害",
              "结果对#{defender_name}造成了极其严重的伤害",
              "结果对#{defender_name}造成了非常可怕的严重伤害"],
              ["结果只轻轻地划破#{defender_name}的皮肉",
              "结果#{defender_name}被划出一道细长的血痕",
              "结果#{defender_name}被割出了一道伤口",
              "结果#{defender_name}被划出了一道血淋淋的伤口",
              "结果#{defender_name}被划出了一道又长又深的伤口",
              "结果#{defender_name}被砍出了一道深及见骨的可怕伤口"],
              ["结果只轻轻地刺破#{defender_name}皮肉",
              "结果在#{defender_name}身上刺出一个创口",
              "结果#{defender_name}被刺入了寸许",
              "结果刺得#{defender_name}退了几步",
              "结果刺出一个血肉模糊的伤口",
              "结果#{defender_name}被刺了个透明窟窿，鲜血飞溅"],
              ["结果只是轻轻地碰到#{defender_name}",
              "结果在#{defender_name}的伤处造成一处瘀青",
              "结果一击命中，#{defender_name}被打肿了一块老高",
              "结果一击命中，#{defender_name}痛苦地闷哼了一声",
              "结果『砰』的一声，#{defender_name}退了两步",
              "结果#{defender_name}连退了好几步，差一点摔倒",
              "结果重重的击中，#{defender_name}吐出一口鲜血",
              "结果一声巨响，#{defender_name}像捆稻草般飞了出去"],
              ["结果#{defender_name}退了半步，毫发无损",
              "结果给#{defender_name}造成一处瘀伤",
              "结果一击命中，#{defender_name}痛得弯下腰",
              "结果#{defender_name}痛苦地闷哼了一声，显然受了点内伤",
              "结果#{defender_name}摇摇晃晃，一跤摔倒在地",
              "结果#{defender_name}脸色一下变得惨白，连退了好几步",
              "结果『轰』的一声，#{defender_name}口中鲜血狂喷而出",
              "结果#{defender_name}一声惨叫，像滩软泥般塌了下去"],
              ["结果只是抓破#{defender_name}的一点皮",
              "结果#{defender_name}被抓出了五条淡淡的血痕",
              "结果一爪命中，#{defender_name}被抓出了五条血沟",
              "结果抓下了#{defender_name}一小块皮肉",
              "结果#{defender_name}皮开肉破，鲜血流了下来",
              "结果#{defender_name}被抓出了五个血洞，鲜血急喷",
              "结果#{defender_name}被连皮带肉抓下了一大块，露出了骨头",
              "结果『喀嚓』一声，#{defender_name}的骨头被抓得粉碎"]]
  return hit_result[type]
end
def draw_hurt_text(defender_name,hp,mhp,type)
  hp=0 if hp<=0
  hurt_result=[["（#{defender_name}看起来充满活力，一点也不累）",
               "（#{defender_name}似乎有些疲惫，但是十分有活力）", 
               "（#{defender_name}看起来可能有些累了）",
               "（#{defender_name}动作似乎开始有点不太灵光）",
               "（#{defender_name}气喘嘘嘘，看起来状况并不太好）",
               "（#{defender_name}十分疲惫，看来需要好好休息了）",
               "（#{defender_name}已经头重脚轻，正在勉力支撑）",
               "（#{defender_name}看起来已经力不从心了）",
               "（#{defender_name}摇头晃脑，眼看就要倒在地上）",
               "（#{defender_name}已经陷入半昏迷状态）"], 
               ["（#{defender_name}看起来气血充盈，并没有受伤）",
               "（#{defender_name}似乎受了点轻伤，不过看不出来）",
               "（#{defender_name}看起来可能受了点轻伤）",
               "（#{defender_name}受了几处伤，不过似乎并不碍事）",
               "（#{defender_name}受伤不轻，看起来状况并不太好）",
               "（#{defender_name}动作开始散乱，看来受的伤不轻）",
               "（#{defender_name}已经伤痕累累，正在勉力支撑）",
               "（#{defender_name}受伤相当重，只怕有生命危险）",
               "（#{defender_name}伤重之下已经难以支撑）",
               "（#{defender_name}受伤过重，已经命在旦夕了）",
               "（#{defender_name}受伤过重，随时都可能断气）"]]
  index=(hurt_result[type].size-1)*(1.0-(hp/1.0)/(mhp/1.0))
  return hurt_result[type][index]
end#==============================================================================
# ■ Skill_Data
#------------------------------------------------------------------------------
# 　读取绝招描述的方法。
#==============================================================================
def get_skill_words(from ,to ,id)
  if from.is_a?(Game_Actor)
    user="你"
    objector=to.name
    weapon_name=from.weapon_id==0 ? "":$data_weapons[from.weapon_id].name
  else
    user=from.name
    objector="你"
    weapon_name=$npc_data[9]==0 ?"":$data_weapons[$npc_data[9]].name
  end
  skills_words_list={
  23=>["#{user}使出绝技神倒鬼跌三连环，一揪一抓一拌接连三招，据说神仙也要摔个跟头！",
      "结果#{objector}眼花缭乱，扑通一声被摔个昏天黑地，想要翻身站起，可又怎缓得出手来！",
      "可是#{objector}内力深厚，急运内力格挡，这神鬼莫测的连环三招竟全部落空！"],
  24=>["#{user}长啸一声，使出雪山神技雪花六出，依照雪花六角之形，一瞬间向#{objector}刺出数剑！"],
  25=>["#{user}深吸一口气，全身真气流转，周身竟隐隐发出一片如冰雪般的晶莹之色！",
      "#{user}冰心决运行完毕，笼罩在身周的护体真气逐渐散去。"],
  16=>["#{user}右脚实，左脚虚，运起挤字诀，粘连粘随，右掌翻出已搭住#{objector}左手！",
      "跟着#{user}横劲发出，#{objector}给这么一挤，招式中的劲力打了个空，心中空荡荡的十分难受！",
      "#{objector}见此情景，一声惊噫，连忙收回自己的劲力，闪身避让！",
      "没想到#{objector}内力浑厚无比，#{user}这一挤非但分毫无功，自己反而被牵得跌出几步！"],
  17=>["#{user}将一个个太极圆圈发出，以四两之微力，拨动#{objector}的千斤巨力！",
      "结果#{objector}身不由己，被推进了#{user}的乱环阵内！",
      "可是#{objector}急中生智奋力一挣，竟然脱出了「乱环诀」的包围！"],
  18=>["「太极阴阳少人修，吞吐开合问刚柔」，这阳阳诀使用时刚柔并济，委实变幻莫测！",
      "#{user}招式一变翻为阴手，一股绵绵劲力直向#{objector}全身罩去！",
      "#{objector}於阴阳变化莫测之际，哪里还能招架，身子被太极柔劲推得跌跌撞撞！",
      "#{objector}大吃一惊之际，急运内力全力相抗，狼狈万状地从太极柔劲中脱得身来！"],
  19=>["突然#{user}双手左右连划，一个圆圈已将#{objector}套住，太极拳的震字诀随即使出！",
      "太极之意连绵不断，一个圆圈未完，第二个圆圈已生，喀喇一响，#{objector}一处骨头已被绞断！",
      "#{objector}内力深厚识得厉害，马上一阵急攻，#{user}登时手忙脚乱，再也来不及出招！"],
  20=>["#{user}每一招均是以弧形刺出，弧形收回，绵绵不绝，逐步向#{objector}收紧！",
      "太极剑意散发出的细丝越积越多，似是积成了一团团丝棉，将#{objector}紧紧裹了起来！",
      "#{objector}大叫一声不好，一个细胸巧翻云，远远跃出丈外！"],
  21=>["#{user}手中剑不断划圈，剑光圈一个未消另一个再生，这光圈剑阵一出，真是滴水不漏！",
      "#{user}剑式一缓，剑上的大小光圈随即不见。"],
  22=>["#{user}剑尖斜指，使出太极剑绝招三环套月，连环三招直向#{objector}攻来！"],
  14=>["#{user}刀指苍穹蓄势发力，忽地使出旋风三连斩绝技，身形如风连续劈出三刀！"],
  15=>["#{user}反手握刀纵声长啸，霎时间天地为之变色，这一刀之势虽然平平，却威力惊人！"],
  13=>["#{user}双手合掌身形急转，一声低喝中，身影一分为二，#{objector}一时竟分辨不真假！",
      "#{user}忍法影分身运行完毕，制造出来的幻影也跟著消失。"],
  12=>["#{user}双手连挥，一掌击在地上，腾的一声爆起一阵烟幕，#{objector}眼前顿时一片昏暗！",
      "#{objector}识破了#{user}的烟幕诡计，攻守自如多了。",
      "没想到#{objector}内力深厚，当即猛推一掌，震散了烟雾！"],
  9=>["#{user}默念红莲教义，周身啪啪做响，真气流转间，好像手上的力道加强了！"],
  10=>["#{user}合眼默诵红莲教义：去残除恶，唯我光明！忽地睁开双眼，似乎增强了战斗力！"],
  11=>["#{user}运足内力长啸一声，将手中#{weapon_name}向#{objector}猛掷过来，去势急劲，当真快若闪电！",
      "#{objector}吓得目瞪口呆，竟忘了闪避，这一杖在#{objector}胸口对穿而过，鲜血溅得满地",
      "没想到#{objector}身法奇快，一个燕子三抄水凌空跃出数丈，#{weapon_name}竟未碰到分毫！"],
  8=>["#{user}使出柳浪闻莺绝技，向#{objector}同时击出两掌一刀，一时间刀浪如柳，掌风如莺！"],
  6=>["#{user}凝神运功，周身泛出一片七彩绚烂之色，似乎披了一件五彩霓裳，身法骤然变快！",
      "#{user}三花心法用毕，身法也恢复正常。"],
  7=>["#{user}手中#{weapon_name}轻舞，划出一个又一个圈子，#{objector}跟着鞭子一绕,登时眼花缭乱！",
      "#{objector}手中兵刃被鞭圈带动连转几圈，再也把持不定，一下子脱手飞出！",
      "#{objector}身手敏捷，见机急快，连忙随著鞭势运力抽出，锵的一声逃过兵刃被夺之厄！",
      "#{objector}眼见漫天鞭影当头罩下，躲无可躲架无可架，一下子卷入鞭圈之中！",
      "#{objector}眼见不好，紧急中一个就地十八滚，滚出数丈之外，却也大感狼狈！"],
  2=>["#{user}呼喝一声，将混元一气功逼到双掌，掌心闪出奇异的光芒，掌缘锋利竟如钢刀一般！",
      "#{user}缓缓收回内力，掌法也恢复平常。"],
  3=>["#{user}呼喝一声，将混元一气功逼到双掌，掌心闪出奇异的光芒，掌缘锋利竟如钢刀一般！",
      "#{user}缓缓收回内力，掌法也恢复平常。"],
  4=>["#{user}使出八卦门刀影掌绝学，一时间刀光闪闪，掌风呼啸，刀光掌影直向#{objector}扑来！"],
  5=>["#{user}使出八卦门刀影掌绝学，一时间刀光闪闪，掌风呼啸，刀光掌影直向#{objector}扑来！"]}
  return skills_words_list[id]
end#==============================================================================
# ■ String_Data
#------------------------------------------------------------------------------
# 　定义各种描述字符串的方法。
#==============================================================================
module RPG
  class System
    # 增加装备位置
    attr_accessor :armor5
    attr_accessor :armor6
    attr_accessor :armor7
    def initialize
      @armor5=""
      @armor6=""
      @armor7=""
    end
    def armor5
      return "披风"
    end
    def armor6
      return "腰带"
    end
    def armor7
      return "钓竿"
    end
  end
  class Armor
    # 增加3个装备分类
    def kind
      if self.id==19
        return 4
      else
        if self.id==30
          return 5
        else
          if self.id==31
            return 6
          else
            return @kind
          end
        end
      end
    end
  end
  class Enemy
    attr_accessor :lv
    alias :orig_initialize :initialize
    def initialize
      orig_initialize
      @lv=0
    end
  end
  class Item
    # 对物品进行分类
    # 0--食物
    # 1--药物
    # 2--其他
    attr_accessor :type
    def initialize
      super
      @type=0
    end
    def type
      if self.id<=7 or self.id==17
        return 0
      end
      if self.id>7 and self.id<=10
        return 1
      end
      if self.id>10 and self.id != 17
        return 2
      end
    end
  end
end
$levels=["不堪一击","毫不足虑","不足挂齿","初学乍练","勉勉强强","初窥门径",
         "初出茅庐","略知一二","普普通通","平平常常","平淡无奇","粗通皮毛",
         "半生不熟","登堂入室","略有小成","已有小成","鹤立鸡群","驾轻就熟",
         "青出於蓝","融会贯通","心领神会","炉火纯青","了然於胸","略有大成",
         "已有大成","豁然贯通","非比寻常","出类拔萃","罕有敌手","技冠群雄",
         "神乎其技","出神入化","傲视群雄","登峰造极","无与伦比","所向披靡",
         "一代宗师","精深奥妙","神功盖世","举世无双","惊世骇俗","撼天动地",
         "震古铄今","超凡入圣","威镇寰宇","空前绝后","天人合一","深藏不露",
         "深不可测","返璞归真","极轻很轻","极轻很轻","极轻很轻","极轻很轻",
         "极轻很轻","极轻很轻","极轻很轻","极轻很轻","极轻很轻","极轻很轻",
         "极轻很轻","极轻很轻","极轻很轻","极轻很轻","极轻很轻","极轻很轻"]
#出手
$attacks=["极轻","很轻","不轻","不重","很重","极重"]
#门派列表
$school=["江湖小虾","八卦门","花间派","红莲教","尹贺谷","太极门",
         "雪山剑派","逍遥派"]
#人物相貌列表
$boy=["风流俊雅，仪表堂堂","气宇轩昂，骨骼清奇","相貌英俊，双目有神",
      "五官端正，身材匀称","相貌平平，还过得去","小鼻小眼，一脸麻子",
      "牛眼马嘴，面目狰狞","一塌糊涂，不是人样"]
$girl=["美奂绝伦，人间仙子","沉鱼落雁，闭月羞花","婷婷玉立，美貌如花",
       "身材娇好，尚有姿色","相貌平平，还过得去","看上去…，马马虎虎",
       "眼小嘴大，相貌简陋","貌赛无盐，惨不忍睹"]
#捕快任务列表
$task1=[["赵","钱","孙","李","周","吴","郑","王"],
        ["梅","竹","兰","菊","英","雄","豪","杰"]]
#结束评价
$end_com=["普通菜鸟","浪子杀手","神行太保","冷血屠夫","邪恶天使","盖世大侠",
          "好好先生","无情名捕","绝代佳人","舞林高手","灌篮高手"]#==============================================================================
# ■ NPC_Data
#------------------------------------------------------------------------------
# 　读取NPC数据的方法，返回数组给变量$npc_data
#   NPC数据格式为[膂力,敏捷,悟性,根骨,拳脚,兵刃,轻功,内功,招架,武器,装备,装备,
#   [技能,等级]*12,命中,闪避,经验,门派,防御,附加膂力,附加敏捷]，没有以0补足。
#==============================================================================
def get_npc_data(id)
  return $npc_data=get_bad_data if id==125
  $npc_data=[]
           #村长
  npc_data={1=>[29,25,21,21,0,0,0,0,0,0,4,0,[47,100],[40,100],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],0,0,40000,0,0,0,0],
           #顾炎武
            2=>[127,22,28,27,0,0,0,0,0,0,0,0,[48,180],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],0,0,2000000,0,0,0,0],
           #中年妇人
            3=>[20,20,27,22,0,0,0,0,0,0,4,0,[47,30],[40,40],[46,30],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],0,0,6000,0,0,0,0],
           #平一指
            4=>[17,26,30,20,0,0,0,0,0,0,0,0,[47,60],[40,80],[46,80],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],60,30,60000,0,0,0,0],
           #捕快
            5=>[27,25,28,29,0,0,0,0,0,15,4,0,[47,45],[46,45],[41,70],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],0,0,20000,0,0,0,0],
           #小顽童
            6=>[28,23,24,24,0,0,0,0,0,0,4,0,[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],0,0,10,0,0,0,0],
           #老婆婆
            7=>[18,16,29,27,0,0,0,0,0,0,4,0,[47,40],[40,20],[46,50],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],0,0,5000,0,0,0,0],
           #李也白
            8=>[25,25,20,26,0,85,0,0,85,15,4,0,[47,45],[41,75],[46,85],[85,70],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],0,0,40000,5,0,0,0],
           #小书童
            9=>[27,21,22,25,0,0,0,0,0,0,4,0,[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],0,0,100,0,0,0,0],
           #茅十七
            10=>[26,27,21,21,56,0,0,0,56,0,4,0,[47,60],[40,60],[46,100],[56,70],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],0,0,35000,3,0,0,0],
           #民团团丁
            11=>[25,25,20,26,0,0,0,0,0,0,4,0,[47,45],[40,55],[46,45],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],0,0,12000,0,0,0,0],
           #潘小莲
            12=>[16,24,25,21,0,0,0,0,0,0,7,9,[47,40],[40,20],[46,50],[45,30],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],0,0,5000,0,0,0,0],
           #小裁缝
            13=>[29,23,29,26,0,0,0,0,0,0,4,0,[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],0,0,200,0,0,0,0],
           #卖花妞
            14=>[26,21,25,26,0,0,0,0,0,6,4,0,[47,25],[46,20],[41,60],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],0,0,10000,0,0,0,0],
           #小商贩
            15=>[25,20,27,25,0,0,0,0,0,0,4,0,[47,30],[40,30],[46,30],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],0,0,6000,0,0,0,0],
           #杂货贩
            16=>[25,23,26,23,0,0,0,0,0,0,4,0,[47,90],[40,100],[46,60],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],0,0,30000,0,0,0,0],
           #老裁缝
            17=>[26,22,24,22,0,0,0,0,0,0,4,0,[47,30],[40,30],[46,30],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],0,0,10000,0,0,0,0],
           #西门广
            18=>[29,21,22,29,0,0,0,0,0,3,4,0,[47,10],[46,20],[41,20],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],0,0,1000,0,0,0,0],
           #神秘人
            19=>[28,20,26,25,0,0,0,0,0,0,4,0,[40,10],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],0,0,400,0,0,0,0],
           #何铁手
            20=>[22,30,27,24,0,81,65,73,81,28,4,0,[65,100],[47,100],[81,100],[40,30],[42,100],[46,100],[45,100],[73,100],[0,0],[0,0],[0,0],[0,0],0,0,110000,2,0,0,0],
           #葛朗台
            21=>[23,25,21,28,0,0,0,0,0,25,4,0,[47,100],[40,50],[46,100],[43,100],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],0,0,110000,0,0,0,0],
           #店小二
            22=>[20,23,22,29,0,0,0,0,0,0,0,0,[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],0,0,300,0,0,0,0],
           #厨师
            23=>[28,21,24,21,0,0,0,0,0,0,4,0,[47,40],[40,40],[46,40],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],0,0,10000,0,0,0,0],
           #挑夫
            24=>[28,29,26,22,0,0,0,0,0,0,4,0,[47,10],[40,10],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],0,0,500,0,0,0,0],
           #胡屠户
            25=>[29,28,14,29,0,0,0,0,0,9,30,4,[47,60],[42,80],[46,60],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],0,0,12000,0,0,0,0],
           #盐商
            26=>[27,23,29,24,0,0,0,0,0,0,4,0,[40,50],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],0,0,10000,0,0,0,0],
           #采花大盗
            27=>[18,28,22,24,0,0,0,0,0,0,15,0,[47,100],[40,100],[46,150],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],20,50,105000,0,0,0,0],
           #官兵
            28=>[27,25,29,29,0,0,0,0,0,8,4,0,[47,70],[40,70],[42,90],[46,70],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],50,30,55000,0,0,0,0],
           #寻捕
            29=>[27,25,23,22,0,0,0,0,0,15,4,0,[47,45],[46,45],[41,90],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],60,30,60000,0,0,0,0],
           #道德和尚
            30=>[21,26,29,27,0,0,0,0,0,0,4,0,[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],0,0,10,0,0,0,0],
           #独行大侠
            31=>[20,20,26,21,0,0,0,0,0,15,4,0,[45,250],[40,250],[41,250],[42,250],[39,250],[43,250],[44,250],[46,250],[47,250],[0,0],[0,0],[0,0],0,50,160000,0,0,0,0],
           #荷西
            32=>[28,25,27,28,0,0,0,0,0,0,0,0,[40,50],[46,40],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],0,0,8000,0,0,0,0],
           #工地管事
            33=>[27,29,26,26,0,0,0,0,0,0,4,0,[47,60],[40,90],[46,60],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],0,0,30000,0,0,0,0],
           #石料管事
            34=>[25,26,26,27,0,0,0,0,0,0,4,0,[47,60],[40,90],[46,60],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],0,0,30000,0,0,0,0],
           #独脚大盗
            35=>[33,18,20,22,0,0,0,0,0,0,4,0,[47,100],[40,100],[46,50],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],50,50,80000,0,0,0,0],
           #黑衣大盗
            36=>[18,28,22,25,57,0,67,0,57,0,1,0,[47,110],[67,110],[40,110],[46,110],[57,110],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],20,15,160000,4,0,0,0],
           #王璁儿
            37=>[28,22,30,29,56,0,66,74,56,0,0,0,[47,150],[40,150],[66,100],[56,120],[46,150],[74,100],[45,150],[0,0],[0,0],[0,0],[0,0],[0,0],0,0,180000,3,0,0,0],
           #方长老
            38=>[28,26,24,28,0,89,66,74,89,25,22,0,[40,150],[43,120],[46,120],[45,120],[47,120],[56,120],[89,120],[66,120],[74,150],[48,50],[50,120],[0,0],0,0,300000,3,0,0,0],
           #白衣教众
            39=>[28,26,25,24,0,89,66,74,89,26,0,0,[47,40],[89,40],[66,40],[46,40],[43,40],[74,40],[45,40],[0,0],[0,0],[0,0],[0,0],[0,0],0,0,30000,3,0,0,0],
           #黑衣教众
            40=>[21,29,24,25,0,89,66,74,89,27,0,0,[47,30],[89,30],[66,30],[46,30],[43,30],[74,30],[45,30],[0,0],[0,0],[0,0],[0,0],[0,0],0,0,15000,3,0,0,0],
           #红衣教众
            41=>[23,25,28,27,0,89,66,74,89,27,0,0,[47,50],[89,50],[66,50],[46,50],[43,50],[74,50],[45,50],[0,0],[0,0],[0,0],[0,0],[0,0],0,0,40000,3,0,0,0],
           #蓝衣教众
            42=>[26,22,26,25,0,89,66,74,89,27,0,0,[47,20],[89,20],[66,20],[46,20],[43,20],[74,20],[45,20],[0,0],[0,0],[0,0],[0,0],[0,0],0,0,15000,3,0,0,0],
           #韩长老
            43=>[23,29,29,29,56,0,66,74,56,0,22,0,[47,90],[40,90],[66,90],[56,120],[46,90],[74,90],[45,90],[0,0],[0,0],[0,0],[0,0],[0,0],0,0,140000,3,0,0,0],
           #唐思儿
            44=>[21,23,30,24,0,89,0,74,89,25,16,0,[47,119],[89,100],[40,119],[46,119],[43,119],[74,100],[45,100],[0,0],[0,0],[0,0],[0,0],[0,0],0,0,180000,3,0,0,0],
           #余鸿儒
            45=>[35,24,34,29,0,89,66,74,89,26,4,0,[40,160],[43,160],[46,160],[45,160],[47,160],[56,180],[89,180],[66,160],[74,250],[48,150],[50,180],[0,0],0,0,900000,3,0,0,0],
           #齐林天
            46=>[25,20,25,24,56,0,66,74,56,0,22,0,[47,80],[40,80],[66,80],[56,80],[46,80],[74,80],[45,80],[0,0],[0,0],[0,0],[0,0],[0,0],0,0,90000,3,0,0,0],
           #褚红灯
            47=>[30,30,10,30,56,89,66,0,89,25,22,0,[47,100],[89,100],[40,100],[66,100],[56,100],[46,100],[43,100],[74,100],[45,100],[0,0],[0,0],[0,0],0,0,145000,3,0,0,0],
           #平婆婆
            48=>[29,21,21,25,55,0,65,73,55,0,4,0,[40,70],[46,70],[45,70],[47,50],[55,70],[65,60],[73,80],[48,60],[0,0],[0,0],[0,0],[0,0],0,0,60000,2,0,0,0],
           #公孙大娘
            49=>[24,29,23,20,0,81,65,73,81,8,4,0,[65,130],[47,120],[81,110],[40,100],[55,100],[42,100],[46,100],[45,100],[73,100],[0,0],[0,0],[0,0],0,0,150000,2,0,0,0],
           #聂隐娘
            50=>[24,32,25,21,0,0,65,73,88,8,17,0,[65,130],[47,120],[88,110],[44,100],[46,120],[45,100],[73,100],[0,0],[0,0],[0,0],[0,0],[0,0],0,0,180000,2,0,0,0],
           #瑞婆婆
            51=>[29,23,23,26,55,0,65,0,55,0,4,0,[65,60],[47,60],[40,60],[55,50],[46,60],[73,60],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],0,0,35000,2,0,0,0],
           #柳如是
            52=>[27,25,21,27,55,0,65,73,55,0,4,11,[65,80],[47,80],[40,80],[55,80],[46,80],[45,80],[73,80],[0,0],[0,0],[0,0],[0,0],[0,0],0,40,65000,2,0,0,0],
           #红拂女
            53=>[26,25,26,27,0,88,65,73,88,24,4,0,[65,100],[47,100],[88,110],[44,100],[46,100],[45,100],[73,100],[0,0],[0,0],[0,0],[0,0],[0,0],0,0,140000,2,0,0,0],
           #茶花女
            54=>[16,22,26,23,55,0,65,0,55,0,4,0,[65,60],[47,60],[40,60],[55,60],[46,60],[73,60],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],0,0,35000,2,0,0,0],
           #小红
            55=>[26,22,22,24,0,0,0,0,0,7,4,0,[47,60],[46,60],[41,60],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],40,30,45000,2,0,0,0],
           #薛涛
            56=>[21,25,23,26,55,0,65,73,55,0,4,0,[65,100],[47,100],[40,100],[55,100],[46,100],[45,100],[73,100],[0,0],[0,0],[0,0],[0,0],[0,0],0,0,120000,2,0,0,0],
           #桑轻虹
            57=>[22,20,28,29,55,0,65,73,88,21,14,13,[40,100],[44,130],[46,110],[47,100],[45,100],[55,100],[88,130],[65,110],[73,150],[48,100],[0,0],[0,0],0,0,160000,2,0,0,0],
           #听琴
            58=>[21,24,26,27,55,0,0,0,55,0,12,0,[47,20],[40,20],[55,10],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],0,0,3000,2,0,0,0],
           #司棋
            59=>[20,21,27,23,55,0,0,0,55,0,12,0,[47,20],[40,20],[55,15],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],0,0,3000,2,0,0,0],
           #李师师
            60=>[28,25,28,23,0,81,65,0,81,12,4,11,[65,90],[47,80],[81,80],[42,70],[46,60],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],0,40,65000,2,0,0,0],
           #侍书
            61=>[25,28,22,24,55,0,65,73,55,0,12,13,[65,70],[47,60],[40,60],[55,50],[46,60],[45,60],[73,60],[0,0],[0,0],[0,0],[0,0],[0,0],0,0,40000,2,0,0,0],
           #唐晚词
            62=>[29,28,26,24,55,81,65,73,81,8,12,13,[40,100],[42,120],[46,120],[45,100],[47,100],[55,100],[81,120],[65,120],[73,150],[48,100],[49,180],[0,0],0,0,150000,2,0,0,0],
           #李青照
            63=>[26,29,31,23,55,88,65,73,55,22,14,0,[40,150],[44,160],[42,160],[46,140],[45,140],[47,140],[55,180],[81,180],[88,180],[65,150],[73,250],[48,150],0,0,1000000,2,0,0,0],
           #绿珠
            64=>[21,25,20,26,55,0,65,73,55,0,4,0,[65,90],[47,100],[40,100],[55,120],[46,40],[45,100],[73,100],[0,0],[0,0],[0,0],[0,0],[0,0],0,0,120000,2,0,0,0],
           #入画
            65=>[26,20,25,20,55,0,65,73,55,0,12,13,[65,50],[47,60],[40,60],[55,70],[46,60],[45,60],[73,60],[0,0],[0,0],[0,0],[0,0],[0,0],0,0,40000,2,0,0,0],
           #护院武师
            66=>[25,25,23,27,0,0,0,0,0,8,4,0,[47,65],[42,60],[46,65],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],0,0,15000,1,0,0,0],
           #武师教头
            67=>[28,25,26,22,53,0,0,0,53,0,4,0,[47,65],[40,75],[53,70],[46,85],[45,80],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],0,0,40000,1,0,0,0],
           #王剑杰
            68=>[25,25,22,27,0,0,64,72,54,0,4,0,[47,100],[72,100],[40,100],[64,100],[54,100],[46,100],[45,100],[0,0],[0,0],[0,0],[0,0],[0,0],0,30,140000,1,0,0,0],
           #王剑英
            69=>[28,27,29,29,0,0,64,72,54,0,4,0,[47,120],[72,110],[40,120],[64,110],[54,120],[46,100],[45,100],[0,0],[0,0],[0,0],[0,0],[0,0],0,40,180000,1,0,0,0],
           #庄丁
            70=>[26,25,24,29,0,0,0,0,0,0,4,0,[47,20],[40,30],[46,20],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],0,0,2000,1,0,0,0],
           #徐铮
            71=>[27,25,20,20,0,0,0,0,0,8,4,0,[47,90],[40,70],[42,90],[46,75],[45,70],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],0,0,35000,1,0,0,0],
           #马行空
            72=>[25,27,25,29,0,0,0,0,56,0,4,0,[47,60],[40,100],[56,100],[46,100],[45,100],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],0,40,110000,1,0,0,0],
           #商老太
            73=>[22,22,28,22,0,80,64,72,80,8,4,0,[47,60],[72,80],[40,90],[53,60],[64,90],[42,90],[46,80],[80,90],[45,80],[0,0],[0,0],[0,0],0,0,80000,1,0,0,0],
           #阎基
            74=>[28,26,26,27,0,0,0,0,0,10,4,0,[47,50],[40,50],[42,60],[46,50],[48,50],[45,50],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],0,0,15000,1,0,0,0],
           #平阿四
            75=>[28,28,25,23,0,0,0,0,0,0,4,0,[40,20],[46,20],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],0,0,1000,1,0,0,0],
           #商剑鸣
            76=>[27,26,24,29,0,80,64,72,80,11,4,0,[40,110],[42,110],[46,110],[45,110],[47,110],[53,110],[80,110],[64,110],[72,150],[48,50],[0,0],[0,0],0,0,180000,1,0,0,0],
           #王维扬
            77=>[32,24,24,27,54,80,64,72,54,8,4,0,[40,160],[42,160],[46,160],[45,160],[47,160],[53,160],[54,180],[80,180],[64,160],[72,250],[48,60],[0,0],0,0,800000,1,0,0,0],
           #马春花
            78=>[17,25,23,27,0,0,0,0,0,0,4,0,[47,65],[40,70],[46,75],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],0,0,20000,1,0,0,0],
           #商宝震
            79=>[22,23,24,29,0,80,64,72,80,8,4,0,[40,60],[42,60],[46,60],[45,80],[47,60],[53,60],[80,60],[64,60],[72,80],[48,50],[0,0],[0,0],0,0,60000,1,0,0,0],
           #雪豹
            80=>[38,29,25,26,0,0,0,0,0,0,29,0,[40,80],[46,80],[47,80],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],0,0,50000,0,0,0,0],
           #雪山教头
            81=>[22,22,20,27,0,87,69,77,87,19,27,0,[40,50],[41,50],[46,50],[45,50],[47,50],[87,60],[69,50],[77,50],[0,0],[0,0],[0,0],[0,0],0,0,50000,6,0,0,0],
           #封万剑
            82=>[24,28,25,25,0,86,69,77,86,19,27,0,[40,120],[41,120],[46,120],[45,100],[47,120],[87,120],[86,120],[69,120],[77,120],[0,0],[0,0],[0,0],0,0,160000,6,0,0,0],
           #欧阳千善
            83=>[23,24,20,27,59,86,69,77,0,19,27,0,[47,40],[59,40],[86,40],[69,40],[40,40],[77,40],[42,40],[46,40],[45,40],[0,0],[0,0],[0,0],0,0,25000,6,0,0,0],
           #马千刚
            84=>[20,29,22,27,59,86,69,77,0,19,27,0,[47,80],[59,80],[86,80],[69,80],[40,80],[77,80],[41,80],[46,80],[45,80],[0,0],[0,0],[0,0],0,0,65000,6,0,0,0],
           #赵千猛
            85=>[27,25,23,24,59,0,69,77,0,0,27,0,[47,80],[59,80],[86,80],[69,80],[40,80],[77,70],[41,80],[46,80],[45,80],[0,0],[0,0],[0,0],0,0,65000,6,0,0,0],
           #薛千柔
            86=>[25,21,28,28,59,86,0,77,86,19,16,0,[59,30],[47,30],[86,30],[40,30],[77,30],[41,30],[46,30],[45,30],[0,0],[0,0],[0,0],[0,0],0,0,20000,6,0,0,0],
           #花万红
            87=>[30,28,30,25,0,0,0,0,0,0,27,0,[47,60],[40,60],[46,60],[41,60],[45,60],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],0,0,60000,6,0,0,0],
           #王万轫
            88=>[21,21,29,27,59,86,0,77,86,19,28,0,[47,90],[59,90],[86,90],[69,90],[40,90],[77,90],[41,90],[46,90],[45,90],[0,0],[0,0],[0,0],0,0,75000,6,0,0,0],
           #柯万锺
            89=>[50,28,25,21,59,0,69,77,59,0,28,0,[59,100],[47,100],[69,100],[40,100],[77,100],[46,100],[45,100],[0,0],[0,0],[0,0],[0,0],[0,0],0,0,110000,6,0,0,0],
           #齐万翼
            90=>[28,23,25,28,59,86,69,77,0,19,27,0,[47,100],[59,100],[86,100],[69,100],[40,100],[77,100],[41,100],[46,100],[45,100],[0,0],[0,0],[0,0],0,0,110000,6,0,0,0],
           #张福来
            91=>[20,22,21,25,0,0,0,0,0,0,0,0,[47,10],[40,20],[46,20],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],0,0,10000,6,0,0,0],
           #白瑞德
            92=>[34,28,22,25,59,86,69,77,59,0,22,0,[40,150],[41,150],[46,140],[45,140],[47,140],[59,180],[86,170],[69,150],[77,250],[48,80],[0,0],[0,0],0,0,800000,6,0,0,0],
           #史婆婆
            93=>[27,24,20,27,59,86,69,77,0,18,26,0,[47,110],[59,110],[86,110],[69,110],[40,110],[77,110],[41,110],[46,110],[45,110],[0,0],[0,0],[0,0],0,0,130000,6,0,0,0],
           #阿绣
            94=>[28,28,28,24,59,86,0,77,86,17,4,0,[47,60],[59,60],[86,60],[69,60],[40,60],[77,60],[41,60],[46,60],[45,60],[0,0],[0,0],[0,0],0,0,55000,6,0,0,0],
           #进香客
            95=>[26,29,21,26,0,0,0,0,0,0,23,0,[47,5],[40,5],[41,3],[46,5],[45,5],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],0,0,1000,0,0,0,0],
           #知客道长
            96=>[30,22,25,27,58,85,68,76,85,20,22,0,[47,80],[40,80],[68,80],[58,80],[85,80],[41,80],[46,80],[76,80],[45,80],[0,0],[0,0],[0,0],0,0,70000,5,0,0,0],
           #迎客道童
            97=>[20,27,22,20,58,0,0,76,0,0,22,0,[47,50],[40,50],[58,50],[41,50],[46,50],[76,50],[45,50],[0,0],[0,0],[0,0],[0,0],[0,0],0,0,40000,5,0,0,0],
           #桃花
            98=>[25,27,21,20,0,0,0,0,0,0,22,0,[40,40],[46,40],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],0,0,1000,5,0,0,0],
           #苍月道长
            99=>[27,26,25,24,0,83,68,76,83,0,21,0,[40,120],[42,130],[46,130],[45,130],[47,130],[83,130],[68,130],[76,150],[48,100],[0,0],[0,0],[0,0],0,0,160000,5,0,0,0],
           #清风
            100 =>[24,29,25,25,58,85,68,76,85,20,22,0,[47,40],[40,40],[68,40],[58,40],[85,40],[41,40],[46,40],[76,40],[45,40],[0,0],[0,0],[0,0],0,0,15000,5,0,0,0],
           #清虚道长
            101=>[28,28,28,27,0,85,68,76,85,15,21,0,[40,200],[42,200],[41,200],[46,200],[45,200],[47,200],[58,220],[85,220],[68,200],[83,200],[76,250],[48,130],0,0,1100000,5,0,0,0],
           #烧饭道童
            102=>[27,23,26,24,0,0,0,0,0,0,0,0,[40,20],[46,20],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],0,0,2000,5,0,0,0],
           #古松道长
            103=>[25,25,23,23,58,0,68,76,58,0,21,0,[40,120],[46,120],[45,120],[47,120],[58,120],[68,120],[76,120],[0,0],[0,0],[0,0],[0,0],[0,0],0,0,160000,5,0,0,0],
           #采药道人
            104=>[30,27,30,20,58,85,68,76,85,20,22,0,[47,100],[40,100],[68,100],[85,100],[58,100],[46,100],[41,100],[76,100],[45,100],[0,0],[0,0],[0,0],0,0,85000,5,0,0,0],
           #明月
            105=>[25,20,28,20,58,0,0,76,0,0,22,0,[47,60],[40,60],[58,60],[41,60],[46,60],[76,60],[45,60],[0,0],[0,0],[0,0],[0,0],[0,0],0,0,40000,5,0,0,0],
           #谷虚道长
            106=>[25,25,23,20,58,0,68,76,58,16,25,0,[47,120],[40,120],[68,120],[58,120],[46,120],[76,120],[45,120],[0,0],[0,0],[0,0],[0,0],[0,0],0,0,130000,5,0,0,0],
           #陈美娜
            107=>[23,29,20,27,57,82,67,75,82,8,4,0,[40,80],[42,120],[46,100],[45,100],[47,100],[57,60],[82,120],[67,100],[75,150],[48,60],[0,0],[0,0],0,0,100000,4,0,0,0],
           #十兵卫
            108=>[28,23,26,25,0,82,67,75,82,8,4,18,[47,110],[67,100],[75,150],[42,120],[46,110],[82,110],[45,110],[0,0],[0,0],[0,0],[0,0],[0,0],0,0,160000,4,0,0,0],
           #大熊
            109=>[30,29,22,23,57,0,67,0,57,0,4,0,[47,50],[67,50],[40,70],[46,40],[57,70],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],0,0,30000,4,0,0,0],
           #浪人甲
            110=>[22,29,28,22,0,0,0,0,0,0,4,0,[47,50],[40,70],[46,80],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],0,0,20000,4,0,0,0],
           #浪人乙
            111=>[21,21,20,22,0,0,0,0,0,0,4,0,[47,90],[40,70],[46,100],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],0,0,45000,4,0,0,0],
           #藤王丸
            112=>[28,26,25,25,57,0,67,75,57,0,4,0,[40,120],[42,80],[46,100],[45,100],[47,100],[57,120],[82,60],[67,100],[75,150],[48,60],[0,0],[0,0],0,0,100000,4,0,0,0],
           #未知火舞
            113=>[20,25,26,20,0,82,67,75,82,13,4,0,[47,100],[67,120],[75,100],[42,100],[46,100],[82,100],[45,100],[0,0],[0,0],[0,0],[0,0],[0,0],0,0,130000,4,0,0,0],
           #食野太郎
            114=>[22,24,29,21,57,0,67,0,57,0,4,0,[47,50],[67,30],[40,50],[46,50],[57,40],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],0,0,15000,4,0,0,0],
           #孙悟菜
            115=>[33,26,20,24,0,82,67,75,82,14,4,0,[47,90],[67,80],[75,90],[42,90],[46,80],[82,90],[45,90],[0,0],[0,0],[0,0],[0,0],[0,0],0,40,85000,4,0,0,0],
           #枳右京
            116=>[20,27,29,22,0,82,67,75,82,8,4,0,[47,110],[67,100],[75,110],[42,110],[46,110],[82,110],[45,110],[0,0],[0,0],[0,0],[0,0],[0,0],0,0,160000,4,0,0,0],
           #和仲阳
            117=>[24,26,27,23,57,82,67,75,82,8,4,0,[40,150],[42,180],[46,140],[45,160],[47,140],[57,150],[82,180],[67,170],[75,250],[48,120],[0,0],[0,0],0,0,1000000,4,0,0,0],
           #野比
            118=>[27,25,24,22,57,0,0,0,57,0,4,0,[47,50],[40,50],[46,50],[57,40],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],0,0,15000,4,0,0,0],
           #天津虾
            119=>[28,26,24,21,57,0,67,75,57,0,20,19,[47,90],[67,80],[40,90],[75,120],[46,80],[82,90],[45,90],[0,0],[0,0],[0,0],[0,0],[0,0],0,0,85000,4,0,0,0],
           #大口木子
            120=>[20,22,28,21,57,0,67,0,57,0,4,0,[47,50],[67,50],[40,60],[46,90],[57,70],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],0,0,35000,4,0,0,0],
           #流氓
            121=>[28,20,22,23,0,0,0,0,0,0,4,0,[47,10],[40,20],[46,30],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],0,0,5000,0,0,0,0],
           #流氓头
            122=>[25,20,20,21,0,0,0,0,0,0,4,0,[47,100],[40,100],[46,100],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],0,0,35000,0,0,0,0],
           #土匪
            123=>[20,28,23,29,0,0,0,0,0,20,0,0,[47,60],[46,60],[41,60],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],0,0,45000,0,0,0,0],
           #土匪头领
            124=>[25,23,25,29,0,85,68,0,85,20,24,0,[47,70],[68,70],[85,70],[46,70],[41,70],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],0,0,60000,5,0,0,0],
           #恶人
            125=>[],
           #我是谁
            126=>[30,30,30,20,0,82,64,76,82,29,24,0,[40,100],[42,200],[46,100],[45,200],[47,200],[82,250],[64,180],[76,180],[0,0],[0,0],[0,0],[0,0],0,0,2500000,7,0,0,0],
           #东方求败
            127=>[35,38,25,20,0,85,65,76,85,30,1,13,[40,150],[41,200],[46,180],[45,200],[47,200],[51,60],[85,250],[65,250],[76,200],[0,0],[0,0],[0,0],0,0,3600000,7,0,0,0],
           #道德和尚
            128=>[40,32,32,40,59,0,68,76,59,0,21,0,[40,200],[46,120],[45,200],[47,200],[59,250],[68,250],[76,250],[0,0],[0,0],[0,0],[0,0],[0,0],0,0,5000000,7,0,0,0],
           #焦石丸
            136=>[19,21,45,22,0,0,0,0,0,0,0,0,[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],0,0,950000,0,0,0,0],
           #焦白丸
            137=>[20,20,45,22,0,0,0,0,0,0,0,0,[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],0,0,1200000,0,0,0,0],
           #焦千丸
            138=>[19,21,46,21,0,0,0,0,0,0,0,0,[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],0,0,1500000,0,0,0,0],
           #焦依伊
            139=>[15,31,52,29,0,0,0,0,0,0,0,0,[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],0,0,2000000,0,0,0,0],
           #赏善使
            140=>[36,32,33,36,60,86,68,75,86,20,4,0,[60,195],[86,195],[68,195],[75,195],[40,195],[41,195],[45,195],[46,195],[47,195],[48,100],[0,0],[0,0],60,800,2200000,7,0,0,0],
           #罚恶使
            141=>[35,33,33,36,59,85,66,72,85,20,4,0,[59,195],[85,195],[66,195],[72,195],[40,195],[41,195],[45,195],[46,195],[47,195],[48,100],[0,0],[0,0],60,800,2200000,7,0,0,0],
           #全远见
            142=>[54,53,51,51,60,82,67,74,60,0,26,0,[60,240],[82,240],[67,240],[74,240],[40,240],[42,240],[45,240],[46,240],[47,240],[48,200],[51,150],[0,0],60,9800,2800000,7,0,0,0]}
  if id>128 and id<136
    play_data=[]
    $data_enemies[id].lv=0
    case id
    when 129
      play_data.push(27,22,28,28)
    when 130
      play_data.push(15,30,29,24)
    when 131
      play_data.push(28,21,27,20)
    when 132
      play_data.push(26,26,26,25)
    when 133
      play_data.push(20,20,33,32)
    when 134
      play_data.push(23,29,30,31)
    when 135
      play_data.push(30,24,15,28)
    end
    $data_enemies[id].lv=0
    for i in 39..89
      if $data_enemies[id].lv<$game_variables[i]
        $data_enemies[id].lv=$game_variables[i]
      end
    end
    i=(id-128)*0.02+0.94
    i+=0.1 if id==135
    $data_enemies[id].lv+=(id-129)*3
    $data_enemies[id].lv=$data_enemies[id].lv.truncate
    $data_enemies[id].lv=[$data_enemies[id].lv,325].min
    lv=$data_enemies[id].lv
    $data_enemies[id].exp=2*lv/3
    $data_enemies[id].maxsp=$game_variables[24]*i
    $data_enemies[id].maxsp=$data_enemies[id].maxsp.truncate
    $data_enemies[id].maxhp=$data_enemies[id].maxsp/4+100
    player_data=[[54,80,64,72,80,11,1,29,[54,lv],[80,lv],[64,lv],[72,lv],[42,lv]],
                  [55,88,65,73,88,22,14,13,[55,lv],[88,lv],[65,lv],[73,lv],[44,lv]],
                  [56,89,66,74,89,26,26,9,[56,lv],[89,lv],[66,lv],[74,lv],[43,lv]],
                  [57,82,67,75,82,14,1,18,[57,lv],[82,lv],[67,lv],[75,lv],[42,lv]],
                  [58,85,68,76,85,18,21,24,[58,lv],[85,lv],[68,lv],[76,lv],[41,lv]],
                  [59,86,69,77,86,16,27,28,[59,lv],[86,lv],[69,lv],[77,lv],[41,lv]],
                  [60,59,0,73,60,0,22,0,[60,lv],[59,lv],[73,lv],[51,[lv,101].min],[0,0]]]
    for a in player_data[id-129]
      play_data.push(a)
    end
    play_data.push([40,lv],[45,lv],[46,lv],[47,lv],[0,0],[0,0],[0,0])
    play_data.push(45,15)
    n=$game_variables[19]*i
    n=n.truncate
    play_data.push(n,id-128,0,0,0)
    $data_enemies[id].atk=play_data[0]+lv/3+lv/10
    if $game_actors[1].weapon_id !=0
      $data_enemies[id].atk+=$data_weapons[$game_actors[1].weapon_id].atk
    end
    $data_enemies[id].atk+=$data_weapons[play_data[9]].atk if play_data[9] !=0
    $data_enemies[id].atk/=20
    $data_enemies[id].atk=[$data_enemies[id].atk,5].min
    return $npc_data=play_data
  else
    if id>139 and id<143
      $data_enemies[id].maxsp=65535
      $data_enemies[id].maxhp=65535
    end
    return $npc_data=npc_data[id]
  end
end
def get_bad_data
  $data_enemies[125].lv=0
  $game_variables[10]=rand(6)
  npc_data=[]
  for i in 39..89
    if $data_enemies[125].lv<$game_variables[i]
      $data_enemies[125].lv=$game_variables[i]
    end
  end
  i=0.70+$bad_man_count*0.05+$bad_man_turn*0.05
  $data_enemies[125].lv *=i
  $data_enemies[125].lv=$data_enemies[125].lv.truncate
  $data_enemies[125].lv=1 if $data_enemies[125].lv<=0
  $data_enemies[125].maxsp=$game_variables[24]*i
  $data_enemies[125].maxsp=$data_enemies[125].maxsp.truncate
  $data_enemies[125].maxhp=$data_enemies[125].maxsp/4+100
  lv=$data_enemies[125].lv
  $data_enemies[125].exp=lv/3
  bad_man_data=[[54,80,64,72,80,8,4,0,[54,lv],[80,lv],[64,lv],[72,lv],[42,lv]],
                [55,88,65,73,88,21,4,0,[55,lv],[88,lv],[65,lv],[73,lv],[44,lv]],
                [56,89,66,74,89,25,4,0,[56,lv],[89,lv],[66,lv],[74,lv],[43,lv]],
                [57,82,67,75,82,8,4,0,[57,lv],[82,lv],[67,lv],[75,lv],[42,lv]],
                [58,85,68,76,85,20,4,0,[58,lv],[85,lv],[68,lv],[76,lv],[41,lv]],
                [59,86,69,77,86,19,4,0,[59,lv],[86,lv],[69,lv],[77,lv],[41,lv]]]
  base_abi=[[[15,12,16,12],[13,15,17,10],[17,12,13,13],[14,13,14,14],[10,10,19,16],
            [14,14,13,14]],[[12,14,16,13],[10,16,17,12],[15,14,13,13],[12,14,15,14],
            [8,12,19,16],[11,15,13,13]]]
  $game_variables[7]>3 ? a=0 : a=1
  for i in 0..3
    b=rand(3)+base_abi[a][$game_variables[10]][i]
    b+=$game_variables[91+i] if i<2
    npc_data.push b
  end
  for a in bad_man_data[$game_variables[10]]
    npc_data.push(a)
  end
  npc_data.push([40,lv],[45,lv],[46,lv],[47,lv])
  for a in 1..3
    npc_data.push([0,0])
  end
  npc_data.push(0,0)
  n=$game_variables[19]*i
  n=n.truncate
  npc_data.push(n)
  npc_data.push($game_variables[10]+1,0,0,0)
  $data_enemies[125].atk=npc_data[0]+lv/3+lv/10
  if $game_actors[1].weapon_id !=0
    $data_enemies[125].atk+=$data_weapons[$game_actors[1].weapon_id].atk
  end
  $data_enemies[125].atk+=$data_weapons[npc_data[9]].atk
  $data_enemies[125].atk*=5
  $data_enemies[125].atk=[$data_enemies[125].atk,500].min
  return npc_data
end#==============================================================================
# ■ Game_Task
#------------------------------------------------------------------------------
# 　处理游戏中各种任务以及奖励。
#==============================================================================  
  #扫地
  def task1
    $game_party.actors[0].hp-=30
    task= Window_Base.new((640-160)/2,128,185,60)
    task.contents = Bitmap.new(task.width - 32, task.height - 32)
    task.contents.font.color.set(0,0,0)
    task.contents.draw_text(0,0,240,32,"扫地扫地我扫地")
    for i in 0..40
      Graphics.update
    end
    task.contents.clear
    task.contents.draw_text(0,0,240,32,"地上还有西瓜皮")
    for i in 0..40
      Graphics.update
    end
    task.contents.clear
    task.contents.draw_text(0,0,240,32,"婆婆家中欠打扫")
    for i in 0..40
      Graphics.update
    end
    task.contents.clear
    task.contents.draw_text(0,0,240,32,"尘土满天难呼吸")
    for i in 0..40
      Graphics.update
    end
    for i in 0..10
      task.opacity -= 20
      task.contents_opacity -= 20
    end
    task.dispose
  end
  #挑水
  def task2
    $game_party.actors[0].hp-=40
    task= Window_Base.new((640-160)/2,128,185,60)
    task.contents = Bitmap.new(task.width - 32, task.height - 32)
    task.contents.font.color.set(0,0,0)
    task.contents.draw_text(0,0,240,32,"挑水挑水我挑水")
    for i in 0..40
      Graphics.update
    end
    task.contents.clear
    task.contents.draw_text(0,0,240,32,"倒水进缸水花飞")
    for i in 0..40
      Graphics.update
    end
    task.contents.clear
    task.contents.draw_text(0,0,240,32,"一桶两桶三四桶")
    for i in 0..40
      Graphics.update
    end
    task.contents.clear
    task.contents.draw_text(0,0,240,32,"反正不用交水费")
    for i in 0..40
      Graphics.update
    end
    for i in 0..12
      task.opacity -= 20
      task.contents_opacity -= 20
    end
    task.dispose
  end
  #劈柴
  def task3
    $game_party.actors[0].hp-=50
    task= Window_Base.new((640-160)/2,128,185,60)
    task.contents = Bitmap.new(task.width - 32, task.height - 32)
    task.contents.font.color.set(0,0,0)
    task.contents.draw_text(0,0,240,32,"劈柴劈柴我劈柴")
    for i in 0..40
      Graphics.update
    end
    task.contents.clear
    task.contents.draw_text(0,0,240,32,"抡起斧子劈起来")
    for i in 0..40
      Graphics.update
    end
    task.contents.clear
    task.contents.draw_text(0,0,240,32,"保护树木讲环保")
    for i in 0..40
      Graphics.update
    end
    task.contents.clear
    task.contents.draw_text(0,0,240,32,"婆婆没事别乱烧")
    for i in 0..40
      Graphics.update
    end
    for i in 0..12
      task.opacity -= 20
      task.contents_opacity -= 20
    end
    task.dispose
  end
  #老婆婆任务结束
  def finishtask
    $game_variables[152]=Zlib.crc32(($game_variables[19]+100).to_s,51)
    $game_variables[19]+=100
    $game_variables[20]+=50
    $game_variables[153]+=50
    $game_party.gain_gold(250)
    task = Window_Base.new((640-300)/2,128,300,64)
    task.contents = Bitmap.new(task.width - 32, task.height - 32)
    task.contents.font.color.set(0,0,0)
    task.contents.draw_text(0,0,300,32,"费了老大力气，总算干完了！")
    for i in 0..50
      Graphics.update
    end
    for i in 0..12
      task.opacity -= 20
      task.contents_opacity -= 20
    end
    task.dispose
  end
  #村长任务
  def task4
    #生成任务列表
    @task=[]
    for i in 5..124
      if $live[i]
        @task.push i
      end
    end
    #检查人是否杀光
    if @task==nil
      $kill=false
    else
      $kill=true
      id=rand(@task.size)
      $game_actors[3].name=""
      $game_variables[2]=@task[id]
      $game_actors[3].name=$data_enemies[@task[id]].name
    end
  end
  #检查中年妇女任务
  def checktask5?
    type=$game_variables[4]/100
    id=$game_variables[4]%100
    case type
    when 1
      if $game_party.weapon_number(id)>0
        if $game_actors[1].weapon_id==id
          if $game_party.weapon_number(id)>1
            $game_party.gain_weapon(id,-1)
            return true
          else
            return false
          end
        else
          $game_party.gain_weapon(id,-1)
          return true
        end
      else
        return false
      end
    when 2
      if $game_party.item_number(id)>0
        $game_party.gain_item(id,-1)
        return true
      else
        return false
      end
    when 3
      if $game_party.armor_number(id)>0
        if $game_actors[1].armor_equiped?(id)
          if $game_party.armor_number(id)>1
            $game_party.gain_armor(id,-1)
            return true
          else
            return false
          end
        else
          $game_party.gain_armor(id,-1)
          return true
        end
      else
        return false
      end
    end
  end
  #中年妇女任务
  def task5
    #随机选择类型
    $game_variables[4]=100*(rand(3)+1)
    #随机确定任务物品
    case $game_variables[4]
    when 100 #武器
      if $game_variables[19]<10000
        id=rand(8)+1 #1-8
      elsif $game_variables[19]<30000
        id=rand(13)+1
      else
        id=rand($data_weapons.size-3)+1
      end
      name=$data_weapons[id].name
    when 200 #物品
      if $game_variables[19]<15000
        id=rand(7)+1 #1-7
      else
        id=rand(18)+1
      end
      name=$data_items[id].name
    when 300 #防具
      if $game_variables[19]<13000
        id=rand(4)+2
      elsif $game_variables[19]<25000
        id=rand(12)+1
      else
        id=rand($data_armors.size-1)+1
      end
      name=$data_armors[id].name
    end
    $game_actors[5].name=""
    $game_actors[5].name=name
    $game_variables[4] +=id
  end
  #平一指任务
  def task6
    #生成任务列表
    @task=[]
    for i in 5..124
      if $live[i]
        @task.push i
      end
    end
    #检查人是否杀光
    if @task==[]
      $kill=false
    else
      $kill=true
      id=rand(@task.size)
      $game_actors[4].name=""
      $game_variables[5]=@task[id]
      $game_actors[4].name=$data_enemies[@task[id]].name
    end
  end
  #捕快任务
  def task7
    $bad_man_data=[]
    $data_enemies[125].lv=0
    $game_switches[$game_variables[8]+46]=true
    $game_actors[6].name=""
    $game_actors[6].name=$task1[0][$game_variables[6]]+$task1[1][$game_variables[7]]
    $data_enemies[125].name=$game_actors[6].name
    $game_actors[7].name=""
    $game_actors[7].name=$data_mapinfos[$game_variables[8]].name
    if $game_variables[7]<4
      $data_enemies[125].battler_name="NPC_Tile_03.png"
    else
      $data_enemies[125].battler_name="NPC_Tile_11.png"
    end
    if $bad_man_count%10==0
      $bad_man_count=0
      $bad_man_turn+=1
    end
    $bad_man_count+=1
  end
  #任务奖励（杀人，寻物，拜访）
  def one_award
    #奖励经验
    if $game_variables[9]<6
      i=1
      if $game_variables[19]>=56000
        e=90+rand(204)
      else
        e=rand(156)+60
      end
    else
    #奖励潜能
      i=2
      if $game_variables[19]>=40000
        e=53+rand(127)
      else
        e=rand(83)+27
      end
    end
    e*=($game_variables[13]+$game_variables[48]/10+$game_variables[93])
    e/=20
    e=[e,3492/i].min
    case i
    when 1
      $game_variables[152]=Zlib.crc32(($game_variables[19]+e).to_s,51)
      $game_variables[19]+=e
    when 2
      $game_variables[20]+=e
      $game_variables[153]+=e
    end
    $game_variables[26]=e
  end
  #捕快任务奖励
  def two_award
    if $game_variables[19]>=63000
      e=200+rand(80)
    else
      e=rand(40)+180
    end
    t=$bad_man_count
    add=e/2
    while t>1
      e+=(add+$bad_man_count+$bad_man_turn*5)
      t-=1
    end
    e*=($game_variables[13]+$game_variables[48]/10)
    e/=20
    e=[e.truncate,5692].min
    q=e/4
    $game_variables[27]=e
    $game_variables[152]=Zlib.crc32(($game_variables[19]+e).to_s,51)
    $game_variables[19]+=e
    $game_variables[28]=q
    $game_variables[153]+=q
    $game_variables[20]+=q
  end
    #==============================================================================
# ■ Game_Temp
#------------------------------------------------------------------------------
# 　在没有存档的情况下，处理临时数据的类。这个类的实例请参考
# $game_temp 。
#==============================================================================

class Game_Temp
  #--------------------------------------------------------------------------
  # ● 定义实例变量
  #--------------------------------------------------------------------------
  attr_accessor :map_bgm                  # 地图画面 BGM (战斗时记忆用)
  attr_accessor :message_text             # 信息文章
  attr_accessor :message_proc             # 信息 返回调用 (Proc)
  attr_accessor :choice_start             # 选择项 开始行
  attr_accessor :choice_max               # 选择项 项目数
  attr_accessor :choice_cancel_type       # 选择项 取消的情况
  attr_accessor :choice_proc              # 选择项 返回调用 (Proc)
  attr_accessor :num_input_start          # 输入数值 开始行
  attr_accessor :num_input_variable_id    # 输入数值 变量 ID
  attr_accessor :num_input_digits_max     # 输入数值 位数
  attr_accessor :message_window_showing   # 显示信息窗口
  attr_accessor :common_event_id          # 公共事件 ID
  attr_accessor :in_battle                # 战斗中的标志
  attr_accessor :battle_calling           # 调用战斗的标志
  attr_accessor :battle_troop_id          # 战斗 队伍 ID
  attr_accessor :battle_can_escape        # 战斗中 允许逃跑 ID
  attr_accessor :battle_can_lose          # 战斗中 允许失败 ID
  attr_accessor :battle_proc              # 战斗 返回调用 (Proc)
  attr_accessor :battle_turn              # 战斗 回合数
  attr_accessor :battle_event_flags       # 战斗 事件执行执行完毕的标志
  attr_accessor :battle_abort             # 战斗 中断标志
  attr_accessor :battle_main_phase        # 战斗 状态标志
  attr_accessor :battleback_name          # 战斗背景 文件名
  attr_accessor :forcing_battler          # 强制行动的战斗者
  attr_accessor :shop_calling             # 调用商店的标志
  attr_accessor :shop_goods               # 商店 商品列表
  attr_accessor :name_calling             # 输入名称 调用标志
  attr_accessor :name_actor_id            # 输入名称 角色 ID
  attr_accessor :name_max_char            # 输入名称 最大字数
  attr_accessor :menu_calling             # 菜单 调用标志
  attr_accessor :menu_beep                # 菜单 SE 演奏标志
  attr_accessor :save_calling             # 存档 调用标志
  attr_accessor :debug_calling            # 调试 调用标志
  attr_accessor :player_transferring      # 主角 场所移动标志
  attr_accessor :player_new_map_id        # 主角 移动目标地图 ID
  attr_accessor :player_new_x             # 主角 移动目标 X 坐标
  attr_accessor :player_new_y             # 主角 移动目标 Y 坐标
  attr_accessor :player_new_direction     # 主角 移动目标 朝向
  attr_accessor :transition_processing    # 过渡处理中标志
  attr_accessor :transition_name          # 过渡 文件名
  attr_accessor :gameover                 # 游戏结束标志
  attr_accessor :to_title                 # 返回标题画面标志
  attr_accessor :last_file_index          # 最后存档的文件编号
  attr_accessor :debug_top_row            # 调试画面 保存状态用
  attr_accessor :debug_index              # 调试画面 保存状态用
  attr_accessor :shop_type                # 商店的类型
  attr_accessor :msg_for_socket           # 对方的网络信息
  attr_accessor :msg_for_net_battler
  #--------------------------------------------------------------------------
  # ● 初始化对像
  #--------------------------------------------------------------------------
  def initialize
    @map_bgm = nil
    @message_text = nil
    @message_proc = nil
    @choice_start = 99
    @choice_max = 0
    @choice_cancel_type = 0
    @choice_proc = nil
    @num_input_start = 99
    @num_input_variable_id = 0
    @num_input_digits_max = 0
    @message_window_showing = false
    @common_event_id = 0
    @in_battle = false
    @battle_calling = false
    @battle_troop_id = 0
    @battle_can_escape = false
    @battle_can_lose = false
    @battle_proc = nil
    @battle_turn = 0
    @battle_event_flags = {}
    @battle_abort = false
    @battle_main_phase = false
    @battleback_name = ''
    @forcing_battler = nil
    @shop_calling = false
    @shop_id = 0
    @name_calling = false
    @name_actor_id = 0
    @name_max_char = 0
    @menu_calling = false
    @menu_beep = false
    @save_calling = false
    @debug_calling = false
    @player_transferring = false
    @player_new_map_id = 0
    @player_new_x = 0
    @player_new_y = 0
    @player_new_direction = 0
    @transition_processing = false
    @transition_name = ""
    @gameover = false
    @to_title = false
    @last_file_index = 0
    @debug_top_row = 0
    @debug_index = 0
    @shop_type=1
    @msg_for_socket=nil
    @msg_for_net_battler=""
  end
end
#==============================================================================
# ■ Game_System
#------------------------------------------------------------------------------
# 　处理系统附属数据的类。也可执行诸如 BGM 管理之类的功能。本类的实例请参考
# $game_system 。
#==============================================================================
class Game_System
  #--------------------------------------------------------------------------
  # ● 定义实例变量
  #--------------------------------------------------------------------------
  attr_accessor :playing_bgm
  attr_reader   :map_interpreter          # 地图事件用解释程序
  attr_reader   :battle_interpreter       # 战斗事件用解释程序
  attr_accessor :timer                    # 计时器
  attr_accessor :timer_working            # 计时器执行中的标志
  attr_accessor :save_disabled            # 禁止存档
  attr_accessor :menu_disabled            # 禁止菜单
  attr_accessor :encounter_disabled       # 禁止遇敌
  attr_accessor :message_position         # 文章选项 显示位置
  attr_accessor :message_frame            # 文章选项 窗口外关
  attr_accessor :save_count               # 存档次数
  attr_accessor :magic_number             # 魔法编号
  #--------------------------------------------------------------------------
  # ● 初始化对像
  #--------------------------------------------------------------------------
  def initialize
    @map_interpreter = Interpreter.new(0, true)
    @battle_interpreter = Interpreter.new(0, false)
    @timer = 0
    @timer_working = false
    @save_disabled = false
    @menu_disabled = false
    @encounter_disabled = false
    @message_position = 2
    @message_frame = 0
    @save_count = 0
    @magic_number = 0
  end
  #--------------------------------------------------------------------------
  # ● 演奏 BGM
  #     bgm : 演奏的 BGM
  #--------------------------------------------------------------------------
  def bgm_play(bgm)
    @playing_bgm = bgm
    if bgm != nil and bgm.name != ""
      Audio.bgm_play("Audio/BGM/" + bgm.name, bgm.volume, bgm.pitch)
    else
      Audio.bgm_stop
    end
    Graphics.frame_reset
  end
  #--------------------------------------------------------------------------
  # ● 停止 BGM
  #--------------------------------------------------------------------------
  def bgm_stop
    Audio.bgm_stop
  end
  #--------------------------------------------------------------------------
  # ● BGM 的淡出
  #     time : 淡出时间 (秒)
  #--------------------------------------------------------------------------
  def bgm_fade(time)
    @playing_bgm = nil
    Audio.bgm_fade(time * 1000)
  end
  #--------------------------------------------------------------------------
  # ● 记忆 BGM
  #--------------------------------------------------------------------------
  def bgm_memorize
    @memorized_bgm = @playing_bgm
  end
  #--------------------------------------------------------------------------
  # ● 还原 BGM
  #--------------------------------------------------------------------------
  def bgm_restore
    bgm_play(@memorized_bgm)
  end
  #--------------------------------------------------------------------------
  # ● 演奏 BGS
  #     bgs : 演奏的 BGS
  #--------------------------------------------------------------------------
  def bgs_play(bgs)
    @playing_bgs = bgs
    if bgs != nil and bgs.name != ""
      Audio.bgs_play("Audio/BGS/" + bgs.name, bgs.volume, bgs.pitch)
    else
      Audio.bgs_stop
    end
    Graphics.frame_reset
  end
  #--------------------------------------------------------------------------
  # ● BGS 的淡出
  #     time : 淡出时间 (秒)
  #--------------------------------------------------------------------------
  def bgs_fade(time)
    @playing_bgs = nil
    Audio.bgs_fade(time * 1000)
  end
  #--------------------------------------------------------------------------
  # ● 记忆 BGS
  #--------------------------------------------------------------------------
  def bgs_memorize
    @memorized_bgs = @playing_bgs
  end
  #--------------------------------------------------------------------------
  # ● 还原 BGS
  #--------------------------------------------------------------------------
  def bgs_restore
    bgs_play(@memorized_bgs)
  end
  #--------------------------------------------------------------------------
  # ● ME 的演奏
  #     me : 演奏的 ME
  #--------------------------------------------------------------------------
  def me_play(me)
    if me != nil and me.name != ""
      Audio.me_play("Audio/ME/" + me.name, me.volume, me.pitch)
    else
      Audio.me_stop
    end
    Graphics.frame_reset
  end
  #--------------------------------------------------------------------------
  # ● SE 的演奏
  #     se : 演奏的 SE
  #--------------------------------------------------------------------------
  def se_play(se)
    if se != nil and se.name != ""
      Audio.se_play("Audio/SE/" + se.name, se.volume, se.pitch)
    end
  end
  #--------------------------------------------------------------------------
  # ● 停止 SE 
  #--------------------------------------------------------------------------
  def se_stop
    Audio.se_stop
  end
  #--------------------------------------------------------------------------
  # ● 获取演奏中 BGM
  #--------------------------------------------------------------------------
  def playing_bgm
    return @playing_bgm
  end
  #--------------------------------------------------------------------------
  # ● 获取演奏中 BGS
  #--------------------------------------------------------------------------
  def playing_bgs
    return @playing_bgs
  end
  #--------------------------------------------------------------------------
  # ● 获取窗口外观的文件名
  #--------------------------------------------------------------------------
  def windowskin_name
    if @windowskin_name == nil
      return $data_system.windowskin_name
    else
      return @windowskin_name
    end
  end
  #--------------------------------------------------------------------------
  # ● 设置窗口外观的文件名
  #     windowskin_name : 新的窗口外观文件名
  #--------------------------------------------------------------------------
  def windowskin_name=(windowskin_name)
    @windowskin_name = windowskin_name
  end
  #--------------------------------------------------------------------------
  # ● 获取战斗 BGM
  #--------------------------------------------------------------------------
  def battle_bgm
    if @battle_bgm == nil
      return $data_system.battle_bgm
    else
      return @battle_bgm
    end
  end
  #--------------------------------------------------------------------------
  # ● 设置战斗 BGM
  #     battle_bgm : 新的战斗 BGM
  #--------------------------------------------------------------------------
  def battle_bgm=(battle_bgm)
    @battle_bgm = battle_bgm
  end
  #--------------------------------------------------------------------------
  # ● 获取战斗结束的 BGM
  #--------------------------------------------------------------------------
  def battle_end_me
    if @battle_end_me == nil
      return $data_system.battle_end_me
    else
      return @battle_end_me
    end
  end
  #--------------------------------------------------------------------------
  # ● 设置战斗结束的 BGM
  #     battle_end_me : 新的战斗结束 BGM
  #--------------------------------------------------------------------------
  def battle_end_me=(battle_end_me)
    @battle_end_me = battle_end_me
  end
  #--------------------------------------------------------------------------
  # ● 刷新画面
  #--------------------------------------------------------------------------
  def update
    # 计时器减 1
    if @timer_working and @timer > 0
      @timer -= 1
    end
  end
end
#==============================================================================
# ■ Game_Switches
#------------------------------------------------------------------------------
# 　处理开关的类。编入的是类 Array 的外壳。本类的实例请参考
# $game_switches。
#==============================================================================

class Game_Switches
  #--------------------------------------------------------------------------
  # ● 初始化对像
  #--------------------------------------------------------------------------
  def initialize
    @data = []
  end
  #--------------------------------------------------------------------------
  # ● 获取开关
  #     switch_id : 开关 ID
  #--------------------------------------------------------------------------
  def [](switch_id)
    if switch_id <= 5000 and @data[switch_id] != nil
      return @data[switch_id]
    else
      return false
    end
  end
  #--------------------------------------------------------------------------
  # ● 设置开关
  #     switch_id : 开关 ID
  #     value     : ON (true) / OFF (false)
  #--------------------------------------------------------------------------
  def []=(switch_id, value)
    if switch_id <= 5000
      @data[switch_id] = value
    end
  end
end
#==============================================================================
# ■ Game_Variables
#------------------------------------------------------------------------------
# 　处理变量的类。编入的是类 Array 的外壳。本类的实例请参考
# $game_variables。
#==============================================================================

class Game_Variables
  #--------------------------------------------------------------------------
  # ● 初始化
  #--------------------------------------------------------------------------
  def initialize
    @data = []
  end
  #--------------------------------------------------------------------------
  # ● 获取变量
  #     variable_id : 变量 ID
  #--------------------------------------------------------------------------
  def [](variable_id)
    if variable_id <= 5000 and @data[variable_id] != nil
      return @data[variable_id]
    else
      return 0
    end
  end
  #--------------------------------------------------------------------------
  # ● 设置变量
  #     variable_id : 变量 ID
  #     value       : 变量的值
  #--------------------------------------------------------------------------
  def []=(variable_id, value)
    if variable_id <= 5000
      @data[variable_id] = value
    end
  end
end
#==============================================================================
# ■ Game_SelfSwitches
#------------------------------------------------------------------------------
# 　处理独立开关的类。编入的是类 Hash 的外壳。本类的实例请参考
# $game_self_switches。
#==============================================================================

class Game_SelfSwitches
  #--------------------------------------------------------------------------
  # ● 初始化对像
  #--------------------------------------------------------------------------
  def initialize
    @data = {}
  end
  #--------------------------------------------------------------------------
  # ● 获取独立开关
  #     key : 键
  #--------------------------------------------------------------------------
  def [](key)
    return @data[key] == true ? true : false
  end
  #--------------------------------------------------------------------------
  # ● 设置独立开关
  #     key   : 键
  #     value : ON (true) / OFF (false)
  #--------------------------------------------------------------------------
  def []=(key, value)
    @data[key] = value
  end
end
#==============================================================================
# ■ Game_Screen
#------------------------------------------------------------------------------
# 　更改色调以及画面闪烁、保存画面全体关系处理数据的类。本类的实例请参考
# $game_screen。
#==============================================================================

class Game_Screen
  #--------------------------------------------------------------------------
  # ● 定义实例变量
  #--------------------------------------------------------------------------
  attr_reader   :tone                     # 色调
  attr_reader   :flash_color              # 闪烁色
  attr_reader   :shake                    # 震动位置
  attr_reader   :pictures                 # 图片
  attr_reader   :weather_type             # 天候 类型
  attr_reader   :weather_max              # 天候 图像的最大数
  #--------------------------------------------------------------------------
  # ● 初试化对像
  #--------------------------------------------------------------------------
  def initialize
    @tone = Tone.new(0, 0, 0, 0)
    @tone_target = Tone.new(0, 0, 0, 0)
    @tone_duration = 0
    @flash_color = Color.new(0, 0, 0, 0)
    @flash_duration = 0
    @shake_power = 0
    @shake_speed = 0
    @shake_duration = 0
    @shake_direction = 1
    @shake = 0
    @pictures = [nil]
    for i in 1..100
      @pictures.push(Game_Picture.new(i))
    end
    @weather_type = 0
    @weather_max = 0.0
    @weather_type_target = 0
    @weather_max_target = 0.0
    @weather_duration = 0
  end
  #--------------------------------------------------------------------------
  # ● 开始更改色调
  #     tone     : 色调
  #     duration : 时间
  #--------------------------------------------------------------------------
  def start_tone_change(tone, duration)
    @tone_target = tone.clone
    @tone_duration = duration
    if @tone_duration == 0
      @tone = @tone_target.clone
    end
  end
  #--------------------------------------------------------------------------
  # ● 开始画面闪烁
  #     color    : 色
  #     duration : 时间
  #--------------------------------------------------------------------------
  def start_flash(color, duration)
    @flash_color = color.clone
    @flash_duration = duration
  end
  #--------------------------------------------------------------------------
  # ● 开始震动
  #     power    : 强度
  #     speed    : 速度
  #     duration : 时间
  #--------------------------------------------------------------------------
  def start_shake(power, speed, duration)
    @shake_power = power
    @shake_speed = speed
    @shake_duration = duration
  end
  #--------------------------------------------------------------------------
  # ● 设置天候
  #     type     : 类型
  #     power    : 强度
  #     duration : 时间
  #--------------------------------------------------------------------------
  def weather(type, power, duration)
    @weather_type_target = type
    if @weather_type_target != 0
      @weather_type = @weather_type_target
    end
    if @weather_type_target == 0
      @weather_max_target = 0.0
    else
      @weather_max_target = (power + 1) * 4.0
    end
    @weather_duration = duration
    if @weather_duration == 0
      @weather_type = @weather_type_target
      @weather_max = @weather_max_target
    end
  end
  #--------------------------------------------------------------------------
  # ● 刷新画面
  #--------------------------------------------------------------------------
  def update
    if @tone_duration >= 1
      d = @tone_duration
      @tone.red = (@tone.red * (d - 1) + @tone_target.red) / d
      @tone.green = (@tone.green * (d - 1) + @tone_target.green) / d
      @tone.blue = (@tone.blue * (d - 1) + @tone_target.blue) / d
      @tone.gray = (@tone.gray * (d - 1) + @tone_target.gray) / d
      @tone_duration -= 1
    end
    if @flash_duration >= 1
      d = @flash_duration
      @flash_color.alpha = @flash_color.alpha * (d - 1) / d
      @flash_duration -= 1
    end
    if @shake_duration >= 1 or @shake != 0
      delta = (@shake_power * @shake_speed * @shake_direction) / 10.0
      if @shake_duration <= 1 and @shake * (@shake + delta) < 0
        @shake = 0
      else
        @shake += delta
      end
      if @shake > @shake_power * 2
        @shake_direction = -1
      end
      if @shake < - @shake_power * 2
        @shake_direction = 1
      end
      if @shake_duration >= 1
        @shake_duration -= 1
      end
    end
    if @weather_duration >= 1
      d = @weather_duration
      @weather_max = (@weather_max * (d - 1) + @weather_max_target) / d
      @weather_duration -= 1
      if @weather_duration == 0
        @weather_type = @weather_type_target
      end
    end
    if $game_temp.in_battle
      for i in 51..100
        @pictures[i].update
      end
    else
      for i in 1..50
        @pictures[i].update
      end
    end
  end
end
#==============================================================================
# ■ Game_Picture
#------------------------------------------------------------------------------
# 　处理图片的类。本类在类 Game_Screen ($game_screen)
# 的内部使用。
#==============================================================================

class Game_Picture
  #--------------------------------------------------------------------------
  # ● 定义实例变量
  #--------------------------------------------------------------------------
  attr_reader   :number                   # 图片编号
  attr_reader   :name                     # 文件名
  attr_reader   :origin                   # 原点
  attr_reader   :x                        # X 坐标
  attr_reader   :y                        # Y 坐标
  attr_reader   :zoom_x                   # X 方向放大率
  attr_reader   :zoom_y                   # Y 方向放大率
  attr_reader   :opacity                  # 不透明度
  attr_reader   :blend_type               # 合成方式
  attr_reader   :tone                     # 色调
  attr_reader   :angle                    # 旋转角度
  #--------------------------------------------------------------------------
  # ● 初始化对像
  #     number : 图片编号
  #--------------------------------------------------------------------------
  def initialize(number)
    @number = number
    @name = ""
    @origin = 0
    @x = 0.0
    @y = 0.0
    @zoom_x = 100.0
    @zoom_y = 100.0
    @opacity = 255.0
    @blend_type = 1
    @duration = 0
    @target_x = @x
    @target_y = @y
    @target_zoom_x = @zoom_x
    @target_zoom_y = @zoom_y
    @target_opacity = @opacity
    @tone = Tone.new(0, 0, 0, 0)
    @tone_target = Tone.new(0, 0, 0, 0)
    @tone_duration = 0
    @angle = 0
    @rotate_speed = 0
  end
  #--------------------------------------------------------------------------
  # ● 显示图片
  #     name         : 文件名
  #     origin       : 原点
  #     x            : X 坐标
  #     y            : Y 坐标
  #     zoom_x       : X 方向放大率
  #     zoom_y       : Y 方向放大率
  #     opacity      : 不透明度
  #     blend_type   : 合成方式
  #--------------------------------------------------------------------------
  def show(name, origin, x, y, zoom_x, zoom_y, opacity, blend_type)
    @name = name
    @origin = origin
    @x = x.to_f
    @y = y.to_f
    @zoom_x = zoom_x.to_f
    @zoom_y = zoom_y.to_f
    @opacity = opacity.to_f
    @blend_type = blend_type
    @duration = 0
    @target_x = @x
    @target_y = @y
    @target_zoom_x = @zoom_x
    @target_zoom_y = @zoom_y
    @target_opacity = @opacity
    @tone = Tone.new(0, 0, 0, 0)
    @tone_target = Tone.new(0, 0, 0, 0)
    @tone_duration = 0
    @angle = 0
    @rotate_speed = 0
  end
  #--------------------------------------------------------------------------
  # ● 移动图片
  #     duration     : 时间
  #     origin       : 原点
  #     x            : X 坐标
  #     y            : Y 坐标
  #     zoom_x       : X 方向放大率
  #     zoom_y       : Y 方向放大率
  #     opacity      : 不透明度
  #     blend_type   : 合成方式
  #--------------------------------------------------------------------------
  def move(duration, origin, x, y, zoom_x, zoom_y, opacity, blend_type)
    @duration = duration
    @origin = origin
    @target_x = x.to_f
    @target_y = y.to_f
    @target_zoom_x = zoom_x.to_f
    @target_zoom_y = zoom_y.to_f
    @target_opacity = opacity.to_f
    @blend_type = blend_type
  end
  #--------------------------------------------------------------------------
  # ● 更改旋转速度
  #     speed : 旋转速度
  #--------------------------------------------------------------------------
  def rotate(speed)
    @rotate_speed = speed
  end
  #--------------------------------------------------------------------------
  # ● 开始更改色调
  #     tone     : 色调
  #     duration : 时间
  #--------------------------------------------------------------------------
  def start_tone_change(tone, duration)
    @tone_target = tone.clone
    @tone_duration = duration
    if @tone_duration == 0
      @tone = @tone_target.clone
    end
  end
  #--------------------------------------------------------------------------
  # ● 消除图片
  #--------------------------------------------------------------------------
  def erase
    @name = ""
  end
  #--------------------------------------------------------------------------
  # ● 刷新画面
  #--------------------------------------------------------------------------
  def update
    if @duration >= 1
      d = @duration
      @x = (@x * (d - 1) + @target_x) / d
      @y = (@y * (d - 1) + @target_y) / d
      @zoom_x = (@zoom_x * (d - 1) + @target_zoom_x) / d
      @zoom_y = (@zoom_y * (d - 1) + @target_zoom_y) / d
      @opacity = (@opacity * (d - 1) + @target_opacity) / d
      @duration -= 1
    end
    if @tone_duration >= 1
      d = @tone_duration
      @tone.red = (@tone.red * (d - 1) + @tone_target.red) / d
      @tone.green = (@tone.green * (d - 1) + @tone_target.green) / d
      @tone.blue = (@tone.blue * (d - 1) + @tone_target.blue) / d
      @tone.gray = (@tone.gray * (d - 1) + @tone_target.gray) / d
      @tone_duration -= 1
    end
    if @rotate_speed != 0
      @angle += @rotate_speed / 2.0
      while @angle < 0
        @angle += 360
      end
      @angle %= 360
    end
  end
end
#==============================================================================
# ■ Game_Battler (分割定义 1)
#------------------------------------------------------------------------------
# 　处理战斗者的类。这个类作为 Game_Actor 类与 Game_Enemy 类的
# 超级类来使用。
#==============================================================================

class Game_Battler
  #--------------------------------------------------------------------------
  # ● 定义实例变量
  #--------------------------------------------------------------------------
  attr_reader   :battler_name             # 战斗者 文件名
  attr_reader   :battler_hue              # 战斗者 色相
  attr_reader   :hp                       # HP
  attr_reader   :sp                       # SP
  attr_accessor :states                   # 状态
  attr_accessor :hidden                   # 隐藏标志
  attr_accessor :immortal                 # 不死身标志
  attr_accessor :damage_pop               # 显示伤害标志
  attr_accessor :damage                   # 伤害值
  attr_accessor :critical                 # 会心一击标志
  attr_accessor :animation_id             # 动画 ID
  attr_accessor :animation_hit            # 动画 击中标志
  attr_accessor :white_flash              # 白色屏幕闪烁标志
  attr_accessor :blink                    # 闪烁标志
  #--------------------------------------------------------------------------
  # ● 初始化对像
  #--------------------------------------------------------------------------
  def initialize
    @battler_name = ""
    @battler_hue = 0
    @hp = 0
    @sp = 0
    @states = []
    @states_turn = {}
    @maxhp_plus = 0
    @maxsp_plus = 0
    @str_plus = 0
    @dex_plus = 0
    @agi_plus = 0
    @int_plus = 0
    @hidden = false
    @immortal = false
    @damage_pop = false
    @damage = nil
    @critical = false
    @animation_id = 0
    @animation_hit = false
    @white_flash = false
    @blink = false
    @current_action = Game_BattleAction.new
  end
  #--------------------------------------------------------------------------
  # ● 获取 MaxHP
  #--------------------------------------------------------------------------
  def maxhp
    n = [[base_maxhp + @maxhp_plus, 1].max, 65535].min
    for i in @states
      n *= $data_states[i].maxhp_rate / 100.0
    end
    n = [[Integer(n), 1].max, 65535].min
    return n
  end
  #--------------------------------------------------------------------------
  # ● 获取 MaxSP
  #--------------------------------------------------------------------------
  def maxsp
    n = [[base_maxsp + @maxsp_plus, 0].max, 65535].min
    for i in @states
      n *= $data_states[i].maxsp_rate / 100.0
    end
    n = [[Integer(n), 0].max, 65535].min
    return n
  end
  #--------------------------------------------------------------------------
  # ● 获取力量
  #--------------------------------------------------------------------------
  def str
    n = [[base_str + @str_plus, 1].max, 9999].min
    for i in @states
      n *= $data_states[i].str_rate / 100.0
    end
    n = [[Integer(n), 1].max, 9999].min
    return n
  end
  #--------------------------------------------------------------------------
  # ● 获取灵巧
  #--------------------------------------------------------------------------
  def dex
    n = [[base_dex + @dex_plus, 1].max, 9999].min
    for i in @states
      n *= $data_states[i].dex_rate / 100.0
    end
    n = [[Integer(n), 1].max, 9999].min
    return n
  end
  #--------------------------------------------------------------------------
  # ● 获取速度
  #--------------------------------------------------------------------------
  def agi
    n = [[base_agi + @agi_plus, 1].max, 9999].min
    for i in @states
      n *= $data_states[i].agi_rate / 100.0
    end
    n = [[Integer(n), 1].max, 9999].min
    return n
  end
  #--------------------------------------------------------------------------
  # ● 获取魔力
  #--------------------------------------------------------------------------
  def int
    n = [[base_int + @int_plus, 1].max, 9999].min
    for i in @states
      n *= $data_states[i].int_rate / 100.0
    end
    n = [[Integer(n), 1].max, 9999].min
    return n
  end
  #--------------------------------------------------------------------------
  # ● 设置 MaxHP
  #     maxhp : 新的 MaxHP
  #--------------------------------------------------------------------------
  def maxhp=(maxhp)
    @maxhp_plus += maxhp - self.maxhp
    @maxhp_plus = [[@maxhp_plus, -9999].max, 65535].min
    @hp = [@hp, self.maxhp].min
  end
  #--------------------------------------------------------------------------
  # ● 设置 MaxSP
  #     maxsp : 新的 MaxSP
  #--------------------------------------------------------------------------
  def maxsp=(maxsp)
    @maxsp_plus += maxsp - self.maxsp
    @maxsp_plus = [[@maxsp_plus, -9999].max, 65535].min
    @sp = [@sp, self.maxsp].min
  end
  #--------------------------------------------------------------------------
  # ● 设置力量
  #     str : 新的力量
  #--------------------------------------------------------------------------
  def str=(str)
    @str_plus += str - self.str
    @str_plus = [[@str_plus, -9999].max, 9999].min
  end
  #--------------------------------------------------------------------------
  # ● 设置灵巧
  #     dex : 新的灵巧
  #--------------------------------------------------------------------------
  def dex=(dex)
    @dex_plus += dex - self.dex
    @dex_plus = [[@dex_plus, -9999].max, 9999].min
  end
  #--------------------------------------------------------------------------
  # ● 设置速度
  #     agi : 新的速度
  #--------------------------------------------------------------------------
  def agi=(agi)
    @agi_plus += agi - self.agi
    @agi_plus = [[@agi_plus, -9999].max, 9999].min
  end
  #--------------------------------------------------------------------------
  # ● 设置魔力
  #     int : 新的魔力
  #--------------------------------------------------------------------------
  def int=(int)
    @int_plus += int - self.int
    @int_plus = [[@int_plus, -9999].max, 9999].min
  end
  #--------------------------------------------------------------------------
  # ● 获取命中率
  #--------------------------------------------------------------------------
  def hit
    n = 100
    for i in @states
      n *= $data_states[i].hit_rate / 100.0
    end
    return Integer(n)
  end
  #--------------------------------------------------------------------------
  # ● 获取攻击力
  #--------------------------------------------------------------------------
  def atk
    n = base_atk
    for i in @states
      n *= $data_states[i].atk_rate / 100.0
    end
    return Integer(n)
  end
  #--------------------------------------------------------------------------
  # ● 获取物理防御
  #--------------------------------------------------------------------------
  def pdef
    n = base_pdef
    for i in @states
      n *= $data_states[i].pdef_rate / 100.0
    end
    return Integer(n)
  end
  #--------------------------------------------------------------------------
  # ● 获取魔法防御
  #--------------------------------------------------------------------------
  def mdef
    n = base_mdef
    for i in @states
      n *= $data_states[i].mdef_rate / 100.0
    end
    return Integer(n)
  end
  #--------------------------------------------------------------------------
  # ● 获取回避修正
  #--------------------------------------------------------------------------
  def eva
    n = base_eva
    for i in @states
      n += $data_states[i].eva
    end
    return n
  end
  #--------------------------------------------------------------------------
  # ● 更改 HP
  #     hp : 新的 HP
  #--------------------------------------------------------------------------
  def hp=(hp)
    @hp = [[hp, maxhp].min, 0].max
    # 解除附加的战斗不能状态
    for i in 1...$data_states.size
      if $data_states[i].zero_hp
        if self.dead?
          add_state(i)
        else
          remove_state(i)
        end
      end
    end
  end
  #--------------------------------------------------------------------------
  # ● 更改 SP
  #     sp : 新的 SP
  #--------------------------------------------------------------------------
  def sp=(sp)
    @sp = [[sp, maxsp].min, 0].max
  end
  #--------------------------------------------------------------------------
  # ● 全回复
  #--------------------------------------------------------------------------
  def recover_all
    @hp = maxhp
    @sp = maxsp
    for i in @states.clone
      remove_state(i)
    end
  end
  #--------------------------------------------------------------------------
  # ● 获取当前的动作
  #--------------------------------------------------------------------------
  def current_action
    return @current_action
  end
  #--------------------------------------------------------------------------
  # ● 确定动作速度
  #--------------------------------------------------------------------------
  def make_action_speed
    @current_action.speed = agi + rand(10 + agi / 4)
  end
  #--------------------------------------------------------------------------
  # ● 战斗不能判定
  #--------------------------------------------------------------------------
  def dead?
    return (@hp == 0 and not @immortal)
  end
  #--------------------------------------------------------------------------
  # ● 存在判定
  #--------------------------------------------------------------------------
  def exist?
    return (not @hidden and (@hp > 0 or @immortal))
  end
  #--------------------------------------------------------------------------
  # ● HP 0 判定
  #--------------------------------------------------------------------------
  def hp0?
    return (not @hidden and @hp == 0)
  end
  #--------------------------------------------------------------------------
  # ● 可以输入命令判定
  #--------------------------------------------------------------------------
  def inputable?
    return (not @hidden and restriction <= 1)
  end
  #--------------------------------------------------------------------------
  # ● 可以行动判定
  #--------------------------------------------------------------------------
  def movable?
    return (not @hidden and restriction < 4)
  end
  #--------------------------------------------------------------------------
  # ● 防御中判定
  #--------------------------------------------------------------------------
  def guarding?
    return (@current_action.kind == 0 and @current_action.basic == 1)
  end
  #--------------------------------------------------------------------------
  # ● 休止中判定
  #--------------------------------------------------------------------------
  def resting?
    return (@current_action.kind == 0 and @current_action.basic == 3)
  end
end
#==============================================================================
# ■ Game_Battler (分割定义 2)
#------------------------------------------------------------------------------
# 　处理战斗者的类。这个类作为 Game_Actor 类与 Game_Enemy 类的
# 超级类来使用。
#==============================================================================

class Game_Battler
  #--------------------------------------------------------------------------
  # ● 检查状态
  #     state_id : 状态 ID
  #--------------------------------------------------------------------------
  def state?(state_id)
    # 如果符合被附加的状态的条件就返回 ture
    return @states.include?(state_id)
  end
  #--------------------------------------------------------------------------
  # ● 判断状态是否为 full
  #     state_id : 状态 ID
  #--------------------------------------------------------------------------
  def state_full?(state_id)
    # 如果符合被附加的状态的条件就返回 false
    unless self.state?(state_id)
      return false
    end
    # 秩序回合数 -1 (自动状态) 然后返回 true
    if @states_turn[state_id] == -1
      return true
    end
    # 当持续回合数等于自然解除的最低回合数时返回 ture
    return @states_turn[state_id] == $data_states[state_id].hold_turn
  end
  #--------------------------------------------------------------------------
  # ● 附加状态
  #     state_id : 状态 ID
  #     force    : 强制附加标志 (处理自动状态时使用)
  #--------------------------------------------------------------------------
  def add_state(state_id, force = false)
    # 无效状态的情况下
    if $data_states[state_id] == nil
      # 过程结束
      return
    end
    # 无法强制附加的情况下
    unless force
      # 已存在的状态循环
      for i in @states
        # 新的状态和已经存在的状态 (-) 同时包含的情况下、
        # 本状态不包含变化为新状态的状态变化 (-) 
        # (ex : 战斗不能与附加中毒同时存在的场合)
        if $data_states[i].minus_state_set.include?(state_id) and
           not $data_states[state_id].minus_state_set.include?(i)
          # 过程结束
          return
        end
      end
    end
    # 无法附加本状态的情况下
    unless state?(state_id)
      # 状态 ID 追加到 @states 序列中
      @states.push(state_id)
      # 选项 [当作 HP 0 的状态] 有效的情况下
      if $data_states[state_id].zero_hp
        # HP 更改为 0
        @hp = 0
      end
      # 所有状态的循环
      for i in 1...$data_states.size
        # 状态变化 (+) 处理
        if $data_states[state_id].plus_state_set.include?(i)
          add_state(i)
        end
        # 状态变化 (-) 处理
        if $data_states[state_id].minus_state_set.include?(i)
          remove_state(i)
        end
      end
      # 按比例大的排序 (值相等的情况下按照强度排序)
      @states.sort! do |a, b|
        state_a = $data_states[a]
        state_b = $data_states[b]
        if state_a.rating > state_b.rating
          -1
        elsif state_a.rating < state_b.rating
          +1
        elsif state_a.restriction > state_b.restriction
          -1
        elsif state_a.restriction < state_b.restriction
          +1
        else
          a <=> b
        end
      end
    end
    # 强制附加的场合
    if force
      # 设置为自然解除的最低回数 -1 (无效)
      @states_turn[state_id] = -1
    end
    # 不能强制附加的场合
    unless  @states_turn[state_id] == -1
      # 设置为自然解除的最低回数
      @states_turn[state_id] = $data_states[state_id].hold_turn
    end
    # 无法行动的场合
    unless movable?
      # 清除行动
      @current_action.clear
    end
    # 检查 HP 及 SP 的最大值
    @hp = [@hp, self.maxhp].min
    @sp = [@sp, self.maxsp].min
  end
  #--------------------------------------------------------------------------
  # ● 解除状态
  #     state_id : 状态 ID
  #     force    : 强制解除标志 (处理自动状态时使用)
  #--------------------------------------------------------------------------
  def remove_state(state_id, force = false)
    # 无法附加本状态的情况下
    if state?(state_id)
      # 被强制附加的状态、并不是强制解除的情况下
      if @states_turn[state_id] == -1 and not force
        # 过程结束
        return
      end
      # 现在的 HP 为 0 当作选项 [当作 HP 0 的状态]有效的场合
      if @hp == 0 and $data_states[state_id].zero_hp
        # 判断是否有另外的 [当作 HP 0 的状态]状态
        zero_hp = false
        for i in @states
          if i != state_id and $data_states[i].zero_hp
            zero_hp = true
          end
        end
        # 如果可以解除战斗不能、将 HP 更改为 1
        if zero_hp == false
          @hp = 1
        end
      end
      # 将状态 ID 从 @states 队列和 @states_turn hash 中删除 
      @states.delete(state_id)
      @states_turn.delete(state_id)
    end
    # 检查 HP 及 SP 的最大值
    @hp = [@hp, self.maxhp].min
    @sp = [@sp, self.maxsp].min
  end
  #--------------------------------------------------------------------------
  # ● 获取状态的动画 ID
  #--------------------------------------------------------------------------
  def state_animation_id
    # 一个状态也没被附加的情况下
    if @states.size == 0
      return 0
    end
    # 返回概率最大的状态动画 ID
    return $data_states[@states[0]].animation_id
  end
  #--------------------------------------------------------------------------
  # ● 获取限制
  #--------------------------------------------------------------------------
  def restriction
    restriction_max = 0
    # 从当前附加的状态中获取最大的 restriction 
    for i in @states
      if $data_states[i].restriction >= restriction_max
        restriction_max = $data_states[i].restriction
      end
    end
    return restriction_max
  end
  #--------------------------------------------------------------------------
  # ● 判断状态 [无法获得 EXP]
  #--------------------------------------------------------------------------
  def cant_get_exp?
    for i in @states
      if $data_states[i].cant_get_exp
        return true
      end
    end
    return false
  end
  #--------------------------------------------------------------------------
  # ● 判断状态 [无法回避攻击]
  #--------------------------------------------------------------------------
  def cant_evade?
    for i in @states
      if $data_states[i].cant_evade
        return true
      end
    end
    return false
  end
  #--------------------------------------------------------------------------
  # ● 判断状态 [连续伤害]
  #--------------------------------------------------------------------------
  def slip_damage?
    for i in @states
      if $data_states[i].slip_damage
        return true
      end
    end
    return false
  end
  #--------------------------------------------------------------------------
  # ● 解除战斗用状态 (战斗结束时调用)
  #--------------------------------------------------------------------------
  def remove_states_battle
    for i in @states.clone
      if $data_states[i].battle_only
        remove_state(i)
      end
    end
  end
  #--------------------------------------------------------------------------
  # ● 状态自然解除 (回合改变时调用)
  #--------------------------------------------------------------------------
  def remove_states_auto(window)
    for i in @states_turn.keys.clone
      if @states_turn[i] > 0
        @states_turn[i] -= 1
      elsif rand(100) < $data_states[i].auto_release_prob
        remove_state(i)
        k=state_to_skill(i)
        if k>0
          if self.is_a?(Game_Actor)
            defender=$game_troop.enemies[0]
          else
            defender=$game_actors[1]
          end
          words=get_skill_words(self,defender,k)
          window.draw_words(words[1])
          window.visible=true
          for k in 0..20
            Graphics.update
          end
          window.visible=false
        end
      end
    end
  end
  #--------------------------------------------------------------------------
  # ● 状态攻击解除 (受到物理伤害时调用)
  #--------------------------------------------------------------------------
  def remove_states_shock
    for i in @states.clone
      if rand(100) < $data_states[i].shock_release_prob
        remove_state(i)
      end
    end
  end
  #--------------------------------------------------------------------------
  # ● 状态变化 (+) 的适用
  #     plus_state_set  : 状态变化 (+)
  #--------------------------------------------------------------------------
  def states_plus(plus_state_set)
    # 清除有效标志
    effective = false
    # 循环 (附加状态)
    for i in plus_state_set
      # 无法防御本状态的情况下
      unless self.state_guard?(i)
        # 这个状态如果不是 full 的话就设置有效标志
        effective |= self.state_full?(i) == false
        # 状态为 [不能抵抗] 的情况下
        if $data_states[i].nonresistance
          # 设置状态变化标志
          @state_changed = true
          # 附加状态
          add_state(i)
        # 这个状态不是 full 的情况下
        elsif self.state_full?(i) == false
          # 将状态的有效度变换为概率、与随机数比较
          if rand(100) < [0,100,80,60,40,20,0][self.state_ranks[i]]
            # 设置状态变化标志
            @state_changed = true
            # 附加状态
            add_state(i)
          end
        end
      end
    end
    # 过程结束
    return effective
  end
  #--------------------------------------------------------------------------
  # ● 状态变化 (-) 的使用
  #     minus_state_set : 状态变化 (-)
  #--------------------------------------------------------------------------
  def states_minus(minus_state_set)
    # 清除有效标志
    effective = false
    # 循环 (解除状态)
    for i in minus_state_set
      # 如果这个状态被附加则设置有效标志
      effective |= self.state?(i)
      # 设置状态变化标志
      @state_changed = true
      # 解除状态
      remove_state(i)
    end
    # 过程结束
    return effective
  end
end
#==============================================================================
# ■ Game_Battler (分割定义 3)
#------------------------------------------------------------------------------
# 　处理战斗者的类。这个类作为 Game_Actor 类与 Game_Enemy 类的
# 超级类来使用。
#==============================================================================

class Game_Battler
  #--------------------------------------------------------------------------
  # ● 可以使用特技的判定
  #     skill_id : 特技 ID
  #--------------------------------------------------------------------------
  def skill_can_use?(skill_id)
    # SP 不足的情况下不能使用
    if $data_skills[skill_id].sp_cost > self.sp
      return false
    end
    # 战斗不能的情况下不能使用
    if dead?
      return false
    end
    # 沉默状态的情况下、物理特技以外的特技不能使用
    if $data_skills[skill_id].atk_f == 0 and self.restriction == 1
      return false
    end
    # 获取可以使用的时机
    occasion = $data_skills[skill_id].occasion
    # 战斗中的情况下
    if $game_temp.in_battle
      # [平时] 或者是 [战斗中] 可以使用
      return (occasion == 0 or occasion == 1)
    # 不是战斗中的情况下
    else
      # [平时] 或者是 [菜单中] 可以使用
      return (occasion == 0 or occasion == 2)
    end
  end
  #--------------------------------------------------------------------------
  # ● 应用通常攻击效果
  #     attacker : 攻击者 (battler)
  #--------------------------------------------------------------------------
  def attack_effect(attacker,s_atk1,s_atk2,s_atk3)
    # 清除会心一击标志
    self.critical = false
    # 第一命中判定
    hit_result = (rand(100) < attacker.hit)
    hits=attacker.str
    percent=100*(hits-self.dex)/([self.dex,attacker.dex].min+1)
    n_hit=percent
    if attacker.is_a?(Game_Actor)
      n_hit=50 if self.npc_level==0
      hit_add=$game_variables[19]-$npc_data[26]
      hit_add/=([$game_variables[19],$npc_data[26]].min+1)
      n_hit+=10 if attacker.weapon_id !=0
    else
      n_hit=50 if get_actor_level==0
      hit_add=$npc_data[26]-$game_variables[19]
      hit_add/=([$game_variables[19],$npc_data[26]].min+1)
      n_hit+=10 if $npc_data[9] !=0
    end
    n_hit+=(50+rand(13))
    hit_add=[hit_add,80].min
    hit_add=[hit_add,-80].max
    n_hit+=hit_add*5
    hit_result &= (rand(100)<=n_hit)
    if hit_result == true
      $fenshen=false
      $gedang=false
      #判定影分身
      if attacker.state?(7)
        i=rand(100)
        if i<25
          text=draw_defend2_text(self,5).split('|')
          $defend_text=text[0]
          $dis_id=5
          $gedang=true
          hit_result=false
          self.damage="Miss"
          self.critical = false
          return true
        end
      end
      #判定格挡
      if self.is_a?(Game_Actor)
        if self.weapon_id !=0 and $game_variables[47]>0
          i=rand(100)
          j=($game_variables[14]+$game_variables[11])/2+10
          j+=($game_variables[47]*2+$game_variables[40])/30
          j=[j,55].min
          if i<j
            text=draw_defend2_text(self).split('|')
            $defend_text=text[0]
            $dis_id=text[1].to_i
            hit_result == false
            $gedang=true
            self.damage="Miss"
            self.critical = false
            return true
          end
        else
          if self.weapon_id==0 and $game_variables[47]>0
            i=rand(100)
            j=($game_variables[14]+$game_variables[11])/2
            j+=($game_variables[47]*2+$game_variables[40])/30
            j*=0.75
            j=[j,35].min
            if i<j
              $defend_text="结果被你挡开了"
              $dis_id=4
              hit_result == false
              $gedang=true
              self.damage="Miss"
              self.critical = false
              return true
            end
          end
        end
      else
        if $npc_data[9] !=0 and self.get_skill_level(47)>0
          i=rand(100)
          j=($npc_data[3]+$npc_data[0])/2+10
          j+=(self.get_skill_level(47)+2*self.get_skill_level(40))/30
          j=[j,55].min
          if i<j
            text=draw_defend2_text(self).split('|')
            $defend_text=text[0]
            $dis_id=text[1].to_i
            hit_result == false
            $gedang=true
            self.damage="Miss"
            self.critical = false
            return true
          end
        else
          if $npc_data[9]==0 and self.get_skill_level(47)>0
            i=rand(100)
            j=($npc_data[3]+$npc_data[0])/2
            j+=(self.get_skill_level(47)+2*self.get_skill_level(40))/30
            j*=0.75
            j=[j,35].min
            if i<j
              $defend_text="结果被"+self.name+"挡开了"
              $dis_id=4
              hit_result == false
              $gedang=true
              self.damage="Miss"
              self.critical = false
              return true
            end
          end
        end
      end
      # 计算基本伤害
      if attacker.is_a?(Game_Actor)
        if $game_variables[23]>0 and attacker.sp>0
          atk=attacker.atk+[attacker.sp/20,150].min
        else
          atk=attacker.atk-$game_variables[23]/2
        end
        dmg_per=$npc_data[28]*self.get_skill_level(77)/65535
        dmg_per=[dmg_per,0.3].min
        if 1.2*$game_actors[1].full_fp<$game_variables[24] and $game_switches[96]
          baoti=$game_variables[24]-$game_actors[1].full_fp*1.2
          gailv=rand($game_actors[1].full_fp)
          if gailv<= baoti
            $game_actors[1].hp/=2
            $game_actors[1].sp/=2
            $game_actors[1].maxhp/=2
          end
        end
        s_atk1=($game_variables[50]/10*5+s_atk1.to_i).to_s
      else
        if attacker.exp>0 and attacker.sp>0
          atk=attacker.atk+[attacker.sp/20,150].min
        else
          atk=attacker.atk-attacker.exp/2
        end
        dmg_per=$game_variables[96]*$game_variables[77]/65535.0
        dmg_per=[dmg_per,0.3].min
        s_atk1=(attacker.get_skill_level(50)/3+s_atk1.to_i).to_s
      end
      atk=atk*(s_atk1.to_i/100.0+0.8)
      self.damage=atk/2+rand(atk/2)
      self.damage*=(1.0-dmg_per)
      self.damage=self.damage.truncate
    end
    # 命中的情况下
    if hit_result == true
      if attacker.is_a?(Game_Actor)
        attacker.sp-=$game_variables[23]
        if attacker.sp<=0
          attacker.sp=0
        end
      else
        attacker.sp-=attacker.exp
        if attacker.sp<=0
          attacker.sp=0
        end
      end
      # 状态冲击解除
      remove_states_shock
      if attacker.is_a?(Game_Actor)
        if attacker.weapon_id !=0
          if weapon_matching_skill?
            sk_id=$game_variables[30]
          else
            sk_id=get_weapon_base_skill
          end
        else
          sk_id=$game_variables[29]!=0 ? $game_variables[29]:40
        end
        result_array=draw_hit_result(self.name,s_atk3)
        index=get_hit_index(damage)
        index=[index,result_array.size-1].min
        i=rand(1)
        $defend_text=result_array[index]+draw_hurt_text(self.name,self.hp-self.damage,self.maxhp,i)
      else
        if $npc_data[9]==0 
          sk_id=$npc_data[4]
          sk_id=40 if sk_id==0
        else
          sk_id=$npc_data[5]
          if sk_id==0
            case $npc_data[9]
            when 8,9,10,11,12,13,14,1,28,29
              sk_id=42
            when 2,3,4,6,7,15,16,17,18,19,20,30
              sk_id=41
            when 5,21,22,23,24
              sk_id=44
            when 25,26,27
              sk_id=43
            end
          end
        end
        full_hp=100+$game_variables[24]/4
        full_hp+=[($game_variables[157]-14)*20,300].min
        result_array=draw_hit_result("你",s_atk3)
        index=get_hit_index(damage)
        index=[index,result_array.size-1].min
        rand(100)<=(1-self.pdef/500.0)*s_atk2.to_i ? i=1 : i=0
        $defend_text=result_array[index]+draw_hurt_text("你",self.hp-self.damage,full_hp,i)
      end
      # HP 的伤害计算
      self.hp -= self.damage
      if self.is_a?(Game_Actor)
        if i==1
          self.maxhp-=[rand(self.damage*1.3),self.damage].min
          self.maxhp=[self.maxhp,1].max
        end
        attacker.hp+=(self.damage*(attacker.get_skill_level(51)/100.0)).truncate
      else
        attacker.hp+=(self.damage*($game_variables[51]/100.0)).truncate
        attacker.hp-=self.damage/2 if self.id==142
      end
      attacker.hp=[attacker.hp,attacker.maxhp].min
      # 状态变化
      @state_changed = false
      states_plus(attacker.plus_state_set)
      states_minus(attacker.minus_state_set)
    # Miss 的情况下
    else  
      text=draw_defend_text(self,attacker).split('|')
      $defend_text=text[0]
      $dis_id=text[1].to_i
      # 伤害设置为 "Miss"
      self.damage = "Miss"
      # 清除会心一击标志
      self.critical = false
    end
    # 过程结束
    return true
  end
  #--------------------------------------------------------------------------
  # ● 应用特技效果
  #     user  : 特技的使用者 (battler)
  #     skill : 特技
  #--------------------------------------------------------------------------
  def skill_effect(user, skill ,window)
    if skill.id !=26 and skill.id !=27
      words=get_skill_words(user ,self ,skill.id)
      window.draw_words(words[0])
      for i in 0..20
        Graphics.update
      end
    end
    if 1.2*$game_actors[1].full_fp<$game_variables[24] and $game_switches[96]
      baoti=$game_variables[24]-$game_actors[1].full_fp*1.2
      gailv=rand($game_actors[1].full_fp)
      if gailv<= baoti
        $game_actors[1].hp/=2
        $game_actors[1].sp/=2
        $game_actors[1].maxhp/=2
      end
    end
    $dis_id2=100
    case skill.id
    when 4,5,24,22,14,15,8,26,27
      attack_times(user,self,skill.id,window)
    #落英缤纷
    when 7
      set_turns(user,2)
      if user.is_a?(Game_Actor)
        if $npc_data[9]==0
          if hit_result?(user,self)
            $defend_text=words[3]
            $dis_id2=3
            self.damage=rand(200)+50
            self.add_state(2)
            self.hp-=self.damage
            user.hp-=self.damage/2 if self.id==142
          else
            $defend_text=words[4]
            $dis_id2=4
            user.add_state(1)
            self.damage="Miss"
          end
        else
          if hit_result?(user,self)
            $defend_text=words[1]
            $dis_id2=1
            id=$npc_data[9]
            $game_party.gain_weapon(id,1)
            $npc_data[9]=0
          else
            $defend_text=words[2]
            $dis_id2=2
            user.add_state(1)
          end
          self.damage=0
        end
      else
        if self.weapon_id==0
          if hit_result?(user,self)
            $defend_text=words[3]
            self.damage=rand(200)+50
            self.add_state(2)
            self.hp-=self.damage
          else
            $defend_text=words[4]
            user.add_state(1)
            self.damage="Miss"
          end
        else
          if hit_result?(user,self)
            $defend_text=words[1]
            id=self.weapon_id
            $game_actors[1].equip(0,0)
            $game_party.gain_weapon(id,-1)
          else
            $defend_text=words[2]
            user.add_state(1)
          end
          self.damage=0
        end
      end
    #八阵化掌为刀
    when 2
      set_turns(user,4)
      if user.is_a?(Game_Actor)
        $game_variables[91]+=$game_variables[54]/10
        $game_variables[94]+=$game_variables[54]/10
        $game_variables[91]=[$game_variables[91],255].min
        $game_variables[94]=[$game_variables[94],255].min
      else
        $npc_data[29]+=user.get_skill_level(54)/10
        $npc_data[24]+=user.get_skill_level(54)/10
        $npc_data[29]=[$npc_data[29],255].min
        $npc_data[24]=[$npc_data[24],255].min
      end
      user.add_state(1)
      $defend_text=""
      self.damage="Miss"
    #八卦化掌为刀
    when 3
      set_turns(user,2)
      if user.is_a?(Game_Actor)
        $game_variables[94] += (($game_variables[40]+$game_variables[53])/20)
        $game_variables[94]=[$game_variables[94],255].min
      else
        $npc_data[24]+=user.get_skill_level(54)/10
        $npc_data[24]=[$npc_data[24],255].min
      end
      $defend_text=""
      self.damage="Miss"
    #三花
    when 6
      set_turns(user,9)
      if user.is_a?(Game_Actor)
        $game_variables[92]+=($game_variables[73]/5-4)
        $game_variables[92]=[$game_variables[92],255].min
        $game_variables[95]=($game_variables[45]+2*$game_variables[73])/10-5
      else
        $npc_data[30]+=user.get_skill_level(73)/5-4
        $npc_data[30]=[$npc_data[30],255].min
        $npc_data[25]=user.get_skill_level(45)+2*user.get_skill_level(73)/10-5
      end
      $defend_text=""
      self.damage="Miss"
    #雷动九天
    when 9
      if user.is_a?(Game_Actor)
        $game_variables[91]+=(3+($game_variables[45]+$game_variables[74])/10)
        $game_variables[91]=[$game_variables[91],255].min
      else
        $npc_data[29]+=3+(user.get_skill_level(45)+user.get_skill_level(74))/10
        $npc_data[29]=[$npc_data[29],255].min
      end
      $defend_text=""
      self.damage="Miss"
    #红莲出世
    when 10
      if user.is_a?(Game_Actor)
        $game_variables[94]+=(($game_variables[45]+$game_variables[74])/10-3)
        $game_variables[94]=[$game_variables[94],255].min
      else
        $npc_data[24]+=(user.get_skill_level(45)+user.get_skill_level(74))/10-3
        $npc_data[24]=[$npc_data[24],255].min
      end
      user.add_state(11)
      $defend_text=""
      self.damage="Miss"
    #忍法影分身
    when 13
      set_turns(user,7)
      if user.is_a?(Game_Actor)
        $game_variables[93]=90
        $game_variables[22]=30
      end
      self.add_state(7)
      $defend_text=""
      self.damage="Miss"
    #连字诀
    when 21
      set_turns(user,6)
      if user.is_a?(Game_Actor)
        $game_variables[94]+=10
        $game_variables[95]+=($game_variables[85]/10)
        $game_variables[95]=[$game_variables[95],255].min
        $game_variables[94]=[$game_variables[94],255].min
      else
        $npc_data[24]+=10
        $npc_data[25]+=user.get_skill_level(85)/10
        $npc_data[25]=[$npc_data[25],255].min
        $npc_data[24]=[$npc_data[24],255].min
      end
      $defend_text=""
      self.damage="Miss"
    #冰心诀
    when 25
      set_turns(user,5)
      if user.is_a?(Game_Actor)
        $game_variables[96]+=($game_variables[45]/8+$game_variables[77]/4)
        $game_variables[96]=[$game_variables[96],255].min
      else
        $npc_data[28]+=user.get_skill_level(45)/8+user.get_skill_level(77)/4
        $npc_data[28]=[$npc_data[28],255].min
      end
      $defend_text=""
      self.damage="Miss"
    #流星飞掷
    when 11
      if user.is_a?(Game_Actor)
        hit=($game_variables[11]+$game_variables[40]/10+$game_variables[91])/33.0
        dama=$game_variables[11]*2+($game_variables[43]/2+$game_variables[89])*2
      else
        hit=($npc_data[0]+user.get_skill_level(40)/10+$npc_data[29])/33.0
        dama=$npc_data[0]*2+(user.get_skill_level(43)/2+user.get_skill_level(89))*2
      end
      hit*=(40*(user.sp+1.0)/(2*self.sp+1.0))
      hit=0 if user.sp<=self.sp/3.0
      hit=0 if self.id>125
      hit=[hit,40].min
      hit_result=(rand(100)<hit)
      if hit_result
        self.damage=dama
        $defend_text=words[1]
        $dis_id2=1
        self.hp-=self.damage
      else
        $defend_text=words[2]
        $dis_id2=2
        user.add_state(1)
        self.damage="Miss"
      end
      if user.is_a?(Game_Actor)
        id=$game_actors[1].weapon_id
        $game_actors[1].equip(0,0)
        $game_party.lose_weapon(id,1)
      else
        id=$npc_data[9]
        $npc_data[9]=0
      end
    #忍术烟幕
    when 12
      set_turns(user,10)
      if user.is_a?(Game_Actor)
        $game_variables[94]=$npc_data[24]
        $game_variables[94]=[$game_variables[94],255].min
      else
        $npc_data[24]=$game_variables[94]
        $npc_data[24]=[$npc_data[24],255].min
      end
      if hit_result?(user,self)
        $defend_text=""
        self.add_state(10)
      else
        $defend_text=words[2]
        user.add_state(3)
        $dis_id2=2
      end
      self.damage="Miss"
    #挤字诀
    when 16
      hit=85*(user.sp+1.0)/(self.sp+1.0)
      hit=0 if user.sp<=self.sp/3.0
      hit=[hit,85].min
      hit_result=(rand(100)<=hit)
      if hit_result
        if (user.sp+1.0)/(self.sp+1.0)<=1
          $defend_text=words[2]
          $dis_id2=2
          self.sp-=350
          self.sp=[self.sp,0].max
        else
          $defend_text=words[1]
          $dis_id2=1
          if user.is_a?(Game_Actor)
            self.sp-=(user.sp/10+350+$game_variables[23])
          else
            self.sp-=user.sp/10+350+user.exp
          end
          self.sp=[self.sp,0].max
        end
      else
        $defend_text=words[3]
        $dis_id2=3
        user.add_state(1)
      end
      self.damage=0
    #乱环诀，缠字诀
    when 17,20
      if hit_result?(user,self)
        $defend_text=words[1]
        $dis_id2=1
        self.add_state(2)
      else
        $defend_text=words[2]
        $dis_id2=2
        user.add_state(1)
      end
      self.damage=0
    #阴阳诀
    when 18
      if rand(100)<50
        #阴手
        window.draw_words(words[1])
        set_turns(user,19)
        for i in 0..20
          Graphics.update
        end
        if hit_result?(user,self)
          $defend_text=words[2]
          $dis_id2=12
          self.add_state(19)
        else
          $defend_text=words[3]
          $dis_id2=13
          user.add_state(1)
        end
        self.damage=0
      else
        #揽雀尾
        if user.is_a?(Game_Actor)
          $game_variables[91]+=(($game_variables[40]+$game_variables[58])/10)
          $game_variables[91]=[$game_variables[91],255].min
          $game_variables[94]+=15
          $game_variables[94]=[$game_variables[94],255].min
        else
          $npc_data[29]+=(user.get_skill_level(40)+user.get_skill_level(58))/10
          $npc_data[29]=[$npc_data[29],255].min
          $npc_data[24]+=15
          $npc_data[24]=[$npc_data[24],255].min
        end
        user.add_state(1)
        user.add_state(8)
        s_atk=draw_atk_text(user,self,58,0,0,window).split('|')
        self.attack_effect(user,s_atk[0],s_atk[1],s_atk[2])
        user.remove_state(8)
      end
    #神倒鬼跌
    when 23
      set_turns(user,19)
      if hit_result?(user,self)
        if user.is_a?(Game_Actor)
          self.damage=$game_variables[40]/5+$game_variables[59]*3/10
        else
          self.damage=user.get_skill_level(40)/5+user.get_skill_level(59)*3/10
        end
        $defend_text=words[1]
        $dis_id2=1
        self.hp-=self.damage
        user.hp-=self.damage/2 if self.is_a?(Game_Enemy) and self.id==142
        self.add_state(19)
      else
        $defend_text=words[2]
        $dis_id2=2
        user.add_state(1)
        self.damage="Miss"
      end
    #震字诀
    when 19
      if hit_result?(user,self)
        if user.is_a?(Game_Actor)
          self.damage=user.sp/10-self.sp/30+$game_variables[23]
        else
          self.damage=user.sp/10-self.sp/30+user.exp
        end
        $defend_text=words[1]
        $dis_id2=1
        user.hp-=self.damage/2 if self.id==142
        self.hp-=self.damage
      else
        $defend_text=words[2]
        $dis_id2=2
        user.add_state(1)
        self.damage="Miss"
      end
    end
    if skill.scope>=3
      states_plus(skill.plus_state_set)
      states_minus(skill.minus_state_set)
      self.damage = ""
      $defend_text=""
      return true
    end
    # 清除会心一击标志
    self.critical = false
    # 清除有效标志
    effective = true
    return effective
  end
  #--------------------------------------------------------------------------
  # ● 应用物品效果
  #     item : 物品
  #--------------------------------------------------------------------------
  def item_effect(item)
    # 清除会心一击标志
    self.critical = false
    # 物品的效果范围是 HP 1 以上的己方、自己的 HP 为 0、
    # 或者物品的效果范围是 HP 0 的己方、自己的 HP 为 1 以上的情况下
    if ((item.scope == 3 or item.scope == 4) and self.hp == 0) or
       ((item.scope == 5 or item.scope == 6) and self.hp >= 1)
      # 过程结束
      return false
    end
    # 清除有效标志
    effective = false
    # 公共事件 ID 是有效的情况下,设置为有效标志
    effective |= item.common_event_id > 0
    # 命中判定
    hit_result = (rand(100) < item.hit)
    # 不确定的特技的情况下设置为有效标志
    effective |= item.hit < 100
    # 命中的情况
    if hit_result == true
      # 计算回复量
      recover_hp = maxhp * item.recover_hp_rate / 100 + item.recover_hp
      recover_sp = maxsp * item.recover_sp_rate / 100 + item.recover_sp
      if recover_hp < 0
        recover_hp += self.pdef * item.pdef_f / 20
        recover_hp += self.mdef * item.mdef_f / 20
        recover_hp = [recover_hp, 0].min
      end
      # 属性修正
      recover_hp *= elements_correct(item.element_set)
      recover_hp /= 100
      recover_sp *= elements_correct(item.element_set)
      recover_sp /= 100
      # 分散
      if item.variance > 0 and recover_hp.abs > 0
        amp = [recover_hp.abs * item.variance / 100, 1].max
        recover_hp += rand(amp+1) + rand(amp+1) - amp
      end
      if item.variance > 0 and recover_sp.abs > 0
        amp = [recover_sp.abs * item.variance / 100, 1].max
        recover_sp += rand(amp+1) + rand(amp+1) - amp
      end
      # 回复量符号为负的情况下
      if recover_hp < 0
        # 防御修正
        if self.guarding?
          recover_hp /= 2
        end
      end
      # HP 回复量符号的反转、设置伤害值
      self.damage = -recover_hp
      # HP 以及 SP 的回复
      last_hp = self.hp
      last_sp = self.sp
      self.hp += recover_hp
      self.sp += recover_sp
      effective |= self.hp != last_hp
      effective |= self.sp != last_sp
      # 状态变化
      @state_changed = false
      effective |= states_plus(item.plus_state_set)
      effective |= states_minus(item.minus_state_set)
      # 能力上升值有效的情况下
      if item.parameter_type > 0 and item.parameter_points != 0
        # 能力值的分支
        case item.parameter_type
        when 1  # MaxHP
          @maxhp_plus += item.parameter_points
        when 2  # MaxSP
          @maxsp_plus += item.parameter_points
        when 3  # 力量
          @str_plus += item.parameter_points
        when 4  # 灵巧
          @dex_plus += item.parameter_points
        when 5  # 速度
          @agi_plus += item.parameter_points
        when 6  # 魔力
          @int_plus += item.parameter_points
        end
        # 设置有效标志
        effective = true
      end
      # HP 回复率与回复量为 0 的情况下
      if item.recover_hp_rate == 0 and item.recover_hp == 0
        # 设置伤害为空的字符串
        self.damage = ""
        # SP 回复率与回复量为 0、能力上升值无效的情况下
        if item.recover_sp_rate == 0 and item.recover_sp == 0 and
           (item.parameter_type == 0 or item.parameter_points == 0)
          # 状态没有变化的情况下
          unless @state_changed
            # 伤害设置为 "Miss"
            self.damage = "Miss"
          end
        end
      end
    # Miss 的情况下
    else
      # 伤害设置为 "Miss"
      self.damage = "Miss"
    end
    # 不在战斗中的情况下
    unless $game_temp.in_battle
      # 伤害设置为 nil
      self.damage = nil
    end
    # 过程结束
    return effective
  end
  #--------------------------------------------------------------------------
  # ● 应用连续伤害效果
  #--------------------------------------------------------------------------
  def slip_damage_effect
    # 设置伤害
    self.damage = self.maxhp / 20
    # 分散
    if self.damage.abs > 0
      amp = [self.damage.abs * 20 / 100, 1].max
      self.damage += rand(amp+1) + rand(amp+1) - amp
    end
    # HP 的伤害减法运算
    self.hp -= self.damage
    # 过程结束
    return true
  end
  #--------------------------------------------------------------------------
  # ● 属性修正计算
  #     element_set : 属性
  #--------------------------------------------------------------------------
  def elements_correct(element_set)
    # 無属性的情况
    if element_set == []
      # 返回 100
      return 100
    end
    # 在被赋予的属性中返回最弱的
    # ※过程 element_rate 是、本类以及继承的 Game_Actor
    #   和 Game_Enemy 类的定义
    weakest = -100
    for i in element_set
      weakest = [weakest, self.element_rate(i)].max
    end
    return weakest
  end
end#==============================================================================
# ■ Game_Battler (分割定义 4)
#------------------------------------------------------------------------------
# 　处理战斗者的类。这个类作为 Game_Actor 类与 Game_Enemy 类的
# 超级类来使用。本页主要处理绝招效果。
#==============================================================================
class Game_Battler
  #--------------------------------------------------------------------------
  # ● 状态转换成对应技能编号
  #--------------------------------------------------------------------------
  def state_to_skill(i)
    case i
    when 3
      return 3
    when 4
      return 2
    when 5
      return 25
    when 6
      return 21
    when 7
      return 13
    when 9
      return 6
    when 10
      return 12
    end
    return 0
  end
  #--------------------------------------------------------------------------
  # ● 获取击中描述序号
  #--------------------------------------------------------------------------
  def get_hit_index(damage)
    return 0 if damage<10
    return 1 if damage<20
    return 2 if damage<40
    return 3 if damage<80
    return 4 if damage<120
    return 5 if damage<160
    return 6 if damage<200
    return 7
  end
  #--------------------------------------------------------------------------
  # ● 命中判定
  #     user  : 绝招的使用者 (battler)
  #     target: 绝招目标
  #--------------------------------------------------------------------------
  def hit_result?(user,target)
    hit=85.0*(user.sp+1.0)/(target.sp+1.0)
    hit=0 if user.sp<=target.sp/3.0
    hit=[hit,85].min
    hit_result=(rand(100)<=hit)
    return hit_result
  end
  #--------------------------------------------------------------------------
  # ● 连击绝招
  #     user  : 绝招的使用者 (battler)
  #     id    : 绝招ID
  #     target: 绝招目标
  #--------------------------------------------------------------------------
  def attack_times(user,target,id,window)
    i1=0
    i2=0
    times1=0
    times2=0
    case id
    #雪花六出
    when 24
      i1=86
      if user.is_a?(Game_Actor)
        times1=2+($game_variables[86]-60)/20
        times1=[times1,5].min if $game_switches[101]==false
      else
        times1=2+(user.get_skill_level(86)-60)/20
        times1=[times1,5].min
      end
    #三环套月
    when 22
      i1=85
      times1=3
    #旋风三连斩
    when 14
      i1=82
      times1=3
    #迎风一刀斩
    when 15
      i1=82
      times1=1
      user.add_state(8)
    #柳浪闻莺
    when 8
      i1=55
      times1=2
      i2=81
      times2=1
    #八卦刀影掌
    when 4
      i1=53
      i2=80
      times1=1
      times2=1
    #八阵刀影掌
    when 5
      i1=54
      i2=80
      times1=2
      times2=1
    #周伯通左右互搏
    when 26
      i1=60
      i2=59
      times1=1
      times2=1
      user.add_state(20)
    #玩家左右互搏
    when 27
      i1=0
      times1=2
      user.add_state(20)
    end
    if id !=27 and user.is_a?(Game_Actor) and $game_switches[100]==true and $game_variables[13]<=16
      times1 *=2
      times2 *=2
      user.add_state(20)
    end
    for i in 1..times1
      s_atk=draw_atk_text(user,target,i1,0,0,window).split('|')
      target.attack_effect(user,s_atk[0],s_atk[1],s_atk[2])
      for a in 0..10
        Graphics.update
      end
      unless i==times1 and i2==0 
        # 对像方动画
        if ["Miss",""].include?(target.damage)
          Audio.se_play("Audio/SE/Miss.ogg")
        else
          Audio.se_play("Audio/SE/Blow8.ogg")
        end
        window.draw_words($defend_text)
        for a in 0..30
          Graphics.update
        end
      end
    end
    if i2 !=0
      for i in 1..times2
        s_atk=draw_atk_text(user,target,i2,0,0,window).split('|')
        target.attack_effect(user,s_atk[0],s_atk[1],s_atk[2])
        for a in 0..10
          Graphics.update
        end
        unless i==times2
          # 对像方动画
          if ["Miss",""].include?(target.damage)
            Audio.se_play("Audio/SE/Miss.ogg")
          else
            Audio.se_play("Audio/SE/Blow8.ogg")
          end
          window.draw_words($defend_text)
          for a in 0..30
            Graphics.update
          end
        end
      end
    end
    user.remove_state(8) if user.state?(8)
    user.remove_state(20) if user.state?(20)
    case id
    when 24,22,8
      user.add_state(1)
    when 14,15,4,5
      user.add_state(11)
    end
  end
  #--------------------------------------------------------------------------
  # ● 设置状态持续时间
  #--------------------------------------------------------------------------
  def set_turns(user,id)
    if user.is_a?(Game_Actor)
      $data_states[id].hold_turn=($game_variables[45]+$game_variables[$game_variables[32]])/40
    else
      for i in 72..77
        sk_id=i if user.get_skill_level(i)>0
      end
      $data_states[id].hold_turn=(user.get_skill_level(45)+user.get_skill_level(sk_id))/40
    end
  end
end
    #==============================================================================
# ■ Game_BattleAction
#------------------------------------------------------------------------------
# 　处理行动 (战斗中的行动) 的类。这个类在 Game_Battler 类
# 的内部使用。
#==============================================================================

class Game_BattleAction
  #--------------------------------------------------------------------------
  # ● 定义实例变量
  #--------------------------------------------------------------------------
  attr_accessor :speed                    # 速度
  attr_accessor :kind                     # 种类 (基本 / 特技 / 物品)
  attr_accessor :basic                    # 基本 (攻击 / 防御 / 逃跑)
  attr_accessor :skill_id                 # 特技 ID
  attr_accessor :item_id                  # 物品 ID
  attr_accessor :target_index             # 对像索引
  attr_accessor :forcing                  # 强制标志
  #--------------------------------------------------------------------------
  # ● 初始化对像
  #--------------------------------------------------------------------------
  def initialize
    clear
  end
  #--------------------------------------------------------------------------
  # ● 清除
  #--------------------------------------------------------------------------
  def clear
    @speed = 0
    @kind = 0
    @basic = 3
    @skill_id = 0
    @item_id = 0
    @target_index = -1
    @forcing = false
  end
  #--------------------------------------------------------------------------
  # ● 有效判定
  #--------------------------------------------------------------------------
  def valid?
    return (not (@kind == 0 and @basic == 3))
  end
  #--------------------------------------------------------------------------
  # ● 己方单体使用判定
  #--------------------------------------------------------------------------
  def for_one_friend?
    # 种类为特技、效果范围是我方单体 (包含 HP 0) 的情况
    if @kind == 1 and [3, 5].include?($data_skills[@skill_id].scope)
      return true
    end
    # 种类为物品、效果范围是我方单体 (包含 HP 0) 的情况
    if @kind == 2 and [3, 5].include?($data_items[@item_id].scope)
      return true
    end
    return false
  end
  #--------------------------------------------------------------------------
  # ● 己方单体用 (HP 0) 判定
  #--------------------------------------------------------------------------
  def for_one_friend_hp0?
    # 种类为特技、效果范围是我方单体 (HP 0) 的情况
    if @kind == 1 and [5].include?($data_skills[@skill_id].scope)
      return true
    end
    # 种类为物品、效果范围是我方单体 (HP 0) 的情况
    if @kind == 2 and [5].include?($data_items[@item_id].scope)
      return true
    end
    return false
  end
  #--------------------------------------------------------------------------
  # ● 随机目标 (角色用)
  #--------------------------------------------------------------------------
  def decide_random_target_for_actor
    # 效果范围的分支
    if for_one_friend_hp0?
      battler = $game_party.random_target_actor_hp0
    elsif for_one_friend?
      battler = $game_party.random_target_actor
    else
      battler = $game_troop.random_target_enemy
    end
    # 对像存在的话取得索引、
    # 对像不存在的场合下清除行动
    if battler != nil
      @target_index = battler.index
    else
      clear
    end
  end
  #--------------------------------------------------------------------------
  # ● 随机目标 (敌人用)
  #--------------------------------------------------------------------------
  def decide_random_target_for_enemy
    # 效果范围的分支
    if for_one_friend_hp0?
      battler = $game_troop.random_target_enemy_hp0
    elsif for_one_friend?
      battler = $game_troop.random_target_enemy
    else
      battler = $game_party.random_target_actor
    end
    # 对像存在的话取得索引、
    # 对像不存在的场合下清除行动
    if battler != nil
      @target_index = battler.index
    else
      clear
    end
  end
  #--------------------------------------------------------------------------
  # ● 最后的目标 (角色用)
  #--------------------------------------------------------------------------
  def decide_last_target_for_actor
    # 效果范围是己方单体以及行动者以外的敌人
    if @target_index == -1
      battler = nil
    elsif for_one_friend?
      battler = $game_party.actors[@target_index]
    else
      battler = $game_troop.enemies[@target_index]
    end
    # 对像不存在的场合下清除行动
    if battler == nil or not battler.exist?
      clear
    end
  end
  #--------------------------------------------------------------------------
  # ● 最后的目标 (敌人用)
  #--------------------------------------------------------------------------
  def decide_last_target_for_enemy
    # 效果范围是己方单体以敌人以外的角色
    if @target_index == -1
      battler = nil
    elsif for_one_friend?
      battler = $game_troop.enemies[@target_index]
    else
      battler = $game_party.actors[@target_index]
    end
    # 对像不存在的场合下清除行动
    if battler == nil or not battler.exist?
      clear
    end
  end
end
#==============================================================================
# ■ Game_Actor
#------------------------------------------------------------------------------
# 　处理角色的类。本类在 Game_Actors 类 ($game_actors)
# 的内部使用、Game_Party 类请参考 ($game_party) 。
#==============================================================================

class Game_Actor < Game_Battler
    #--------------------------------------------------------------------------
    # ● 定义实例变量
    #--------------------------------------------------------------------------
    attr_reader   :name                     # 名称
    attr_reader   :character_name           # 角色 文件名
    attr_reader   :character_hue            # 角色 色相
    attr_reader   :class_id                 # 职业 ID
    attr_reader   :weapon_id                # 武器 ID
    attr_reader   :armor1_id                # 鞋子 ID
    attr_reader   :armor2_id                # 头饰 ID
    attr_reader   :armor3_id                # 外衣 ID
    attr_reader   :armor4_id                # 盔甲 ID
    attr_reader   :armor5_id                # 披风 ID
    attr_reader   :armor6_id                # 腰带 ID
    attr_reader   :armor7_id                # 钓竿 ID
    attr_reader   :level                    # 等级
    attr_reader   :exp                      # EXP
    attr_accessor :skills                   # 特技
    #力量，灵巧，速度，魔力，攻击力
    #百姓，八卦，花间，红莲，尹贺，太极，雪山，逍遥
    @@class_parameter=[[1,1,1,1,1],[1.3,1.1,1,0.85,1.15],[0.9,1.4,1,1.1,1],
      [1.2,1.1,1,0.8,1.3],[1,1,1,1.4,1],[0.9,1.05,1,1.45,1],
      [1.25,1.2,1,0.8,1.15],[1.2,1.8,1,0.9,1.2]]
    #--------------------------------------------------------------------------
    # ● 初始化对像
    #     actor_id : 角色 ID
    #--------------------------------------------------------------------------
    def initialize(actor_id)
      super()
      setup(actor_id)
    end
    #--------------------------------------------------------------------------
    # ● 设置
    #     actor_id : 角色 ID
    #--------------------------------------------------------------------------
    def setup(actor_id)
      @actor = $data_actors[1]
      @actor_id = actor_id
      @name = "哈哈哈"
      @character_name = @actor.character_name
      @character_hue = @actor.character_hue
      @battler_name = @actor.battler_name
      @battler_hue = @actor.battler_hue
      @class_id = @actor.class_id
      @weapon_id = @actor.weapon_id
      @armor1_id = @actor.armor1_id
      @armor2_id = @actor.armor2_id
      @armor3_id = @actor.armor3_id
      @armor4_id = @actor.armor4_id
      @armor5_id = 0
      @armor6_id = 0#@actor.armor6_id
      @armor7_id = 0#@actor.armor7_id
      @level = 99
      @exp_list = Array.new(101)
      make_exp_list
      @exp = @exp_list[@level]
      @skills = []
      @hp = maxhp
      @sp = maxsp
      @states = []
      @states_turn = {}
      @maxhp_plus = 0
      @maxsp_plus = 0
      @str_plus = 0
      @dex_plus = 0
      @agi_plus = 0
      @int_plus = 0
      # 学会特技
      for i in 1..@level
        for j in $data_classes[@class_id].learnings
          if j.level == i
            learn_skill(j.skill_id)
          end
        end
      end
      # 刷新自动状态
      update_auto_state(nil, $data_armors[@armor1_id])
      update_auto_state(nil, $data_armors[@armor2_id])
      update_auto_state(nil, $data_armors[@armor3_id])
      update_auto_state(nil, $data_armors[@armor4_id])
      update_auto_state(nil, $data_armors[@armor5_id])
      update_auto_state(nil, $data_armors[@armor6_id])
      update_auto_state(nil, $data_armors[@armor7_id])
    end
    #--------------------------------------------------------------------------
    # ● 获取角色 ID 
    #--------------------------------------------------------------------------
    def id
      return @actor_id
    end
    #--------------------------------------------------------------------------
    # ● 获取角色最大生命值
    #--------------------------------------------------------------------------
    def full_hp
      full=100+$game_variables[24]/4
      full+=[($game_variables[157]-14)*20,300].min
      return full
    end
    #--------------------------------------------------------------------------
    # ● 获取角色最大内力值
    #--------------------------------------------------------------------------
    def full_fp
      full=$game_variables[45]/2*10+$game_variables[$game_variables[32]]*10
      full+=$game_variables[19]/1000
      full+=[20*($game_variables[157]-14),920].min
      full=[full,65535].min
      return full
    end
    #--------------------------------------------------------------------------
    # ● 获取索引
    #--------------------------------------------------------------------------
    def index
      return $game_party.actors.index(self)
    end
    #--------------------------------------------------------------------------
    # ● 计算 EXP
    #--------------------------------------------------------------------------
    def make_exp_list
      actor = $data_actors[@actor_id]
      @exp_list[1] = 0
      pow_i = 2.4 + actor.exp_inflation / 100.0
      for i in 2..100
        if i > actor.final_level
          @exp_list[i] = 0
        else
          n = actor.exp_basis * ((i + 3) ** pow_i) / (5 ** pow_i)
          @exp_list[i] = @exp_list[i-1] + Integer(n)
        end
      end
    end
    #--------------------------------------------------------------------------
    # ● 取得属性修正值
    #     element_id : 属性 ID
    #--------------------------------------------------------------------------
    def element_rate(element_id)
      # 获取对应属性有效度的数值
      table = [0,200,150,100,50,0,-100]
      result = table[$data_classes[@class_id].element_ranks[element_id]]
      # 防具能防御本属性的情况下效果减半
      for i in [@armor1_id, @armor2_id, @armor3_id, @armor4_id, @armor5_id, 
                @armor6_id, @armor7_id]
        armor = $data_armors[i]
        if armor != nil and armor.guard_element_set.include?(element_id)
          result /= 2
        end
      end
      # 状态能防御本属性的情况下效果减半
      for i in @states
        if $data_states[i].guard_element_set.include?(element_id)
          result /= 2
        end
      end
      # 过程结束
      return result
    end
    #--------------------------------------------------------------------------
    # ● 获取属性有效度
    #--------------------------------------------------------------------------
    def state_ranks
      return $data_classes[@class_id].state_ranks
    end
    #--------------------------------------------------------------------------
    # ● 判定防御属性
    #     state_id : 属性 ID
    #--------------------------------------------------------------------------
    def state_guard?(state_id)
      for i in [@armor1_id, @armor2_id, @armor3_id, @armor4_id, @armor5_id,
                @armor6_id, @armor7_id]
        armor = $data_armors[i]
        if armor != nil
          if armor.guard_state_set.include?(state_id)
            return true
          end
        end
      end
      return false
    end
    #--------------------------------------------------------------------------
    # ● 获取普通攻击属性
    #--------------------------------------------------------------------------
    def element_set
      weapon = $data_weapons[@weapon_id]
      return weapon != nil ? weapon.element_set : []
    end
    #--------------------------------------------------------------------------
    # ● 获取普通攻击状态变化 (+)
    #--------------------------------------------------------------------------
    def plus_state_set
      weapon = $data_weapons[@weapon_id]
      return weapon != nil ? weapon.plus_state_set : []
    end
    #--------------------------------------------------------------------------
    # ● 获取普通攻击状态变化 (-)
    #--------------------------------------------------------------------------
    def minus_state_set
      weapon = $data_weapons[@weapon_id]
      return weapon != nil ? weapon.minus_state_set : []
    end
    #--------------------------------------------------------------------------
    # ● 获取 MaxHP
    #--------------------------------------------------------------------------
    def maxhp
      n = [[base_maxhp + @maxhp_plus, 1].max, 65535].min
      for i in @states
        n *= $data_states[i].maxhp_rate / 100.0
      end
      n = [[Integer(n), 1].max, 65535].min
      return n
    end
   #--------------------------------------------------------------------------
    # ● 获取基本 MaxHP
    #--------------------------------------------------------------------------
    def base_maxhp
      return $data_actors[@actor_id].parameters[0, @level]
    end
    #--------------------------------------------------------------------------
    # ● 获取基本 MaxSP
    #--------------------------------------------------------------------------
    def base_maxsp
      return $game_variables[24]*2
    end
    #--------------------------------------------------------------------------
    # ● 获取基本力量
    #--------------------------------------------------------------------------
    def base_str
      if @weapon_id==0
        sk_1=$game_variables[40]*2+$game_variables[45]
        sk_1+=[$game_variables[$game_variables[29]],get_actor_level].min*4
      else
        if weapon_matching_skill?
          sk_1=$game_variables[get_weapon_base_skill]*2+$game_variables[45]
          sk_1+=[$game_variables[$game_variables[30]],get_actor_level].min*4
        else
          sk_1=$game_variables[get_weapon_base_skill]*2+$game_variables[45]
        end
      end
      n=[$game_variables[11]*7/2+$game_variables[91],225].min+$game_variables[14]*3/2+3*sk_1/7
      n *= @@class_parameter[$game_variables[21]][0]
      n=n.truncate
      weapon = $data_weapons[@weapon_id]
      armor1 = $data_armors[@armor1_id]
      armor2 = $data_armors[@armor2_id]
      armor3 = $data_armors[@armor3_id]
      armor4 = $data_armors[@armor4_id]
      armor5 = $data_armors[@armor5_id]
      armor6 = $data_armors[@armor6_id]
      armor7 = $data_armors[@armor7_id]
      n += weapon != nil ? weapon.str_plus : 0
      n += armor1 != nil ? armor1.str_plus : 0
      n += armor2 != nil ? armor2.str_plus : 0
      n += armor3 != nil ? armor3.str_plus : 0
      n += armor4 != nil ? armor4.str_plus : 0
      n += armor5 != nil ? armor5.str_plus : 0
      n += armor6 != nil ? armor6.str_plus : 0
      n += armor7 != nil ? armor7.str_plus : 0
      n += $game_variables[94]
      return [[n, 1].max, 9999].min
    end
    #--------------------------------------------------------------------------
    # ● 获取基本灵巧
    #--------------------------------------------------------------------------
    def base_dex
      sk_2=$game_variables[46]*2+get_actor_level
      sk_2+=[$game_variables[$game_variables[31]],get_actor_level].min*4
      n = $game_variables[12]*5+3*sk_2/5+$game_variables[92]
      n *= @@class_parameter[$game_variables[21]][1]
      n=n.truncate
      weapon = $data_weapons[@weapon_id]
      armor1 = $data_armors[@armor1_id]
      armor2 = $data_armors[@armor2_id]
      armor3 = $data_armors[@armor3_id]
      armor4 = $data_armors[@armor4_id]
      armor5 = $data_armors[@armor5_id]
      armor6 = $data_armors[@armor6_id]
      armor7 = $data_armors[@armor7_id]
      n += weapon != nil ? weapon.dex_plus : 0
      n += armor1 != nil ? armor1.dex_plus : 0
      n += armor2 != nil ? armor2.dex_plus : 0
      n += armor3 != nil ? armor3.dex_plus : 0
      n += armor4 != nil ? armor4.dex_plus : 0
      n += armor5 != nil ? armor5.dex_plus : 0
      n += armor6 != nil ? armor6.dex_plus : 0
      n += armor7 != nil ? armor7.dex_plus : 0
      n += [$game_variables[95],255].min
      return [[n, 1].max, 9999].min
    end
    #--------------------------------------------------------------------------
    # ● 获取基本速度
    #--------------------------------------------------------------------------
    def base_agi
      n = $game_variables[48]+$game_variables[13]*10
      n *= @@class_parameter[$game_variables[21]][2]
      n=n.truncate
      weapon = $data_weapons[@weapon_id]
      armor1 = $data_armors[@armor1_id]
      armor2 = $data_armors[@armor2_id]
      armor3 = $data_armors[@armor3_id]
      armor4 = $data_armors[@armor4_id]
      armor5 = $data_armors[@armor5_id]
      armor6 = $data_armors[@armor6_id]
      armor7 = $data_armors[@armor7_id]
      n += weapon != nil ? weapon.agi_plus : 0
      n += armor1 != nil ? armor1.agi_plus : 0
      n += armor2 != nil ? armor2.agi_plus : 0
      n += armor3 != nil ? armor3.agi_plus : 0
      n += armor4 != nil ? armor4.agi_plus : 0
      n += armor5 != nil ? armor5.agi_plus : 0
      n += armor6 != nil ? armor6.agi_plus : 0
      n += armor7 != nil ? armor7.agi_plus : 0
      return [[n, 1].max, 9999].min
    end
    #--------------------------------------------------------------------------
    # ● 获取基本魔力
    #--------------------------------------------------------------------------
    def base_int
      sk_4=$game_variables[45]*2+$game_variables[$game_variables[32]]*4
      n = $game_variables[14]*5+sk_4/3
      n *= @@class_parameter[$game_variables[21]][3]
      n=n.truncate
      weapon = $data_weapons[@weapon_id]
      armor1 = $data_armors[@armor1_id]
      armor2 = $data_armors[@armor2_id]
      armor3 = $data_armors[@armor3_id]
      armor4 = $data_armors[@armor4_id]
      armor5 = $data_armors[@armor5_id]
      armor6 = $data_armors[@armor6_id]
      armor7 = $data_armors[@armor7_id]
      n += weapon != nil ? weapon.int_plus : 0
      n += armor1 != nil ? armor1.int_plus : 0
      n += armor2 != nil ? armor2.int_plus : 0
      n += armor3 != nil ? armor3.int_plus : 0
      n += armor4 != nil ? armor4.int_plus : 0
      n += armor5 != nil ? armor5.int_plus : 0
      n += armor6 != nil ? armor6.int_plus : 0
      n += armor7 != nil ? armor7.int_plus : 0
      return [[n, 1].max, 9999].min
    end
    #--------------------------------------------------------------------------
    # ● 获取基本攻击力
    #--------------------------------------------------------------------------
    def base_atk
      atk=$game_variables[11]+$game_variables[23]/2+$game_variables[40]/10+$game_variables[91]
      atk *= @@class_parameter[$game_variables[21]][4]
      atk=atk.truncate
      weapon = $data_weapons[@weapon_id]
      return weapon != nil ? weapon.atk+atk : atk
    end
    #--------------------------------------------------------------------------
    # ● 获取基本物理防御
    #--------------------------------------------------------------------------
    def base_pdef
      n=($game_variables[11]*3+$game_variables[14]*7)/2
      weapon = $data_weapons[@weapon_id]
      armor1 = $data_armors[@armor1_id]
      armor2 = $data_armors[@armor2_id]
      armor3 = $data_armors[@armor3_id]
      armor4 = $data_armors[@armor4_id]
      armor5 = $data_armors[@armor5_id]
      armor6 = $data_armors[@armor6_id]
      armor7 = $data_armors[@armor7_id]
      pdef1 = weapon != nil ? weapon.pdef : 0
      pdef2 = armor1 != nil ? armor1.pdef : 0
      pdef3 = armor2 != nil ? armor2.pdef : 0
      pdef4 = armor3 != nil ? armor3.pdef : 0
      pdef5 = armor4 != nil ? armor4.pdef : 0
      pdef6 = armor5 != nil ? armor5.pdef : 0
      pdef7 = armor6 != nil ? armor6.pdef : 0
      pdef8 = armor7 != nil ? armor7.pdef : 0
      n +=[$game_variables[96],255].min
      n += (pdef1 + pdef2 + pdef3 + pdef4 + pdef5 + pdef6 + pdef7 + pdef8)
      return [[n, 1].max, 255].min
    end
    #--------------------------------------------------------------------------
    # ● 获取基本魔法防御
    #--------------------------------------------------------------------------
    def base_mdef
      sk_4=$game_variables[45]*2+$game_variables[47]+$game_variables[$game_variables[32]]*2
      n = base_int+sk_4/5
      weapon = $data_weapons[@weapon_id]
      armor1 = $data_armors[@armor1_id]
      armor2 = $data_armors[@armor2_id]
      armor3 = $data_armors[@armor3_id]
      armor4 = $data_armors[@armor4_id]
      armor5 = $data_armors[@armor5_id]
      armor6 = $data_armors[@armor6_id]
      armor7 = $data_armors[@armor7_id]
      mdef1 = weapon != nil ? weapon.mdef : 0
      mdef2 = armor1 != nil ? armor1.mdef : 0
      mdef3 = armor2 != nil ? armor2.mdef : 0
      mdef4 = armor3 != nil ? armor3.mdef : 0
      mdef5 = armor4 != nil ? armor4.mdef : 0
      mdef6 = armor5 != nil ? armor5.mdef : 0
      mdef7 = armor6 != nil ? armor6.mdef : 0
      mdef8 = armor7 != nil ? armor7.mdef : 0
      return mdef1 + mdef2 + mdef3 + mdef4 + mdef5 + mdef6 + mdef7 +mdef8+n
    end
    #--------------------------------------------------------------------------
    # ● 获取基本回避修正
    #--------------------------------------------------------------------------
    def base_eva
      armor1 = $data_armors[@armor1_id]
      armor2 = $data_armors[@armor2_id]
      armor3 = $data_armors[@armor3_id]
      armor4 = $data_armors[@armor4_id]
      armor5 = $data_armors[@armor5_id]
      armor6 = $data_armors[@armor6_id]
      armor7 = $data_armors[@armor7_id]
      eva1 = armor1 != nil ? armor1.eva : 0
      eva2 = armor2 != nil ? armor2.eva : 0
      eva3 = armor3 != nil ? armor3.eva : 0
      eva4 = armor4 != nil ? armor4.eva : 0
      eva5 = armor5 != nil ? armor5.eva : 0
      eva6 = armor6 != nil ? armor6.eva : 0
      eva7 = armor7 != nil ? armor7.eva : 0
      return eva1 + eva2 + eva3 + eva4 + eva5 + eva6 +eva7
    end
    #--------------------------------------------------------------------------
    # ● 普通攻击 获取攻击方动画 ID
    #--------------------------------------------------------------------------
    def animation1_id
      weapon = $data_weapons[@weapon_id]
      return weapon != nil ? weapon.animation1_id : 0
    end
    #--------------------------------------------------------------------------
    # ● 普通攻击 获取对像方动画 ID
    #--------------------------------------------------------------------------
    def animation2_id
      weapon = $data_weapons[@weapon_id]
      return weapon != nil ? weapon.animation2_id : 0
    end
    #--------------------------------------------------------------------------
    # ● 获取类名
    #--------------------------------------------------------------------------
    def class_name
      return $data_classes[@class_id].name
    end
    #--------------------------------------------------------------------------
    # ● 获取 EXP 字符串
    #--------------------------------------------------------------------------
    def exp_s
      return @exp_list[@level+1] > 0 ? @exp.to_s : "-------"
    end
    #--------------------------------------------------------------------------
    # ● 获取下一等级的 EXP 字符串
    #--------------------------------------------------------------------------
    def next_exp_s
      return @exp_list[@level+1] > 0 ? @exp_list[@level+1].to_s : "-------"
    end
    #--------------------------------------------------------------------------
    # ● 获取离下一等级还需的 EXP 字符串
    #--------------------------------------------------------------------------
    def next_rest_exp_s
      return @exp_list[@level+1] > 0 ?
        (@exp_list[@level+1] - @exp).to_s : "-------"
    end
    #--------------------------------------------------------------------------
    # ● 更新自动状态
    #     old_armor : 卸下防具
    #     new_armor : 装备防具
    #--------------------------------------------------------------------------
    def update_auto_state(old_armor, new_armor)
      # 强制解除卸下防具的自动状态
      if old_armor != nil and old_armor.auto_state_id != 0
        remove_state(old_armor.auto_state_id, true)
      end
      # 强制附加装备防具的自动状态
      if new_armor != nil and new_armor.auto_state_id != 0
        add_state(new_armor.auto_state_id, true)
      end
    end
    #--------------------------------------------------------------------------
    # ● 装备固定判定
    #     equip_type : 装备类型
    #--------------------------------------------------------------------------
    def equip_fix?(equip_type)
      case equip_type
      when 0  # 武器
        return $data_actors[@actor_id].weapon_fix
      when 1  # 鞋子
        return $data_actors[@actor_id].armor1_fix
      when 2  # 头饰
        return $data_actors[@actor_id].armor2_fix
      when 3  # 外衣
        return $data_actors[@actor_id].armor3_fix
      when 4  # 盔甲
        return $data_actors[@actor_id].armor4_fix
      end
      return false
    end
    #--------------------------------------------------------------------------
    # ● 变更装备
    #     equip_type : 装备类型
    #     id    : 武器 or 防具 ID  (0 为解除装备)
    #--------------------------------------------------------------------------
    def equip(equip_type, id)
      case equip_type
      when 0  # 武器
        return $data_actors[@actor_id].weapon_fix
      when 1  # 盾
        return $data_actors[@actor_id].armor1_fix
      when 2  # 头
        return $data_actors[@actor_id].armor2_fix
      when 3  # 身体
        return $data_actors[@actor_id].armor3_fix
      when 4  # 装饰品
        return $data_actors[@actor_id].armor4_fix
      end
      return false
    end
    #--------------------------------------------------------------------------
    # ● 卸下所有装备
    #--------------------------------------------------------------------------
    def unequipall
      @weapon_id=0
      @armor1_id=0
      @armor2_id=0
      @armor3_id=0
      @armor4_id=0
      @armor5_id=0
      @armor6_id=0
      @armor7_id=0
    end
    #--------------------------------------------------------------------------
    # ● 可以装备判定
    #     item : 物品
    #--------------------------------------------------------------------------
    def equippable?(item)
      # 武器的情况
      if item.is_a?(RPG::Weapon)
        # 包含当前的职业可以装备武器的场合
        if $data_classes[@class_id].weapon_set.include?(item.id)
          return true
        end
      end
      # 防具的情况
      if item.is_a?(RPG::Armor)
        # 不包含当前的职业可以装备武器的场合
        if $data_classes[@class_id].armor_set.include?(item.id)
          return true
        end
      end
      return false
    end
    #--------------------------------------------------------------------------
    # ● 更改 EXP
    #     exp : 新的 EXP
    #--------------------------------------------------------------------------
    def exp=(exp)
      @exp = [[exp, 9999999].min, 0].max
      # 升级
      while @exp >= @exp_list[@level+1] and @exp_list[@level+1] > 0
        @level += 1
        # 学会特技
        for j in $data_classes[@class_id].learnings
          if j.level == @level
            learn_skill(j.skill_id)
          end
        end
      end
      # 降级
      while @exp < @exp_list[@level]
        @level -= 1
      end
      # 修正当前的 HP 与 SP 超过最大值
      @hp = [@hp, self.maxhp].min
      @sp = [@sp, self.maxsp].min
    end
    #--------------------------------------------------------------------------
    # ● 更改等级
    #     level : 新的等级
    #--------------------------------------------------------------------------
    def level=(level)
      # 检查上下限
      level = [[level, $data_actors[@actor_id].final_level].min, 1].max
      # 更改 EXP
      self.exp = @exp_list[level]
    end
    #--------------------------------------------------------------------------
    # ● 觉悟特技
    #     skill_id : 特技 ID
    #--------------------------------------------------------------------------
    def learn_skill(skill_id)
      if skill_id > 0 and not skill_learn?(skill_id)
        @skills.push(skill_id)
        @skills.sort!
      end
    end
    #--------------------------------------------------------------------------
    # ● 遗忘特技
    #     skill_id : 特技 ID
    #--------------------------------------------------------------------------
    def forget_skill(skill_id)
      @skills.delete(skill_id)
    end
    #--------------------------------------------------------------------------
    # ● 已经学会的特技判定
    #     skill_id : 特技 ID
    #--------------------------------------------------------------------------
    def skill_learn?(skill_id)
      return @skills.include?(skill_id)
    end
    #--------------------------------------------------------------------------
    # ● 可以使用特技判定
    #     skill_id : 特技 ID
    #--------------------------------------------------------------------------
    def skill_can_use?(skill_id)
      if not skill_learn?(skill_id)
        return false
      end
      return super
    end
    #--------------------------------------------------------------------------
    # ● 更改名称
    #     name : 新的名称
    #--------------------------------------------------------------------------
    def name=(name)
      @name = name
    end
    #--------------------------------------------------------------------------
    # ● 更改职业 ID
    #     class_id : 新的职业 ID
    #--------------------------------------------------------------------------
    def class_id=(class_id)
      if $data_classes[class_id] != nil
        @class_id = class_id
        # 避开无法装备的物品
        unless equippable?($data_weapons[@weapon_id])
          equip(0, 0)
        end
        unless equippable?($data_armors[@armor1_id])
          equip(1, 0)
        end
        unless equippable?($data_armors[@armor2_id])
          equip(2, 0)
        end
        unless equippable?($data_armors[@armor3_id])
          equip(3, 0)
        end
        unless equippable?($data_armors[@armor4_id])
          equip(4, 0)
        end
        unless equippable?($data_armors[@armor5_id])
          equip(5, 0)
        end
        unless equippable?($data_armors[@armor6_id])
          equip(6, 0)
        end
        unless equippable?($data_armors[@armor7_id])
          equip(7, 0)
        end
      end
    end
    #--------------------------------------------------------------------------
    # ● 更改图形
    #     character_name : 新的角色 文件名
    #     character_hue  : 新的角色 色相
    #     battler_name   : 新的战斗者 文件名
    #     battler_hue    : 新的战斗者 色相
    #--------------------------------------------------------------------------
    def set_graphic(character_name, character_hue, battler_name, battler_hue)
      @character_name = character_name
      @character_hue = character_hue
      @battler_name = battler_name
      @battler_hue = battler_hue
    end
    #--------------------------------------------------------------------------
    # ● 取得战斗画面的 X 坐标
    #--------------------------------------------------------------------------
    def screen_x
        return 160
    end
    #--------------------------------------------------------------------------
    # ● 取得战斗画面的 Y 坐标
    #--------------------------------------------------------------------------
    def screen_y
      return 160
    end
    #--------------------------------------------------------------------------
    # ● 更换装备
    #    type：0-武器
    #--------------------------------------------------------------------------
    def equip(type,id)
      case type
      when 0 # 武器
        @weapon_id=id
      when 1 # 鞋子
        @armor1_id=id
      when 2 # 头饰
        update_auto_state($data_armors[@armor2_id], $data_armors[id])
        @armor2_id=id
      when 3 # 外衣
        @armor3_id=id
      when 4 # 盔甲
        @armor4_id=id
      when 5 # 披风
        @armor5_id=id
      when 6 # 腰带
        @armor6_id=id
      when 7 # 钓竿
        @armor7_id=id
      end
    end
    #--------------------------------------------------------------------------
    # ● 判定是否装备某件防具
    #--------------------------------------------------------------------------
    def armor_equiped?(id)
      chk=[@armor1_id, @armor2_id, @armor3_id, @armor4_id, @armor5_id,
           @armor6_id, @armor7_id]
      for i in chk
        if id==i
          return true
          break
        end
      end
      return false
    end
    #--------------------------------------------------------------------------
    # ● 取得战斗画面的 Z 坐标
    #--------------------------------------------------------------------------
    def screen_z
      # 返回计算后的队伍 Z 坐标的排列顺序
      if self.index != nil
        return 4 - self.index
      else
        return 0
      end
    end
  end
  #==============================================================================
# ■ Game_Enemy
#------------------------------------------------------------------------------
# 　处理敌人的类。本类在 Game_Troop 类 ($game_troop) 的
# 内部使用。
#==============================================================================

class Game_Enemy < Game_Battler
  #--------------------------------------------------------------------------
  # ● 定义实例变量
  #--------------------------------------------------------------------------
  @@class_parameter=[[1,1,1,1,1],[1.3,1.1,1,0.85,1.15],[0.9,1.4,1,1.1,1],
    [1.2,1.1,1,0.8,1.3],[1,1,1,1.4,1],[0.85,1,1,1.55,1],
    [1.25,1.2,1,0.8,1.15],[1.2,1.3,1,0.9,1.2]]
  #--------------------------------------------------------------------------
  # ● 初始化对像
  #     troop_id     : 循环 ID
  #     member_index : 循环成员的索引
  #--------------------------------------------------------------------------
  def initialize(troop_id, member_index)
    super()
    @troop_id = troop_id
    @member_index = member_index
    troop = $data_troops[@troop_id]
    @enemy_id = troop.members[@member_index].enemy_id
    enemy = $data_enemies[@enemy_id]
    @battler_name = enemy.battler_name
    @battler_hue = enemy.battler_hue
    @hp = maxhp
    @sp = maxsp
    @hidden = troop.members[@member_index].hidden
    @immortal = troop.members[@member_index].immortal
  end
  #--------------------------------------------------------------------------
  # ● 获取敌人 ID
  #--------------------------------------------------------------------------
  def id
    return @enemy_id
  end
  #--------------------------------------------------------------------------
  # ● 获取索引
  #--------------------------------------------------------------------------
  def index
    return @member_index
  end
  #--------------------------------------------------------------------------
  # ● 获取名称
  #--------------------------------------------------------------------------
  def name
    return $data_enemies[@enemy_id].name
  end
  #--------------------------------------------------------------------------
  # ● 获取基本 MaxHP
  #--------------------------------------------------------------------------
  def base_maxhp
    return $data_enemies[@enemy_id].maxhp
  end
  #--------------------------------------------------------------------------
  # ● 获取基本 MaxSP
  #--------------------------------------------------------------------------
  def base_maxsp
    return $data_enemies[@enemy_id].maxsp
  end
  #--------------------------------------------------------------------------
  # ● 获取基本力量
  #--------------------------------------------------------------------------
  def base_str
    if $npc_data[9]==0
      sk_1=get_skill_level(40)*2+get_skill_level(45)
      sk_1+=[get_skill_level($npc_data[4]),npc_level].min*4
    else
      if npc_weapon?($npc_data[9])
        sk_1=get_skill_level(npc_base_skill($npc_data[9]))*2+get_skill_level(45)
        sk_1+=[get_skill_level($npc_data[5]),npc_level].min*4
      else
        sk_1=get_skill_level(npc_base_skill($npc_data[9]))*2
        sk_1+=get_skill_level(45)
      end
    end
    n=$npc_data[0]*7/2+$npc_data[3]*3/2+3*sk_1/7
    n+=$npc_data[24]
    n*=@@class_parameter[$npc_data[27]][0]
    n+=$npc_data[29]
    n=n.truncate
    weapon = $data_weapons[$npc_data[9]]
    armor1 = $data_armors[$npc_data[10]]
    armor2 = $data_armors[$npc_data[11]]
    n += weapon != nil ? weapon.str_plus : 0
    n += armor1 != nil ? armor1.str_plus : 0
    n += armor2 != nil ? armor2.str_plus : 0
    return [[n, 1].max, 9999].min
  end
  #--------------------------------------------------------------------------
  # ● 获取基本灵巧
  #--------------------------------------------------------------------------
  def base_dex
    sk_2=get_skill_level(46)*2+npc_level
    sk_2+=[get_skill_level($npc_data[6]),npc_level].min*4
    n=$npc_data[1]*5+3*sk_2/5
    n+=$npc_data[25]
    n*=@@class_parameter[$npc_data[27]][1]
    n+=$npc_data[30]
    n=n.truncate
    weapon = $data_weapons[$npc_data[9]]
    armor1 = $data_armors[$npc_data[10]]
    armor2 = $data_armors[$npc_data[11]]
    n += weapon != nil ? weapon.dex_plus : 0
    n += armor1 != nil ? armor1.dex_plus : 0
    n += armor2 != nil ? armor2.dex_plus : 0
    return [[n, 1].max, 9999].min
  end
  #--------------------------------------------------------------------------
  # ● 获取基本速度
  #--------------------------------------------------------------------------
  def base_agi
    n=get_skill_level(48)+$npc_data[2]*10
    n*=@@class_parameter[$npc_data[27]][3]
    n=n.truncate
    weapon = $data_weapons[$npc_data[9]]
    armor1 = $data_armors[$npc_data[10]]
    armor2 = $data_armors[$npc_data[11]]
    n += weapon != nil ? weapon.agi_plus : 0
    n += armor1 != nil ? armor1.agi_plus : 0
    n += armor2 != nil ? armor2.agi_plus : 0
    return [[n, 1].max, 9999].min
  end
  #--------------------------------------------------------------------------
  # ● 获取基本魔力
  #--------------------------------------------------------------------------
  def base_int
    sk_4=get_skill_level(45)*2+get_skill_level($npc_data[7])*4
    n=$npc_data[3]*5+sk_4/3
    n=n.truncate
    weapon = $data_weapons[$npc_data[9]]
    armor1 = $data_armors[$npc_data[10]]
    armor2 = $data_armors[$npc_data[11]]
    n += weapon != nil ? weapon.int_plus : 0
    n += armor1 != nil ? armor1.int_plus : 0
    n += armor2 != nil ? armor2.int_plus : 0
    return [[n, 1].max, 9999].min
  end
  #--------------------------------------------------------------------------
  # ● 获取基本攻击力
  #--------------------------------------------------------------------------
  def base_atk
    atk=$npc_data[0]+$data_enemies[@enemy_id].exp/2+get_skill_level(40)/10+$npc_data[29]
    if @enemy_id==125 and $game_actors[1].weapon_id !=0
      atk+=$data_weapons[$game_actors[1].weapon_id].atk
    end
    atk*=@@class_parameter[$npc_data[27]][4]
    atk=atk.truncate
    weapon = $data_weapons[$npc_data[9]]
    return weapon != nil ? weapon.atk+atk : atk
  end
  #--------------------------------------------------------------------------
  # ● 获取基本物理防御
  #--------------------------------------------------------------------------
  def base_pdef
    n=($npc_data[0]*3+$npc_data[3]*7)/2
    n+=$npc_data[28]
    n=n.truncate
    weapon = $data_weapons[$npc_data[9]]
    armor1 = $data_armors[$npc_data[10]]
    armor2 = $data_armors[$npc_data[11]]
    pdef1 = weapon != nil ? weapon.pdef : 0
    pdef2 = armor1 != nil ? armor1.pdef : 0
    pdef3 = armor2 != nil ? armor2.pdef : 0
    n+=pdef1 + pdef2 + pdef3
    n=[n,255].min
    return n
  end
  #--------------------------------------------------------------------------
  # ● 获取基本魔法防御
  #--------------------------------------------------------------------------
  def base_mdef
    sk_4=get_skill_level(45)*2+get_skill_level(47)
    sk_4+=(get_skill_level($npc_data[7])*2)
    n=base_int+sk_4/5
    weapon = $data_weapons[$npc_data[9]]
    armor1 = $data_armors[$npc_data[10]]
    armor2 = $data_armors[$npc_data[11]]
    mdef1 = weapon != nil ? weapon.mdef : 0
    mdef2 = armor1 != nil ? armor1.mdef : 0
    mdef3 = armor2 != nil ? armor2.mdef : 0
    return mdef1 + mdef2 + mdef3 +n
  end
  #--------------------------------------------------------------------------
  # ● 获取基本回避修正
  #--------------------------------------------------------------------------
  def base_eva
    return $data_enemies[@enemy_id].eva
  end
  #--------------------------------------------------------------------------
  # ● 普通攻击 获取攻击方动画 ID
  #--------------------------------------------------------------------------
  def animation1_id
    return $data_enemies[@enemy_id].animation1_id
  end
  #--------------------------------------------------------------------------
  # ● 普通攻击 获取对像方动画 ID
  #--------------------------------------------------------------------------
  def animation2_id
    return $data_enemies[@enemy_id].animation2_id
  end
  #--------------------------------------------------------------------------
  # ● 获取属性修正值
  #     element_id : 属性 ID
  #--------------------------------------------------------------------------
  def element_rate(element_id)
    # 获取对应属性有效度的数值
    table = [0,200,150,100,50,0,-100]
    result = table[$data_enemies[@enemy_id].element_ranks[element_id]]
    # 状态能防御本属性的情况下效果减半
    for i in @states
      if $data_states[i].guard_element_set.include?(element_id)
        result /= 2
      end
    end
    # 过程结束
    return result
  end
  #--------------------------------------------------------------------------
  # ● 获取属性有效度
  #--------------------------------------------------------------------------
  def state_ranks
    return $data_enemies[@enemy_id].state_ranks
  end
  #--------------------------------------------------------------------------
  # ● 属性防御判定
  #     state_id : 状态 ID
  #--------------------------------------------------------------------------
  def state_guard?(state_id)
    return false
  end
  #--------------------------------------------------------------------------
  # ● 获取普通攻击属性
  #--------------------------------------------------------------------------
  def element_set
    return []
  end
  #--------------------------------------------------------------------------
  # ● 获取普通攻击的状态变化 (+)
  #--------------------------------------------------------------------------
  def plus_state_set
    return []
  end
  #--------------------------------------------------------------------------
  # ● 获取普通攻击的状态变化 (-)
  #--------------------------------------------------------------------------
  def minus_state_set
    return []
  end
  #--------------------------------------------------------------------------
  # ● 获取行动
  #--------------------------------------------------------------------------
  def actions
    return $data_enemies[@enemy_id].actions
  end
  #--------------------------------------------------------------------------
  # ● 获取 EXP
  #--------------------------------------------------------------------------
  def exp
    return $data_enemies[@enemy_id].exp
  end
  #--------------------------------------------------------------------------
  # ● 获取金钱
  #--------------------------------------------------------------------------
  def gold
    return $data_enemies[@enemy_id].gold
  end
  #--------------------------------------------------------------------------
  # ● 获取物品 ID
  #--------------------------------------------------------------------------
  def item_id
    return $data_enemies[@enemy_id].item_id
  end
  #--------------------------------------------------------------------------
  # ● 获取武器 ID
  #--------------------------------------------------------------------------
  def weapon_id
    return $data_enemies[@enemy_id].weapon_id
  end
  #--------------------------------------------------------------------------
  # ● 获取防具 ID
  #--------------------------------------------------------------------------
  def armor_id
    return $data_enemies[@enemy_id].armor_id
  end
  #--------------------------------------------------------------------------
  # ● 获取宝物出现率
  #--------------------------------------------------------------------------
  def treasure_prob
    return $data_enemies[@enemy_id].treasure_prob
  end
  #--------------------------------------------------------------------------
  # ● 取得战斗画面 X 坐标
  #--------------------------------------------------------------------------
  def screen_x
    return 480
    #return $data_troops[@troop_id].members[@member_index].x
  end
  #--------------------------------------------------------------------------
  # ● 取得战斗画面 Y 坐标
  #--------------------------------------------------------------------------
  def screen_y
    return 160
    #return $data_troops[@troop_id].members[@member_index].y
  end
  #--------------------------------------------------------------------------
  # ● 取得战斗画面 Z 坐标
  #--------------------------------------------------------------------------
  def screen_z
    # 返回计算后的队伍 Z 坐标的排列顺序
    if self.index != nil
      return 4 - self.index
    else
      return 0
    end
  end
  #--------------------------------------------------------------------------
  # ● 取得NPC总评等级
  #--------------------------------------------------------------------------
  def npc_level
    if $npc_data[9]==0
      sk_1=get_skill_level(40)*2+get_skill_level($npc_data[4])*4
      sk_2=get_skill_level(46)+get_skill_level($npc_data[6])*2
      sk_3=get_skill_level(47)+get_skill_level($npc_data[8])*2
    else
      sk_2=get_skill_level(46)+get_skill_level($npc_data[6])*2
      sk_3=get_skill_level(47)+get_skill_level($npc_data[8])*2
      if npc_weapon?($npc_data[9])
        sk_1=get_skill_level(npc_base_skill($npc_data[9]))*2
        sk_1+=get_skill_level($npc_data[5])*4
      else
        sk_1=get_skill_level(npc_base_skill($npc_data[9]))*2
      end
    end
    return (sk_1+sk_2+sk_3)/12
  end
  #--------------------------------------------------------------------------
  # ● 判定NPC装备武器是否与兵刃匹配
  #--------------------------------------------------------------------------
  def npc_weapon?(id)
    case id
    when 8,9,10,11,12,13,14,1,28,29
      return true if $npc_data[5]>=80 and $npc_data[5]<=83
    when 2,3,4,6,7,15,16,17,18,19,20,30
      return true if $npc_data[5]>=85 and $npc_data[5]<=87
    when 5,21,22,23,24
      return true if $npc_data[5]==88
    when 25,26,27
      return true if $npc_data[5]==89
    end
    return false
  end
  #--------------------------------------------------------------------------
  # ● 取得NPC武器对应基本功夫编号
  #--------------------------------------------------------------------------
  def npc_base_skill(id)
    case id
    when 8,9,10,11,12,13,14,1,28,29
      return 42
    when 2,3,4,6,7,15,16,17,18,19,20,30
      return 41
    when 5,21,22,23,24
      return 44
    when 25,26,27
      return 43
    end
    return 0
  end
  #--------------------------------------------------------------------------
  # ● 取得NPC指定编号技能的等级
  #--------------------------------------------------------------------------
  def get_skill_level(sk_id)
    for i in $npc_data
      if i.is_a?(Array)
        return i[1] if i[0]==sk_id
      end
    end
    return 0
  end
  #--------------------------------------------------------------------------
  # ● 逃跑
  #--------------------------------------------------------------------------
  def escape
    # 设置隐藏标志
    @hidden = true
    # 清除当前行动
    self.current_action.clear
  end
  #--------------------------------------------------------------------------
  # ● 变身
  #     enemy_id : 变身为的敌人 ID
  #--------------------------------------------------------------------------
  def transform(enemy_id)
    # 更改敌人 ID
    @enemy_id = enemy_id
    # 更改战斗图形
    @battler_name = $data_enemies[@enemy_id].battler_name
    @battler_hue = $data_enemies[@enemy_id].battler_hue
    # 再生成行动
    make_action
  end
  #--------------------------------------------------------------------------
  # ● 生成行动
  #--------------------------------------------------------------------------
  def make_action
    # 清除当前行动
    self.current_action.clear
    # 无法行动的情况
    unless self.movable?
      # 过程结束
      return
    end
    # 抽取现在有效的行动
    available_actions = []
    rating_max = 0
    for action in self.actions
      # 确认回合条件
      n = $game_temp.battle_turn
      a = action.condition_turn_a
      b = action.condition_turn_b
      if (b == 0 and n != a) or
         (b > 0 and (n < 1 or n < a or n % b != a % b))
        next
      end
      # 确认 HP 条件
      if self.hp * 100.0 / self.maxhp > action.condition_hp
        next
      end
      # 确认等级条件
      if $game_party.max_level < action.condition_level
        next
      end
      # 确认开关条件
      switch_id = action.condition_switch_id
      if switch_id > 0 and $game_switches[switch_id] == false
        next
      end
      # 符合条件 : 添加本行动
      available_actions.push(action)
      if action.rating > rating_max
        rating_max = action.rating
      end
    end
    # 最大概率值作为 3 合计计算(0 除外)
    ratings_total = 0
    for action in available_actions
      if action.rating > rating_max - 3
        ratings_total += action.rating - (rating_max - 3)
      end
    end
    # 概率合计不为 0 的情况下
    if ratings_total > 0
      # 生成随机数
      value = rand(ratings_total)
      # 设置对应生成随机数的当前行动
      for action in available_actions
        if action.rating > rating_max - 3
          if value < action.rating - (rating_max - 3)
            self.current_action.kind = action.kind
            self.current_action.basic = action.basic
            self.current_action.skill_id = action.skill_id
            self.current_action.decide_random_target_for_enemy
            return
          else
            value -= action.rating - (rating_max - 3)
          end
        end
      end
    end
  end
end
#==============================================================================
# ■ Game_Actors
#------------------------------------------------------------------------------
# 　处理角色排列的类。本类的实例请参考
#  $game_actors。
#==============================================================================

class Game_Actors
  #--------------------------------------------------------------------------
  # ● 初始化对像
  #--------------------------------------------------------------------------
  def initialize
    @data = []
  end
  #--------------------------------------------------------------------------
  # ● 获取角色
  #     actor_id : 角色 ID
  #--------------------------------------------------------------------------
  def [](actor_id)
    if actor_id > 999 or $data_actors[actor_id] == nil
      return nil
    end
    if @data[actor_id] == nil
      @data[actor_id] = Game_Actor.new(actor_id)
    end
    return @data[actor_id]
  end
end
#==============================================================================
# ■ Game_Party
#------------------------------------------------------------------------------
# 　处理同伴的类。包含金钱以及物品的信息。本类的实例
# 请参考 $game_party。
#==============================================================================

class Game_Party
  #--------------------------------------------------------------------------
  # ● 定义实例变量
  #--------------------------------------------------------------------------
  attr_reader   :actors                   # 角色
  attr_reader   :gold                     # 金钱
  attr_reader   :steps                    # 步数
  #--------------------------------------------------------------------------
  # ● 初始化对像
  #--------------------------------------------------------------------------
  def initialize
    # 建立角色序列
    @actors = []
    # 初始化金钱与步数
    @gold = 0
    @steps = 0
    # 生成物品、武器、防具的所持数 hash
    @items = {}
    @weapons = {}
    @armors = {}
  end
  #--------------------------------------------------------------------------
  # ● 设置初期同伴
  #--------------------------------------------------------------------------
  def setup_starting_members
    @actors = []
    for i in $data_system.party_members
      @actors.push($game_actors[i])
    end
  end
  #--------------------------------------------------------------------------
  # ● 设置战斗测试用同伴
  #--------------------------------------------------------------------------
  def setup_battle_test_members
    @actors = []
    for battler in $data_system.test_battlers
      actor = $game_actors[battler.actor_id]
      actor.level = battler.level
      gain_weapon(battler.weapon_id, 1)
      gain_armor(battler.armor1_id, 1)
      gain_armor(battler.armor2_id, 1)
      gain_armor(battler.armor3_id, 1)
      gain_armor(battler.armor4_id, 1)
      actor.equip(0, battler.weapon_id)
      actor.equip(1, battler.armor1_id)
      actor.equip(2, battler.armor2_id)
      actor.equip(3, battler.armor3_id)
      actor.equip(4, battler.armor4_id)
      actor.recover_all
      @actors.push(actor)
    end
    @items = {}
    for i in 1...$data_items.size
      if $data_items[i].name != ""
        occasion = $data_items[i].occasion
        if occasion == 0 or occasion == 1
          @items[i] = 99
        end
      end
    end
  end
  #--------------------------------------------------------------------------
  # ● 同伴成员的还原
  #--------------------------------------------------------------------------
  def refresh
    # 游戏数据载入后角色对像直接从 $game_actors
    # 分离。
    # 回避由于载入造成的角色再设置的问题。
    new_actors = []
    for i in 0...@actors.size
      if $data_actors[@actors[i].id] != nil
        new_actors.push($game_actors[@actors[i].id])
      end
    end
    @actors = new_actors
  end
  #--------------------------------------------------------------------------
  # ● 获取最大等级
  #--------------------------------------------------------------------------
  def max_level
    # 同伴人数为 0 的情况下
    if @actors.size == 0
      return 0
    end
    # 初始化本地变量 level
    level = 0
    # 求得同伴的最大等级
    for actor in @actors
      if level < actor.level
        level = actor.level
      end
    end
    return level
  end
  #--------------------------------------------------------------------------
  # ● 加入同伴
  #     actor_id : 角色 ID
  #--------------------------------------------------------------------------
  def add_actor(actor_id)
    # 获取角色
    actor = $game_actors[actor_id]
    # 同伴人数未满 4 人、本角色不在队伍中的情况下
    if @actors.size < 4 and not @actors.include?(actor)
      # 添加角色
      @actors.push(actor)
      # 还原主角
      $game_player.refresh
    end
  end
  #--------------------------------------------------------------------------
  # ● 角色离开
  #     actor_id : 角色 ID
  #--------------------------------------------------------------------------
  def remove_actor(actor_id)
    # 删除角色
    @actors.delete($game_actors[actor_id])
    # 还原主角
    $game_player.refresh
  end
  #--------------------------------------------------------------------------
  # ● 增加金钱 (减少)
  #     n : 金额
  #--------------------------------------------------------------------------
  def gain_gold(n)
    @gold = [[@gold + n, 0].max, 999999999].min
    $game_variables[151]=Zlib.crc32(@gold.to_s,51)
  end
  #--------------------------------------------------------------------------
  # ● 减少金钱
  #     n : 金额
  #--------------------------------------------------------------------------
  def lose_gold(n)
    # 调用数值逆转 gain_gold 
    gain_gold(-n)
  end
  #--------------------------------------------------------------------------
  # ● 增加步数
  #--------------------------------------------------------------------------
  def increase_steps
  end
  #--------------------------------------------------------------------------
  # ● 获取物品的所持数
  #     item_id : 物品 ID
  #--------------------------------------------------------------------------
  def item_number(item_id)
    # 如果 hash 个数数值不存在就返回 0
    return @items.include?(item_id) ? @items[item_id] : 0
  end
  #--------------------------------------------------------------------------
  # ● 获取武器所持数
  #     weapon_id : 武器 ID
  #--------------------------------------------------------------------------
  def weapon_number(weapon_id)
    # 如果 hash 个数数值不存在就返回 0
    return @weapons.include?(weapon_id) ? @weapons[weapon_id] : 0
  end
  #--------------------------------------------------------------------------
  # ● 获取防具所持数
  #     armor_id : 防具 ID
  #--------------------------------------------------------------------------
  def armor_number(armor_id)
    # 如果 hash 个数数值不存在就返回 0
    return @armors.include?(armor_id) ? @armors[armor_id] : 0
  end
  #--------------------------------------------------------------------------
  # ● 增加物品 (减少)
  #     item_id : 物品 ID
  #     n       : 个数
  #--------------------------------------------------------------------------
  def gain_item(item_id, n)
    # 更新 hash 的个数数据
    if item_id > 0
      @items[item_id] = [[item_number(item_id) + n, 0].max, 99].min
    end
  end
  #--------------------------------------------------------------------------
  # ● 增加武器 (减少)
  #     weapon_id : 武器 ID
  #     n         : 个数
  #--------------------------------------------------------------------------
  def gain_weapon(weapon_id, n)
    # 更新 hash 的个数数据
    if weapon_id > 0
      @weapons[weapon_id] = [[weapon_number(weapon_id) + n, 0].max, 99].min
    end
  end
  #--------------------------------------------------------------------------
  # ● 增加防具 (减少)
  #     armor_id : 防具 ID
  #     n        : 个数
  #--------------------------------------------------------------------------
  def gain_armor(armor_id, n)
    # 更新 hash 的个数数据
    if armor_id > 0
      @armors[armor_id] = [[armor_number(armor_id) + n, 0].max, 99].min
    end
  end
  #--------------------------------------------------------------------------
  # ● 减少物品
  #     item_id : 物品 ID
  #     n       : 个数
  #--------------------------------------------------------------------------
  def lose_item(item_id, n)
    # 调用 gain_item 的数值逆转
    gain_item(item_id, -n)
  end
  #--------------------------------------------------------------------------
  # ● 减少武器
  #     weapon_id : 武器 ID
  #     n         : 个数
  #--------------------------------------------------------------------------
  def lose_weapon(weapon_id, n)
    # 调用 gain_weapon 的数值逆转
    gain_weapon(weapon_id, -n)
  end
  #--------------------------------------------------------------------------
  # ● 减少防具
  #     armor_id : 防具 ID
  #     n        : 个数
  #--------------------------------------------------------------------------
  def lose_armor(armor_id, n)
    # 调用 gain_armor 的数值逆转
    gain_armor(armor_id, -n)
  end
  #--------------------------------------------------------------------------
  # ● 判断物品可以使用
  #     item_id : 物品 ID
  #--------------------------------------------------------------------------
  def item_can_use?(item_id)
    # 物品个数为 0 的情况
    if item_number(item_id) == 0
      # 不能使用
      return false
    end
    # 获取可以使用的时候
    occasion = $data_items[item_id].occasion
    # 战斗的情况
    if $game_temp.in_battle
      # 可以使用时为 0 (平时) 或者是 1 (战斗时) 可以使用
      return (occasion == 0 or occasion == 1)
    end
    # 可以使用时为 0 (平时) 或者是 2 (菜单时) 可以使用
    return (occasion == 0 or occasion == 2)
  end
  #--------------------------------------------------------------------------
  # ● 清除全体的行动
  #--------------------------------------------------------------------------
  def clear_actions
    # 清除全体同伴的行为
    for actor in @actors
      actor.current_action.clear
    end
  end
  #--------------------------------------------------------------------------
  # ● 可以输入命令的判定
  #--------------------------------------------------------------------------
  def inputable?
    # 如果一可以输入命令就返回 true
    for actor in @actors
      if actor.inputable?
        return true
      end
    end
    return false
  end
  #--------------------------------------------------------------------------
  # ● 全灭判定
  #--------------------------------------------------------------------------
  def all_dead?
    # 同伴人数为 0 的情况下
    if $game_party.actors.size == 0
      return false
    end
    # 同伴中无人 HP 在 0 以上
    for actor in @actors
      if actor.hp > 0
        return false
      end
    end
    # 全灭
    return true
  end
  #--------------------------------------------------------------------------
  # ● 检查连续伤害 (地图用)
  #--------------------------------------------------------------------------
  def check_map_slip_damage
    for actor in @actors
      if actor.hp > 0 and actor.slip_damage?
        actor.hp -= [actor.maxhp / 100, 1].max
        if actor.hp == 0
          $game_system.se_play($data_system.actor_collapse_se)
        end
        $game_screen.start_flash(Color.new(255,0,0,128), 4)
        $game_temp.gameover = $game_party.all_dead?
      end
    end
  end
  #--------------------------------------------------------------------------
  # ● 对像角色的随机确定
  #     hp0 : 限制为 HP 0 的角色
  #--------------------------------------------------------------------------
  def random_target_actor(hp0 = false)
    # 初始化轮流
    roulette = []
    # 循环
    for actor in @actors
      # 符合条件的场合
      if (not hp0 and actor.exist?) or (hp0 and actor.hp0?)
        # 获取角色职业的位置 [位置]
        position = $data_classes[actor.class_id].position
        # 前卫的话 n = 4、中卫的话 n = 3、后卫的话 n = 2
        n = 4 - position
        # 添加角色的轮流 n 回
        n.times do
          roulette.push(actor)
        end
      end
    end
    # 轮流大小为 0 的情况
    if roulette.size == 0
      return nil
    end
    # 转轮盘赌，决定角色
    return roulette[rand(roulette.size)]
  end
  #--------------------------------------------------------------------------
  # ● 对像角色的随机确定 (HP 0)
  #--------------------------------------------------------------------------
  def random_target_actor_hp0
    return random_target_actor(true)
  end
  #--------------------------------------------------------------------------
  # ● 获取队伍总共携带不同物品的数量
  #--------------------------------------------------------------------------
  def all_items_number
    n=0
    for i in 1..21
      n+=1 if item_number(i)>0
    end
    for i in 1..30
      n+=1 if weapon_number(i)>0
    end
    for i in 1..31
      n+=1 if armor_number(i)>0
    end
    return n
  end
  #--------------------------------------------------------------------------
  # ● 对像角色的顺序确定
  #     actor_index : 角色索引
  #--------------------------------------------------------------------------
  def smooth_target_actor(actor_index)
    # 取得对像
    actor = @actors[actor_index]
    # 对像存在的情况下
    if actor != nil and actor.exist?
      return actor
    end
    # 循环
    for actor in @actors
      # 对像存在的情况下
      if actor.exist?
        return actor
      end
    end
  end
end
#==============================================================================
# ■ Game_Troop
#------------------------------------------------------------------------------
# 　处理队伍的类。本类的实例请参考 $game_troop
# 
#==============================================================================

class Game_Troop
  #--------------------------------------------------------------------------
  # ● 初始化对像
  #--------------------------------------------------------------------------
  def initialize
    # 建立敌人序列
    @enemies = []
  end
  #--------------------------------------------------------------------------
  # ● 获取敌人
  #--------------------------------------------------------------------------
  def enemies
    return @enemies
  end
  #--------------------------------------------------------------------------
  # ● 设置
  #     troop_id : 敌人 ID
  #--------------------------------------------------------------------------
  def setup(troop_id)
    # 由敌人序列的设置来确定队伍的设置
    @enemies = []
    troop = $data_troops[troop_id]
    for i in 0...troop.members.size
      enemy = $data_enemies[troop.members[i].enemy_id]
      if enemy != nil
        @enemies.push(Game_Enemy.new(troop_id, i))
      end
    end
  end
  #--------------------------------------------------------------------------
  # ● 对像敌人的随机确定
  #     hp0 : 限制 HP 0 的敌人
  #--------------------------------------------------------------------------
  def random_target_enemy(hp0 = false)
    # 初始化轮流
    roulette = []
    # 循环
    for enemy in @enemies
      # 条件符合的情况下
      if (not hp0 and enemy.exist?) or (hp0 and enemy.hp0?)
        # 添加敌人到轮流
        roulette.push(enemy)
      end
    end
    # 轮流尺寸为 0 的情况下
    if roulette.size == 0
      return nil
    end
    # 转轮盘赌，决定敌人
    return roulette[rand(roulette.size)]
  end
  #--------------------------------------------------------------------------
  # ● 对像敌人的随机确定 (HP 0)
  #--------------------------------------------------------------------------
  def random_target_enemy_hp0
    return random_target_enemy(true)
  end
  #--------------------------------------------------------------------------
  # ● 对像角色的顺序确定
  #     enemy_index : 敌人索引
  #--------------------------------------------------------------------------
  def smooth_target_enemy(enemy_index)
    # 获取敌人
    enemy = @enemies[enemy_index]
    # 敌人存在的场合
    if enemy != nil and enemy.exist?
      return enemy
    end
    # 循环
    for enemy in @enemies
      # 敌人存在的场合
      if enemy.exist?
        return enemy
      end
    end
  end
end
#==============================================================================
# ■ Game_Map
#------------------------------------------------------------------------------
# 　处理地图的类。包含卷动以及可以通行的判断功能。
# 本类的实例请参考 $game_map 。
#==============================================================================

class Game_Map
  #--------------------------------------------------------------------------
  # ● 定义实例变量
  #--------------------------------------------------------------------------
  attr_accessor :tileset_name             # 元件 文件名
  attr_accessor :autotile_names           # 自动元件 文件名
  attr_accessor :panorama_name            # 全景 文件名
  attr_accessor :panorama_hue             # 全景 色相
  attr_accessor :fog_name                 # 雾 文件名
  attr_accessor :fog_hue                  # 雾 色相
  attr_accessor :fog_opacity              # 雾 不透明度
  attr_accessor :fog_blend_type           # 雾 混合方式
  attr_accessor :fog_zoom                 # 雾 放大率
  attr_accessor :fog_sx                   # 雾 SX
  attr_accessor :fog_sy                   # 雾 SY
  attr_accessor :battleback_name          # 战斗背景 文件名
  attr_accessor :display_x                # 显示 X 坐标 * 128
  attr_accessor :display_y                # 显示 Y 坐标 * 128
  attr_accessor :need_refresh             # 刷新要求标志
  attr_reader   :passages                 # 通行表
  attr_reader   :priorities               # 优先表
  attr_reader   :terrain_tags             # 地形标记表
  attr_reader   :events                   # 事件
  attr_reader   :fog_ox                   # 雾 原点 X 坐标
  attr_reader   :fog_oy                   # 雾 原点 Y 坐标
  attr_reader   :fog_tone                 # 雾 色调
  attr_reader   :map
  #--------------------------------------------------------------------------
  # ● 初始化条件
  #--------------------------------------------------------------------------
  def initialize
    @map_id = 0
    @display_x = 0
    @display_y = 0
  end
  #--------------------------------------------------------------------------
  # ● 设置
  #     map_id : 地图 ID
  #--------------------------------------------------------------------------
  def setup(map_id)
    # 地图 ID 记录到 @map_id 
    @map_id = map_id
    # 地图文件装载后、设置到 @map 
    @map = load_data(sprintf("Data/Map%03d.rxdata", @map_id))
    # 定义实例变量设置地图元件信息
    tileset = $data_tilesets[@map.tileset_id]
    @tileset_name = tileset.tileset_name
    @autotile_names = tileset.autotile_names
    @panorama_name = tileset.panorama_name
    @panorama_hue = tileset.panorama_hue
    @fog_name = tileset.fog_name
    @fog_hue = tileset.fog_hue
    @fog_opacity = tileset.fog_opacity
    @fog_blend_type = tileset.fog_blend_type
    @fog_zoom = tileset.fog_zoom
    @fog_sx = tileset.fog_sx
    @fog_sy = tileset.fog_sy
    @battleback_name = tileset.battleback_name
    @passages = tileset.passages
    @priorities = tileset.priorities
    @terrain_tags = tileset.terrain_tags
    # 初始化显示坐标
    @display_x = 0
    @display_y = 0
    # 清除刷新要求标志
    @need_refresh = false
    # 设置地图事件数据
    @events = {}
    for i in @map.events.keys
      @events[i] = Game_Event.new(@map_id, @map.events[i])
    end
    # 设置公共事件数据
    @common_events = {}
    for i in 1...$data_common_events.size
      @common_events[i] = Game_CommonEvent.new(i)
    end
    # 初始化雾的各种信息
    @fog_ox = 0
    @fog_oy = 0
    @fog_tone = Tone.new(0, 0, 0, 0)
    @fog_tone_target = Tone.new(0, 0, 0, 0)
    @fog_tone_duration = 0
    @fog_opacity_duration = 0
    @fog_opacity_target = 0
    # 初始化滚动信息
    @scroll_direction = 2
    @scroll_rest = 0
    @scroll_speed = 4
  end
  #--------------------------------------------------------------------------
  # ● 获取地图 ID
  #--------------------------------------------------------------------------
  def map_id
    return @map_id
  end
  #--------------------------------------------------------------------------
  # ● 获取宽度
  #--------------------------------------------------------------------------
  def width
    return @map.width
  end
  #--------------------------------------------------------------------------
  # ● 获取高度
  #--------------------------------------------------------------------------
  def height
    return @map.height
  end
  #--------------------------------------------------------------------------
  # ● 获取遇敌列表
  #--------------------------------------------------------------------------
  def encounter_list
    return @map.encounter_list
  end
  #--------------------------------------------------------------------------
  # ● 获取遇敌步数
  #--------------------------------------------------------------------------
  def encounter_step
    return @map.encounter_step
  end
  #--------------------------------------------------------------------------
  # ● 获取地图数据
  #--------------------------------------------------------------------------
  def data
    return @map.data
  end
  #--------------------------------------------------------------------------
  # ● BGM / BGS 自动切换
  #--------------------------------------------------------------------------
  def autoplay
    if @map.autoplay_bgm
      $game_system.bgm_play(@map.bgm)
    end
    if @map.autoplay_bgs
      $game_system.bgs_play(@map.bgs)
    end
  end
  #--------------------------------------------------------------------------
  # ● 刷新
  #--------------------------------------------------------------------------
  def refresh
    # 地图 ID 有效
    if @map_id > 0
      # 刷新全部的地图事件
      for event in @events.values
        event.refresh
      end
      # 刷新全部的公共事件
      for common_event in @common_events.values
        common_event.refresh
      end
    end
    # 清除刷新要求标志
    @need_refresh = false
  end
  #--------------------------------------------------------------------------
  # ● 向下滚动
  #     distance : 滚动距离
  #--------------------------------------------------------------------------
  def scroll_down(distance)
    @display_y = [@display_y + distance, (self.height - 15) * 128].min
  end
  #--------------------------------------------------------------------------
  # ● 向左滚动
  #     distance : 滚动距离
  #--------------------------------------------------------------------------
  def scroll_left(distance)
    @display_x = [@display_x - distance, 0].max
  end
  #--------------------------------------------------------------------------
  # ● 向右滚动
  #     distance : 滚动距离
  #--------------------------------------------------------------------------
  def scroll_right(distance)
    @display_x = [@display_x + distance, (self.width - 20) * 128].min
  end
  #--------------------------------------------------------------------------
  # ● 向上滚动
  #     distance : 滚动距离
  #--------------------------------------------------------------------------
  def scroll_up(distance)
    @display_y = [@display_y - distance, 0].max
  end
  #--------------------------------------------------------------------------
  # ● 有效坐标判定
  #     x          : X 坐标
  #     y          : Y 坐标
  #--------------------------------------------------------------------------
  def valid?(x, y)
    return (x >= 0 and x < width and y >= 0 and y < height)
  end
  #--------------------------------------------------------------------------
  # ● 可以通行判定
  #     x          : X 坐标
  #     y          : Y 坐标
  #     d          : 方向 (0,2,4,6,8,10)
  #                  ※ 0,10 = 全方向不能通行的情况的判定 (跳跃等)
  #     self_event : 自己 (判定事件可以通行的情况下)
  #--------------------------------------------------------------------------
  def passable?(x, y, d, self_event = nil)
    # 被给予的坐标地图外的情况下
    unless valid?(x, y)
      # 不能通行
      return false
    end
    # 方向 (0,2,4,6,8,10) 与障碍物接触 (0,1,2,4,8,0) 后变换
    bit = (1 << (d / 2 - 1)) & 0x0f
    # 循环全部的事件
    for event in events.values
      # 自己以外的元件与坐标相同的情况
      if event.tile_id >= 0 and event != self_event and
         event.x == x and event.y == y and not event.through
        # 如果障碍物的接触被设置的情况下
        if @passages[event.tile_id] & bit != 0
          # 不能通行
          return false
        # 如果全方向的障碍物的接触被设置的情况下
        elsif @passages[event.tile_id] & 0x0f == 0x0f
          # 不能通行
          return false
        # 这以外的优先度为 0 的情况下
        elsif @priorities[event.tile_id] == 0
          # 可以通行
          return true
        end
      end
    end
    # 从层按从上到下的顺序调查循环
    for i in [2, 1, 0]
      # 取得元件 ID
      tile_id = data[x, y, i]
      # 取得元件 ID 失败
      if tile_id == nil
        # 不能通行
        return false
      # 如果障碍物的接触被设置的情况下
      elsif @passages[tile_id] & bit != 0
        # 不能通行
        return false
      # 如果全方向的障碍物的接触被设置的情况下
      elsif @passages[tile_id] & 0x0f == 0x0f
        # 不能通行
        return false
      # 这以外的优先度为 0 的情况下
      elsif @priorities[tile_id] == 0
        # 可以通行
        return true
      end
    end
    # 可以通行
    return true
  end
  #--------------------------------------------------------------------------
  # ● 茂密判定
  #     x          : X 坐标
  #     y          : Y 坐标
  #--------------------------------------------------------------------------
  def bush?(x, y)
    if @map_id != 0
      for i in [2, 1, 0]
        tile_id = data[x, y, i]
        if tile_id == nil
          return false
        elsif @passages[tile_id] & 0x40 == 0x40
          return true
        end
      end
    end
    return false
  end
  #--------------------------------------------------------------------------
  # ● 柜台判定
  #     x          : X 坐标
  #     y          : Y 坐标
  #--------------------------------------------------------------------------
  def counter?(x, y)
    if @map_id != 0
      for i in [2, 1, 0]
        tile_id = data[x, y, i]
        if tile_id == nil
          return false
        elsif @passages[tile_id] & 0x80 == 0x80
          return true
        end
      end
    end
    return false
  end
  #--------------------------------------------------------------------------
  # ● 获取地形标志
  #     x          : X 坐标
  #     y          : Y 坐标
  #--------------------------------------------------------------------------
  def terrain_tag(x, y)
    if @map_id != 0
      for i in [2, 1, 0]
        tile_id = data[x, y, i]
        if tile_id == nil
          return 0
        elsif @terrain_tags[tile_id] > 0
          return @terrain_tags[tile_id]
        end
      end
    end
    return 0
  end
  #--------------------------------------------------------------------------
  # ● 获取指定位置的事件 ID
  #     x          : X 坐标
  #     y          : Y 坐标
  #--------------------------------------------------------------------------
  def check_event(x, y)
    for event in $game_map.events.values
      if event.x == x and event.y == y
        return event.id
      end
    end
  end
  #--------------------------------------------------------------------------
  # ● 滚动开始
  #     direction : 滚动方向
  #     distance  : 滚动距离
  #     speed     : 滚动速度
  #--------------------------------------------------------------------------
  def start_scroll(direction, distance, speed)
    @scroll_direction = direction
    @scroll_rest = distance * 128
    @scroll_speed = speed
  end
  #--------------------------------------------------------------------------
  # ● 滚动中判定
  #--------------------------------------------------------------------------
  def scrolling?
    return @scroll_rest > 0
  end
  #--------------------------------------------------------------------------
  # ● 开始变更雾的色调
  #     tone     : 色调
  #     duration : 时间
  #--------------------------------------------------------------------------
  def start_fog_tone_change(tone, duration)
    @fog_tone_target = tone.clone
    @fog_tone_duration = duration
    if @fog_tone_duration == 0
      @fog_tone = @fog_tone_target.clone
    end
  end
  #--------------------------------------------------------------------------
  # ● 开始变更雾的不透明度
  #     opacity  : 不透明度
  #     duration : 时间
  #--------------------------------------------------------------------------
  def start_fog_opacity_change(opacity, duration)
    @fog_opacity_target = opacity * 1.0
    @fog_opacity_duration = duration
    if @fog_opacity_duration == 0
      @fog_opacity = @fog_opacity_target
    end
  end
  #--------------------------------------------------------------------------
  # ● 刷新画面
  #--------------------------------------------------------------------------
  def update
    # 还原必要的地图
    if $game_map.need_refresh
      refresh
    end
    # 滚动中的情况下
    if @scroll_rest > 0
      # 滚动速度变化为地图坐标系的距离
      distance = 2 ** @scroll_speed
      # 执行滚动
      case @scroll_direction
      when 2  # 下
        scroll_down(distance)
      when 4  # 左
        scroll_left(distance)
      when 6  # 右
        scroll_right(distance)
      when 8  # 上
        scroll_up(distance)
      end
      # 滚动距离的减法运算
      @scroll_rest -= distance
    end
    # 更新地图事件
    for event in @events.values
      event.update
    end
    # 更新公共事件
    for common_event in @common_events.values
      common_event.update
    end
    # 处理雾的滚动
    @fog_ox -= @fog_sx / 8.0
    @fog_oy -= @fog_sy / 8.0
    # 处理雾的色调变更
    if @fog_tone_duration >= 1
      d = @fog_tone_duration
      target = @fog_tone_target
      @fog_tone.red = (@fog_tone.red * (d - 1) + target.red) / d
      @fog_tone.green = (@fog_tone.green * (d - 1) + target.green) / d
      @fog_tone.blue = (@fog_tone.blue * (d - 1) + target.blue) / d
      @fog_tone.gray = (@fog_tone.gray * (d - 1) + target.gray) / d
      @fog_tone_duration -= 1
    end
    # 处理雾的不透明度变更
    if @fog_opacity_duration >= 1
      d = @fog_opacity_duration
      @fog_opacity = (@fog_opacity * (d - 1) + @fog_opacity_target) / d
      @fog_opacity_duration -= 1
    end
  end
end
#==============================================================================
# ■ Game_CommonEvent
#------------------------------------------------------------------------------
# 　处理公共事件的类。包含执行并行事件的功能。
# 本类在 Game_Map 类 ($game_map) 的内部使用。
#==============================================================================

class Game_CommonEvent
  #--------------------------------------------------------------------------
  # ● 初始对像
  #     common_event_id : 公共事件 ID
  #--------------------------------------------------------------------------
  def initialize(common_event_id)
    @common_event_id = common_event_id
    @interpreter = nil
    refresh
  end
  #--------------------------------------------------------------------------
  # ● 获取名称
  #--------------------------------------------------------------------------
  def name
    return $data_common_events[@common_event_id].name
  end
  #--------------------------------------------------------------------------
  # ● 获取目标
  #--------------------------------------------------------------------------
  def trigger
    return $data_common_events[@common_event_id].trigger
  end
  #--------------------------------------------------------------------------
  # ● 获取条件开关 ID
  #--------------------------------------------------------------------------
  def switch_id
    return $data_common_events[@common_event_id].switch_id
  end
  #--------------------------------------------------------------------------
  # ● 获取执行内容
  #--------------------------------------------------------------------------
  def list
    return $data_common_events[@common_event_id].list
  end
  #--------------------------------------------------------------------------
  # ● 刷新
  #--------------------------------------------------------------------------
  def refresh
    # 建立必须的处理并行事件用的解释器
    if self.trigger == 2 and $game_switches[self.switch_id] == true
      if @interpreter == nil
        @interpreter = Interpreter.new
      end
    else
      @interpreter = nil
    end
  end
  #--------------------------------------------------------------------------
  # ● 更新画面
  #--------------------------------------------------------------------------
  def update
    # 并行处理有效的情况下
    if @interpreter != nil
      # 如果不是在执行中就设置
      unless @interpreter.running?
        @interpreter.setup(self.list, 0)
      end
      # 更新解释器
      @interpreter.update
    end
  end
end
#==============================================================================
# ■ Game_Character (分割定义 1)
#------------------------------------------------------------------------------
# 　处理角色的类。本类作为 Game_Player 类与 Game_Event
# 类的超级类使用。
#==============================================================================

class Game_Character
  #--------------------------------------------------------------------------
  # ● 定义实例变量
  #--------------------------------------------------------------------------
  attr_reader   :id                       # ID
  attr_reader   :x                        # 地图 X 坐标 (理论坐标)
  attr_reader   :y                        # 地图 Y 坐标 (理论坐标)
  attr_reader   :real_x                   # 地图 X 坐标 (实际坐标 * 128)
  attr_reader   :real_y                   # 地图 Y 坐标 (实际坐标 * 128)
  attr_reader   :tile_id                  # 元件 ID  (0 为无效)
  attr_reader   :character_name           # 角色 文件名
  attr_reader   :character_hue            # 角色 色相
  attr_reader   :opacity                  # 不透明度
  attr_reader   :blend_type               # 合成方式
  attr_reader   :direction                # 朝向
  attr_reader   :pattern                  # 图案
  attr_reader   :move_route_forcing       # 移动路线强制标志
  attr_reader   :through                  # 穿透
  attr_accessor :animation_id             # 动画 ID
  attr_accessor :transparent              # 透明状态
  #--------------------------------------------------------------------------
  # ● 初始化对像
  #--------------------------------------------------------------------------
  def initialize
    @id = 0
    @x = 0
    @y = 0
    @real_x = 0
    @real_y = 0
    @tile_id = 0
    @character_name = ""
    @character_hue = 0
    @opacity = 255
    @blend_type = 0
    @direction = 2
    @pattern = 0
    @move_route_forcing = false
    @through = false
    @animation_id = 0
    @transparent = false
    @original_direction = 2
    @original_pattern = 0
    @move_type = 0
    @move_speed = 4
    @move_frequency = 6
    @move_route = nil
    @move_route_index = 0
    @original_move_route = nil
    @original_move_route_index = 0
    @walk_anime = true
    @step_anime = false
    @direction_fix = false
    @always_on_top = false
    @anime_count = 0
    @stop_count = 0
    @jump_count = 0
    @jump_peak = 0
    @wait_count = 0
    @locked = false
    @prelock_direction = 0
  end
  #--------------------------------------------------------------------------
  # ● 移动中判定
  #--------------------------------------------------------------------------
  def moving?
    # 如果在移动中理论坐标与实际坐标不同
    return (@real_x != @x * 128 or @real_y != @y * 128)
  end
  #--------------------------------------------------------------------------
  # ● 跳跃中判定
  #--------------------------------------------------------------------------
  def jumping?
    # 如果跳跃中跳跃点数比 0 大
    return @jump_count > 0
  end
  #--------------------------------------------------------------------------
  # ● 矫正姿势
  #--------------------------------------------------------------------------
  def straighten
    # 移动时动画以及停止动画为 ON 的情况下
    if @walk_anime or @step_anime
      # 设置图形为 0
      @pattern = 0
    end
    # 清除动画计数
    @anime_count = 0
    # 清除被锁定的向前朝向
    @prelock_direction = 0
  end
  #--------------------------------------------------------------------------
  # ● 强制移动路线
  #     move_route : 新的移动路线
  #--------------------------------------------------------------------------
  def force_move_route(move_route)
    # 保存原来的移动路线
    if @original_move_route == nil
      @original_move_route = @move_route
      @original_move_route_index = @move_route_index
    end
    # 更改移动路线
    @move_route = move_route
    @move_route_index = 0
    # 设置强制移动路线标志
    @move_route_forcing = true
    # 清除被锁定的向前朝向
    @prelock_direction = 0
    # 清除等待计数
    @wait_count = 0
    # 自定义移动
    move_type_custom
  end
  #--------------------------------------------------------------------------
  # ● 可以通行判定
  #     x : X 坐标
  #     y : Y 坐标
  #     d : 方向 (0,2,4,6,8)  ※ 0 = 全方向不能通行的情况判定 (跳跃用)
  #--------------------------------------------------------------------------
  def passable?(x, y, d)
    # 求得新的坐标
    new_x = x + (d == 6 ? 1 : d == 4 ? -1 : 0)
    new_y = y + (d == 2 ? 1 : d == 8 ? -1 : 0)
    # 坐标在地图以外的情况
    unless $game_map.valid?(new_x, new_y)
      # 不能通行
      return false
    end
    # 穿透是 ON 的情况下
    if @through
      # 可以通行
      return true
    end
    # 移动者的元件无法来到指定方向的情况下
    unless $game_map.passable?(x, y, d, self)
      # 通行不可
      return false
    end
    # 从指定方向不能进入到移动处的元件的情况下
    unless $game_map.passable?(new_x, new_y, 10 - d)
      # 不能通行
      return false
    end
    # 循环全部事件
    for event in $game_map.events.values
      # 事件坐标于移动目标坐标一致的情况下
      if event.x == new_x and event.y == new_y
        # 穿透为 ON
        unless event.through
          # 自己就是事件的情况下
          if self != $game_player
            # 不能通行
            return false
          end
          # 自己是主角、对方的图形是角色的情况下
          if event.character_name != ""
            # 不能通行
            return false
          end
        end
      end
    end
    # 主角的坐标与移动目标坐标一致的情况下
    if $game_player.x == new_x and $game_player.y == new_y
      # 穿透为 ON
      unless $game_player.through
        # 自己的图形是角色的情况下
        if @character_name != ""
          # 不能通行
          return false
        end
      end
    end
    # 可以通行
    return true
  end
  #--------------------------------------------------------------------------
  # ● 锁定
  #--------------------------------------------------------------------------
  def lock
    # 如果已经被锁定的情况下
    if @locked
      # 过程结束
      return
    end
    # 保存锁定前的朝向
    @prelock_direction = @direction
    # 保存主角的朝向
    turn_toward_player
    # 设置锁定中标志
    @locked = true
  end
  #--------------------------------------------------------------------------
  # ● 锁定中判定
  #--------------------------------------------------------------------------
  def lock?
    return @locked
  end
  #--------------------------------------------------------------------------
  # ● 解除锁定
  #--------------------------------------------------------------------------
  def unlock
    # 没有锁定的情况下
    unless @locked
      # 过程结束
      return
    end
    # 清除锁定中标志
    @locked = false
    # 没有固定朝向的情况下
    unless @direction_fix
      # 如果保存了锁定前的方向
      if @prelock_direction != 0
        # 还原为锁定前的方向
        @direction = @prelock_direction
      end
    end
  end
  #--------------------------------------------------------------------------
  # ● 移动到指定位置
  #     x : X 坐标
  #     y : Y 坐标
  #--------------------------------------------------------------------------
  def moveto(x, y)
    @x = x % $game_map.width
    @y = y % $game_map.height
    @real_x = @x * 128
    @real_y = @y * 128
    @prelock_direction = 0
  end
  #--------------------------------------------------------------------------
  # ● 获取画面 X 坐标
  #--------------------------------------------------------------------------
  def screen_x
    # 通过实际坐标和地图的显示位置来求得画面坐标
    return (@real_x - $game_map.display_x + 3) / 4 + 16
  end
  #--------------------------------------------------------------------------
  # ● 获取画面 Y 坐标
  #--------------------------------------------------------------------------
  def screen_y
    # 通过实际坐标和地图的显示位置来求得画面坐标
    y = (@real_y - $game_map.display_y + 3) / 4 + 32
    # 取跳跃计数小的 Y 坐标
    if @jump_count >= @jump_peak
      n = @jump_count - @jump_peak
    else
      n = @jump_peak - @jump_count
    end
    return y - (@jump_peak * @jump_peak - n * n) / 2
  end
  #--------------------------------------------------------------------------
  # ● 获取画面 Z 坐标
  #     height : 角色的高度
  #--------------------------------------------------------------------------
  def screen_z(height = 0)
    # 在最前显示的标志为 ON 的情况下
    if @always_on_top
      # 无条件设置为 999
      return 999
    end
    # 通过实际坐标和地图的显示位置来求得画面坐标
    z = (@real_y - $game_map.display_y + 3) / 4 + 32
    # 元件的情况下
    if @tile_id > 0
      # 元件的优先不足 * 32 
      return z + $game_map.priorities[@tile_id] * 32
    # 角色的场合
    else
      # 如果高度超过 32 就判定为满足 31
      return z + ((height > 32) ? 31 : 0)
    end
  end
  #--------------------------------------------------------------------------
  # ● 取得繁茂
  #--------------------------------------------------------------------------
  def bush_depth
    # 是元件、并且在最前显示为 ON 的情况下
    if @tile_id > 0 or @always_on_top
      return 0
    end
    # 在跳跃以外的状态时繁茂处元件的属性为 12，除此之外为 0
    if @jump_count == 0 and $game_map.bush?(@x, @y)
      return 12
    else
      return 0
    end
  end
  #--------------------------------------------------------------------------
  # ● 取得地形标记
  #--------------------------------------------------------------------------
  def terrain_tag
    return $game_map.terrain_tag(@x, @y)
  end
end
#==============================================================================
# ■ Game_Character (分割定义 2)
#------------------------------------------------------------------------------
# 　处理角色的类。本类作为 Game_Player 类与 Game_Event
# 类的超级类使用。
#==============================================================================

class Game_Character
  #--------------------------------------------------------------------------
  # ● 刷新画面
  #--------------------------------------------------------------------------
  def update
    # 跳跃中、移动中、停止中的分支
    if jumping?
      update_jump
    elsif moving?
      update_move
    else
      update_stop
    end
    # 动画计数超过最大值的情况下
    # ※最大值等于基本值减去移动速度 * 1 的值
    if @anime_count > 14 - @move_speed * 2
      # 停止动画为 OFF 并且在停止中的情况下
      if not @step_anime and @stop_count > 0
        # 还原为原来的图形
        #@pattern = @original_pattern
      # 停止动画为 ON 并且在移动中的情况下
      else
        # 更新图形
        @pattern = (@pattern + 1) % 4
      end
      # 清除动画计数
      @anime_count = 0
    end
    # 等待中的情况下
    if @wait_count > 0
      # 减少等待计数
      @wait_count -= 1
      return
    end
    # 强制移动路线的场合
    if @move_route_forcing
      # 自定义移动
      move_type_custom
      return
    end
    # 事件执行待机中并且为锁定状态的情况下
    if @starting or lock?
      # 不做规则移动
      return
    end
    # 如果停止计数超过了一定的值(由移动频度算出)
    if @stop_count > (40 - @move_frequency * 2) * (6 - @move_frequency)
      # 移动类型分支
      case @move_type
      when 1  # 随机
        move_type_random
      when 2  # 接近
        move_type_toward_player
      when 3  # 自定义
        move_type_custom
      end
    end
  end
  #--------------------------------------------------------------------------
  # ● 更新画面 (跳跃)
  #--------------------------------------------------------------------------
  def update_jump
    # 跳跃计数减 1
    @jump_count -= 1
    # 计算新坐标
    @real_x = (@real_x * @jump_count + @x * 128) / (@jump_count + 1)
    @real_y = (@real_y * @jump_count + @y * 128) / (@jump_count + 1)
  end
  #--------------------------------------------------------------------------
  # ● 更新画面 (移动)
  #--------------------------------------------------------------------------
  def update_move
    # 移动速度转换为地图坐标系的移动距离
    distance = 2 ** @move_speed
    # 理论坐标在实际坐标下方的情况下
    if @y * 128 > @real_y
      # 向下移动
      @real_y = [@real_y + distance, @y * 128].min
    end
    # 理论坐标在实际坐标左方的情况下
    if @x * 128 < @real_x
      # 向左移动
      @real_x = [@real_x - distance, @x * 128].max
    end
    # 理论坐标在实际坐标右方的情况下
    if @x * 128 > @real_x
      # 向右移动
      @real_x = [@real_x + distance, @x * 128].min
    end
    # 理论坐标在实际坐标上方的情况下
    if @y * 128 < @real_y
      # 向上移动
      @real_y = [@real_y - distance, @y * 128].max
    end
    # 移动时动画为 ON 的情况下
    if @walk_anime
      # 动画计数增加 1.5
      @anime_count += 1.5
    # 移动时动画为 OFF、停止时动画为 ON 的情况下
    elsif @step_anime
      # 动画计数增加 1.5
      @anime_count += 1.5
    end
  end
  #--------------------------------------------------------------------------
  # ● 更新画面 (停止)
  #--------------------------------------------------------------------------
  def update_stop
    # 停止时动画为 ON 的情况下
    if @step_anime
      # 动画计数增加 1.5
      @anime_count += 1.5
    # 停止时动画为 OFF 并且、现在的图像与原来的不同的情况下
    elsif @pattern != @original_pattern
      # 动画计数增加 1.5
      @anime_count += 1.5
    end
    # 事件执行待机中并且不是锁定状态的情况下
    # ※锁定、处理成立刻停止执行中的事件
    unless @starting or lock?
      # 停止计数增加 1
      @stop_count += 1.5
    end
  end
  #--------------------------------------------------------------------------
  # ● 移动类型 : 随机
  #--------------------------------------------------------------------------
  def move_type_random
    # 随机 0～5 的分支
    case rand(6)
    when 0..3  # 随机
      move_random
    when 4  # 前进一步
      move_forward
    when 5  # 暂时停止
      @stop_count = 0
    end
  end
  #--------------------------------------------------------------------------
  # ● 移动类型 : 接近
  #--------------------------------------------------------------------------
  def move_type_toward_player
    # 求得与主角坐标的差
    sx = @x - $game_player.x
    sy = @y - $game_player.y
    # 求得差的绝对值
    abs_sx = sx > 0 ? sx : -sx
    abs_sy = sy > 0 ? sy : -sy
    # 如果纵横共计离开 20 个元件
    if sx + sy >= 20
      # 随机
      move_random
      return
    end
    # 随机 0～5 的分支
    case rand(6)
    when 0..3  # 接近主角
      move_toward_player
    when 4  # 随机
      move_random
    when 5  # 前进一步
      move_forward
    end
  end
  #--------------------------------------------------------------------------
  # ● 移动类型 : 自定义
  #--------------------------------------------------------------------------
  def move_type_custom
    # 如果不是停止中就中断
    if jumping? or moving?
      return
    end
    # 如果在移动指令列表最后结束还没到达就循环执行
    while @move_route_index < @move_route.list.size
      # 获取移动指令
      command = @move_route.list[@move_route_index]
      # 指令编号 0 号 (列表最后) 的情况下
      if command.code == 0
        # 选项 [反复动作] 为 ON 的情况下
        if @move_route.repeat
          # 还原为移动路线的最初索引
          @move_route_index = 0
        end
        # 选项 [反复动作] 为 OFF 的情况下
        unless @move_route.repeat
          # 强制移动路线的场合
          if @move_route_forcing and not @move_route.repeat
            # 强制解除移动路线
            @move_route_forcing = false
            # 还原为原始的移动路线
            @move_route = @original_move_route
            @move_route_index = @original_move_route_index
            @original_move_route = nil
          end
          # 清除停止计数
          @stop_count = 0
        end
        return
      end
      # 移动系指令 (向下移动～跳跃) 的情况下
      if command.code <= 14
        # 命令编号分支
        case command.code
        when 1  # 向下移动
          move_down
        when 2  # 向左移动
          move_left
        when 3  # 向右移动
          move_right
        when 4  # 向上移动
          move_up
        when 5  # 向左下移动
          move_lower_left
        when 6  # 向右下移动
          move_lower_right
        when 7  # 向左上移动
          move_upper_left
        when 8  # 向右上
          move_upper_right
        when 9  # 随机移动
          move_random
        when 10  # 接近主角
          move_toward_player
        when 11  # 远离主角
          move_away_from_player
        when 12  # 前进一步
          move_forward
        when 13  # 后退一步
          move_backward
        when 14  # 跳跃
          jump(command.parameters[0], command.parameters[1])
        end
        # 选项 [无视无法移动的情况] 为 OFF 、移动失败的情况下
        if not @move_route.skippable and not moving? and not jumping?
          return
        end
        @move_route_index += 1
        return
      end
      # 等待的情况下
      if command.code == 15
        # 设置等待计数
        @wait_count = command.parameters[0] * 2 - 1
        @move_route_index += 1
        return
      end
      # 朝向变更系指令的情况下
      if command.code >= 16 and command.code <= 26
        # 命令编号分支
        case command.code
        when 16  # 面向下
          turn_down
        when 17  # 面向左
          turn_left
        when 18  # 面向右
          turn_right
        when 19  # 面向上
          turn_up
        when 20  # 向右转 90 度
          turn_right_90
        when 21  # 向左转 90 度
          turn_left_90
        when 22  # 旋转 180 度
          turn_180
        when 23  # 从右向左转 90 度
          turn_right_or_left_90
        when 24  # 随机变换方向
          turn_random
        when 25  # 面向主角的方向
          turn_toward_player
        when 26  # 背向主角的方向
          turn_away_from_player
        end
        @move_route_index += 1
        return
      end
      # 其它指令的场合
      if command.code >= 27
        # 命令编号分支
        case command.code
        when 27  # 开关 ON
          $game_switches[command.parameters[0]] = true
          $game_map.need_refresh = true
        when 28  # 开关 OFF
          $game_switches[command.parameters[0]] = false
          $game_map.need_refresh = true
        when 29  # 更改移动速度
          @move_speed = command.parameters[0]
        when 30  # 更改移动频度
          @move_frequency = command.parameters[0]
        when 31  # 移动时动画 ON
          @walk_anime = true
        when 32  # 移动时动画 OFF
          @walk_anime = false
        when 33  # 停止时动画 ON
          @step_anime = true
        when 34  # 停止时动画 OFF
          @step_anime = false
        when 35  # 朝向固定 ON
          @direction_fix = true
        when 36  # 朝向固定 OFF
          @direction_fix = false
        when 37  # 穿透 ON
          @through = true
        when 38  # 穿透 OFF
          @through = false
        when 39  # 在最前面显示 ON
          @always_on_top = true
        when 40  # 在最前面显示 OFF
          @always_on_top = false
        when 41  # 更改图形
          @tile_id = 0
          @character_name = command.parameters[0]
          @character_hue = command.parameters[1]
          if @original_direction != command.parameters[2]
            @direction = command.parameters[2]
            @original_direction = @direction
            @prelock_direction = 0
          end
          if @original_pattern != command.parameters[3]
            @pattern = command.parameters[3]
            @original_pattern = @pattern
          end
        when 42  # 更改不透明度
          @opacity = command.parameters[0]
        when 43  # 更改合成方式
          @blend_type = command.parameters[0]
        when 44  # 演奏 SE
          $game_system.se_play(command.parameters[0])
        when 45  # 脚本
          result = eval(command.parameters[0])
        end
        @move_route_index += 1
      end
    end
  end
  #--------------------------------------------------------------------------
  # ● 增加步数
  #--------------------------------------------------------------------------
  def increase_steps
    # 清除停止步数
    @stop_count = 0
  end
end
#==============================================================================
# ■ Game_Character (分割定义 3)
#------------------------------------------------------------------------------
# 　处理角色的类。本类作为 Game_Player 类与 Game_Event
# 类的超级类使用。
#==============================================================================

class Game_Character
  #--------------------------------------------------------------------------
  # ● 向下移动
  #     turn_enabled : 本场地位置更改许可标志
  #--------------------------------------------------------------------------
  def move_down(turn_enabled = true)
    # 面向下
    if turn_enabled
      turn_down
    end
    # 可以通行的场合
    if passable?(@x, @y, 2)
      # 面向下
      turn_down
      # 更新坐标
      @y += 1
      # 增加步数
    # 不能通行的情况下
    else
      # 接触事件的启动判定
      check_event_trigger_touch(@x, @y+1)
      @scratch = true
      @step_anime = true
    end
  end
  #--------------------------------------------------------------------------
  # ● 向左移动
  #     turn_enabled : 本场地位置更改许可标志
  #--------------------------------------------------------------------------
  def move_left(turn_enabled = true)
    # 面向左
    if turn_enabled
      turn_left
    end
    # 可以通行的情况下
    if passable?(@x, @y, 4)
      # 面向左
      turn_left
      # 更新坐标
      @x -= 1
      # 增加步数
    # 不能通行的情况下
    else
      # 接触事件的启动判定
      check_event_trigger_touch(@x-1, @y)
      @scratch = true
      @step_anime = true
    end
  end
  #--------------------------------------------------------------------------
  # ● 向右移动
  #     turn_enabled : 本场地位置更改许可标志
  #--------------------------------------------------------------------------
  def move_right(turn_enabled = true)
    # 面向右
    if turn_enabled
      turn_right
    end
    # 可以通行的场合
    if passable?(@x, @y, 6)
      # 面向右
      turn_right
      # 更新坐标
      @x += 1
      # 增加步数
    # 不能通行的情况下
    else
      # 接触事件的启动判定
      check_event_trigger_touch(@x+1, @y)
      @scratch = true
      @step_anime = true
    end
  end
  #--------------------------------------------------------------------------
  # ● 向上移动
  #     turn_enabled : 本场地位置更改许可标志
  #--------------------------------------------------------------------------
  def move_up(turn_enabled = true)
    # 面向上
    if turn_enabled
      turn_up
    end
    # 可以通行的情况下
    if passable?(@x, @y, 8)
      # 面向上
      turn_up
      # 更新坐标
      @y -= 1
      # 歩数増加
    # 不能通行的情况下
    else
      # 接触事件的启动判定
      check_event_trigger_touch(@x, @y-1)
      @scratch = true
      @step_anime = true
    end
  end
  #--------------------------------------------------------------------------
  # ● 向左下移动
  #--------------------------------------------------------------------------
  def move_lower_left
    # 没有固定面向的场合
    unless @direction_fix
      # 朝向是右的情况下适合的面是左面、朝向是上的情况下适合的面是下面
      @direction = (@direction == 6 ? 4 : @direction == 8 ? 2 : @direction)
    end
    # 下→左、左→下 的通道可以通行的情况下
    if (passable?(@x, @y, 2) and passable?(@x, @y + 1, 4)) or
       (passable?(@x, @y, 4) and passable?(@x - 1, @y, 2))
      # 更新坐标
      @x -= 1
      @y += 1
      # 增加步数
    end
  end
  #--------------------------------------------------------------------------
  # ● 向右下移动
  #--------------------------------------------------------------------------
  def move_lower_right
    # 没有固定面向的场合
    unless @direction_fix
      # 朝向是右的情况下适合的面是左面、朝向是上的情况下适合的面是下面
      @direction = (@direction == 4 ? 6 : @direction == 8 ? 2 : @direction)
    end
    # 下→右、右→下 的通道可以通行的情况下
    if (passable?(@x, @y, 2) and passable?(@x, @y + 1, 6)) or
       (passable?(@x, @y, 6) and passable?(@x + 1, @y, 2))
      # 更新坐标
      @x += 1
      @y += 1
      # 增加步数
    end
  end
  #--------------------------------------------------------------------------
  # ● 向左上移动
  #--------------------------------------------------------------------------
  def move_upper_left
    # 没有固定面向的场合
    unless @direction_fix
      # 朝向是右的情况下适合的面是左面、朝向是上的情况下适合的面是下面
      @direction = (@direction == 6 ? 4 : @direction == 2 ? 8 : @direction)
    end
    # 上→左、左→上 的通道可以通行的情况下
    if (passable?(@x, @y, 8) and passable?(@x, @y - 1, 4)) or
       (passable?(@x, @y, 4) and passable?(@x - 1, @y, 8))
      # 更新坐标
      @x -= 1
      @y -= 1
      # 增加步数
    end
  end
  #--------------------------------------------------------------------------
  # ● 向右上移动
  #--------------------------------------------------------------------------
  def move_upper_right
    # 没有固定面向的场合
    unless @direction_fix
      # 朝向是右的情况下适合的面是左面、朝向是上的情况下适合的面是下面
      @direction = (@direction == 4 ? 6 : @direction == 2 ? 8 : @direction)
    end
    # 上→右、右→上 的通道可以通行的情况下
    if (passable?(@x, @y, 8) and passable?(@x, @y - 1, 6)) or
       (passable?(@x, @y, 6) and passable?(@x + 1, @y, 8))
      # 更新坐标
      @x += 1
      @y -= 1
      # 增加步数
    end
  end
  #--------------------------------------------------------------------------
  # ● 随机移动
  #--------------------------------------------------------------------------
  def move_random
    case rand(4)
    when 0  # 向下移动
      move_down(false)
    when 1  # 向左移动
      move_left(false)
    when 2  # 向右移动
      move_right(false)
    when 3  # 向上移动
      move_up(false)
    end
  end
  #--------------------------------------------------------------------------
  # ● 接近主角
  #--------------------------------------------------------------------------
  def move_toward_player
    # 求得与主角的坐标差
    sx = @x - $game_player.x
    sy = @y - $game_player.y
    # 坐标相等情况下
    if sx == 0 and sy == 0
      return
    end
    # 求得差的绝对值
    abs_sx = sx.abs
    abs_sy = sy.abs
    # 横距离与纵距离相等的情况下
    if abs_sx == abs_sy
      # 随机将边数增加 1
      rand(2) == 0 ? abs_sx += 1 : abs_sy += 1
    end
    # 横侧距离长的情况下
    if abs_sx > abs_sy
      # 左右方向优先。向主角移动
      sx > 0 ? move_left : move_right
      if not moving? and sy != 0
        sy > 0 ? move_up : move_down
      end
    # 竖侧距离长的情况下
    else
      # 上下方向优先。向主角移动
      sy > 0 ? move_up : move_down
      if not moving? and sx != 0
        sx > 0 ? move_left : move_right
      end
    end
  end
  #--------------------------------------------------------------------------
  # ● 远离主角
  #--------------------------------------------------------------------------
  def move_away_from_player
    # 求得与主角的坐标差
    sx = @x - $game_player.x
    sy = @y - $game_player.y
    # 坐标相等情况下
    if sx == 0 and sy == 0
      return
    end
    # 求得差的绝对值
    abs_sx = sx.abs
    abs_sy = sy.abs
    # 横距离与纵距离相等的情况下
    if abs_sx == abs_sy
      # 随机将边数增加 1
      rand(2) == 0 ? abs_sx += 1 : abs_sy += 1
    end
    # 横侧距离长的情况下
    if abs_sx > abs_sy
      # 左右方向优先。远离主角移动
      sx > 0 ? move_right : move_left
      if not moving? and sy != 0
        sy > 0 ? move_down : move_up
      end
    # 竖侧距离长的情况下
    else
      # 上下方向优先。远离主角移动
      sy > 0 ? move_down : move_up
      if not moving? and sx != 0
        sx > 0 ? move_right : move_left
      end
    end
  end
  #--------------------------------------------------------------------------
  # ● 前进一步
  #--------------------------------------------------------------------------
  def move_forward
    case @direction
    when 2
      move_down(false)
    when 4
      move_left(false)
    when 6
      move_right(false)
    when 8
      move_up(false)
    end
  end
  #--------------------------------------------------------------------------
  # ● 后退一步
  #--------------------------------------------------------------------------
  def move_backward
    # 记忆朝向固定信息
    last_direction_fix = @direction_fix
    # 强制固定朝向
    @direction_fix = true
    # 朝向分支
    case @direction
    when 2  # 下
      move_up(false)
    when 4  # 左
      move_right(false)
    when 6  # 右
      move_left(false)
    when 8  # 上
      move_down(false)
    end
    # 还原朝向固定信息
    @direction_fix = last_direction_fix
  end
  #--------------------------------------------------------------------------
  # ● 跳跃
  #     x_plus : X 坐标增加值
  #     y_plus : Y 坐标增加值
  #--------------------------------------------------------------------------
  def jump(x_plus, y_plus)
    # 增加值不是 (0,0) 的情况下
    if x_plus != 0 or y_plus != 0
      # 横侧距离长的情况下
      if x_plus.abs > y_plus.abs
        # 变更左右方向
        x_plus < 0 ? turn_left : turn_right
      # 竖侧距离长的情况下
      else
        # 变更上下方向
        y_plus < 0 ? turn_up : turn_down
      end
    end
    # 计算新的坐标
    new_x = @x + x_plus
    new_y = @y + y_plus
    # 增加值为 (0,0) 的情况下、跳跃目标可以通行的场合
    if (x_plus == 0 and y_plus == 0) or passable?(new_x, new_y, 0)
      # 矫正姿势
      straighten
      # 更新坐标
      @x = new_x
      @y = new_y
      # 距计算距离
      distance = Math.sqrt(x_plus * x_plus + y_plus * y_plus).round
      # 设置跳跃记数
      @jump_peak = 10 + distance - @move_speed
      @jump_count = @jump_peak * 2
      # 清除停止记数信息
      @stop_count = 0
    end
  end
  #--------------------------------------------------------------------------
  # ● 面向向下
  #--------------------------------------------------------------------------
  def turn_down
    unless @direction_fix
      @direction = 2
      @stop_count = 0
    end
  end
  #--------------------------------------------------------------------------
  # ● 面向向左
  #--------------------------------------------------------------------------
  def turn_left
    unless @direction_fix
      @direction = 4
      @stop_count = 0
    end
  end
  #--------------------------------------------------------------------------
  # ● 面向向右
  #--------------------------------------------------------------------------
  def turn_right
    unless @direction_fix
      @direction = 6
      @stop_count = 0
    end
  end
  #--------------------------------------------------------------------------
  # ● 面向向上
  #--------------------------------------------------------------------------
  def turn_up
    unless @direction_fix
      @direction = 8
      @stop_count = 0
    end
  end
  #--------------------------------------------------------------------------
  # ● 向右旋转 90 度
  #--------------------------------------------------------------------------
  def turn_right_90
    case @direction
    when 2
      turn_left
    when 4
      turn_up
    when 6
      turn_down
    when 8
      turn_right
    end
  end
  #--------------------------------------------------------------------------
  # ● 向左旋转 90 度
  #--------------------------------------------------------------------------
  def turn_left_90
    case @direction
    when 2
      turn_right
    when 4
      turn_down
    when 6
      turn_up
    when 8
      turn_left
    end
  end
  #--------------------------------------------------------------------------
  # ● 旋转 180 度
  #--------------------------------------------------------------------------
  def turn_180
    case @direction
    when 2
      turn_up
    when 4
      turn_right
    when 6
      turn_left
    when 8
      turn_down
    end
  end
  #--------------------------------------------------------------------------
  # ● 从右向左旋转 90 度
  #--------------------------------------------------------------------------
  def turn_right_or_left_90
    if rand(2) == 0
      turn_right_90
    else
      turn_left_90
    end
  end
  #--------------------------------------------------------------------------
  # ● 随机变换方向
  #--------------------------------------------------------------------------
  def turn_random
    case rand(4)
    when 0
      turn_up
    when 1
      turn_right
    when 2
      turn_left
    when 3
      turn_down
    end
  end
  #--------------------------------------------------------------------------
  # ● 接近主角的方向
  #--------------------------------------------------------------------------
  def turn_toward_player
    # 求得与主角的坐标差
    sx = @x - $game_player.x
    sy = @y - $game_player.y
    # 坐标相等的场合下
    if sx == 0 and sy == 0
      return
    end
    # 横侧距离长的情况下
    if sx.abs > sy.abs
      # 将左右方向变更为朝向主角的方向
      sx > 0 ? turn_left : turn_right
    # 竖侧距离长的情况下
    else
      # 将上下方向变更为朝向主角的方向
      sy > 0 ? turn_up : turn_down
    end
  end
  #--------------------------------------------------------------------------
  # ● 背向主角的方向
  #--------------------------------------------------------------------------
  def turn_away_from_player
    # 求得与主角的坐标差
    sx = @x - $game_player.x
    sy = @y - $game_player.y
    # 坐标相等的场合下
    if sx == 0 and sy == 0
      return
    end
    # 横侧距离长的情况下
    if sx.abs > sy.abs
      # 将左右方向变更为背离主角的方向
      sx > 0 ? turn_right : turn_left
    # 竖侧距离长的情况下
    else
      # 将上下方向变更为背离主角的方向
      sy > 0 ? turn_down : turn_up
    end
  end
end
#==============================================================================
# ■ Game_Event
#------------------------------------------------------------------------------
# 　处理事件的类。条件判断、事件页的切换、并行处理、执行事件功能
# 在 Game_Map 类的内部使用。
#==============================================================================

class Game_Event < Game_Character
  #--------------------------------------------------------------------------
  # ● 定义实例变量
  #--------------------------------------------------------------------------
  attr_reader   :trigger                  # 目标
  attr_reader   :list                     # 执行内容
  attr_reader   :event                    # 事件
  attr_reader   :starting                 # 启动中标志
  #--------------------------------------------------------------------------
  # ● 初始化对像
  #     map_id : 地图 ID
  #     event  : 事件 (RPG::Event)
  #--------------------------------------------------------------------------
  def initialize(map_id, event)
    super()
    @map_id = map_id
    @event = event
    @id = @event.id
    @erased = false
    @starting = false
    @through = true
    # 初期位置的移动
    moveto(@event.x, @event.y)
    refresh
  end
  #--------------------------------------------------------------------------
  # ● 清除移动中标志
  #--------------------------------------------------------------------------
  def clear_starting
    @starting = false
  end
  #--------------------------------------------------------------------------
  # ● 越过目标判定 (不能将相同位置作为启动条件)
  #--------------------------------------------------------------------------
  def over_trigger?
    # 图形是角色、没有开启穿透的情况下
    if @character_name != "" and not @through
      # 启动判定是正面
      return false
    end
    # 地图上的这个位置不能通行的情况下
    unless $game_map.passable?(@x, @y, 0)
      # 启动判定是正面
      return false
    end
    # 启动判定在同位置
    return true
  end
  #--------------------------------------------------------------------------
  # ● 启动事件
  #--------------------------------------------------------------------------
  def start
    # 执行内容不为空的情况下
    if @list.size > 1
      @starting = true
    end
  end
  #--------------------------------------------------------------------------
  # ● 暂时消失
  #--------------------------------------------------------------------------
  def erase
    @erased = true
    refresh
  end
  #--------------------------------------------------------------------------
  # ● 刷新
  #--------------------------------------------------------------------------
  def refresh
    # 初始化本地变量 new_page
    new_page = nil
    # 无法暂时消失的情况下
    unless @erased
      # 从编号大的事件页按顺序调查
      for page in @event.pages.reverse
        # 可以参考事件条件 c
        c = page.condition
        # 确认开关条件 1 
        if c.switch1_valid
          if $game_switches[c.switch1_id] == false
            next
          end
        end
        # 确认开关条件 2 
        if c.switch2_valid
          if $game_switches[c.switch2_id] == false
            next
          end
        end
        # 确认变量条件
        if c.variable_valid
          if $game_variables[c.variable_id] < c.variable_value
            next
          end
        end
        # 确认独立开关条件
        if c.self_switch_valid
          key = [@map_id, @event.id, c.self_switch_ch]
          if $game_self_switches[key] != true
            next
          end
        end
        # 设置本地变量 new_page
        new_page = page
        # 跳出循环
        break
      end
    end
    # 与上次同一事件页的情况下
    if new_page == @page
      # 过程结束
      return
    end
    # @page 设置为现在的事件页
    @page = new_page
    # 清除启动中标志
    clear_starting
    # 没有满足条件的页面的时候
    if @page == nil
      # 设置各实例变量
      @tile_id = 0
      @character_name = ""
      @character_hue = 0
      @move_type = 0
      @through = true
      @trigger = nil
      @list = nil
      @interpreter = nil
      # 过程结束
      return
    end
    # 设置各实例变量
    @tile_id = @page.graphic.tile_id
    @character_name = @page.graphic.character_name
    @character_hue = @page.graphic.character_hue
    if @original_direction != @page.graphic.direction
      @direction = @page.graphic.direction
      @original_direction = @direction
      @prelock_direction = 0
    end
    if @original_pattern != @page.graphic.pattern
      @pattern = @page.graphic.pattern
      @original_pattern = @pattern
    end
    @opacity = @page.graphic.opacity
    @blend_type = @page.graphic.blend_type
    @move_type = @page.move_type
    @move_speed = @page.move_speed
    @move_frequency = @page.move_frequency
    @move_route = @page.move_route
    @move_route_index = 0
    @move_route_forcing = false
    @walk_anime = @page.walk_anime
    @step_anime = @page.step_anime
    @direction_fix = @page.direction_fix
    @through = @page.through
    @always_on_top = @page.always_on_top
    @trigger = @page.trigger
    @list = @page.list
    @interpreter = nil
    # 目标是 [并行处理] 的情况下
    if @trigger == 4
      # 生成并行处理用解释器
      @interpreter = Interpreter.new
    end
    # 自动事件启动判定
    check_event_trigger_auto
  end
  #--------------------------------------------------------------------------
  # ● 接触事件启动判定
  #--------------------------------------------------------------------------
  def check_event_trigger_touch(x, y)
    # 事件执行中的情况下
    if $game_system.map_interpreter.running?
      return
    end
    # 目标为 [与事件接触] 以及和主角坐标一致的情况下
    if @trigger == 2 and x == $game_player.x and y == $game_player.y
      # 除跳跃中以外的情况、启动判定就是正面的事件
      if not jumping? and not over_trigger?
        start
      end
    end
  end
  #--------------------------------------------------------------------------
  # ● 自动事件启动判定
  #--------------------------------------------------------------------------
  def check_event_trigger_auto
    # 目标为 [与事件接触] 以及和主角坐标一致的情况下
    if @trigger == 2 and @x == $game_player.x and @y == $game_player.y
      # 除跳跃中以外的情况、启动判定就是同位置的事件
      if not jumping? and over_trigger?
        start
      end
    end
    # 目标是 [自动执行] 的情况下
    if @trigger == 3
      start
    end
  end
  #--------------------------------------------------------------------------
  # ● 更新画面
  #--------------------------------------------------------------------------
  def update
    super
    # 自动启动事件判定
    check_event_trigger_auto
    # 并行处理有效的情况下
    if @interpreter != nil
      # 不在执行中的场合的情况下
      unless @interpreter.running?
        # 设置事件
        @interpreter.setup(@list, @event.id)
      end
      # 更新解释器
      @interpreter.update
    end
  end
end
#==============================================================================
# ■ Game_Player
#------------------------------------------------------------------------------
# 　处理主角的类。事件启动的判定、以及地图的滚动等功能。
# 本类的实例请参考 $game_player。
#==============================================================================

class Game_Player < Game_Character
  #--------------------------------------------------------------------------
  # ● 常量
  #--------------------------------------------------------------------------
  CENTER_X = (320 - 16) * 4   # 画面中央的 X 坐标 * 4
  CENTER_Y = (240 - 16) * 4   # 画面中央的 Y 坐标 * 4
  #--------------------------------------------------------------------------
  # ● 可以通行判定
  #     x : X 坐标
  #     y : Y 坐标
  #     d : 方向 (0,2,4,6,8)  ※ 0 = 全方向不能通行的情况判定 (跳跃用)
  #--------------------------------------------------------------------------
  def passable?(x, y, d)
    # 求得新的坐标
    new_x = x + (d == 6 ? 1 : d == 4 ? -1 : 0)
    new_y = y + (d == 2 ? 1 : d == 8 ? -1 : 0)
    # 坐标在地图外的情况下
    unless $game_map.valid?(new_x, new_y)
      # 不能通行
      return false
    end
    # 调试模式为 ON 并且 按下 CTRL 键的情况下
    if $DEBUG and Input.press?(Input::CTRL)
      # 可以通行
      return true
    end
    super
  end
  #--------------------------------------------------------------------------
  # ● 以画面中央为基准设置地图的显示位置
  #--------------------------------------------------------------------------
  def center(x, y)
    max_x = ($game_map.width - 20) * 128
    max_y = ($game_map.height - 15) * 128
    $game_map.display_x = [0, [x * 128 - CENTER_X, max_x].min].max
    $game_map.display_y = [0, [y * 128 - CENTER_Y, max_y].min].max
  end
  #--------------------------------------------------------------------------
  # ● 向指定的位置移动
  #     x : X 坐标
  #     y : Y 坐标
  #--------------------------------------------------------------------------
  def moveto(x, y)
    super
    # 自连接
    center(x, y)
    # 生成遇敌计数
    make_encounter_count
  end
  #--------------------------------------------------------------------------
  # ● 增加步数
  #--------------------------------------------------------------------------
  def increase_steps
    super
  end
  #--------------------------------------------------------------------------
  # ● 获取遇敌计数
  #--------------------------------------------------------------------------
  def encounter_count
    return @encounter_count
  end
  #--------------------------------------------------------------------------
  # ● 生成遇敌计数
  #--------------------------------------------------------------------------
  def make_encounter_count
    # 两种颜色震动的图像
    if $game_map.map_id != 0
      n = $game_map.encounter_step
      @encounter_count = rand(n) + rand(n) + 1
    end
  end
  #--------------------------------------------------------------------------
  # ● 刷新
  #--------------------------------------------------------------------------
  def refresh
    # 同伴人数为 0 的情况下
    if $game_party.actors.size == 0
      # 清除角色的文件名及对像
      @character_name = ""
      @character_hue = 0
      # 分支结束
      return
    end
    # 获取带头的角色
    actor = $game_party.actors[0]
    # 设置角色的文件名及对像
    @character_name = actor.character_name
    @character_hue = actor.character_hue
    # 初始化不透明度和合成方式
    @opacity = 255
    @blend_type = 0
  end
  #--------------------------------------------------------------------------
  # ● 同位置的事件启动判定
  #--------------------------------------------------------------------------
  def check_event_trigger_here(triggers)
    result = false
    # 事件执行中的情况下
    if $game_system.map_interpreter.running?
      return result
    end
    # 全部事件的循环
    for event in $game_map.events.values
      # 事件坐标与目标一致的情况下
      if event.x == @x and event.y == @y and triggers.include?(event.trigger)
        # 跳跃中以外的情况下、启动判定是同位置的事件
        if not event.jumping? and event.over_trigger?
          event.start
          result = true
        end
      end
    end
    return result
  end
  #--------------------------------------------------------------------------
  # ● 正面事件的启动判定
  #--------------------------------------------------------------------------
  def check_event_trigger_there(triggers)
    result = false
    # 事件执行中的情况下
    if $game_system.map_interpreter.running?
      return result
    end
    # 计算正面坐标
    new_x = @x + (@direction == 6 ? 1 : @direction == 4 ? -1 : 0)
    new_y = @y + (@direction == 2 ? 1 : @direction == 8 ? -1 : 0)
    # 全部事件的循环
    for event in $game_map.events.values
      # 事件坐标与目标一致的情况下
      if event.x == new_x and event.y == new_y and
         triggers.include?(event.trigger)
        # 跳跃中以外的情况下、启动判定是正面的事件
        if not event.jumping? and not event.over_trigger?
          event.start
          result = true
        end
      end
    end
    # 找不到符合条件的事件的情况下
    if result == false
      # 正面的元件是计数器的情况下
      if $game_map.counter?(new_x, new_y)
        # 计算 1 元件里侧的坐标
        new_x += (@direction == 6 ? 1 : @direction == 4 ? -1 : 0)
        new_y += (@direction == 2 ? 1 : @direction == 8 ? -1 : 0)
        # 全事件的循环
        for event in $game_map.events.values
          # 事件坐标与目标一致的情况下
          if event.x == new_x and event.y == new_y and
             triggers.include?(event.trigger)
            # 跳跃中以外的情况下、启动判定是正面的事件
            if not event.jumping? and not event.over_trigger?
              event.start
              result = true
            end
          end
        end
      end
    end
    return result
  end
  #--------------------------------------------------------------------------
  # ● 接触事件启动判定
  #--------------------------------------------------------------------------
  def check_event_trigger_touch(x, y)
    result = false
    # 事件执行中的情况下
    if $game_system.map_interpreter.running?
      return result
    end
    # 全事件的循环
    for event in $game_map.events.values
      # 事件坐标与目标一致的情况下
      if event.x == x and event.y == y and [1,2].include?(event.trigger)
        # 跳跃中以外的情况下、启动判定是正面的事件
        if not event.jumping? and not event.over_trigger?
          event.start
          result = true
        end
      end
    end
    return result
  end
  #--------------------------------------------------------------------------
  # ● 画面更新
  #--------------------------------------------------------------------------
  def update
    # 本地变量记录移动信息
    last_moving = moving?
    # 移动中、事件执行中、强制移动路线中、
    unless moving?
      @scratch = false
      @step_anime = false
    end
    # 信息窗口一个也不显示的时候
    unless moving? or $game_system.map_interpreter.running? or
           @move_route_forcing or $game_temp.message_window_showing
      # 如果方向键被按下、主角就朝那个方向移动
      case Input.dir4
      when 2
        move_down
      when 4
        move_left
      when 6
        move_right
      when 8
        move_up
      end
    end
    # 本地变量记忆坐标
    last_real_x = @real_x
    last_real_y = @real_y
    super
    # 角色向下移动、画面上的位置在中央下方的情况下
    if @real_y > last_real_y and @real_y - $game_map.display_y > CENTER_Y
      # 画面向下卷动
      $game_map.scroll_down(@real_y - last_real_y)
    end
    # 角色向左移动、画面上的位置在中央左方的情况下
    if @real_x < last_real_x and @real_x - $game_map.display_x < CENTER_X
      # 画面向左卷动
      $game_map.scroll_left(last_real_x - @real_x)
    end
    # 角色向右移动、画面上的位置在中央右方的情况下
    if @real_x > last_real_x and @real_x - $game_map.display_x > CENTER_X
      # 画面向右卷动
      $game_map.scroll_right(@real_x - last_real_x)
    end
    # 角色向上移动、画面上的位置在中央上方的情况下
    if @real_y < last_real_y and @real_y - $game_map.display_y < CENTER_Y
      # 画面向上卷动
      $game_map.scroll_up(last_real_y - @real_y)
    end
    # 不在移动中的情况下
    unless moving?
      # 上次主角移动中的情况
      if last_moving
        # 与同位置的事件接触就判定为事件启动
        result = check_event_trigger_here([1,2])
        # 没有可以启动的事件的情况下
        if result == false
          # 调试模式为 ON 并且按下 CTRL 键的情况下除外
          unless $DEBUG and Input.press?(Input::CTRL)
            # 遇敌计数下降
            if @encounter_count > 0
              @encounter_count -= 1
            end
          end
        end
      end
      # 按下 C 键的情况下
      if Input.trigger?(Input::C)
        # 判定为同位置以及正面的事件启动
        check_event_trigger_here([0])
        check_event_trigger_there([0,1,2])
      end
    end
  end
end
#==============================================================================
# ■ Sprite_Character
#------------------------------------------------------------------------------
# 　角色显示用脚本。监视 Game_Character 类的实例、
# 自动变化脚本状态。
#==============================================================================

class Sprite_Character < RPG::Sprite
  #--------------------------------------------------------------------------
  # ● 定义实例变量
  #--------------------------------------------------------------------------
  attr_accessor :character                # 角色
  #--------------------------------------------------------------------------
  # ● 初始化对像
  #     viewport  : 查看端口
  #     character : 角色 (Game_Character)
  #--------------------------------------------------------------------------
  def initialize(viewport, character = nil)
    super(viewport)
    @character = character
    update
  end
  #--------------------------------------------------------------------------
  # ● 更新画面
  #--------------------------------------------------------------------------
  def update
    super
    # 元件 ID、文件名、色相与现在的情况存在差异的情况下
    if @tile_id != @character.tile_id or
       @character_name != @character.character_name or
       @character_hue != @character.character_hue
      # 记忆元件 ID 与文件名、色相
      @tile_id = @character.tile_id
      @character_name = @character.character_name
      @character_hue = @character.character_hue
      # 元件 ID 为有效值的情况下
      if @tile_id >= 384
        self.bitmap = RPG::Cache.tile($game_map.tileset_name,
          @tile_id, @character.character_hue)
        self.src_rect.set(0, 0, 32, 32)
        self.ox = 16
        self.oy = 32
      # 元件 ID 为无效值的情况下
      else
        self.bitmap = RPG::Cache.character(@character.character_name,
          @character.character_hue)
        @cw = bitmap.width / 4
        @ch = bitmap.height / 4
        self.ox = @cw / 2
        self.oy = @ch
      end
    end
    # 设置可视状态
    self.visible = (not @character.transparent)
    # 图形是角色的情况下
    if @tile_id == 0
      # 设置传送目标的矩形
      sx = @character.pattern * @cw
      sy = (@character.direction - 2) / 2 * @ch
      self.src_rect.set(sx, sy, @cw, @ch)
    end
    # 设置脚本的坐标
    self.x = @character.screen_x
    self.y = @character.screen_y
    self.z = @character.screen_z(@ch)
    # 设置不透明度、合成方式、茂密
    self.opacity = @character.opacity
    self.blend_type = @character.blend_type
    self.bush_depth = @character.bush_depth
    # 动画
    if @character.animation_id != 0
      animation = $data_animations[@character.animation_id]
      animation(animation, true)
      @character.animation_id = 0
    end
  end
end
#==============================================================================
# ■ Sprite_Battler
#------------------------------------------------------------------------------
# 　战斗显示用活动块。Game_Battler 类的实例监视、
# 活动块的状态的监视。
#==============================================================================

class Sprite_Battler < RPG::Sprite
  #--------------------------------------------------------------------------
  # ● 定义实例变量
  #--------------------------------------------------------------------------
  attr_accessor :battler                  # 战斗者
  #--------------------------------------------------------------------------
  # ● 初始化对像
  #     viewport : 显示端口
  #     battler  : 战斗者 (Game_Battler)
  #--------------------------------------------------------------------------
  def initialize(viewport, battler = nil)
    super(viewport)
    @battler = battler
    @battler_visible = false
  end
  #--------------------------------------------------------------------------
  # ● 释放
  #--------------------------------------------------------------------------
  def dispose
    if self.bitmap != nil
      self.bitmap.dispose
    end
    super
  end
  #--------------------------------------------------------------------------
  # ● 刷新画面
  #--------------------------------------------------------------------------
  def update
    super
    # 战斗者为 nil 的情况下
    if @battler == nil
      self.bitmap = nil
      loop_animation(nil)
      return
    end
    # 文件名和色相与当前情况有差异的情况下
    if @battler.battler_name != @battler_name or
       @battler.battler_hue != @battler_hue
      # 获取、设置位图
      @battler_name = @battler.battler_name
      @battler_hue = @battler.battler_hue
      self.bitmap = RPG::Cache.battler(@battler_name, @battler_hue)
      @width = bitmap.width
      @height = bitmap.height
      self.ox = @width / 2
      self.oy = @height
      # 如果是战斗不能或者是隐藏状态就把透明度设置成 0
      if @battler.dead? or @battler.hidden
        self.opacity = 0
      end
    end
    # 动画 ID 与当前的情况有差异的情况下
    if @battler.damage == nil and
       @battler.state_animation_id != @state_animation_id
      @state_animation_id = @battler.state_animation_id
      loop_animation($data_animations[@state_animation_id])
    end
    # 应该被显示的角色的情况下
    if @battler.is_a?(Game_Actor) and @battler_visible
      # 不是主状态的时候稍稍降低点透明度
      if $game_temp.battle_main_phase
        #self.opacity += 3 if self.opacity < 255
      else
        #self.opacity -= 3 if self.opacity > 207
      end
    end
    # 明灭
    if @battler.blink
      blink_off
    else
      blink_off
    end
    # 不可见的情况下
    unless @battler_visible
      # 出现
      if not @battler.hidden and not @battler.dead? and
         (@battler.damage == nil or @battler.damage_pop)
        appear
        @battler_visible = true
      end
    end
    # 可见的情况下
    if @battler_visible
      # 逃跑
      if @battler.hidden
        $game_system.se_play($data_system.escape_se)
        escape
        @battler_visible = false
      end
      # 白色闪烁
      if @battler.white_flash
        whiten
        @battler.white_flash = false
      end
      # 动画
      if @battler.animation_id != 0
        animation = $data_animations[@battler.animation_id]
        animation(animation, @battler.animation_hit)
        @battler.animation_id = 0
      end
      # 伤害
      if @battler.damage_pop
        damage(@battler.damage, @battler.critical)
        @battler.damage = nil
        @battler.critical = false
        @battler.damage_pop = false
      end
      # korapusu
      if @battler.damage == nil and @battler.dead?
        if @battler.is_a?(Game_Enemy)
          $game_system.se_play($data_system.enemy_collapse_se)
        else
          $game_system.se_play($data_system.actor_collapse_se)
        end
        collapse
        @battler_visible = false
      end
    end
    # 设置活动块的坐标
    self.x = @battler.screen_x
    self.y = @battler.screen_y
    self.z = @battler.screen_z
  end
end
class Sprite_Status < Sprite
  #--------------------------------------------------------------------------
  # ● 初始化对像
  #     viewport : 显示端口
  #     picture  : 图片 (Game_Picture)
  #--------------------------------------------------------------------------
  def initialize(viewport, picture)
    super(viewport)
    @picture = picture
    update
  end
  #--------------------------------------------------------------------------
  # ● 释放
  #--------------------------------------------------------------------------
  def dispose
    if self.bitmap != nil
      self.bitmap.dispose
    end
    super
  end
  #--------------------------------------------------------------------------
  # ● 更新画面
  #--------------------------------------------------------------------------
  def update
    super
    # 文件名不为空的情况下
    if @picture != ""
      # 获取图片图形
      self.bitmap = RPG::Cache.picture(@picture)
    end
    # 文件名是空的情况下
    if @picture_name == ""
      # 将活动块设置为不可见
      self.visible = false
      return
    end
    # 将活动块设置为可见
    self.visible = true
    # 设置传送原点
    #self.ox = self.bitmap.width / 2
    #self.oy = self.bitmap.height / 2
  end
end
#==============================================================================
# ■ Sprite_Picture
#------------------------------------------------------------------------------
# 　显示图片用的活动块。Game_Picture 类的实例监视、
# 活动块状态的自动变化。
#==============================================================================

class Sprite_Picture < Sprite
  #--------------------------------------------------------------------------
  # ● 初始化对像
  #     viewport : 显示端口
  #     picture  : 图片 (Game_Picture)
  #--------------------------------------------------------------------------
  def initialize(viewport, picture)
    super(viewport)
    @picture = picture
    update
  end
  #--------------------------------------------------------------------------
  # ● 释放
  #--------------------------------------------------------------------------
  def dispose
    if self.bitmap != nil
      self.bitmap.dispose
    end
    super
  end
  #--------------------------------------------------------------------------
  # ● 更新画面
  #--------------------------------------------------------------------------
  def update
    super
    # 图片的文件名与当前的情况有差异的情况下
    if @picture_name != @picture.name
      # 将文件名记忆到实例变量
      @picture_name = @picture.name
      # 文件名不为空的情况下
      if @picture_name != ""
        # 获取图片图形
        self.bitmap = RPG::Cache.picture(@picture_name)
      end
    end
    # 文件名是空的情况下
    if @picture_name == ""
      # 将活动块设置为不可见
      self.visible = false
      return
    end
    # 将活动块设置为可见
    self.visible = true
    # 设置传送原点
    if @picture.origin == 0
      self.ox = 0
      self.oy = 0
    else
      self.ox = self.bitmap.width / 2
      self.oy = self.bitmap.height / 2
    end
    # 设置活动块的坐标
    self.x = @picture.x
    self.y = @picture.y
    self.z = @picture.number
    # 设置放大率、不透明度、合成方式
    self.zoom_x = @picture.zoom_x / 100.0
    self.zoom_y = @picture.zoom_y / 100.0
    self.opacity = @picture.opacity
    self.blend_type = @picture.blend_type
    # 设置旋转角度、色调
    self.angle = @picture.angle
    self.tone = @picture.tone
  end
end
#==============================================================================
# ■ Sprite_Timer
#------------------------------------------------------------------------------
# 　显示计时器用的活动块。监视 $game_system 、活动块状态
# 自动变化。
#==============================================================================

class Sprite_Timer < Sprite
  #--------------------------------------------------------------------------
  # ● 初始化对像
  #--------------------------------------------------------------------------
  def initialize
    super
    self.bitmap = Bitmap.new(88, 48)
    self.bitmap.font.name = "Arial"
    self.bitmap.font.size = 32
    self.x = 640 - self.bitmap.width
    self.y = 0
    self.z = 500
    update
  end
  #--------------------------------------------------------------------------
  # ● 释放
  #--------------------------------------------------------------------------
  def dispose
    if self.bitmap != nil
      self.bitmap.dispose
    end
    super
  end
  #--------------------------------------------------------------------------
  # ● 刷新画面
  #--------------------------------------------------------------------------
  def update
    super
    # 设置计时器执行中为可见
    self.visible = $game_system.timer_working
    self.visible=false
    # 如果有必要再次描绘计时器
    if $game_system.timer / Graphics.frame_rate != @total_sec
      # 清除窗口内容
      self.bitmap.clear
      # 计算总计秒数
      @total_sec = $game_system.timer / Graphics.frame_rate
      # 生成计时器显示用字符串
      min = @total_sec / 60
      sec = @total_sec % 60
      text = sprintf("%02d:%02d", min, sec)
      # 描绘计时器
      self.bitmap.font.color.set(255, 255, 255)
      self.bitmap.draw_text(self.bitmap.rect, text, 1)
    end
  end
end
#==============================================================================
# ■ Spriteset_Map
#------------------------------------------------------------------------------
# 　处理地图画面活动块和元件的类。本类在
# Scene_Map 类的内部使用。
#==============================================================================

class Spriteset_Map
  #--------------------------------------------------------------------------
  # ● 初始化对像
  #--------------------------------------------------------------------------
  def initialize
    # 生成显示端口
    @viewport1 = Viewport.new(0, 0, 640, 480)
    @viewport2 = Viewport.new(0, 0, 640, 480)
    @viewport3 = Viewport.new(0, 0, 640, 480)
    @viewport2.z = 200
    @viewport3.z = 5000
    # 生成元件地图
    @tilemap = Tilemap.new(@viewport1)
    @tilemap.tileset = RPG::Cache.tileset($game_map.tileset_name)
    for i in 0..6
      autotile_name = $game_map.autotile_names[i]
      @tilemap.autotiles[i] = RPG::Cache.autotile(autotile_name)
    end
    @tilemap.map_data = $game_map.data
    @tilemap.priorities = $game_map.priorities
    # 生成远景平面
    @panorama = Plane.new(@viewport1)
    @panorama.z = -1000
    # 生成雾平面
    @fog = Plane.new(@viewport1)
    @fog.z = 3000
    # 生成角色活动块
    @character_sprites = []
    for i in $game_map.events.keys.sort
      sprite = Sprite_Character.new(@viewport1, $game_map.events[i])
      @character_sprites.push(sprite)
    end
    @character_sprites.push(Sprite_Character.new(@viewport1, $game_player))
    # 生成天气
    @weather = RPG::Weather.new(@viewport1)
    # 生成图片
    @picture_sprites = []
    for i in 1..50
      @picture_sprites.push(Sprite_Picture.new(@viewport2,
        $game_screen.pictures[i]))
    end
    # 生成计时器块
    @timer_sprite = Sprite_Timer.new
    # 刷新画面
    update
  end
  #--------------------------------------------------------------------------
  # ● 释放
  #--------------------------------------------------------------------------
  def dispose
    # 释放元件地图
    @tilemap.tileset.dispose
    for i in 0..6
      @tilemap.autotiles[i].dispose
    end
    @tilemap.dispose
    # 释放远景平面
    @panorama.dispose
    # 释放雾平面
    @fog.dispose
    # 释放角色活动块
    for sprite in @character_sprites
      sprite.dispose
    end
    # 释放天候
    @weather.dispose
    # 释放图片
    for sprite in @picture_sprites
      sprite.dispose
    end
    # 释放计时器块
    @timer_sprite.dispose
    # 释放显示端口
    @viewport1.dispose
    @viewport2.dispose
    @viewport3.dispose
  end
  #--------------------------------------------------------------------------
  # ● 刷新画面
  #--------------------------------------------------------------------------
  def update
    # 远景与现在的情况有差异发生的情况下
    if @panorama_name != $game_map.panorama_name or
       @panorama_hue != $game_map.panorama_hue
      @panorama_name = $game_map.panorama_name
      @panorama_hue = $game_map.panorama_hue
      if @panorama.bitmap != nil
        @panorama.bitmap.dispose
        @panorama.bitmap = nil
      end
      if @panorama_name != ""
        @panorama.bitmap = RPG::Cache.panorama(@panorama_name, @panorama_hue)
      end
      Graphics.frame_reset
    end
    # 雾与现在的情况有差异的情况下
    if @fog_name != $game_map.fog_name or @fog_hue != $game_map.fog_hue
      @fog_name = $game_map.fog_name
      @fog_hue = $game_map.fog_hue
      if @fog.bitmap != nil
        @fog.bitmap.dispose
        @fog.bitmap = nil
      end
      if @fog_name != ""
        @fog.bitmap = RPG::Cache.fog(@fog_name, @fog_hue)
      end
      Graphics.frame_reset
    end
    # 刷新元件地图
    @tilemap.ox = $game_map.display_x / 4
    @tilemap.oy = $game_map.display_y / 4
    @tilemap.update
    # 刷新远景平面
    @panorama.ox = $game_map.display_x / 8
    @panorama.oy = $game_map.display_y / 8
    # 刷新雾平面
    @fog.zoom_x = $game_map.fog_zoom / 100.0
    @fog.zoom_y = $game_map.fog_zoom / 100.0
    @fog.opacity = $game_map.fog_opacity
    @fog.blend_type = $game_map.fog_blend_type
    @fog.ox = $game_map.display_x / 4 + $game_map.fog_ox
    @fog.oy = $game_map.display_y / 4 + $game_map.fog_oy
    @fog.tone = $game_map.fog_tone
    # 刷新角色活动块
    for sprite in @character_sprites
      sprite.update
    end
    # 刷新天候图形
    @weather.type = $game_screen.weather_type
    @weather.max = $game_screen.weather_max
    @weather.ox = $game_map.display_x / 4
    @weather.oy = $game_map.display_y / 4
    @weather.update
    # 刷新图片
    for sprite in @picture_sprites
      sprite.update
    end
    # 刷新计时器块
    @timer_sprite.update
    # 设置画面的色调与震动位置
    @viewport1.tone = $game_screen.tone
    @viewport1.ox = $game_screen.shake
    # 设置画面的闪烁色
    @viewport3.color = $game_screen.flash_color
    # 刷新显示端口
    @viewport1.update
    @viewport3.update
  end
end
#==============================================================================
# ■ Spriteset_Battle
#------------------------------------------------------------------------------
# 　处理战斗画面的活动块的类。本类在 Scene_Battle 类
# 的内部使用。
#==============================================================================

class Spriteset_Battle
  #--------------------------------------------------------------------------
  # ● 定义实例变量
  #--------------------------------------------------------------------------
  attr_reader   :viewport1                # 敌人方的显示端口
  attr_reader   :viewport2                # 角色方的显示端口
  #--------------------------------------------------------------------------
  # ● 初始化变量
  #--------------------------------------------------------------------------
  def initialize
    # 生成显示端口
    @viewport1 = Viewport.new(0, 0, 640, 320)
    @viewport2 = Viewport.new(0, 0, 640, 480)
    @viewport3 = Viewport.new(0, 0, 640, 480)
    @viewport4 = Viewport.new(0, 0, 640, 480)
    @viewport5 = Viewport.new(0, 0, 640, 480)
    @viewport2.z = 101
    @viewport3.z = 200
    @viewport4.z = 5000
    @viewport5.z = 201
    # 生成战斗背景活动块
    @battleback_sprite = Sprite.new(@viewport1)
    # 生成敌人活动块
    @enemy_sprites = []
    for enemy in $game_troop.enemies.reverse
      @enemy_sprites.push(Sprite_Battler.new(@viewport1, enemy))
    end
    # 生成敌人活动块
    @actor_sprites = []
    @actor_sprites.push(Sprite_Battler.new(@viewport2))
    @actor_sprites.push(Sprite_Battler.new(@viewport2))
    @actor_sprites.push(Sprite_Battler.new(@viewport2))
    @actor_sprites.push(Sprite_Battler.new(@viewport2))
    # 生成天候
    @weather = RPG::Weather.new(@viewport1)
    # 生成图片活动块
    @picture_sprites = []
    for i in 51..100
      @picture_sprites.push(Sprite_Picture.new(@viewport3,
        $game_screen.pictures[i]))
    end
    @status_sprites = []
    @status_sprites.push(Sprite_Status.new(@viewport5,"VS.png"))
    @status_sprites.push(Sprite_Status.new(@viewport5,"HP.png"))
    @status_sprites.push(Sprite_Status.new(@viewport5,"HP.png"))
    @status_sprites[0].x=295
    @status_sprites[0].y=120
    @status_sprites[1].x=96
    @status_sprites[1].y=204
    @status_sprites[2].x=416
    @status_sprites[2].y=204
    if $game_actors[1].maxsp>0
      @status_sprites.push(Sprite_Status.new(@viewport5,"FP.png"))
      i=@status_sprites.size-1
      @status_sprites[i].x=96
      @status_sprites[i].y=228
    end
    for enemy in $game_troop.enemies.reverse
      if enemy.maxsp>0
        @status_sprites.push(Sprite_Status.new(@viewport5,"FP.png"))
        i=@status_sprites.size-1
        @status_sprites[i].x=416
        @status_sprites[i].y=228
      end
    end
    # 生成计时器块
    @timer_sprite = Sprite_Timer.new
    # 刷新画面
    update
  end
  #--------------------------------------------------------------------------
  # ● 释放
  #--------------------------------------------------------------------------
  def dispose
    # 如果战斗背景位图存在的情况下就释放
    if @battleback_sprite.bitmap != nil
      @battleback_sprite.bitmap.dispose
    end
    # 释放战斗背景活动块
    @battleback_sprite.dispose
    # 释放敌人活动块、角色活动块
    for sprite in @enemy_sprites + @actor_sprites
      sprite.dispose
    end
    # 释放天候
    @weather.dispose
    # 释放图片活动块
    for sprite in @picture_sprites
      sprite.dispose
    end
    for sprite in @status_sprites
      sprite.dispose
    end
    # 释放计时器活动块
    @timer_sprite.dispose
    # 释放显示端口
    @viewport1.dispose
    @viewport2.dispose
    @viewport3.dispose
    @viewport4.dispose
    @viewport5.dispose
  end
  #--------------------------------------------------------------------------
  # ● 显示效果中判定
  #--------------------------------------------------------------------------
  def effect?
    # 如果是在显示效果中的话就返回 true
    for sprite in @enemy_sprites + @actor_sprites
      return true if sprite.effect?
    end
    return false
  end
  #--------------------------------------------------------------------------
  # ● 刷新画面
  #--------------------------------------------------------------------------
  def update
    # 刷新角色的活动块 (对应角色的替换)
    @actor_sprites[0].battler = $game_party.actors[0]
    @actor_sprites[1].battler = $game_party.actors[1]
    @actor_sprites[2].battler = $game_party.actors[2]
    @actor_sprites[3].battler = $game_party.actors[3]
    # 战斗背景的文件名与现在情况有差异的情况下
    if @battleback_name != $game_temp.battleback_name
      @battleback_name = $game_temp.battleback_name
      if @battleback_sprite.bitmap != nil
        @battleback_sprite.bitmap.dispose
      end
      @battleback_sprite.bitmap = RPG::Cache.battleback(@battleback_name)
      @battleback_sprite.src_rect.set(0, 0, 640, 320)
    end
    # 刷新战斗者的活动块
    for sprite in @enemy_sprites + @actor_sprites
      sprite.update
    end
    # 刷新天气图形
    @weather.type = $game_screen.weather_type
    @weather.max = $game_screen.weather_max
    @weather.update
    # 刷新图片活动块
    for sprite in @picture_sprites
      sprite.update
    end
    for sprite in @status_sprites
      sprite.update
    end
    # 刷新计时器活动块
    @timer_sprite.update
    # 设置画面的色调与震动位置
    @viewport1.tone = $game_screen.tone
    @viewport1.ox = $game_screen.shake
    # 设置画面的闪烁色
    @viewport4.color = $game_screen.flash_color
    # 刷新显示端口
    @viewport1.update
    @viewport2.update
    @viewport4.update
    @viewport5.update
  end
end
#==============================================================================
# ■ Window_Base
#------------------------------------------------------------------------------
# 　游戏中全部窗口的超级类。
#==============================================================================

class Window_Base < Window
  #--------------------------------------------------------------------------
  # ● 初始化对像
  #     x      : 窗口的 X 坐标
  #     y      : 窗口的 Y 坐标
  #     width  : 窗口的宽
  #     height : 窗口的宽
  #--------------------------------------------------------------------------
  def initialize(x, y, width, height)
    super()
    @windowskin_name = $game_system.windowskin_name
    self.windowskin = RPG::Cache.windowskin(@windowskin_name)
    self.x = x
    self.y = y
    self.width = width
    self.height = height
    self.z = 100
  end
  #--------------------------------------------------------------------------
  # ● 释放
  #--------------------------------------------------------------------------
  def dispose
    # 如果窗口的内容已经被设置就被释放
    if self.contents != nil
      self.contents.dispose
    end
    super
  end
  #--------------------------------------------------------------------------
  # ● 获取文字色
  #     n : 文字色编号 (0～7)
  #--------------------------------------------------------------------------
  def text_color(n)
    case n
    when 0
      return Color.new(255, 255, 255, 255)
    when 1
      return Color.new(128, 128, 255, 255)
    when 2
      return Color.new(255, 128, 128, 255)
    when 3
      return Color.new(128, 255, 128, 255)
    when 4
      return Color.new(128, 255, 255, 255)
    when 5
      return Color.new(255, 128, 255, 255)
    when 6
      return Color.new(255, 255, 128, 255)
    when 7
      return Color.new(192, 192, 192, 255)
    else
      normal_color
    end
  end
  #--------------------------------------------------------------------------
  # ● 获取普通文字色
  #--------------------------------------------------------------------------
  def normal_color
    return Color.new(0, 0, 0, 255)
  end
  #--------------------------------------------------------------------------
  # ● 获取无效文字色
  #--------------------------------------------------------------------------
  def disabled_color
    return Color.new(0, 0, 0, 128)
  end
  #--------------------------------------------------------------------------
  # ● 获取系统文字色
  #--------------------------------------------------------------------------
  def system_color
    return Color.new(0, 0, 0, 255)
  end
  #--------------------------------------------------------------------------
  # ● 获取危机文字色
  #--------------------------------------------------------------------------
  def crisis_color
    return Color.new(255, 255, 64, 255)
  end
  #--------------------------------------------------------------------------
  # ● 获取战斗不能文字色
  #--------------------------------------------------------------------------
  def knockout_color
    return Color.new(255, 64, 0)
  end
  #--------------------------------------------------------------------------
  # ● 刷新画面
  #--------------------------------------------------------------------------
  def update
    super
    # 如果窗口的外观被变更了、再设置
    if $game_system.windowskin_name != @windowskin_name
      @windowskin_name = $game_system.windowskin_name
      self.windowskin = RPG::Cache.windowskin(@windowskin_name)
    end
  end
  #--------------------------------------------------------------------------
  # ● 图形的描绘
  #     actor : 角色
  #     x     : 描画目标 X 坐标
  #     y     : 描画目标 Y 坐标
  #--------------------------------------------------------------------------
  def draw_actor_graphic(actor, x, y)
    bitmap = RPG::Cache.character(actor.character_name, actor.character_hue)
    cw = bitmap.width / 4
    ch = bitmap.height / 4
    src_rect = Rect.new(0, 0, cw, ch)
    self.contents.blt(x - cw / 2, y - ch, bitmap, src_rect)
  end
  #--------------------------------------------------------------------------
  # ● 名称的描绘
  #     actor : 角色
  #     x     : 描画目标 X 坐标
  #     y     : 描画目标 Y 坐标
  #--------------------------------------------------------------------------
  def draw_actor_name(actor, x, y, opt = false)
    if opt
      self.contents.font.color = system_color
      self.contents.draw_text(x, y, 120, 32, "姓名")
      self.contents.font.color = normal_color
      self.contents.draw_text(x + 64, y, 160, 32, actor.name, 2)
      return
    else
      self.contents.font.color = normal_color
      self.contents.draw_text(x, y, 120, 32, actor.name)
      return
    end
  end
  #--------------------------------------------------------------------------
  # ● 性别的描画
  #     actor : 角色
  #     x     : 描画目标 X 坐标
  #     y     : 描画目标 Y 坐标
  #--------------------------------------------------------------------------
  def draw_gender(x, y)
    self.contents.font.color = system_color
    self.contents.draw_text(x, y, 120, 32, "性别")
    self.contents.font.color = normal_color
    self.contents.draw_text(x + 64, y, 160, 32, $gender, 2)
  end
  #--------------------------------------------------------------------------
  # ● 自动换行文字描绘
  #--------------------------------------------------------------------------
  def draw_words(text,align=0)
    self.contents.clear
    self.contents.font.color = normal_color
    self.visible=true
    x = y = 0
    # 限制文字处理
    begin
      last_text = text.clone
      text.gsub!(/\\[Vv]\[([0-9]+)\]/) { $game_variables[$1.to_i] }
    end until text == last_text
    text.gsub!(/\\[Nn]\[([0-9]+)\]/) do
      $game_actors[$1.to_i] != nil ? $game_actors[$1.to_i].name : ""
    end
    # 为了方便、将 "\\\\" 变换为 "\000" 
    text.gsub!(/\\\\/) { "\000" }
    # "\\C" 变为 "\001" 、"\\G" 变为 "\002"
    text.gsub!(/\\[Cc]\[([0-9]+)\]/) { "\001[#{$1}]" }
    text.gsub!(/\\[Gg]/) { "\002" }
    # c 获取 1 个字 (如果不能取得文字就循环)
    while ((c = text.slice!(/./m)) != nil)
      # \\ 的情况下
      if c == "\000"
        # 还原为本来的文字
        c = "\\"
      end
      # \C[n] 的情况下
      if c == "\001"
        # 更改文字色
        text.sub!(/\[([0-9]+)\]/, "")
        color = $1.to_i
        if color >= 0 and color <= 7
          self.contents.font.color = text_color(color)
        end
        # 下面的文字
        next
      end
      # 另起一行文字的情况下
      if c == "\n"
        # y 加 1
        y += 1
        x = 0
        # 下面的文字
        next
      end
      if (x + 4 + self.contents.text_size(c).width) > self.contents.width
        y += 1
        x = 0
      end
      # 描绘文字
      self.contents.draw_text( x + 4, 32 * y, 40, 32, c)
      # x 为要描绘文字的加法运算
      x += self.contents.text_size(c).width
    end
  end
  #--------------------------------------------------------------------------
  # ● 描绘物品名
  #     item : 物品
  #     x    : 描画目标 X 坐标
  #     y    : 描画目标 Y 坐标
  #--------------------------------------------------------------------------
  def draw_item_name(item, x, y)
    if item == nil
      self.contents.font.color = normal_color
      self.contents.draw_text(x + 20, y, 212, 32, "无")
      return
    end
    bitmap = RPG::Cache.icon(item.icon_name)
    self.contents.blt(x, y + 4, bitmap, Rect.new(0, 0, 24, 24))
    self.contents.font.color = normal_color
    self.contents.draw_text(x + 20, y, 212, 32, item.name)
  end
end#==============================================================================
# ■ Window_Selectable
#------------------------------------------------------------------------------
# 　拥有光标的移动以及滚动功能的窗口类。
#==============================================================================

class Window_Selectable < Window_Base
  #--------------------------------------------------------------------------
  # ● 定义实例变量
  #--------------------------------------------------------------------------
  attr_reader   :index                    # 光标位置
  attr_reader   :help_window              # 帮助窗口
  attr_accessor :help_index               # 帮助窗口序号
  #--------------------------------------------------------------------------
  # ● 初始画对像
  #     x      : 窗口的 X 坐标
  #     y      : 窗口的 Y 坐标
  #     width  : 窗口的宽
  #     height : 窗口的高
  #--------------------------------------------------------------------------
  def initialize(x, y, width, height)
    super(x, y, width, height)
    @item_max = 1
    @column_max = 1
    @index = -1
    @help_index = 0
  end
  #--------------------------------------------------------------------------
  # ● 设置光标的位置
  #     index : 新的光标位置
  #--------------------------------------------------------------------------
  def index=(index)
    @index = index
    # 刷新帮助文本 (update_help 定义了继承目标)
    if self.active and @help_window != nil
      self.is_a?(Window_Item) ? update_help(@help_index) : update_help
    end
    # 刷新光标矩形
    update_cursor_rect
  end
  #--------------------------------------------------------------------------
  # ● 获取行数
  #--------------------------------------------------------------------------
  def row_max
    # 由项目数和列数计算出行数
    return (@item_max + @column_max - 1) / @column_max
  end
  #--------------------------------------------------------------------------
  # ● 获取开头行
  #--------------------------------------------------------------------------
  def top_row
    # 将窗口内容的传送源 Y 坐标、1 行的高 32 等分
    return self.oy / 32
  end
  #--------------------------------------------------------------------------
  # ● 设置开头行
  #     row : 显示开头的行
  #--------------------------------------------------------------------------
  def top_row=(row)
    # row 未满 0 的场合更正为 0
    if row < 0
      row = 0
    end
    # row 超过 row_max - 1 的情况下更正为 row_max - 1 
    if row > row_max - 1
      row = row_max - 1
    end
    # row 1 行高的 32 倍、窗口内容的传送源 Y 坐标
    self.oy = row * 32
  end
  #--------------------------------------------------------------------------
  # ● 获取 1 页可以显示的行数
  #--------------------------------------------------------------------------
  def page_row_max
    # 窗口的高度，设置画面的高度减去 32 ，除以 1 行的高度 32 
    return (self.height - 32) / 32
  end
  #--------------------------------------------------------------------------
  # ● 获取 1 页可以显示的项目数
  #--------------------------------------------------------------------------
  def page_item_max
    # 将行数 page_row_max 乘上列数 @column_max
    return page_row_max * @column_max
  end
  #--------------------------------------------------------------------------
  # ● 帮助窗口的设置
  #     help_window : 新的帮助窗口
  #--------------------------------------------------------------------------
  def help_window=(help_window)
    @help_window = help_window
    # 刷新帮助文本 (update_help 定义了继承目标)
    if self.active and @help_window != nil
      self.is_a?(Window_Item) ? update_help(@help_index) : update_help
    end
  end
  #--------------------------------------------------------------------------
  # ● 更新光标矩形
  #--------------------------------------------------------------------------
  def update_cursor_rect
    # 光标位置不满 0 的情况下
    if @index < 0
      self.cursor_rect.empty
      return
    end
    # 获取当前的行
    row = @index / @column_max
    # 当前行被显示开头行前面的情况下
    if row < self.top_row
      # 从当前行向开头行滚动
      self.top_row = row
    end
    # 当前行被显示末尾行之后的情况下
    if row > self.top_row + (self.page_row_max - 1)
      # 从当前行向末尾滚动
      self.top_row = row - (self.page_row_max - 1)
    end
    # 计算光标的宽度
    cursor_width = self.width / @column_max - 32
    # 计算光标坐标
    x = @index % @column_max * (cursor_width + 32)
    y = @index / @column_max * 32 - self.oy
    # 更新光标矩形
    self.cursor_rect.set(x, y, cursor_width, 32)
  end
  #--------------------------------------------------------------------------
  # ● 刷新画面
  #--------------------------------------------------------------------------
  def update
    super
    # 可以移动光标的情况下
    if self.active and @item_max > 0 and @index >= 0
      # 方向键下被按下的情况下
      if Input.repeat?(Input::DOWN)
        # 列数不是 1 并且不与方向键下的按下状态重复的情况、
        # 或光标位置在(项目数-列数)之前的情况下
        if (@column_max == 1 and Input.trigger?(Input::DOWN)) or
           @index < @item_max - @column_max
          # 光标向下移动
          $game_system.se_play($data_system.cursor_se)
          @index = (@index + @column_max) % @item_max
        end
        # 帮助归0
        @help_index=0 if self.is_a?(Window_Item)
      end
      # 方向键上被按下的情况下
      if Input.repeat?(Input::UP)
        # 列数不是 1 并且不与方向键下的按下状态重复的情况、
        # 或光标位置在列之后的情况下
        if (@column_max == 1 and Input.trigger?(Input::UP)) or
           @index >= @column_max
          # 光标向上移动
          $game_system.se_play($data_system.cursor_se)
          @index = (@index - @column_max + @item_max) % @item_max
        end
        # 帮助归0
        @help_index=0 if self.is_a?(Window_Item)
      end
      # 方向键右被按下的情况下
      if Input.repeat?(Input::RIGHT)
        # 列数为 2 以上并且、光标位置在(项目数 - 1)之前的情况下
        if @column_max >= 2 #and @index < @item_max - 1
          # 光标向右移动
          $game_system.se_play($data_system.cursor_se)
          @index += 1
          @index=0 if @index==@item_max
        end
        if self.is_a?(Window_Item)
          $game_system.se_play($data_system.cursor_se)
          @help_index+=1
          @help_index= @help_index==2 ? 0 : 1
        end
      end
      # 方向键左被按下的情况下
      if Input.repeat?(Input::LEFT)
        # 列数为 2 以上并且、光标位置在 0 之后的情况下
        if @column_max >= 2 #and @index > 0
          # 光标向左移动
          $game_system.se_play($data_system.cursor_se)
          @index -= 1
          @index=@item_max-1 if @index==-1
        end
        if self.is_a?(Window_Item)
          $game_system.se_play($data_system.cursor_se)
          @help_index-=1
          @help_index= @help_index==-1 ? 1 : 0
        end
      end
      # R 键被按下的情况下
      if Input.repeat?(Input::R)
        # 显示的最后行在数据中最后行上方的情况下
        if self.top_row + (self.page_row_max - 1) < (self.row_max - 1)
          # 光标向后移动一页
          $game_system.se_play($data_system.cursor_se)
          @index = [@index + self.page_item_max, @item_max - 1].min
          self.top_row += self.page_row_max
        end
      end
      # L 键被按下的情况下
      if Input.repeat?(Input::L)
        # 显示的开头行在位置 0 之后的情况下
        if self.top_row > 0
          # 光标向前移动一页
          $game_system.se_play($data_system.cursor_se)
          @index = [@index - self.page_item_max, 0].max
          self.top_row -= self.page_row_max
        end
      end
    end
    # 刷新帮助文本 (update_help 定义了继承目标)
    if self.active and @help_window != nil
      self.is_a?(Window_Item)? update_help(@help_index) : update_help
    end
    # 刷新光标矩形
    update_cursor_rect
  end
end
#==============================================================================
# 本脚本来自www.66RPG.com，使用和转载请保留此信息
#============================================================================== 
#==============================================================================
# ■ Window_Command
#
#     与Window_Command功能一致,不同点就是可以自己给定行、列的值，使菜单像轩辕剑
# 系列的排列……
#
# 举例：                            行  列               -命令列表-
#      Window_Command.new(160, ["攻击","法术","物品","绝技","防御","逃跑"],2)
#==============================================================================
#==============================================================================
# ■ Window_Command
#------------------------------------------------------------------------------
# 　一般的命令选择行窗口。
#==============================================================================

class Window_Command < Window_Selectable
 #--------------------------------------------------------------------------
 # ● 初始化对像
 #     width    : 每格的的宽
 #     row      : 行数   自己根据命令数算好行列的值
 #     column   : 列数
 #     commands : 命令字符串序列
 #--------------------------------------------------------------------------
 def initialize(width, commands, column=1)
   row = commands.size / column
   # 由命令的个数计算出窗口的宽和高
   super(0, 0, width,row * 32 + 32)
   @item_max = commands.size
   @commands = commands
   @row = row
   @width_txt = (width-32)/column
   @column_max = column
   self.contents = Bitmap.new(width-32, row * 32)
   refresh
   self.index = 0
 end
 #--------------------------------------------------------------------------
 # ● 刷新
 #--------------------------------------------------------------------------
 def refresh
   self.contents.clear
   self.contents.font.size = 24
   for i in 0...@item_max
     draw_item(i, normal_color)
   end
 end
 #--------------------------------------------------------------------------
 # ● 描绘项目
 #     index : 项目编号
 #     color : 文字色
 #--------------------------------------------------------------------------
 def draw_item(index, color)
   self.contents.font.color = color
   # 计算得出当前index所对应的内容所在的行
   row_index = index / @column_max
   # 根据余数得出所在的列
   for y in 0...@column_max
     if index % @column_max == y
       rect = Rect.new(y * @width_txt, 32 * row_index , @width_txt, 32)
       self.contents.fill_rect(rect, Color.new(0, 0, 0, 0))
       self.contents.draw_text(rect, @commands[index],1)
       break
     end
   end
 end
 #--------------------------------------------------------------------------
 # ● 项目无效化
 #     index : 项目编号
 #--------------------------------------------------------------------------
 def disable_item(index)
   draw_item(index, disabled_color)
 end
 #--------------------------------------------------------------------------
 # ● 项目有效化
 #     index : 项目编号
 #--------------------------------------------------------------------------
 def able_item(index)
   draw_item(index, normal_color)
 end
  #--------------------------------------------------------------------------
  # ● 更新光标矩形
  #--------------------------------------------------------------------------
  def update_cursor_rect
    # 光标位置不满 0 的情况下
    if @index < 0
      self.cursor_rect.empty
      return
    end
    # 获取当前的行
    row = @index / @column_max
    # 当前行被显示开头行前面的情况下
    if row < self.top_row
      # 从当前行向开头行滚动
      self.top_row = row
    end
    # 当前行被显示末尾行之后的情况下
    if row > self.top_row + (self.page_row_max - 1)
      # 从当前行向末尾滚动
      self.top_row = row - (self.page_row_max - 1)
    end
    # 计算光标的宽
    cursor_width = @width_txt
    # 计算光标坐标
    x = @index % @column_max * cursor_width
    y = @index / @column_max * 32 - self.oy
    # 更新光标矩形
    self.cursor_rect.set(x, y, @width_txt, 32)
  end
end
#==============================================================================
# 本脚本来自www.66RPG.com，使用和转载请保留此信息
#==============================================================================#==============================================================================
# ■ Window_Help
#------------------------------------------------------------------------------
# 　特技及物品的说明、角色的状态显示的窗口。
#==============================================================================

class Window_Help < Window_Base
  #--------------------------------------------------------------------------
  # ● 初始化对像
  #--------------------------------------------------------------------------
  def initialize
    super(0, 0, 640, 64)
    self.contents = Bitmap.new(width - 32, height - 32)
  end
  #--------------------------------------------------------------------------
  # ● 设置文本
  #     text  : 窗口显示的字符串
  #     align : 对齐方式 (0..左对齐、1..中间对齐、2..右对齐)
  #--------------------------------------------------------------------------
  def set_text(text, align = 0)
    # 如果文本和对齐方式的至少一方与上次的不同
    if text != @text or align != @align
      # 再描绘文本
      self.contents.clear
      self.contents.font.color = normal_color
      self.contents.draw_text(4, 0, self.width - 40, 32, text, align)
      @text = text
      @align = align
      @actor = nil
    end
    self.visible = true
  end
  #--------------------------------------------------------------------------
  # ● 设置角色
  #     actor : 要显示状态的角色
  #--------------------------------------------------------------------------
  def set_actor(actor)
    if actor != @actor
      self.contents.clear
      draw_actor_name(actor, 4, 0)
      draw_actor_state(actor, 140, 0)
      draw_actor_hp(actor, 284, 0)
      draw_actor_sp(actor, 460, 0)
      @actor = actor
      @text = nil
      self.visible = true
    end
  end
  #--------------------------------------------------------------------------
  # ● 设置敌人
  #     enemy : 要显示名字和状态的敌人
  #--------------------------------------------------------------------------
  def set_enemy(enemy)
    text = enemy.name
    state_text = make_battler_state_text(enemy, 112, false)
    if state_text != ""
      text += "  " + state_text
    end
    set_text(text, 1)
  end
end#==============================================================================
# ■ Window_Gold
#------------------------------------------------------------------------------
# 　显示金钱的窗口。
#==============================================================================

class Window_Gold < Window_Base
  #--------------------------------------------------------------------------
  # ● 初始化窗口
  #--------------------------------------------------------------------------
  def initialize
    super(0, 0, 208, 64)
    self.contents = Bitmap.new(width - 32, height - 32)
    refresh
  end
  #--------------------------------------------------------------------------
  # ● 刷新
  #--------------------------------------------------------------------------
  def refresh
    self.contents.clear
    self.contents.font.color = normal_color
    self.contents.draw_text(0, 0, 72, 32, "金钱:")
    self.contents.font.color = system_color
    self.contents.draw_text(72, 0, 102, 32, $game_party.gold.to_s, 2)
  end
end
#==============================================================================
# ■ Window_BattleItem
#------------------------------------------------------------------------------
# 　战斗中使用物品的窗口。
#==============================================================================

class Window_BattleItem < Window_Selectable
  #--------------------------------------------------------------------------
  # ● 初始化对像
  #--------------------------------------------------------------------------
  def initialize
    super(0, 0, 288, 128)
    @category_window=Window_Command.new(96,["药物"],1)
    @category_window.x=128
    @category_window.y=176
    @category_window.height=128
    @category_window.z=500
    @category_window.active=false
    self.x=224
    self.y=176
    self.z=500
    refresh
  end
  #--------------------------------------------------------------------------
  # ● 获取物品
  #--------------------------------------------------------------------------
  def item
    return @data[self.index]
  end
  #--------------------------------------------------------------------------
  # ● 刷新
  #--------------------------------------------------------------------------
  def refresh
    if self.contents != nil
      self.contents.dispose
      self.contents = nil
    end
    @data = []
    # 添加药物
    for i in 1...$data_items.size
      if $game_party.item_number(i) > 0 and $data_items[i].type==1
        @data.push($data_items[i])
      end
    end
    # 如果项目数不是 0 就生成位图、重新描绘全部项目
    @item_max = @data.size
    if @item_max > 0
      self.contents = Bitmap.new(width - 32, height - 32)
      for i in 0...@item_max
        draw_item(i)
      end
      self.index=0
    else
      self.active=false
    end
  end
  #--------------------------------------------------------------------------
  # ● 描绘项目
  #     index : 项目编号
  #--------------------------------------------------------------------------
  def draw_item(index)
    item = @data[index]
    number = $game_party.item_number(item.id)
    self.contents.font.color = normal_color
    x = 4
    y = index * 32
    rect = Rect.new(x, y, 256, 32)
    self.contents.fill_rect(rect, Color.new(0, 0, 0, 0))
    bitmap = RPG::Cache.icon(item.icon_name)
    opacity = self.contents.font.color == normal_color ? 255 : 128
    self.contents.blt(x, y + 4, bitmap, Rect.new(0, 0, 24, 24), opacity)
    self.contents.draw_text(x + 28, y, 128, 32, item.name, 0)
    self.contents.draw_text(x + 140, y, 16, 32, "×", 1)
    self.contents.draw_text(x + 200, y, 24, 32, number.to_s, 2)
  end
  #--------------------------------------------------------------------------
  # ● 释放窗口
  #--------------------------------------------------------------------------
  def dispose
    super
    @category_window.dispose
  end
end
#==============================================================================
# ■ Window_BattleSkill
#------------------------------------------------------------------------------
# 　战斗中使用绝招的窗口。
#==============================================================================

class Window_BattleSkill < Window_Selectable
  #--------------------------------------------------------------------------
  # ● 初始化对像
  #--------------------------------------------------------------------------
  def initialize
    super(0, 300, 640, 180)
    self.contents = Bitmap.new(width - 32, height - 32)
    @actor=$game_actors[1]
    study_skill
    refresh
  end
  #--------------------------------------------------------------------------
  # ● 获取绝招
  #--------------------------------------------------------------------------
  def skill
    return @data[self.index]
  end
  #--------------------------------------------------------------------------
  # ● 刷新
  #--------------------------------------------------------------------------
  def refresh
    if self.contents != nil
      self.contents.dispose
      self.contents = nil
    end
    @data = []
    for i in 0...@actor.skills.size
      skill = $data_skills[@actor.skills[i]]
      if skill != nil
        @data.push(skill)
      end
    end
    # 如果项目数不是 0 就生成位图、重新描绘全部项目
    @item_max = @data.size
    if @item_max > 0
      self.contents = Bitmap.new(width - 32, row_max * 32)
      for i in 0...@item_max
        draw_item(i)
      end
      self.index=0
    end
  end
  #--------------------------------------------------------------------------
  # ● 描绘项目
  #     index : 项目编号
  #--------------------------------------------------------------------------
  def draw_item(index)
    skill = @data[index]
    self.contents.font.color = normal_color
    x = 4
    y = index * 32
    rect = Rect.new(x, y, self.width - 32, 32)
    self.contents.fill_rect(rect, Color.new(0, 0, 0, 0))
    bitmap = RPG::Cache.icon(skill.icon_name)
    opacity = self.contents.font.color == normal_color ? 255 : 128
    self.contents.blt(x, y + 4, bitmap, Rect.new(0, 0, 24, 24), opacity)
    self.contents.draw_text(x + 28, y, 204, 32, skill.name, 0)
    self.contents.draw_text(x + 232, y, 48, 32, skill.sp_cost.to_s, 2)
  end
end
#==============================================================================
# ■ Window_Item
#------------------------------------------------------------------------------
# 　物品画面、战斗画面、显示浏览物品的窗口。
#==============================================================================

class Window_Item < Window_Selectable
  attr_accessor :category
  #--------------------------------------------------------------------------
  # ● 初始化对像
  #--------------------------------------------------------------------------
  def initialize
    super(96, 64, 544, 352)
    @column_max = 1
    @category=0
    refresh
  end  
  #--------------------------------------------------------------------------
  # ● 获取物品
  #--------------------------------------------------------------------------
  def item
    return @data[self.index]
  end
  #--------------------------------------------------------------------------
  # ● 刷新
  #--------------------------------------------------------------------------
  def refresh
    if self.contents != nil
      self.contents.dispose
      self.contents = nil
    end
    @data = []
    @category=self.category
    case @category
    when 0
      # 添加食物
      for i in 1...$data_items.size
        if $game_party.item_number(i) > 0 and $data_items[i].type==0
          @data.push($data_items[i])
        end
      end
    when 1
      # 添加药物
      for i in 1...$data_items.size
        if $game_party.item_number(i) > 0 and $data_items[i].type==1
          @data.push($data_items[i])
        end
      end
    when 2
      # 添加武器
      for i in 1...$data_weapons.size
        if $game_party.weapon_number(i) > 0
          @data.push($data_weapons[i])
        end
      end
    when 3
      # 添加防具
      for i in 1...$data_armors.size
        if $game_party.armor_number(i) > 0
          @data.push($data_armors[i])
        end
      end
    when 4
      # 添加其他
      for i in 1...$data_items.size
        if $game_party.item_number(i) > 0 and $data_items[i].type==2
          @data.push($data_items[i])
        end
      end
    when 5
      # 添加可丢弃物品
      for i in 1...$data_items.size
        if $game_party.item_number(i) > 0 and $data_items[i].id !=19
          @data.push($data_items[i])
        end
      end
      for i in 1...$data_weapons.size
        if $game_party.weapon_number(i) > 0
          if $game_actors[1].weapon_id !=i
            @data.push($data_weapons[i])
          else
            @data.push($data_weapons[i]) if $game_party.weapon_number(i) > 1
          end 
        end
      end
      for i in 1...$data_armors.size
        if $game_party.armor_number(i) > 0
          if $game_actors[1].armor_equiped?(i)
            @data.push($data_armors[i]) if $game_party.armor_number(i) > 1
          else
            @data.push($data_armors[i])
          end
        end
      end
    end
    # 如果项目数不是 0 就生成位图、重新描绘全部项目
    @item_max = @data.size
    if @item_max > 0
      self.contents = Bitmap.new(width - 32, row_max * 32)
      for i in 0...@item_max
        draw_item(i)
      end
    end
  end
  #--------------------------------------------------------------------------
  # ● 描绘项目
  #     index : 项目编号
  #--------------------------------------------------------------------------
  def draw_item(index)
    item = @data[index]
    case item
    when RPG::Item
      number = $game_party.item_number(item.id)
    when RPG::Weapon
      number = $game_party.weapon_number(item.id)
    when RPG::Armor
      number = $game_party.armor_number(item.id)
    end
    self.contents.font.color = normal_color
    x = 4
    y = index * 32
    rect = Rect.new(x, y, self.width / @column_max - 32, 32)
    self.contents.fill_rect(rect, Color.new(0, 0, 0, 0))
    bitmap = RPG::Cache.icon("051-Item_unequip.png")
    if item.is_a?(RPG::Weapon) and $game_actors[1].weapon_id==item.id
      bitmap = RPG::Cache.icon("052-Item_equip.png")
    end
    if item.is_a?(RPG::Armor) and $game_actors[1].armor_equiped?(item.id)
      bitmap = RPG::Cache.icon("052-Item_equip.png")
    end
    opacity = self.contents.font.color == normal_color ? 255 : 128
    self.contents.blt(x, y + 4, bitmap, Rect.new(0, 0, 24, 24), opacity)
    self.contents.draw_text(x + 28, y, 212, 32, item.name, 0)
    self.contents.draw_text(x + 240, y, 16, 32, "×", 1)
    self.contents.draw_text(x + 256, y, 24, 32, number.to_s, 2)
  end
  #--------------------------------------------------------------------------
  # ● 刷新帮助文本
  #--------------------------------------------------------------------------
  def update_help(help_id=0)
    help_text=[]
    text=self.item == nil ? "" : self.item.description
    if text.size<=75
      @help_window.set_text(text)
    else
      help_text[0]=text.slice(0,75)+" →"
      help_text[1]="← "+text.slice(75,text.size-75)
      @help_window.set_text(help_text[help_id])
    end
  end
end#==============================================================================
# ■ Window_Skill
#------------------------------------------------------------------------------
# 　特技画面、战斗画面、显示可以使用的特技浏览的窗口。
#==============================================================================

class Window_Skill < Window_Selectable
  attr_accessor :category
  #--------------------------------------------------------------------------
  # ● 初始化对像
  #--------------------------------------------------------------------------
  def initialize
    super(96, 64, 544, 352)
    @column_max = 1
    @category=0
    refresh
  end  
  #--------------------------------------------------------------------------
  # ● 获取技能
  #--------------------------------------------------------------------------
  def item
    return @data[self.index]
  end
  #--------------------------------------------------------------------------
  # ● 刷新
  #--------------------------------------------------------------------------
  def refresh
    if self.contents != nil
      self.contents.dispose
      self.contents = nil
    end
    @data = []
    @category=self.category
    case @category
    when 0
      # 添加拳脚
      if $game_variables[40]>0
        @data.push 40
      end
      for i in 53..60
        @data.push i if $game_variables[i]>0
      end
    when 1
      # 添加兵刃
      for i in 41..44
        @data.push i if $game_variables[i]>0
      end
      @data.push 39 if $game_variables[39]>0
      for i in 85..89
        @data.push i if $game_variables[i]>0
      end
      for i in 80..83
        @data.push i if $game_variables[i]>0
      end
    when 2 
      # 添加轻功
      @data.push 46 if $game_variables[46]>0
      for i in 64..69
        @data.push i if $game_variables[i]>0
      end
    when 3 
      # 添加内功
      @data.push 45 if $game_variables[45]>0
      for i in 72..77
        @data.push i if $game_variables[i]>0
      end
    when 4 
      # 添加招架
      @data.push 47 if $game_variables[47]>0
      for i in 29..30
        a=$game_variables[i]
        @data.push a if $game_variables[a]>0
      end
    when 5
      # 添加知识
      for i in 48..52
        @data.push i if $game_variables[i]>0
      end
    end
    # 如果项目数不是 0 就生成位图、重新描绘全部项目
    @item_max = @data.size
    if @item_max > 0
      self.contents = Bitmap.new(width - 32, row_max * 32)
      for i in 0...@item_max
        draw_item(i)
      end
    end
  end
  #--------------------------------------------------------------------------
  # ● 描绘项目
  #     index : 项目编号
  #--------------------------------------------------------------------------
  def draw_item(index)
    item = @data[index]
    self.contents.font.color = normal_color
    x = 4
    y = index * 32
    rect = Rect.new(x, y, self.width / @column_max - 32, 32)
    self.contents.fill_rect(rect, Color.new(0, 0, 0, 0))
    if item==$game_variables[29+@category]
      bitmap = RPG::Cache.icon("052-Item_equip.png")
    else
      bitmap = RPG::Cache.icon("051-Item_unequip.png")
    end
    opacity = self.contents.font.color == normal_color ? 255 : 128
    self.contents.blt(x, y + 4, bitmap, Rect.new(0, 0, 24, 24), opacity)
    self.contents.draw_text(x + 28, y, 212, 32, $data_system.variables[item], 0)
  end
  #--------------------------------------------------------------------------
  # ● 刷新帮助文本
  #--------------------------------------------------------------------------
  def update_help
    if @data[self.index]!=nil
      @help_window.set_text($data_system.variables[@data[self.index]]+"  "+
      $game_variables[@data[self.index]].to_s+"/"+
      $game_variables[@data[self.index]+60].to_s+"  "+
      $levels[$game_variables[@data[self.index]]/5])
    else
      @help_window.set_text("")
    end
  end
end
#==============================================================================
# ■ Window_Status
#------------------------------------------------------------------------------
# 　显示状态画面、完全规格的状态窗口。
#==============================================================================

class Window_Status < Window_Base
  #--------------------------------------------------------------------------
  # ● 初始化对像
  #     actor : 角色
  #--------------------------------------------------------------------------
  def initialize(actor)
    super(122, 160, 396, 280)
    self.contents = Bitmap.new(width - 32, height - 32)
    @actor = actor
    @lv=get_actor_level
    self.contents.font.size = 24
    self.contents.font.color = system_color
  end
  #--------------------------------------------------------------------------
  # ● 状态
  #--------------------------------------------------------------------------
  def look0
    self.contents.clear
    self.contents.draw_text(32,32,80,32,"食物：")
    self.contents.draw_text(32,64,80,32,"饮水：")
    self.contents.draw_text(32,96,80,32,"生命：")
    self.contents.draw_text(32,128,80,32,"内力：")
    self.contents.draw_text(32,160,80,32,"经验：")
    self.contents.draw_text(32,192,80,32,"潜能：")
    full_hp=100+$game_variables[24]/4
    full_hp+=[($game_variables[157]-14)*20,300].min
    p=[100*@actor.maxhp/full_hp,100].min
    self.contents.draw_text(104,32,200,32,$game_variables[15].to_s+"/"+$game_variables[16].to_s)
    self.contents.draw_text(104,64,200,32,$game_variables[17].to_s+"/"+$game_variables[18].to_s)
    self.contents.draw_text(104,96,200,32,@actor.hp.to_s+"/"+@actor.maxhp.to_s+"("+p.to_s+"%)")
    self.contents.draw_text(104,128,200,32,@actor.sp.to_s+"/"+$game_variables[24].to_s+"(+"+$game_variables[23].to_s+")")
    self.contents.draw_text(104,160,200,32,$game_variables[19].to_s)
    self.contents.draw_text(104,192,200,32,$game_variables[20].to_s)
  end
  #--------------------------------------------------------------------------
  # ● 描述
  #--------------------------------------------------------------------------
  def look1
    self.contents.clear
    self.contents.draw_text(32, 32, 240, 32, "["+$school[$game_variables[21]]+"]"+@actor.name)
    while $game_variables[158]>=3000
      $game_variables[158]-=3000
      $game_variables[157]+=1
      $game_variables[157]=255 if $game_variables[157]>=255
      if $game_variables[157]%4==0
        $game_variables[34]=1
        $game_switches[97]=true
      else
        $game_variables[34]=0
        $game_switches[97]=false
      end
    end    
    age=$game_variables[157]
    self.contents.draw_text(32, 64, 300, 32, "你是一位"+age.to_s+"岁的"+$gender+"性")
    if $game_variables[157]<16
      face="一脸稚气"
    else
      face_lv=$game_variables[22]+($game_variables[49]/10)
      if face_lv>31
        face_lv=31
      end
      if face_lv<10
        face_lv=10
      end
      case $gender
      when "男"
        face=$boy[7-(face_lv-10)/3]
      when "女"
        face=$girl[7-(face_lv-10)/3]
      when "？"
        face=$girl[7-(face_lv-10)/3]
      end
    end
    self.contents.draw_text(32, 96, 300, 32, "你"+face)
    lv=$levels[@lv/5]
    n = $game_variables[11]+$game_variables[23]/2+$game_variables[40]/10+$game_variables[91]
    weapon = $data_weapons[$game_party.actors[0].weapon_id]
    if weapon != nil
      n+=weapon.atk
    end
    attack=$attacks[[n,100].min/20]
    self.contents.draw_text(32,128,340,32,"武艺看起来"+lv)
    self.contents.draw_text(32,160,340,32,"出手似乎"+attack)
  end
  #--------------------------------------------------------------------------
  # ● 属性
  #--------------------------------------------------------------------------
  def look2
    self.contents.clear
    self.contents.draw_text(32, 32,120,32,"金钱：")
    self.contents.draw_text(32, 64, 120, 32, "膂力：")
    self.contents.draw_text(32, 96, 120, 32, "敏捷：")
    self.contents.draw_text(32, 128, 120, 32, "悟性：")
    self.contents.draw_text(32, 160, 120, 32, "根骨：")
    a=$game_variables[40]/10+$game_variables[11]+$game_variables[91]
    b=$game_variables[46]/10+$game_variables[12]+$game_variables[92]
    a=[255,a].min
    b=[255,b].min
    c=$game_variables[48]/10+$game_variables[13]
    d=$game_variables[45]/10+$game_variables[14]
    self.contents.draw_text(104, 32,288,32,$game_party.gold.to_s)
    self.contents.draw_text(104, 64, 192, 32, "["+a.to_s+"/"+$game_variables[11].to_s+"]")
    self.contents.draw_text(104, 96, 192, 32, "["+b.to_s+"/"+$game_variables[12].to_s+"]")
    self.contents.draw_text(104, 128, 192, 32, "["+c.to_s+"/"+$game_variables[13].to_s+"]")
    self.contents.draw_text(104, 160, 192, 32, "["+d.to_s+"/"+$game_variables[14].to_s+"]") 
    self.contents.draw_text(216, 64, 192, 32, "命中：")
    self.contents.draw_text(216, 96, 192, 32, "闪避：")
    self.contents.draw_text(216, 128, 192, 32, "攻击：")
    self.contents.draw_text(216, 160, 192, 32, "防御：")
    new_status
    e=@actor.weapon_id
    self.contents.draw_text(288, 64, 192, 32, "["+@b.to_s+"]")
    self.contents.draw_text(288, 96, 192, 32, "["+@c.to_s+"]")
    self.contents.draw_text(288, 128, 192, 32, "["+@d.to_s+"]")
    self.contents.draw_text(288, 160, 192, 32, "["+@a.to_s+"]")
  end
  #获取命中闪避
  def new_status
    @a=0
    @b=0
    @c=0
    @d=0
    weapon = $data_weapons[@actor.weapon_id]
    armor1 = $data_armors[@actor.armor1_id]
    armor2 = $data_armors[@actor.armor2_id]
    armor3 = $data_armors[@actor.armor3_id]
    armor4 = $data_armors[@actor.armor4_id]
    armor5 = $data_armors[@actor.armor5_id]
    armor6 = $data_armors[@actor.armor6_id]
    armor7 = $data_armors[@actor.armor7_id]
    @a += armor1 != nil ? armor1.pdef : 0
    @a += armor2 != nil ? armor2.pdef : 0
    @a += armor3 != nil ? armor3.pdef : 0
    @a += armor4 != nil ? armor4.pdef : 0
    @a += armor5 != nil ? armor5.pdef : 0
    @a += armor6 != nil ? armor6.pdef : 0
    @a += armor7 != nil ? armor7.pdef : 0
    @a += $game_variables[96]
    @a=0 if @a<0
    @a=[255,@a].min
    @b += weapon != nil ? weapon.str_plus : 0
    @b += armor1 != nil ? armor1.str_plus : 0
    @b += armor2 != nil ? armor2.str_plus : 0
    @b += armor3 != nil ? armor3.str_plus : 0
    @b += armor4 != nil ? armor4.str_plus : 0
    @b += armor5 != nil ? armor5.str_plus : 0
    @b += armor6 != nil ? armor6.str_plus : 0
    @b += armor7 != nil ? armor7.str_plus : 0
    @b += $game_variables[94]
    @b=0 if @b<0
    @b=[255,@b].min
    @c += weapon != nil ? weapon.dex_plus : 0
    @c += armor1 != nil ? armor1.dex_plus : 0
    @c += armor2 != nil ? armor2.dex_plus : 0
    @c += armor3 != nil ? armor3.dex_plus : 0
    @c += armor4 != nil ? armor4.dex_plus : 0
    @c += armor5 != nil ? armor5.dex_plus : 0
    @c += armor6 != nil ? armor6.dex_plus : 0
    @c += armor7 != nil ? armor7.dex_plus : 0
    @c += $game_variables[95]
    @c=0 if @c<0
    @c=[255,@c].min
    @d += weapon != nil ? weapon.atk : 0
  end
end#==============================================================================
# 本脚本来自www.66RPG.com，使用和转载请保留此信息
#==============================================================================
class Window_ShopCommand < Window_Selectable
  # ----------------------------------------
  def initialize
    super(0, 0, 640, 64)
    self.contents = Bitmap.new(width - 32, height - 32)
    @item_max = 3
    @column_max = 3
    @commands = ["购买", "卖出", "离开"]
    self.contents.font.color.set(0,0,0)
    self.contents.font.size = 24
    refresh
    self.index = 0
  end
  # ----------------------------------------
  def refresh
    self.contents.clear
    if $game_temp.shop_type == 0
      for i in 0...@item_max
      draw_item(i)
      end
    end
    if $game_temp.shop_type == 1
      self.contents.draw_text(4, 0, 602, 32, "要买什么你自己看看吧！")
      self.index = -1
      update_cursor_rect
    end
    if $game_temp.shop_type == 2
      self.contents.draw_text(4, 0, 602, 32, "有什么不用的东西就拿来吧！")
      self.index = -1
      update_cursor_rect
    end
  end
  def draw_item(index)
    x = 4 + index * 160
    self.contents.draw_text(x, 0, 128, 32, @commands[index])
  end
  def update_cursor_rect
    if $game_temp.shop_type == 0
      super
    end
    if $game_temp.shop_type == 1 || $game_temp.shop_type == 2
      self.cursor_rect.empty
    end
  end
end
#==============================================================================
# 本脚本来自www.66RPG.com，使用和转载请保留此信息
#==============================================================================#==============================================================================
# ■ Window_ShopBuy
#------------------------------------------------------------------------------
# 　商店画面、浏览显示可以购买的商品的窗口。
#==============================================================================

class Window_ShopBuy < Window_Selectable
  #--------------------------------------------------------------------------
  # ● 初始化对像
  #     shop_goods : 商品
  #--------------------------------------------------------------------------
  def initialize(shop_goods)
    super(0, 64, 416, shop_goods.size*32+32)
    @shop_goods = shop_goods
    refresh
    self.index = 0
  end
  #--------------------------------------------------------------------------
  # ● 获取物品
  #--------------------------------------------------------------------------
  def item
    return @data[self.index]
  end
  #--------------------------------------------------------------------------
  # ● 刷新
  #--------------------------------------------------------------------------
  def refresh
    if self.contents != nil
      self.contents.dispose
      self.contents = nil
    end
    @data = []
    for goods_item in @shop_goods
      case goods_item[0]
      when 0
        item = $data_items[goods_item[1]]
      when 1
        item = $data_weapons[goods_item[1]]
      when 2
        item = $data_armors[goods_item[1]]
      end
      if item != nil
        @data.push(item)
      end
    end
    # 如果项目数不是 0 就生成位图、描绘全部项目
    @item_max = @data.size
    if @item_max > 0
      self.contents = Bitmap.new(width - 32, row_max * 32)
      for i in 0...@item_max
        draw_item(i)
      end
    end
  end
  #--------------------------------------------------------------------------
  # ● 描绘羡慕
  #     index : 项目编号
  #--------------------------------------------------------------------------
  def draw_item(index)
    item = @data[index]
    # 获取物品所持数
    case item
    when RPG::Item
      number = $game_party.item_number(item.id)
    when RPG::Weapon
      number = $game_party.weapon_number(item.id)
    when RPG::Armor
      number = $game_party.armor_number(item.id)
    end
    # 价格在所持金以下、并且所持数不是 99 的情况下为普通文字颜色
    # 除此之外的情况设置为无效文字色
    if item.price <= $game_party.gold and number < 99
      self.contents.font.color = normal_color
    else
      self.contents.font.color = disabled_color
    end
    x = 4
    y = index * 32
    rect = Rect.new(x, y, self.width - 32, 32)
    self.contents.fill_rect(rect, Color.new(0, 0, 0, 0))
    bitmap = RPG::Cache.icon(item.icon_name)
    opacity = self.contents.font.color == normal_color ? 255 : 128
    self.contents.blt(x, y + 4, bitmap, Rect.new(0, 0, 24, 24), opacity)
    self.contents.draw_text(x + 28, y, 212, 32, item.name, 0)
    #self.contents.draw_text(x + 240, y, 88, 32, item.price.to_s, 2)
  end
  #--------------------------------------------------------------------------
  # ● 刷新帮助文本
  #--------------------------------------------------------------------------
  def update_help
    @help_window.set_text(self.item == nil ? "" : self.item.description)
  end
end
#==============================================================================
# ■ Window_ShopSell
#------------------------------------------------------------------------------
# 　商店画面、浏览显示可以卖掉的商品的窗口。
#==============================================================================

class Window_ShopSell < Window_Selectable
  #--------------------------------------------------------------------------
  # ● 初始化对像
  #--------------------------------------------------------------------------
  def initialize
    super(0, 64, 416, 352)
    refresh
    self.index = 0
  end
  #--------------------------------------------------------------------------
  # ● 获取物品
  #--------------------------------------------------------------------------
  def item
    return @data[self.index]
  end
  #--------------------------------------------------------------------------
  # ● 刷新
  #--------------------------------------------------------------------------
  def refresh
    if self.contents != nil
      self.contents.dispose
      self.contents = nil
    end
    @data = []
    for i in 1...$data_items.size
      if $game_party.item_number(i) > 0 and $data_items[i].id !=19
        @data.push($data_items[i])
      end
    end
    for i in 1...$data_weapons.size
      if $game_party.weapon_number(i) > 0
        if $game_actors[1].weapon_id !=i
          @data.push($data_weapons[i])
        else
          @data.push($data_weapons[i]) if $game_party.weapon_number(i) > 1
        end 
      end
    end
    for i in 1...$data_armors.size
      if $game_party.armor_number(i) > 0
        if $game_actors[1].armor_equiped?(i)
          @data.push($data_armors[i]) if $game_party.armor_number(i) > 1
        else
          @data.push($data_armors[i])
        end
      end
    end
    # 如果项目数不是 0 就生成位图、描绘全部项目
    @item_max = @data.size
    if @item_max > 0
      self.contents = Bitmap.new(width - 32, row_max * 32)
      for i in 0...@item_max
        draw_item(i)
      end
    end
  end
  #--------------------------------------------------------------------------
  # ● 描绘项目
  #     index : 项目标号
  #--------------------------------------------------------------------------
  def draw_item(index)
    item = @data[index]
    case item
    when RPG::Item
      number = $game_party.item_number(item.id)
    when RPG::Weapon
      number = $game_party.weapon_number(item.id)
      number -=1 if $game_actors[1].weapon_id ==item.id
    when RPG::Armor
      number = $game_party.armor_number(item.id)
      number -=1 if $game_actors[1].armor_equiped?(item.id)
    end
    # 可以卖掉的显示为普通文字颜色、除此之外设置成无效文字颜色
    if item.price >= 0
      self.contents.font.color = normal_color
    else
      self.contents.font.color = disabled_color
    end
    x = 4
    y = index* 32
    rect = Rect.new(x, y, self.width / @column_max - 32, 32)
    self.contents.fill_rect(rect, Color.new(0, 0, 0, 0))
    bitmap = RPG::Cache.icon(item.icon_name)
    opacity = self.contents.font.color == normal_color ? 255 : 128
    self.contents.blt(x, y + 4, bitmap, Rect.new(0, 0, 24, 24), opacity)
    self.contents.draw_text(x + 28, y, 212, 32, item.name, 0)
    self.contents.draw_text(x + 240, y, 16, 32, "×", 1)
    self.contents.draw_text(x + 256, y, 24, 32, number.to_s, 2)
  end
  #--------------------------------------------------------------------------
  # ● 刷新帮助文本
  #--------------------------------------------------------------------------
  def update_help
    @help_window.set_text(self.item == nil ? "" : self.item.description)
  end
end
#==============================================================================
# ■ Window_ShopNumber
#------------------------------------------------------------------------------
# 　商店画面、输入买卖数量的窗口。
#==============================================================================

class Window_ShopNumber < Window_Base
  #--------------------------------------------------------------------------
  # ● 初始化对像
  #--------------------------------------------------------------------------
  def initialize
    super(0, 192, 416, 96)
    self.contents = Bitmap.new(width - 32, height - 32)
    @item = nil
    @max = 1
    @price = 0
    @number = 1
  end
  #--------------------------------------------------------------------------
  # ● 设置物品、最大个数、价格
  #--------------------------------------------------------------------------
  def set(item, max, price)
    @item = item
    @max = max
    @price = price
    @number = 1
    refresh
  end
  #--------------------------------------------------------------------------
  # ● 被输入的件数设置
  #--------------------------------------------------------------------------
  def number
    return @number
  end
  #--------------------------------------------------------------------------
  # ● 刷新
  #--------------------------------------------------------------------------
  def refresh
    self.contents.clear
    draw_item_name(@item, 4, 0)
    self.contents.font.color = normal_color
    self.contents.draw_text(172, 0, 32, 32, "×")
    self.contents.draw_text(208, 0, 24, 32, @number.to_s, 2)
    self.cursor_rect.set(204, 0, 32, 32)
    # 描绘合计价格和货币单位
    total_price = @price * @number
    self.contents.font.color = normal_color
    self.contents.draw_text(0, 32, 384, 32, "总价:"+total_price.truncate.to_s, 2)
    self.contents.font.color = system_color
  end
  #--------------------------------------------------------------------------
  # ● 刷新画面
  #--------------------------------------------------------------------------
  def update
    super
    if self.active
      # 光标右 (+1)
      if Input.repeat?(Input::RIGHT) and @number < @max
        $game_system.se_play($data_system.cursor_se)
        @number += 1
        refresh
      end
      # 光标左 (-1)
      if Input.repeat?(Input::LEFT) and @number > 1
        $game_system.se_play($data_system.cursor_se)
        @number -= 1
        refresh
      end
      # 光标上 (+10)
      if Input.repeat?(Input::UP) and @number < @max
        $game_system.se_play($data_system.cursor_se)
        @number = [@number + 10, @max].min
        refresh
      end
      # 光标下 (-10)
      if Input.repeat?(Input::DOWN) and @number > 1
        $game_system.se_play($data_system.cursor_se)
        @number = [@number - 10, 1].max
        refresh
      end
    end
  end
end
#==============================================================================
# ■ Window_ShopStatus
#------------------------------------------------------------------------------
# 　商店画面、显示物品价格的窗口。
#==============================================================================

class Window_ShopStatus < Window_Base
  #--------------------------------------------------------------------------
  # ● 初始化对像
  #--------------------------------------------------------------------------
  def initialize
    super(208, 416, 208, 64)
    self.contents = Bitmap.new(width - 32, height - 32)
    @item = nil
    refresh
  end
  #--------------------------------------------------------------------------
  # ● 刷新
  #--------------------------------------------------------------------------
  def refresh
    self.contents.clear
    if @item == nil
      return
    end
    case @item
    when RPG::Item
      price = $data_items[@item.id].price
    when RPG::Weapon
      price = $data_weapons[@item.id].price
    when RPG::Armor
      price = $data_armors[@item.id].price
    end
    if $game_temp.shop_type==2
      price*=7
      price/=10
    end
    self.contents.font.color = system_color
    self.contents.draw_text(0, 0, 72, 32, "价格:")
    self.contents.font.color = normal_color
    self.contents.draw_text(60, 0, 114, 32, price.to_s, 2)
  end
  #--------------------------------------------------------------------------
  # ● 设置物品
  #     item : 新的物品
  #--------------------------------------------------------------------------
  def item=(item)
    if @item != item
      @item = item
      refresh
    end
  end
end#==============================================================================
# ■ Window_Create
#------------------------------------------------------------------------------
# 　角色创建窗口
#==============================================================================
class Window_Create < Window_Base
  
  #--------------------------------------------------------------------------
  # ● 创建“角色创建”窗口
  #--------------------------------------------------------------------------
  def initialize
    super(0, 0, 640, 480)
    self.contents = Bitmap.new(width - 32, height - 32)
    @index = 0
    refresh
  end
  #--------------------------------------------------------------------------
  # ● 光标矩形
  #--------------------------------------------------------------------------
  def index=(index)
    @index = index
    self.cursor_rect.set(136, @index * 32 + 96, 240, 32)
  end
  #--------------------------------------------------------------------------
  # ● 标题“角色创建”
  #--------------------------------------------------------------------------
  def draw_header
    self.contents.font.size = 32
    self.contents.font.bold = true
    self.contents.font.color.set(0,0,0)
    self.contents.draw_text(0, 0, 640-32, 32, "角色创建", 1)
    self.contents.font.bold = false
    self.contents.font.size = 24
    self.contents.fill_rect(0, 32, 640, 1, normal_color)
  end
  #--------------------------------------------------------------------------
  # ● 列表描绘
  #--------------------------------------------------------------------------
  def draw_content(actor, x, y)
    draw_actor_name(actor, x, y,true)
    draw_gender(x, y + 32)
    draw_actor_ability(actor, x, y + 64)
    self.contents.draw_text(x, y + 192, 160, 32, "开始创建")
  end
  #--------------------------------------------------------------------------
  # ● 刷新
  #--------------------------------------------------------------------------
  def refresh
    self.contents.clear
    draw_header
    draw_content($game_actors[1], 140, 96)
  end
  #--------------------------------------------------------------------------
  # ● 更新窗口
  #--------------------------------------------------------------------------
  def update
    super
    refresh
  end  
  #--------------------------------------------------------------------------
  # ● 四项属性值描绘
  #     actor : 角色
  #     x     : 描画目标 X 坐标
  #     y     : 描画目标 Y 坐标
  #--------------------------------------------------------------------------
  def draw_actor_ability(actor, x, y)
    self.contents.font.color = system_color
    self.contents.draw_text(x, y, 120, 32, "膂力")
    self.contents.draw_text(x, y+32, 120, 32, "敏捷")
    self.contents.draw_text(x, y+64, 120, 32, "悟性")
    self.contents.draw_text(x, y+96, 120, 32, "根骨")
    self.contents.font.color = normal_color
    self.contents.draw_text(x + 64, y, 160, 32, $game_variables[11].to_s, 2)
    self.contents.draw_text(x + 64, y+32, 160, 32, $game_variables[12].to_s, 2)
    self.contents.draw_text(x + 64, y+64, 160, 32, $game_variables[13].to_s, 2)
    self.contents.draw_text(x + 64, y+96, 160, 32, $game_variables[14].to_s, 2)
      
    self.contents.draw_text(x+200, 96+192, 64, 32, (80-$game_variables[11]-
    $game_variables[12]-$game_variables[13]-$game_variables[14]).abs.to_s)
  end
end#==============================================================================
# ■ Window_NameEdit
#------------------------------------------------------------------------------
# 　名称输入画面、编辑名称的窗口。
#==============================================================================

class Window_NameEdit < Window_Base
  #--------------------------------------------------------------------------
  # ● 定义实例变量
  #--------------------------------------------------------------------------
  attr_reader   :name                     # 名称
  attr_reader   :index                    # 光标位置
  #--------------------------------------------------------------------------
  # ● 初始化对像
  #     actor    : 角色
  #     max_char : 最大字数
  #--------------------------------------------------------------------------
  def initialize(actor, max_char)
    super(0, 0, 640, 128)
    self.contents = Bitmap.new(width - 32, height - 32)
    @actor = actor
    @name = actor.name
    @max_char = max_char
    # 控制名字在最大字数以内
    name_array = @name.split(//)[0...@max_char]
    @name = ""
    for i in 0...name_array.size
      @name += name_array[i]
    end
    @default_name = @name
    @index = name_array.size
    refresh
    update_cursor_rect
  end
  #--------------------------------------------------------------------------
  # ● 还原为默认的名称
  #--------------------------------------------------------------------------
  def restore_default
    @name = @default_name
    @index = @name.split(//).size
    refresh
    update_cursor_rect
  end
  #--------------------------------------------------------------------------
  # ● 添加文字
  #     character : 要添加的文字
  #--------------------------------------------------------------------------
  def add(character)
    if @index < @max_char and character != ""
      @name += character
      @index += 1
      refresh
      update_cursor_rect
    end
  end
  #--------------------------------------------------------------------------
  # ● 删除文字
  #--------------------------------------------------------------------------
  def back
    if @index > 0
      # 删除一个字
      name_array = @name.split(//)
      @name = ""
      for i in 0...name_array.size-1
        @name += name_array[i]
      end
      @index -= 1
      refresh
      update_cursor_rect
    end
  end
  #--------------------------------------------------------------------------
  # ● 刷新
  #--------------------------------------------------------------------------
  def refresh
    self.contents.clear
    # 描绘名称
    name_array = @name.split(//)
    for i in 0...@max_char
      c = name_array[i]
      if c == nil
        c = "＿"
      end
      x = 320 - @max_char * 14 + i * 28
      self.contents.draw_text(x, 32, 28, 32, c, 1)
    end
    # 描绘图形
    draw_actor_graphic(@actor, 320 - @max_char * 14 - 40, 80)
  end
  #--------------------------------------------------------------------------
  # ● 刷新光标矩形
  #--------------------------------------------------------------------------
  def update_cursor_rect
    x = 320 - @max_char * 14 + @index * 28
    self.cursor_rect.set(x, 32, 28, 32)
  end
  #--------------------------------------------------------------------------
  # ● 刷新画面
  #--------------------------------------------------------------------------
  def update
    super
    update_cursor_rect
  end
end
#==============================================================================
# ■ Window_NameInput
#------------------------------------------------------------------------------
# 　输入名称的画面、文字选择窗口。
#==============================================================================

class Window_NameInput < Window_Base
  CHARACTER_TABLE =
  [
    "あ","い","う","え","お",
    "か","き","く","け","こ",
    "さ","し","す","せ","そ",
    "た","ち","つ","て","と",
    "な","に","ぬ","ね","の",
    "は","ひ","ふ","へ","ほ",
    "ま","み","む","め","も",
    "や", "" ,"ゆ", "" ,"よ",
    "ら","り","る","れ","ろ",
    "わ", "" ,"を", "" ,"ん",
    "が","ぎ","ぐ","げ","ご",
    "ざ","じ","ず","ぜ","ぞ",
    "だ","ぢ","づ","で","ど",
    "ば","び","ぶ","べ","ぼ",
    "ぱ","ぴ","ぷ","ぺ","ぽ",
    "ゃ","ゅ","ょ","っ","ゎ",
    "ぁ","ぃ","ぅ","ぇ","ぉ",
    "ー","・", "" , "" , "" ,
    "ア","イ","ウ","エ","オ",
    "カ","キ","ク","ケ","コ",
    "サ","シ","ス","セ","ソ",
    "タ","チ","ツ","テ","ト",
    "ナ","ニ","ヌ","ネ","ノ",
    "ハ","ヒ","フ","ヘ","ホ",
    "マ","ミ","ム","メ","モ",
    "ヤ", "" ,"ユ", "" ,"ヨ",
    "ラ","リ","ル","レ","ロ",
    "ワ", "" ,"ヲ", "" ,"ン",
    "ガ","ギ","グ","ゲ","ゴ",
    "ザ","ジ","ズ","ゼ","ゾ",
    "ダ","ヂ","ヅ","デ","ド",
    "バ","ビ","ブ","ベ","ボ",
    "パ","ピ","プ","ペ","ポ",
    "ャ","ュ","ョ","ッ","ヮ",
    "ァ","ィ","ゥ","ェ","ォ",
    "ー","・","ヴ", "" , "" ,
  ]
  #--------------------------------------------------------------------------
  # ● 初始化对像
  #--------------------------------------------------------------------------
  def initialize
    super(0, 128, 640, 352)
    self.contents = Bitmap.new(width - 32, height - 32)
    @index = 0
    refresh
    update_cursor_rect
  end
  #--------------------------------------------------------------------------
  # ● 获取文字
  #--------------------------------------------------------------------------
  def character
    return CHARACTER_TABLE[@index]
  end
  #--------------------------------------------------------------------------
  # ● 刷新
  #--------------------------------------------------------------------------
  def refresh
    self.contents.clear
    for i in 0..179
      x = 4 + i / 5 / 9 * 152 + i % 5 * 28
      y = i / 5 % 9 * 32
      self.contents.draw_text(x, y, 28, 32, CHARACTER_TABLE[i], 1)
    end
    self.contents.draw_text(544, 9 * 32, 64, 32, "确定", 1)
  end
  #--------------------------------------------------------------------------
  # ● 刷新光标矩形
  #--------------------------------------------------------------------------
  def update_cursor_rect
    # 光标位置在 [确定] 的情况下
    if @index >= 180
      self.cursor_rect.set(544, 9 * 32, 64, 32)
    # 光标位置在 [确定] 以外的情况下
    else
      x = 4 + @index / 5 / 9 * 152 + @index % 5 * 28
      y = @index / 5 % 9 * 32
      self.cursor_rect.set(x, y, 28, 32)
    end
  end
  #--------------------------------------------------------------------------
  # ● 刷新画面
  #--------------------------------------------------------------------------
  def update
    super
    # 光标位置在 [确定] 的情况下
    if @index >= 180
      # 光标下
      if Input.trigger?(Input::DOWN)
        $game_system.se_play($data_system.cursor_se)
        @index -= 180
      end
      # 光标上
      if Input.repeat?(Input::UP)
        $game_system.se_play($data_system.cursor_se)
        @index -= 180 - 40
      end
    # 光标位置在 [确定] 以外的情况下
    else
      # 按下方向键右的情况下
      if Input.repeat?(Input::RIGHT)
        # 按下状态不是重复的情况下、
        # 光标位置不在右端的情况下
        if Input.trigger?(Input::RIGHT) or
           @index / 45 < 3 or @index % 5 < 4
          # 光标向右移动
          $game_system.se_play($data_system.cursor_se)
          if @index % 5 < 4
            @index += 1
          else
            @index += 45 - 4
          end
          if @index >= 180
            @index -= 180
          end
        end
      end
      # 按下方向键左的情况下
      if Input.repeat?(Input::LEFT)
        # 按下状态不是重复的情况下、
        # 光标位置不在左端的情况下
        if Input.trigger?(Input::LEFT) or
           @index / 45 > 0 or @index % 5 > 0
          # 光标向右移动
          $game_system.se_play($data_system.cursor_se)
          if @index % 5 > 0
            @index -= 1
          else
            @index -= 45 - 4
          end
          if @index < 0
            @index += 180
          end
        end
      end
      # 按下方向键下的情况下
      if Input.repeat?(Input::DOWN)
        # 光标向下移动
        $game_system.se_play($data_system.cursor_se)
        if @index % 45 < 40
          @index += 5
        else
          @index += 180 - 40
        end
      end
      # 按下方向键上的情况下
      if Input.repeat?(Input::UP)
        # 按下状态不是重复的情况下、
        # 光标位置不在上端的情况下
        if Input.trigger?(Input::UP) or @index % 45 >= 5
          # 光标向上移动
          $game_system.se_play($data_system.cursor_se)
          if @index % 45 >= 5
            @index -= 5
          else
            @index += 180
          end
        end
      end
      # L 键与 R 键被按下的情况下
      if Input.repeat?(Input::L) or Input.repeat?(Input::R)
        # 平假名 / 片假名 之间移动
        $game_system.se_play($data_system.cursor_se)
        if @index / 45 < 2
          @index += 90
        else
          @index -= 90
        end
      end
    end
    update_cursor_rect
  end
end
#==============================================================================
# ■ Window_InputNumber
#------------------------------------------------------------------------------
# 　信息窗口内部使用、输入数值的窗口。
#==============================================================================

class Window_InputNumber < Window_Base
  #--------------------------------------------------------------------------
  # ● 初始化对像
  #     digits_max : 位数
  #--------------------------------------------------------------------------
  def initialize(digits_max)
    @digits_max = digits_max
    @number = 0
    # 从数字的幅度计算(假定与 0～9 等幅)光标的幅度
    dummy_bitmap = Bitmap.new(32, 32)
    @cursor_width = dummy_bitmap.text_size("0").width + 8
    dummy_bitmap.dispose
    super(0, 0, @cursor_width * @digits_max + 32, 64)
    self.contents = Bitmap.new(width - 32, height - 32)
    self.z += 9999
    self.opacity = 0
    @index = 0
    refresh
    update_cursor_rect
  end
  #--------------------------------------------------------------------------
  # ● 取得数值
  #--------------------------------------------------------------------------
  def number
    return @number
  end
  #--------------------------------------------------------------------------
  # ● 设置数值
  #     number : 新的数值
  #--------------------------------------------------------------------------
  def number=(number)
    @number = [[number, 0].max, 10 ** @digits_max - 1].min
    refresh
  end
  #--------------------------------------------------------------------------
  # ● 更新光标矩形
  #--------------------------------------------------------------------------
  def update_cursor_rect
    self.cursor_rect.set(@index * @cursor_width, 0, @cursor_width, 32)
  end
  #--------------------------------------------------------------------------
  # ● 刷新画面
  #--------------------------------------------------------------------------
  def update
    super
    # 按下方向键上与下的情况下
    if Input.repeat?(Input::UP) or Input.repeat?(Input::DOWN)
      $game_system.se_play($data_system.cursor_se)
      # 取得现在位置的数字位数
      place = 10 ** (@digits_max - 1 - @index)
      n = @number / place % 10
      @number -= n * place
      # 上为 +1、下为 -1
      n = (n + 1) % 10 if Input.repeat?(Input::UP)
      n = (n + 9) % 10 if Input.repeat?(Input::DOWN)
      # 再次设置现在位的数字
      @number += n * place
      refresh
    end
    # 光标右
    if Input.repeat?(Input::RIGHT)
      if @digits_max >= 2
        $game_system.se_play($data_system.cursor_se)
        @index = (@index + 1) % @digits_max
      end
    end
    # 光标左
    if Input.repeat?(Input::LEFT)
      if @digits_max >= 2
        $game_system.se_play($data_system.cursor_se)
        @index = (@index + @digits_max - 1) % @digits_max
      end
    end
    update_cursor_rect
  end
  #--------------------------------------------------------------------------
  # ● 刷新
  #--------------------------------------------------------------------------
  def refresh
    self.contents.clear
    self.contents.font.color = normal_color
    s = sprintf("%0*d", @digits_max, @number)
    for i in 0...@digits_max
      self.contents.draw_text(i * @cursor_width + 4, 0, 32, 32, s[i,1])
    end
  end
end
#==============================================================================
# ■ Window_Message
#------------------------------------------------------------------------------
# 　显示文章的信息窗口。
#==============================================================================

class Window_Message < Window_Selectable
  #--------------------------------------------------------------------------
  # ● 初始化状态
  #--------------------------------------------------------------------------
  def initialize
    super(80, 304, 480, 160)
    self.contents = Bitmap.new(width - 32, height - 32)
    self.visible = false
    self.z = 9998
    @fade_in = false
    @fade_out = false
    @contents_showing = false
    @cursor_width = 0
    self.active = false
    self.index = -1
  end
  #--------------------------------------------------------------------------
  # ● 释放
  #--------------------------------------------------------------------------
  def dispose
    terminate_message
    $game_temp.message_window_showing = false
    if @input_number_window != nil
      @input_number_window.dispose
    end
    super
  end
  #--------------------------------------------------------------------------
  # ● 处理信息结束
  #--------------------------------------------------------------------------
  def terminate_message
    self.active = false
    self.pause = false
    self.index = -1
    self.contents.clear
    # 清除显示中标志
    @contents_showing = false
    # 呼叫信息调用
    if $game_temp.message_proc != nil
      $game_temp.message_proc.call
    end
    # 清除文章、选择项、输入数值的相关变量
    $game_temp.message_text = nil
    $game_temp.message_proc = nil
    $game_temp.choice_start = 99
    $game_temp.choice_max = 0
    $game_temp.choice_cancel_type = 0
    $game_temp.choice_proc = nil
    $game_temp.num_input_start = 99
    $game_temp.num_input_variable_id = 0
    $game_temp.num_input_digits_max = 0
    # 开放金钱窗口
    if @gold_window != nil
      @gold_window.dispose
      @gold_window = nil
    end
  end
  #--------------------------------------------------------------------------
  # ● 刷新
  #--------------------------------------------------------------------------
  def refresh
    self.contents.clear
    self.contents.font.color = normal_color
    x = y = 0
    @cursor_width = 0
    # 到选择项的下一行字
    if $game_temp.choice_start == 0
      x = 8
    end
    # 有等待显示的文字的情况下
    if $game_temp.message_text != nil
      text = $game_temp.message_text
      # 限制文字处理
      begin
        last_text = text.clone
        text.gsub!(/\\[Vv]\[([0-9]+)\]/) { $game_variables[$1.to_i] }
      end until text == last_text
      text.gsub!(/\\[Nn]\[([0-9]+)\]/) do
        $game_actors[$1.to_i] != nil ? $game_actors[$1.to_i].name : ""
      end
      # 为了方便、将 "\\\\" 变换为 "\000" 
      text.gsub!(/\\\\/) { "\000" }
      # "\\C" 变为 "\001" 、"\\G" 变为 "\002"
      text.gsub!(/\\[Cc]\[([0-9]+)\]/) { "\001[#{$1}]" }
      text.gsub!(/\\[Gg]/) { "\002" }
      # c 获取 1 个字 (如果不能取得文字就循环)
      while ((c = text.slice!(/./m)) != nil)
        # \\ 的情况下
        if c == "\000"
          # 还原为本来的文字
          c = "\\"
        end
        # \C[n] 的情况下
        if c == "\001"
          # 更改文字色
          text.sub!(/\[([0-9]+)\]/, "")
          color = $1.to_i
          if color >= 0 and color <= 7
            self.contents.font.color = text_color(color)
          end
          # 下面的文字
          next
        end
        # \G 的情况下
        if c == "\002"
          # 生成金钱窗口
          if @gold_window == nil
            @gold_window = Window_Gold.new
            @gold_window.x = 560 - @gold_window.width
            if $game_temp.in_battle
              @gold_window.y = 192
            else
              @gold_window.y = self.y >= 128 ? 32 : 384
            end
            @gold_window.opacity = self.opacity
            @gold_window.back_opacity = self.back_opacity
          end
          # 下面的文字
          next
        end
        # 另起一行文字的情况下
        if c == "\n"
          # 刷新选择项及光标的高
          if y >= $game_temp.choice_start
            @cursor_width = [@cursor_width, x].max
          end
          # y 加 1
          y += 1
          x = 0
          # 移动到选择项的下一行
          if y >= $game_temp.choice_start
            x = 8
          end
          # 下面的文字
          next
        end
        if (x + 4 + self.contents.text_size(c).width) > self.contents.width
          y += 1
          x = 0
        end
        # 描绘文字
        self.contents.draw_text(4 + x, 32 * y, 40, 32, c)
        # x 为要描绘文字的加法运算
        x += self.contents.text_size(c).width
      end
    end
    # 选择项的情况
    if $game_temp.choice_max > 0
      @item_max = $game_temp.choice_max
      self.active = true
      self.index = 0
    end
    # 输入数值的情况
    if $game_temp.num_input_variable_id > 0
      digits_max = $game_temp.num_input_digits_max
      number = $game_variables[$game_temp.num_input_variable_id]
      @input_number_window = Window_InputNumber.new(digits_max)
      @input_number_window.number = number
      @input_number_window.x = self.x + 8
      @input_number_window.y = self.y + $game_temp.num_input_start * 32
    end
  end
  #--------------------------------------------------------------------------
  # ● 设置窗口位置与不透明度
  #--------------------------------------------------------------------------
  def reset_window
    if $game_temp.in_battle
      self.y = 16
    else
      case $game_system.message_position
      when 0  # 上
        self.y = 16
      when 1  # 中
        self.y = 160
      when 2  # 下
        self.y = 304
      end
    end
    if $game_system.message_frame == 0
      self.opacity = 255
    else
      self.opacity = 0
    end
    self.back_opacity = 255
  end
  #--------------------------------------------------------------------------
  # ● 刷新画面
  #--------------------------------------------------------------------------
  def update
    super
    # 渐变的情况下
    if @fade_in
      self.contents_opacity += 24
      if @input_number_window != nil
        @input_number_window.contents_opacity += 24
      end
      if self.contents_opacity == 255
        @fade_in = false
      end
      return
    end
    # 输入数值的情况下
    if @input_number_window != nil
      @input_number_window.update
      # 确定
      if Input.trigger?(Input::C)
        $game_system.se_play($data_system.decision_se)
        $game_variables[$game_temp.num_input_variable_id] =
          @input_number_window.number
        $game_map.need_refresh = true
        # 释放输入数值窗口
        @input_number_window.dispose
        @input_number_window = nil
        terminate_message
      end
      return
    end
    # 显示信息中的情况下
    if @contents_showing
      # 如果不是在显示选择项中就显示暂停标志
      if $game_temp.choice_max == 0
        self.pause = true
      end
      # 取消
      if Input.trigger?(Input::B)
        if $game_temp.choice_max > 0 and $game_temp.choice_cancel_type > 0
          $game_system.se_play($data_system.cancel_se)
          $game_temp.choice_proc.call($game_temp.choice_cancel_type - 1)
          terminate_message
        end
      end
      # 确定
      if Input.trigger?(Input::C)
        if $game_temp.choice_max > 0
          $game_system.se_play($data_system.decision_se)
          $game_temp.choice_proc.call(self.index)
        end
        terminate_message
      end
      return
    end
    # 在渐变以外的状态下有等待显示的信息与选择项的场合
    if @fade_out == false and $game_temp.message_text != nil
      @contents_showing = true
      $game_temp.message_window_showing = true
      reset_window
      refresh
      Graphics.frame_reset
      self.visible = true
      self.contents_opacity = 0
      if @input_number_window != nil
        @input_number_window.contents_opacity = 0
      end
      @fade_in = true
      return
    end
    # 没有可以显示的信息、但是窗口为可见的情况下
    if self.visible
      @fade_out = true
      self.opacity -= 48
      if self.opacity == 0
        self.visible = false
        @fade_out = false
        $game_temp.message_window_showing = false
      end
      return
    end
  end
  #--------------------------------------------------------------------------
  # ● 刷新光标矩形
  #--------------------------------------------------------------------------
  def update_cursor_rect
    if @index >= 0
      n = $game_temp.choice_start + @index
      self.cursor_rect.set(8, n * 32, @cursor_width, 32)
    else
      self.cursor_rect.empty
    end
  end
end#==============================================================================
# ■ Window_BattleStatus
#------------------------------------------------------------------------------
# 　显示战斗画面同伴状态的窗口。
#==============================================================================

class Window_BattleStatus < Window_Base
  #--------------------------------------------------------------------------
  # ● 初始化对像
  #--------------------------------------------------------------------------
  def initialize
    super(0, 200, 640, 128)
    self.contents = Bitmap.new(width - 32, height - 32)
    @actor = $game_party.actors[0]
    @org_maxhp=100+$game_variables[24]/4
    @org_maxhp+=[($game_variables[157]-14)*20,300].min
    @enemy=$game_troop.enemies[0]
    @s=@enemy.id
    self.z=170
    @level_up_flags = [false, false, false, false]
    refresh
  end
  #--------------------------------------------------------------------------
  # ● 释放
  #--------------------------------------------------------------------------
  def dispose
    super
  end
  #--------------------------------------------------------------------------
  # ● 设置升级标志
  #     actor_index : 角色索引
  #--------------------------------------------------------------------------
  def level_up(actor_index)
  end
  #--------------------------------------------------------------------------
  # ● 刷新
  #--------------------------------------------------------------------------
  def refresh
    self.contents.clear
    self.contents.font.size = 18
    @item_max = 1
    self.contents.font.bold = false
    self.contents.font.color = Color.new(0,0, 0, 255)
    self.contents.font.color =Color.new(0,0, 0, 255)
    draw_HP1(@actor, 0, 24)
    draw_SP1(@actor, 0, 48) if @actor.maxsp>0
    draw_HP2(@enemy, 320, 24)
    draw_SP2(@enemy, 320, 48) if @enemy.maxsp>0
  end
  #--------------------------------------------------------------------------
  # ● 刷新画面
  #--------------------------------------------------------------------------
  def update
    super
  end
  def draw_HP1(actor,x, y, w1=100)
    # 边框
    kw=[w1 * actor.maxhp / @org_maxhp,w1].min
    self.contents.fill_rect(x+28, y+25, kw, 2, Color.new(0,0,0,255))
    # 条长度
    w = [w1 * actor.hp / @org_maxhp,w1].min
    # 条颜色
    self.contents.fill_rect(x+28, y+16, w,6, Color.new(0,0, 0, 255))
    self.contents.draw_text(x+136,y+6,216,32,actor.hp.to_s+"/"+actor.maxhp.to_s)
  end
  def draw_SP1(actor,x, y, w1=100)
    # 边框
    self.contents.fill_rect(x+28, y+25, w1, 2, Color.new(0,0,0,255))
    # 条长度
    w = [w1 * actor.sp / $game_variables[24],100].min
    # 条颜色
    self.contents.fill_rect(x+28, y+16, w,6, Color.new(0,0, 0, 255))
    self.contents.draw_text(x+136,y+6,216,32,actor.sp.to_s+"/"+$game_variables[24].to_s)
  end
  def draw_HP2(actor,x, y, w1=100)
    # 边框
    self.contents.fill_rect(x+28, y+25, w1,2, Color.new(0, 0, 0, 255))
    # 条长度
    w = [w1 * actor.hp / actor.maxhp,100].min
    # 条颜色
    self.contents.fill_rect(x+28, y+16, w,6, Color.new(0,0, 0, 255))
  end
  def draw_SP2(actor,x,y, w1=100)
    # 边框
    self.contents.fill_rect(x+28, y+25, w1, 2, Color.new(0,0,0,255))
    # 条长度
    w = [w1 * actor.sp / actor.maxsp,100].min
    # 条颜色
    self.contents.fill_rect(x+28, y+16, w,6, Color.new(0,0, 0, 255))
  end
end
#==============================================================================
# ■ Window_BattleResult
#------------------------------------------------------------------------------
# 　战斗结束时、显示获得的 EXP 及金钱的窗口。
#==============================================================================

class Window_BattleResult < Window_Base
  #--------------------------------------------------------------------------
  # ● 初始化对像
  #     gold      : 金钱
  #     trea1     : 宝物1
  #     trea2     : 宝物2
  #     trea3     : 宝物3
  #     trea4     : 宝物4
  #--------------------------------------------------------------------------
  def initialize(gold, trea1="", trea2="", trea3="", trea4="")
    @gold = gold
    @trea1=trea1
    @trea2=trea2
    @trea3=trea3
    @trea4=trea4
    super(160, 0, 320, 224)
    self.contents = Bitmap.new(width - 32, height - 32)
    self.y = 160 - height / 2
    self.z =300
    refresh
  end
  #--------------------------------------------------------------------------
  # ● 刷新
  #--------------------------------------------------------------------------
  def refresh
    self.contents.clear
    self.contents.font.color = normal_color
    self.contents.font.color = system_color
    self.contents.draw_text(0,0,320,32,"大获全胜！战斗获得")
    self.contents.draw_text(0,32,192,32,"金钱："+@gold.to_s)
    self.contents.draw_text(0,64,192,32,"物品：")
    self.contents.draw_text(66,64,192,32,@trea1) if @trea1 !=nil
    self.contents.draw_text(66,96,192,32,@trea2) if @trea2 !=nil
    self.contents.draw_text(66,128,192,32,@trea3) if @trea3 !=nil
    self.contents.draw_text(66,160,192,32,@trea4) if @trea4 !=nil
  end
end
#==============================================================================
# ■ Window_DebugLeft
#------------------------------------------------------------------------------
# 　调试画面、指定开关及变量块的窗口。
#==============================================================================

class Window_DebugLeft < Window_Selectable
  #--------------------------------------------------------------------------
  # ● 初始化对像
  #--------------------------------------------------------------------------
  def initialize
    super(0, 0, 192, 480)
    self.index = 0
    refresh
  end
  #--------------------------------------------------------------------------
  # ● 刷新
  #--------------------------------------------------------------------------
  def refresh
    if self.contents != nil
      self.contents.dispose
      self.contents = nil
    end
    @switch_max = ($data_system.switches.size - 1 + 9) / 10
    @variable_max = ($data_system.variables.size - 1 + 9) / 10
    @item_max = @switch_max + @variable_max
    self.contents = Bitmap.new(width - 32, @item_max * 32)
    self.contents.font.color.set(0,0,0)
    for i in 0...@switch_max
      text = sprintf("S [%04d-%04d]", i*10+1, i*10+10)
      self.contents.draw_text(4, i * 32, 152, 32, text)
    end
    for i in 0...@variable_max
      text = sprintf("V [%04d-%04d]", i*10+1, i*10+10)
      self.contents.draw_text(4, (@switch_max + i) * 32, 152, 32, text)
    end
  end
  #--------------------------------------------------------------------------
  # ● 获取模式
  #--------------------------------------------------------------------------
  def mode
    if self.index < @switch_max
      return 0
    else
      return 1
    end
  end
  #--------------------------------------------------------------------------
  # ● 获取开头显示的 ID
  #--------------------------------------------------------------------------
  def top_id
    if self.index < @switch_max
      return self.index * 10 + 1
    else
      return (self.index - @switch_max) * 10 + 1
    end
  end
end
#==============================================================================
# ■ Window_DebugRight
#------------------------------------------------------------------------------
# 　调试画面、个别显示开关及变量的窗口。
#==============================================================================

class Window_DebugRight < Window_Selectable
  #--------------------------------------------------------------------------
  # ● 定义实例变量
  #--------------------------------------------------------------------------
  attr_reader   :mode                     # 模式 (0:开关、1:变量)
  attr_reader   :top_id                   # 开头显示的 ID
  #--------------------------------------------------------------------------
  # ● 初始化对像
  #--------------------------------------------------------------------------
  def initialize
    super(192, 0, 448, 352)
    self.contents = Bitmap.new(width - 32, height - 32)
    self.contents.font.color.set(0,0,0)
    self.index = -1
    self.active = false
    @item_max = 10
    @mode = 0
    @top_id = 1
    refresh
  end
  #--------------------------------------------------------------------------
  # ● 刷新
  #--------------------------------------------------------------------------
  def refresh
    self.contents.clear
    for i in 0..9
      if @mode == 0
        name = $data_system.switches[@top_id+i]
        status = $game_switches[@top_id+i] ? "[ON]" : "[OFF]"
      else
        name = $data_system.variables[@top_id+i]
        status = $game_variables[@top_id+i].to_s
      end
      if name == nil
        name = ''
      end
      id_text = sprintf("%04d:", @top_id+i)
      width = self.contents.text_size(id_text).width
      self.contents.draw_text(4, i * 32, width, 32, id_text)
      self.contents.draw_text(12 + width, i * 32, 296 - width, 32, name)
      self.contents.draw_text(312, i * 32, 100, 32, status, 2)
    end
  end
  #--------------------------------------------------------------------------
  # ● 设置模式
  #     id : 新的模式
  #--------------------------------------------------------------------------
  def mode=(mode)
    if @mode != mode
      @mode = mode
      refresh
    end
  end
  #--------------------------------------------------------------------------
  # ● 设置开头显示的 ID
  #     id : 新的 ID
  #--------------------------------------------------------------------------
  def top_id=(id)
    if @top_id != id
      @top_id = id
      refresh
    end
  end
end
#==============================================================================
# ■ Arrow_Base
#------------------------------------------------------------------------------
# 　在战斗画面使用的箭头光标的活动块。本类作为
# Arrow_Enemy 类与 Arrow_Actor 类的超级类使用。
#==============================================================================

class Arrow_Base < Sprite
  #--------------------------------------------------------------------------
  # ● 定义实例变量
  #--------------------------------------------------------------------------
  attr_reader   :index                    # 光标位置
  attr_reader   :help_window              # 帮助窗口
  #--------------------------------------------------------------------------
  # ● 初始化对像
  #     viewport : 显示端口
  #--------------------------------------------------------------------------
  def initialize(viewport)
    super(viewport)
    self.bitmap = RPG::Cache.windowskin($game_system.windowskin_name)
    self.ox = 16
    self.oy = 64
    self.z = 2500
    @blink_count = 0
    @index = 0
    @help_window = nil
    update
  end
  #--------------------------------------------------------------------------
  # ● 设置光标位置
  #     index : 新的光标位置
  #--------------------------------------------------------------------------
  def index=(index)
    @index = index
    update
  end
  #--------------------------------------------------------------------------
  # ● 设置帮助窗口
  #     help_window : 新的帮助窗口
  #--------------------------------------------------------------------------
  def help_window=(help_window)
    @help_window = help_window
    # 刷新帮助文本 (update_help 定义了继承目标)
    if @help_window != nil
      update_help
    end
  end
  #--------------------------------------------------------------------------
  # ● 刷新画面
  #--------------------------------------------------------------------------
  def update
    # 刷新闪烁记数
    @blink_count = (@blink_count + 1) % 8
    # 设置传送源矩形
    if @blink_count < 4
      self.src_rect.set(128, 96, 32, 32)
    else
      self.src_rect.set(160, 96, 32, 32)
    end
    # 刷新帮助文本 (update_help 定义了继承目标)
    if @help_window != nil
      update_help
    end
  end
end
#==============================================================================
# ■ Arrow_Enemy
#------------------------------------------------------------------------------
# 　选择敌人的箭头光标。本类继承 Arrow_Base
# 类。
#==============================================================================

class Arrow_Enemy < Arrow_Base
  #--------------------------------------------------------------------------
  # ● 获取光标指向的敌人
  #--------------------------------------------------------------------------
  def enemy
    return $game_troop.enemies[@index]
  end
  #--------------------------------------------------------------------------
  # ● 刷新画面
  #--------------------------------------------------------------------------
  def update
    super
    # 如果指向不存在的敌人就离开
    $game_troop.enemies.size.times do
      break if self.enemy.exist?
      @index += 1
      @index %= $game_troop.enemies.size
    end
    # 光标右
    if Input.repeat?(Input::RIGHT)
      $game_system.se_play($data_system.cursor_se)
      $game_troop.enemies.size.times do
        @index += 1
        @index %= $game_troop.enemies.size
        break if self.enemy.exist?
      end
    end
    # 光标左
    if Input.repeat?(Input::LEFT)
      $game_system.se_play($data_system.cursor_se)
      $game_troop.enemies.size.times do
        @index += $game_troop.enemies.size - 1
        @index %= $game_troop.enemies.size
        break if self.enemy.exist?
      end
    end
    # 设置活动块坐标
    if self.enemy != nil
      self.x = self.enemy.screen_x
      self.y = self.enemy.screen_y
    end
  end
  #--------------------------------------------------------------------------
  # ● 刷新帮助文本
  #--------------------------------------------------------------------------
  def update_help
    # 帮助窗口显示敌人的名字与状态
    @help_window.set_enemy(self.enemy)
  end
end
#==============================================================================
# ■ Arrow_Actor
#------------------------------------------------------------------------------
# 　选择角色的箭头光标。本类继承 Arrow_Base 
# 类。
#==============================================================================

class Arrow_Actor < Arrow_Base
  #--------------------------------------------------------------------------
  # ● 获取光标指向的角色
  #--------------------------------------------------------------------------
  def actor
    return $game_party.actors[@index]
  end
  #--------------------------------------------------------------------------
  # ● 刷新画面
  #--------------------------------------------------------------------------
  def update
    super
    # 光标右
    if Input.repeat?(Input::RIGHT)
      $game_system.se_play($data_system.cursor_se)
      @index += 1
      @index %= $game_party.actors.size
    end
    # 光标左
    if Input.repeat?(Input::LEFT)
      $game_system.se_play($data_system.cursor_se)
      @index += $game_party.actors.size - 1
      @index %= $game_party.actors.size
    end
    # 设置活动块坐标
    if self.actor != nil
      self.x = self.actor.screen_x
      self.y = self.actor.screen_y
    end
  end
  #--------------------------------------------------------------------------
  # ● 刷新帮助文本
  #--------------------------------------------------------------------------
  def update_help
    # 帮助窗口显示角色的状态
    @help_window.set_actor(self.actor)
  end
end
#==============================================================================
# ■ Interpreter (分割定义 1)
#------------------------------------------------------------------------------
# 　执行事件命令的解释器。本类在 Game_System 类
# 与 Game_Event 类的内部使用。
#==============================================================================

class Interpreter
  attr_reader  :event_id
  attr_reader  :s
  #--------------------------------------------------------------------------
  # ● 初始化标志
  #     depth : 事件的深度
  #     main  : 主标志
  #--------------------------------------------------------------------------
  def initialize(depth = 0, main = false)
    @depth = depth
    @main = main
    # 深度超过 100 级
    if depth > 100
      print("调用公用事件超过了限制。")
      exit
    end
    # 清除注释器的内部状态
    clear
  end
  #--------------------------------------------------------------------------
  # ● 清除
  #--------------------------------------------------------------------------
  def clear
    @map_id = 0                       # 启动时的地图 ID
    @event_id = 0                     # 事件 ID
    @message_waiting = false          # 信息结束后待机中
    @move_route_waiting = false       # 移动结束后待机中
    @button_input_variable_id = 0     # 输入按钮 变量 ID
    @wait_count = 0                   # 窗口计数
    @child_interpreter = nil          # 子实例
    @branch = {}                      # 分支数据
  end
  #--------------------------------------------------------------------------
  # ● 设置事件
  #     list     : 执行内容
  #     event_id : 事件 ID
  #--------------------------------------------------------------------------
  def setup(list, event_id)
    # 清除注释器的内部状态
    clear
    # 记忆地图 ID
    @map_id = $game_map.map_id
    # 记忆事件 ID
    @event_id = event_id
    # 记忆执行内容
    @list = list
    # 初始化索引
    @index = 0
    # 清除分支数据用复述
    @branch.clear
  end
  #--------------------------------------------------------------------------
  # ● 执行中判定
  #--------------------------------------------------------------------------
  def running?
    return @list != nil
  end
  #--------------------------------------------------------------------------
  # ● 设置启动中事件
  #--------------------------------------------------------------------------
  def setup_starting_event
    # 刷新必要的地图
    if $game_map.need_refresh
      $game_map.refresh
    end
    # 如果调用的公共事件被预约的情况下
    if $game_temp.common_event_id > 0
      # 设置事件
      setup($data_common_events[$game_temp.common_event_id].list, 0)
      # 解除预约
      $game_temp.common_event_id = 0
      return
    end
    # 循环 (地图事件)
    for event in $game_map.events.values
      # 如果找到了启动中的事件
      if event.starting
        # 如果不是自动执行
        if event.trigger < 3
          # 清除启动中标志
          event.clear_starting
          # 锁定
          event.lock
        end
        # 设置事件
        setup(event.list, event.id)
        return
      end
    end
    # 循环(公共事件)
    for common_event in $data_common_events.compact
      # 目标的自动执行开关为 ON 的情况下
      if common_event.trigger == 1 and
         $game_switches[common_event.switch_id] == true
        # 设置事件
        setup(common_event.list, 0)
        return
      end
    end
  end
  #--------------------------------------------------------------------------
  # ● 刷新画面
  #--------------------------------------------------------------------------
  def update
    # 初始化循环计数
    @loop_count = 0
    # 循环
    loop do
      # 循环计数加 1
      @loop_count += 1
      # 如果执行了 100 个事件指令
      if @loop_count > 100
        # 为了防止系统崩溃、调用 Graphics.update
        Graphics.update
        @loop_count = 0
      end
      # 如果地图与事件启动有差异
      if $game_map.map_id != @map_id
        # 事件 ID 设置为 0
        @event_id = 0
      end
      # 子注释器存在的情况下
      if @child_interpreter != nil
        # 刷新子注释器
        @child_interpreter.update
        # 子注释器执行结束的情况下
        unless @child_interpreter.running?
          # 删除字注释器
          @child_interpreter = nil
        end
        # 如果子注释器还存在
        if @child_interpreter != nil
          return
        end
      end
      # 信息结束待机的情况下
      if @message_waiting
        return
      end
      # 移动结束待机的情况下
      if @move_route_waiting
        # 强制主角移动路线的情况下
        if $game_player.move_route_forcing
          return
        end
        # 循环 (地图事件)
        for event in $game_map.events.values
          # 本事件为强制移动路线的情况下
          if event.move_route_forcing
            return
          end
        end
        # 清除移动结束待机中的标志
        @move_route_waiting = false
      end
      # 输入按钮待机中的情况下
      if @button_input_variable_id > 0
        # 执行按钮输入处理
        input_button
        return
      end
      # 等待中的情况下
      if @wait_count > 0
        # 减少等待计数
        @wait_count -= 1
        return
      end
      # 如果被强制行动的战斗者存在
      if $game_temp.forcing_battler != nil
        return
      end
      # 如果各画面的调用标志已经被设置
      if $game_temp.battle_calling or
         $game_temp.shop_calling or
         $game_temp.name_calling or
         $game_temp.menu_calling or
         $game_temp.save_calling or
         $game_temp.gameover
        return
      end
      # 执行内容列表为空的情况下
      if @list == nil
        # 主地图事件的情况下
        if @main
          # 设置启动中的事件
          setup_starting_event
        end
        # 什么都没有设置的情况下
        if @list == nil
          return
        end
      end
      # 尝试执行事件列表、返回值为 false 的情况下
      if execute_command == false
        return
      end
      # 推进索引
      @index += 1
    end
  end
  #--------------------------------------------------------------------------
  # ● 输入按钮
  #--------------------------------------------------------------------------
  def input_button
    # 判定按下的按钮
    n = 0
    for i in 1..18
      if Input.trigger?(i)
        n = i
      end
    end
    # 按下按钮的情况下
    if n > 0
      # 更改变量值
      $game_variables[@button_input_variable_id] = n
      $game_map.need_refresh = true
      # 输入按键结束
      @button_input_variable_id = 0
    end
  end
  #--------------------------------------------------------------------------
  # ● 设置选择项
  #--------------------------------------------------------------------------
  def setup_choices(parameters)
    # choice_max 为设置选择项的项目数
    $game_temp.choice_max = parameters[0].size
    # message_text 为设置选择项
    for text in parameters[0]
      $game_temp.message_text += text + "\n"
    end
    # 设置取消的情况的处理
    $game_temp.choice_cancel_type = parameters[1]
    # 返回调用设置
    current_indent = @list[@index].indent
    $game_temp.choice_proc = Proc.new { |n| @branch[current_indent] = n }
  end
  #--------------------------------------------------------------------------
  # ● 角色用 itereta (考虑全体同伴)
  #     parameter : 1 以上为 ID、0 为全体
  #--------------------------------------------------------------------------
  def iterate_actor(parameter)
    # 全体同伴的情况下
    if parameter == 0
      # 同伴全体循环
      for actor in $game_party.actors
        # 评价块
        yield actor
      end
    # 单体角色的情况下
    else
      # 获取角色
      actor = $game_actors[parameter]
      # 获取角色
      yield actor if actor != nil
    end
  end
  #--------------------------------------------------------------------------
  # ● 敌人用 itereta (考虑队伍全体)
  #     parameter : 0 为索引、-1 为全体
  #--------------------------------------------------------------------------
  def iterate_enemy(parameter)
    # 队伍全体的情况下
    if parameter == -1
      # 队伍全体循环
      for enemy in $game_troop.enemies
        # 评价块
        yield enemy
      end
    # 敌人单体的情况下
    else
      # 获取敌人
      enemy = $game_troop.enemies[parameter]
      # 评价块
      yield enemy if enemy != nil
    end
  end
  #--------------------------------------------------------------------------
  # ● 战斗者用 itereta (要考虑全体队伍、全体同伴)
  #     parameter1 : 0 为敌人、1 为角色
  #     parameter2 : 0 以上为索引、-1 为全体
  #--------------------------------------------------------------------------
  def iterate_battler(parameter1, parameter2)
    # 敌人的情况下
    if parameter1 == 0
      # 调用敌人的 itereta
      iterate_enemy(parameter2) do |enemy|
        yield enemy
      end
    # 角色的情况下
    else
      # 全体同伴的情况下
      if parameter2 == -1
        # 同伴全体循环
        for actor in $game_party.actors
          # 评价块
          yield actor
        end
      # 角色单体 (N 个人) 的情况下
      else
        # 获取角色
        actor = $game_party.actors[parameter2]
        # 评价块
        yield actor if actor != nil
      end
    end
  end
end
#==============================================================================
# ■ Interpreter (分割定义 2)
#------------------------------------------------------------------------------
# 　执行时间命令的解释器。本类在 Game_System 类
# 和 Game_Event 类的内部使用。
#==============================================================================

class Interpreter
  #--------------------------------------------------------------------------
  # ● 执行事件命令
  #--------------------------------------------------------------------------
  def execute_command
    # 到达执行内容列表末尾的情况下
    if @index >= @list.size - 1
      # 时间结束
      command_end
      # 继续
      return true
    end
    # 事件命令的功能可以参考 @parameters
    @parameters = @list[@index].parameters
    # 命令代码分支
    case @list[@index].code
    when 101  # 文章的显示
      return command_101
    when 102  # 显示选择项
      return command_102
    when 402  # [**] 的情况下
      return command_402
    when 403  # 取消的情况下
      return command_403
    when 103  # 处理数值输入
      return command_103
    when 104  # 更改文章选项
      return command_104
    when 105  # 处理按键输入
      return command_105
    when 106  # 等待
      return command_106
    when 111  # 条件分支
      return command_111
    when 411  # 这以外的情况
      return command_411
    when 112  # 循环
      return command_112
    when 413  # 重复上次
      return command_413
    when 113  # 中断循环
      return command_113
    when 115  # 中断时间处理
      return command_115
    when 116  # 暂时删除事件
      return command_116
    when 117  # 公共事件
      return command_117
    when 118  # 标签
      return command_118
    when 119  # 标签跳转
      return command_119
    when 121  # 操作开关
      return command_121
    when 122  # 操作变量
      return command_122
    when 123  # 操作独立开关
      return command_123
    when 124  # 操作计时器
      return command_124
    when 125  # 增减金钱
      return command_125
    when 126  # 增减物品
      return command_126
    when 127  # 增减武器
      return command_127
    when 128  # 增减防具
      return command_128
    when 129  # 替换角色
      return command_129
    when 131  # 更改窗口外关
      return command_131
    when 132  # 更改战斗 BGM
      return command_132
    when 133  # 更改战斗结束 BGS
      return command_133
    when 134  # 更改禁止保存
      return command_134
    when 135  # 更改禁止菜单
      return command_135
    when 136  # 更改禁止遇敌
      return command_136
    when 201  # 场所移动
      return command_201
    when 202  # 设置事件位置
      return command_202
    when 203  # 地图滚动
      return command_203
    when 204  # 更改地图设置
      return command_204
    when 205  # 更改雾的色调
      return command_205
    when 206  # 更改雾的不透明度
      return command_206
    when 207  # 显示动画
      return command_207
    when 208  # 更改透明状态
      return command_208
    when 209  # 设置移动路线
      return command_209
    when 210  # 移动结束后等待
      return command_210
    when 221  # 准备过渡
      return command_221
    when 222  # 执行过渡
      return command_222
    when 223  # 更改画面色调
      return command_223
    when 224  # 画面闪烁
      return command_224
    when 225  # 画面震动
      return command_225
    when 231  # 显示图片
      return command_231
    when 232  # 移动图片
      return command_232
    when 233  # 旋转图片
      return command_233
    when 234  # 更改色调
      return command_234
    when 235  # 删除图片
      return command_235
    when 236  # 设置天候
      return command_236
    when 241  # 演奏 BGM
      return command_241
    when 242  # BGM 的淡入淡出
      return command_242
    when 245  # 演奏 BGS
      return command_245
    when 246  # BGS 的淡入淡出
      return command_246
    when 247  # 记忆 BGM / BGS
      return command_247
    when 248  # 还原 BGM / BGS
      return command_248
    when 249  # 演奏 ME
      return command_249
    when 250  # 演奏 SE
      return command_250
    when 251  # 停止 SE
      return command_251
    when 301  # 战斗处理
      return command_301
    when 601  # 胜利的情况
      return command_601
    when 602  # 逃跑的情况
      return command_602
    when 603  # 失败的情况
      return command_603
    when 302  # 商店的处理
      return command_302
    when 303  # 名称输入的处理
      return command_303
    when 311  # 增减 HP
      return command_311
    when 312  # 增减 SP
      return command_312
    when 313  # 更改状态
      return command_313
    when 314  # 全回复
      return command_314
    when 315  # 增减 EXP
      return command_315
    when 316  # 増減 等级
      return command_316
    when 317  # 増減 能力值
      return command_317
    when 318  # 增减特技
      return command_318
    when 319  # 变更装备
      return command_319
    when 320  # 更改角色名字
      return command_320
    when 321  # 更改角色职业
      return command_321
    when 322  # 更改角色图形
      return command_322
    when 331  # 増減敌人的 HP
      return command_331
    when 332  # 増減敌人的 SP
      return command_332
    when 333  # 更改敌人的状态
      return command_333
    when 334  # 敌人出现
      return command_334
    when 335  # 敌人变身
      return command_335
    when 336  # 敌人全回复
      return command_336
    when 337  # 显示动画
      return command_337
    when 338  # 伤害处理
      return command_338
    when 339  # 强制行动
      return command_339
    when 340  # 战斗中断
      return command_340
    when 351  # 调用菜单画面
      return command_351
    when 352  # 调用存档画面
      return command_352
    when 353  # 游戏结束
      return command_353
    when 354  # 返回标题画面
      return command_354
    when 355  # 脚本
      return command_355
    else      # 其它
      return true
    end
  end
  #--------------------------------------------------------------------------
  # ● 事件结束
  #--------------------------------------------------------------------------
  def command_end
    # 清除执行内容列表
    @list = nil
    # 主地图事件与事件 ID 有效的情况下
    if @main and @event_id > 0
      # 解除事件锁定
      $game_map.events[@event_id].unlock
    end
  end
  #--------------------------------------------------------------------------
  # ● 指令跳转
  #--------------------------------------------------------------------------
  def command_skip
    # 获取缩进
    indent = @list[@index].indent
    # 循环
    loop do
      # 下一个事件命令是同等级的缩进的情况下
      if @list[@index+1].indent == indent
        # 继续
        return true
      end
      # 索引的下一个
      @index += 1
    end
  end
  #--------------------------------------------------------------------------
  # ● 获取角色
  #     parameter : 能力值
  #--------------------------------------------------------------------------
  def get_character(parameter)
    # 能力值分支
    case parameter
    when -1  # 角色
      return $game_player
    when 0  # 本事件
      events = $game_map.events
      return events == nil ? nil : events[@event_id]
    else  # 特定的事件
      events = $game_map.events
      return events == nil ? nil : events[parameter]
    end
  end
  #--------------------------------------------------------------------------
  # ● 计算操作的值
  #     operation    : 操作
  #     operand_type : 操作数类型 (0:恒量 1:变量)
  #     operand      : 操作数 (数值是变量 ID)
  #--------------------------------------------------------------------------
  def operate_value(operation, operand_type, operand)
    # 获取操作数
    if operand_type == 0
      value = operand
    else
      value = $game_variables[operand]
    end
    # 操作为 [减少] 的情况下反转实际符号
    if operation == 1
      value = -value
    end
    # 返回 value
    return value
  end
end
#==============================================================================
# ■ Interpreter (分割定义 3)
#------------------------------------------------------------------------------
# 　执行事件指令的解释器。本类在 Game_System 类
# 和 Game_Event 类的内部使用。
#==============================================================================

class Interpreter
  #--------------------------------------------------------------------------
  # ● 显示文章
  #--------------------------------------------------------------------------
  def command_101
    # 另外的文章已经设置过 message_text 的情况下
    if $game_temp.message_text != nil
      # 结束
      return false
    end
    # 设置信息结束后待机和返回调用标志
    @message_waiting = true
    $game_temp.message_proc = Proc.new { @message_waiting = false }
    # message_text 设置为 1 行
    $game_temp.message_text = @list[@index].parameters[0] + "\n"
    line_count = 1
    # 循环
    loop do
      # 下一个事件指令为文章两行以上的情况
      if @list[@index+1].code == 401
        # message_text 添加到第 2 行以下
        $game_temp.message_text += @list[@index+1].parameters[0] + "\n"
        line_count += 1
      # 事件指令不在文章两行以下的情况
      else
        # 下一个事件指令为显示选择项的情况下
        if @list[@index+1].code == 102
          # 如果选择项能收纳在画面里
          if @list[@index+1].parameters[0].size <= 4 - line_count
            # 推进索引
            @index += 1
            # 设置选择项
            $game_temp.choice_start = line_count
            setup_choices(@list[@index].parameters)
          end
        # 下一个事件指令为处理输入数值的情况下
        elsif @list[@index+1].code == 103
          # 如果数值输入窗口能收纳在画面里
          if line_count < 4
            # 推进索引
            @index += 1
            # 设置输入数值
            $game_temp.num_input_start = line_count
            $game_temp.num_input_variable_id = @list[@index].parameters[0]
            $game_temp.num_input_digits_max = @list[@index].parameters[1]
          end
        end
        # 继续
        return true
      end
      # 推进索引
      @index += 1
    end
  end
  #--------------------------------------------------------------------------
  # ● 显示选择项
  #--------------------------------------------------------------------------
  def command_102
    # 文章已经设置过 message_text 的情况下
    if $game_temp.message_text != nil
      # 结束
      return false
    end
    # 设置信息结束后待机和返回调用标志
    @message_waiting = true
    $game_temp.message_proc = Proc.new { @message_waiting = false }
    # 设置选择项
    $game_temp.message_text = ""
    $game_temp.choice_start = 0
    setup_choices(@parameters)
    # 继续
    return true
  end
  #--------------------------------------------------------------------------
  # ● [**] 的情况下
  #--------------------------------------------------------------------------
  def command_402
    # 如果符合的选择项被选择
    if @branch[@list[@index].indent] == @parameters[0]
      # 删除分支数据
      @branch.delete(@list[@index].indent)
      # 继续
      return true
    end
    # 不符合条件的情况下 : 指令跳转
    return command_skip
  end
  #--------------------------------------------------------------------------
  # ● 取消的情况下
  #--------------------------------------------------------------------------
  def command_403
    # 如果选择了选择项取消
    if @branch[@list[@index].indent] == 4
      # 删除分支数据
      @branch.delete(@list[@index].indent)
      # 继续
      return true
    end
    # 不符合条件的情况下 : 指令跳转
    return command_skip
  end
  #--------------------------------------------------------------------------
  # ● 处理数值输入
  #--------------------------------------------------------------------------
  def command_103
    # 文章已经设置过 message_text 的情况下
    if $game_temp.message_text != nil
      # 结束
      return false
    end
    # 设置信息结束后待机和返回调用标志
    @message_waiting = true
    $game_temp.message_proc = Proc.new { @message_waiting = false }
    # 设置数值输入
    $game_temp.message_text = ""
    $game_temp.num_input_start = 0
    $game_temp.num_input_variable_id = @parameters[0]
    $game_temp.num_input_digits_max = @parameters[1]
    # 继续
    return true
  end
  #--------------------------------------------------------------------------
  # ● 更改文章选项
  #--------------------------------------------------------------------------
  def command_104
    # 正在显示信息的情况下
    if $game_temp.message_window_showing
      # 结束
      return false
    end
    # 更改各个选项
    $game_system.message_position = @parameters[0]
    $game_system.message_frame = @parameters[1]
    # 继续
    return true
  end
  #--------------------------------------------------------------------------
  # ● 处理按键输入
  #--------------------------------------------------------------------------
  def command_105
    # 设置按键输入用变量 ID
    @button_input_variable_id = @parameters[0]
    # 推进索引
    @index += 1
    # 结束
    return false
  end
  #--------------------------------------------------------------------------
  # ● 等待
  #--------------------------------------------------------------------------
  def command_106
    # 设置等待计数
    @wait_count = @parameters[0] * 2
    # 继续
    return true
  end
  #--------------------------------------------------------------------------
  # ● 条件分支
  #--------------------------------------------------------------------------
  def command_111
    # 初始化本地变量 result
    result = false
    # 条件判定
    case @parameters[0]
    when 0  # 开关
      result = ($game_switches[@parameters[1]] == (@parameters[2] == 0))
    when 1  # 变量
      value1 = $game_variables[@parameters[1]]
      if @parameters[2] == 0
        value2 = @parameters[3]
      else
        value2 = $game_variables[@parameters[3]]
      end
      case @parameters[4]
      when 0  # 等于
        result = (value1 == value2)
      when 1  # 以上
        result = (value1 >= value2)
      when 2  # 以下
        result = (value1 <= value2)
      when 3  # 超过
        result = (value1 > value2)
      when 4  # 未满
        result = (value1 < value2)
      when 5  # 以外
        result = (value1 != value2)
      end
    when 2  # 独立开关
      if @event_id > 0
        key = [$game_map.map_id, @event_id, @parameters[1]]
        if @parameters[2] == 0
          result = ($game_self_switches[key] == true)
        else
          result = ($game_self_switches[key] != true)
        end
      end
    when 3  # 计时器
      if $game_system.timer_working
        sec = $game_system.timer / Graphics.frame_rate
        if @parameters[2] == 0
          result = (sec >= @parameters[1])
        else
          result = (sec <= @parameters[1])
        end
      end
    when 4  # 角色
      actor = $game_actors[@parameters[1]]
      if actor != nil
        case @parameters[2]
        when 0  # 同伴
          result = ($game_party.actors.include?(actor))
        when 1  # 名称
          result = (actor.name == @parameters[3])
        when 2  # 特技
          result = (actor.skill_learn?(@parameters[3]))
        when 3  # 武器
          result = (actor.weapon_id == @parameters[3])
        when 4  # 防具
          result = (actor.armor1_id == @parameters[3] or
                    actor.armor2_id == @parameters[3] or
                    actor.armor3_id == @parameters[3] or
                    actor.armor4_id == @parameters[3] or
                    actor.armor5_id == @parameters[3] or
                    actor.armor6_id == @parameters[3] or
                    actor.armor7_id == @parameters[3])
        when 5  # 状态
          result = (actor.state?(@parameters[3]))
        end
      end
    when 5  # 敌人
      enemy = $game_troop.enemies[@parameters[1]]
      if enemy != nil
        case @parameters[2]
        when 0  # 出现
          result = (enemy.exist?)
        when 1  # 状态
          result = (enemy.state?(@parameters[3]))
        end
      end
    when 6  # 角色
      character = get_character(@parameters[1])
      if character != nil
        result = (character.direction == @parameters[2])
      end
    when 7  # 金钱
      if @parameters[2] == 0
        result = ($game_party.gold >= @parameters[1])
      else
        result = ($game_party.gold <= @parameters[1])
      end
    when 8  # 物品
      result = ($game_party.item_number(@parameters[1]) > 0)
    when 9  # 武器
      result = ($game_party.weapon_number(@parameters[1]) > 0)
    when 10  # 防具
      result = ($game_party.armor_number(@parameters[1]) > 0)
    when 11  # 按钮
      result = (Input.press?(@parameters[1]))
    when 12  # 活动块
      result = eval(@parameters[1])
    end
    # 判断结果保存在 hash 中
    @branch[@list[@index].indent] = result
    # 判断结果为真的情况下
    if @branch[@list[@index].indent] == true
      # 删除分支数据
      @branch.delete(@list[@index].indent)
      # 继续
      return true
    end
    # 不符合条件的情况下 : 指令跳转
    return command_skip
  end
  #--------------------------------------------------------------------------
  # ● 这以外的情况
  #--------------------------------------------------------------------------
  def command_411
    # 判断结果为假的情况下
    if @branch[@list[@index].indent] == false
      # 删除分支数据
      @branch.delete(@list[@index].indent)
      # 继续
      return true
    end
    # 不符合条件的情况下 : 指令跳转
    return command_skip
  end
  #--------------------------------------------------------------------------
  # ● 循环
  #--------------------------------------------------------------------------
  def command_112
    # 继续
    return true
  end
  #--------------------------------------------------------------------------
  # ● 循环上次
  #--------------------------------------------------------------------------
  def command_413
    # 获取缩进
    indent = @list[@index].indent
    # 循环
    loop do
      # 推进索引
      @index -= 1
      # 本事件指令是同等级的缩进的情况下
      if @list[@index].indent == indent
        # 继续
        return true
      end
    end
  end
  #--------------------------------------------------------------------------
  # ● 中断循环
  #--------------------------------------------------------------------------
  def command_113
    # 获取缩进
    indent = @list[@index].indent
    # 将缩进复制到临时变量中
    temp_index = @index
    # 循环
    loop do
      # 推进索引
      temp_index += 1
      # 没找到符合的循环的情况下
      if temp_index >= @list.size-1
        # 继续
        return true
      end
      # 本事件命令为 [重复上次] 的情况下
      if @list[temp_index].code == 413 and @list[temp_index].indent < indent
        # 刷新索引
        @index = temp_index
        # 继续
        return true
      end
    end
  end
  #--------------------------------------------------------------------------
  # ● 中断事件处理
  #--------------------------------------------------------------------------
  def command_115
    # 结束事件
    command_end
    # 继续
    return true
  end
  #--------------------------------------------------------------------------
  # ● 事件暂时删除
  #--------------------------------------------------------------------------
  def command_116
    # 事件 ID 有效的情况下
    if @event_id > 0
      # 删除事件
      $game_map.events[@event_id].erase
    end
    # 推进索引
    @index += 1
    # 继续
    return false
  end
  #--------------------------------------------------------------------------
  # ● 公共事件
  #--------------------------------------------------------------------------
  def command_117
    # 获取公共事件
    common_event = $data_common_events[@parameters[0]]
    # 公共事件有效的情况下
    if common_event != nil
      # 生成子解释器
      @child_interpreter = Interpreter.new(@depth + 1)
      @child_interpreter.setup(common_event.list, @event_id)
    end
    # 继续
    return true
  end
  #--------------------------------------------------------------------------
  # ● 标签
  #--------------------------------------------------------------------------
  def command_118
    # 继续
    return true
  end
  #--------------------------------------------------------------------------
  # ● 标签跳转
  #--------------------------------------------------------------------------
  def command_119
    # 获取标签名
    label_name = @parameters[0]
    # 初始化临时变量
    temp_index = 0
    # 循环
    loop do
      # 没找到符合的标签的情况下
      if temp_index >= @list.size-1
        # 继续
        return true
      end
      # 本事件指令为指定的标签的名称的情况下
      if @list[temp_index].code == 118 and
         @list[temp_index].parameters[0] == label_name
        # 刷新索引
        @index = temp_index
        # 继续
        return true
      end
      # 推进索引
      temp_index += 1
    end
  end
end
#==============================================================================
# ■ Interpreter (分割定义 4)
#------------------------------------------------------------------------------
# 　执行事件命令的解释器。本类在 Game_System 类
# 和 Game_Event 类的内部使用。
#==============================================================================

class Interpreter
  #--------------------------------------------------------------------------
  # ● 开关操作
  #--------------------------------------------------------------------------
  def command_121
    # 循环全部操作
    for i in @parameters[0] .. @parameters[1]
      # 更改开关
      $game_switches[i] = (@parameters[2] == 0)
    end
    # 刷新地图
    $game_map.need_refresh = true
    # 继续
    return true
  end
  #--------------------------------------------------------------------------
  # ● 变量操作
  #--------------------------------------------------------------------------
  def command_122
    # 初始化值
    value = 0
    # 操作数的分支
    case @parameters[3]
    when 0  # 恒量
      value = @parameters[4]
    when 1  # 变量
      value = $game_variables[@parameters[4]]
    when 2  # 随机数
      value = @parameters[4] + rand(@parameters[5] - @parameters[4] + 1)
    when 3  # 物品
      value = $game_party.item_number(@parameters[4])
    when 4  # 角色
      actor = $game_actors[@parameters[4]]
      if actor != nil
        case @parameters[5]
        when 0  # 等级
          value = actor.level
        when 1  # EXP
          value = actor.exp
        when 2  # HP
          value = actor.hp
        when 3  # SP
          value = actor.sp
        when 4  # MaxHP
          value = actor.maxhp
        when 5  # MaxSP
          value = actor.maxsp
        when 6  # 力量
          value = actor.str
        when 7  # 灵巧
          value = actor.dex
        when 8  # 速度
          value = actor.agi
        when 9  # 魔力
          value = actor.int
        when 10  # 攻击力
          value = actor.atk
        when 11  # 物理防御
          value = actor.pdef
        when 12  # 魔法防御
          value = actor.mdef
        when 13  # 回避修正
          value = actor.eva
        end
      end
    when 5  # 敌人
      enemy = $game_troop.enemies[@parameters[4]]
      if enemy != nil
        case @parameters[5]
        when 0  # HP
          value = enemy.hp
        when 1  # SP
          value = enemy.sp
        when 2  # MaxHP
          value = enemy.maxhp
        when 3  # MaxSP
          value = enemy.maxsp
        when 4  # 力量
          value = enemy.str
        when 5  # 灵巧
          value = enemy.dex
        when 6  # 速度
          value = enemy.agi
        when 7  # 魔力
          value = enemy.int
        when 8  # 攻击力
          value = enemy.atk
        when 9  # 物理防御
          value = enemy.pdef
        when 10  # 魔法防御
          value = enemy.mdef
        when 11  # 回避修正
          value = enemy.eva
        end
      end
    when 6  # 角色
      character = get_character(@parameters[4])
      if character != nil
        case @parameters[5]
        when 0  # X 坐标
          value = character.x
        when 1  # Y 坐标
          value = character.y
        when 2  # 朝向
          value = character.direction
        when 3  # 画面 X 坐标
          value = character.screen_x
        when 4  # 画面 Y 坐标
          value = character.screen_y
        when 5  # 地形标记
          value = character.terrain_tag
        end
      end
    when 7  # 其它
      case @parameters[4]
      when 0  # 地图 ID
        value = $game_map.map_id
      when 1  # 同伴人数
        value = $game_party.actors.size
      when 2  # 金钱
        value = $game_party.gold
      when 3  # 步数
        value = $game_party.steps
      when 4  # 游戏时间
        value = Graphics.frame_count / Graphics.frame_rate
      when 5  # 计时器
        value = $game_system.timer / Graphics.frame_rate
      when 6  # 存档次数
        value = $game_system.save_count
      end
    end
    # 循环全部操作
    for i in @parameters[0] .. @parameters[1]
      # 操作分支
      case @parameters[2]
      when 0  # 代入
        $game_variables[i] = value
      when 1  # 加法
        $game_variables[i] += value
      when 2  # 减法
        $game_variables[i] -= value
      when 3  # 乘法
        $game_variables[i] *= value
      when 4  # 除法
        if value != 0
          $game_variables[i] /= value
        end
      when 5  # 剩余
        if value != 0
          $game_variables[i] %= value
        end
      end
      # 检查上限
      if $game_variables[i] > 99999999
        $game_variables[i] = 99999999
      end
      # 检查下限
      if $game_variables[i] < -99999999
        $game_variables[i] = -99999999
      end
    end
    # 刷新地图
    $game_map.need_refresh = true
    # 继续
    return true
  end
  #--------------------------------------------------------------------------
  # ● 独立开关操作
  #--------------------------------------------------------------------------
  def command_123
    # 事件 ID 有效的情况下
    if @event_id > 0
      # 生成独立开关
      key = [$game_map.map_id, @event_id, @parameters[0]]
      # 更改独立开关
      $game_self_switches[key] = (@parameters[1] == 0)
    end
    # 刷新地图
    $game_map.need_refresh = true
    # 继续
    return true
  end
  #--------------------------------------------------------------------------
  # ● 计时器操作
  #--------------------------------------------------------------------------
  def command_124
    # 开始的情况
    if @parameters[0] == 0
      $game_system.timer = @parameters[1] * Graphics.frame_rate
      $game_system.timer_working = true
    end
    # 停止的情况
    if @parameters[0] == 1
      $game_system.timer_working = false
    end
    # 继续
    return true
  end
  #--------------------------------------------------------------------------
  # ● 增减金钱
  #--------------------------------------------------------------------------
  def command_125
    # 获取要操作的值
    value = operate_value(@parameters[0], @parameters[1], @parameters[2])
    # 增减金钱
    $game_party.gain_gold(value)
    # 继续
    return true
  end
  #--------------------------------------------------------------------------
  # ● 增减物品
  #--------------------------------------------------------------------------
  def command_126
    # 获取要操作的值
    value = operate_value(@parameters[1], @parameters[2], @parameters[3])
    # 增减物品
    $game_party.gain_item(@parameters[0], value)
    # 继续
    return true
  end
  #--------------------------------------------------------------------------
  # ● 增减武器
  #--------------------------------------------------------------------------
  def command_127
    # 获取要操作的值
    value = operate_value(@parameters[1], @parameters[2], @parameters[3])
    # 增减武器
    $game_party.gain_weapon(@parameters[0], value)
    # 继续
    return true
  end
  #--------------------------------------------------------------------------
  # ● 增减防具
  #--------------------------------------------------------------------------
  def command_128
    # 获取要操作的值
    value = operate_value(@parameters[1], @parameters[2], @parameters[3])
    # 增减防具
    $game_party.gain_armor(@parameters[0], value)
    # 继续
    return true
  end
  #--------------------------------------------------------------------------
  # ● 角色的替换
  #--------------------------------------------------------------------------
  def command_129
    # 获取角色
    actor = $game_actors[@parameters[0]]
    # 角色有效的情况下
    if actor != nil
      # 操作分支
      if @parameters[1] == 0
        if @parameters[2] == 1
          $game_actors[@parameters[0]].setup(@parameters[0])
        end
        $game_party.add_actor(@parameters[0])
      else
        $game_party.remove_actor(@parameters[0])
      end
    end
    # 继续
    return true
  end
  #--------------------------------------------------------------------------
  # ● 更改窗口外观
  #--------------------------------------------------------------------------
  def command_131
    # 设置窗口外观文件名
    $game_system.windowskin_name = @parameters[0]
    # 继续
    return true
  end
  #--------------------------------------------------------------------------
  # ● 更改战斗 BGM
  #--------------------------------------------------------------------------
  def command_132
    # 设置战斗 BGM
    $game_system.battle_bgm = @parameters[0]
    p @parameters[0]
    # 继续
    return true
  end
  #--------------------------------------------------------------------------
  # ● 更改战斗结束的 ME
  #--------------------------------------------------------------------------
  def command_133
    # 设置战斗结束的 ME
    $game_system.battle_end_me = @parameters[0]
    # 继续
    return true
  end
  #--------------------------------------------------------------------------
  # ● 更改禁止存档
  #--------------------------------------------------------------------------
  def command_134
    # 更改禁止存档标志
    $game_system.save_disabled = (@parameters[0] == 0)
    # 继续
    return true
  end
  #--------------------------------------------------------------------------
  # ● 更改禁止菜单
  #--------------------------------------------------------------------------
  def command_135
    # 更改禁止菜单标志
    $game_system.menu_disabled = (@parameters[0] == 0)
    # 继续
    return true
  end
  #--------------------------------------------------------------------------
  # ● 更改禁止遇敌
  #--------------------------------------------------------------------------
  def command_136
    # 更改更改禁止遇敌标志
    $game_system.encounter_disabled = (@parameters[0] == 0)
    # 生成遇敌计数
    $game_player.make_encounter_count
    # 继续
    return true
  end
end
#==============================================================================
# ■ Interpreter (分割定义 5)
#------------------------------------------------------------------------------
# 　执行事件命令的注释器。本类在 Game_System 类
# 和 Game_Event 类的内部使用。
#==============================================================================

class Interpreter
  #--------------------------------------------------------------------------
  # ● 场所移动
  #--------------------------------------------------------------------------
  def command_201
    # 战斗中的情况
    if $game_temp.in_battle
      # 继续
      return true
    end
    # 场所移动中、信息显示中、过渡处理中的情况下
    if $game_temp.player_transferring or
       $game_temp.message_window_showing or
       $game_temp.transition_processing
      # 结束
      return false
    end
    # 设置场所移动标志
    $game_temp.player_transferring = true
    # 指定方法为 [直接指定] 的情况下
    if @parameters[0] == 0
      # 设置主角的移动目标
      $game_temp.player_new_map_id = @parameters[1]
      $game_temp.player_new_x = @parameters[2]
      $game_temp.player_new_y = @parameters[3]
      $game_temp.player_new_direction = @parameters[4]
    # 指定方法为 [使用变量指定] 的情况下
    else
      # 设置主角的移动目标
      $game_temp.player_new_map_id = $game_variables[@parameters[1]]
      $game_temp.player_new_x = $game_variables[@parameters[2]]
      $game_temp.player_new_y = $game_variables[@parameters[3]]
      $game_temp.player_new_direction = @parameters[4]
    end
    # 推进索引
    @index += 1
    # 有淡入淡出的情况下
    if @parameters[5] == 0
      # 准备过渡
      Graphics.freeze
      # 设置过渡处理中标志
      $game_temp.transition_processing = true
      $game_temp.transition_name = ""
    end
    # 结束
    return false
  end
  #--------------------------------------------------------------------------
  # ● 设置事件位置
  #--------------------------------------------------------------------------
  def command_202
    # 战斗中的情况下
    if $game_temp.in_battle
      # 继续
      return true
    end
    # 获取角色
    character = get_character(@parameters[0])
    # 角色不存在的情况下
    if character == nil
      # 继续
      return true
    end
    # 指定方法为 [直接指定] 的情况下
    if @parameters[1] == 0
      # 设置角色的位置
      character.moveto(@parameters[2], @parameters[3])
    # 指定方法为 [使用变量指定] 的情况下
    elsif @parameters[1] == 1
      # 设置角色的位置
      character.moveto($game_variables[@parameters[2]],
        $game_variables[@parameters[3]])
    # 指定方法为 [与其它事件交换] 的情况下
    else
      old_x = character.x
      old_y = character.y
      character2 = get_character(@parameters[2])
      if character2 != nil
        character.moveto(character2.x, character2.y)
        character2.moveto(old_x, old_y)
      end
    end
    # 设置角色的朝向
    case @parameters[4]
    when 8  # 上
      character.turn_up
    when 6  # 右
      character.turn_right
    when 2  # 下
      character.turn_down
    when 4  # 左
      character.turn_left
    end
    # 继续
    return true
  end
  #--------------------------------------------------------------------------
  # ● 地图的滚动
  #--------------------------------------------------------------------------
  def command_203
    # 战斗中的情况下
    if $game_temp.in_battle
      # 继续
      return true
    end
    # 已经在滚动中的情况下
    if $game_map.scrolling?
      # 结束
      return false
    end
    # 开始滚动
    $game_map.start_scroll(@parameters[0], @parameters[1], @parameters[2])
    # 继续
    return true
  end
  #--------------------------------------------------------------------------
  # ● 更改地图设置
  #--------------------------------------------------------------------------
  def command_204
    case @parameters[0]
    when 0  # 远景
      $game_map.panorama_name = @parameters[1]
      $game_map.panorama_hue = @parameters[2]
    when 1  # 雾
      $game_map.fog_name = @parameters[1]
      $game_map.fog_hue = @parameters[2]
      $game_map.fog_opacity = @parameters[3]
      $game_map.fog_blend_type = @parameters[4]
      $game_map.fog_zoom = @parameters[5]
      $game_map.fog_sx = @parameters[6]
      $game_map.fog_sy = @parameters[7]
    when 2  # 战斗背景
      $game_map.battleback_name = @parameters[1]
      $game_temp.battleback_name = @parameters[1]
    end
    # 继续
    return true
  end
  #--------------------------------------------------------------------------
  # ● 更改雾的色调
  #--------------------------------------------------------------------------
  def command_205
    # 开始更改色调
    $game_map.start_fog_tone_change(@parameters[0], @parameters[1] * 2)
    # 继续
    return true
  end
  #--------------------------------------------------------------------------
  # ● 更改雾的不透明度
  #--------------------------------------------------------------------------
  def command_206
    # 开始更改不透明度
    $game_map.start_fog_opacity_change(@parameters[0], @parameters[1] * 2)
    # 继续
    return true
  end
  #--------------------------------------------------------------------------
  # ● 显示动画
  #--------------------------------------------------------------------------
  def command_207
    # 获取角色
    character = get_character(@parameters[0])
    # 角色不存在的情况下
    if character == nil
      # 继续
      return true
    end
    # 设置动画 ID
    character.animation_id = @parameters[1]
    # 继续
    return true
  end
  #--------------------------------------------------------------------------
  # ● 更改透明状态
  #--------------------------------------------------------------------------
  def command_208
    # 设置主角的透明状态
    $game_player.transparent = (@parameters[0] == 0)
    # 继续
    return true
  end
  #--------------------------------------------------------------------------
  # ● 设置移动路线
  #--------------------------------------------------------------------------
  def command_209
    # 获取角色
    character = get_character(@parameters[0])
    # 角色不存在的情况下
    if character == nil
      # 继续
      return true
    end
    # 强制移动路线
    character.force_move_route(@parameters[1])
    # 继续
    return true
  end
  #--------------------------------------------------------------------------
  # ● 移动结束后等待
  #--------------------------------------------------------------------------
  def command_210
    # 如果不在战斗中
    unless $game_temp.in_battle
      # 设置移动结束后待机标志
      @move_route_waiting = true
    end
    # 继续
    return true
  end
  #--------------------------------------------------------------------------
  # ● 开始过渡
  #--------------------------------------------------------------------------
  def command_221
    # 显示信息窗口中的情况下
    if $game_temp.message_window_showing
      # 结束
      return false
    end
    # 准备过渡
    Graphics.freeze
    # 继续
    return true
  end
  #--------------------------------------------------------------------------
  # ● 执行过渡
  #--------------------------------------------------------------------------
  def command_222
    # 已经设置了过渡处理中标志的情况下
    if $game_temp.transition_processing
      # 结束
      return false
    end
    # 设置过渡处理中标志
    $game_temp.transition_processing = true
    $game_temp.transition_name = @parameters[0]
    # 推进索引
    @index += 1
    # 结束
    return false
  end
  #--------------------------------------------------------------------------
  # ● 更改画面色调
  #--------------------------------------------------------------------------
  def command_223
    # 开始更改色调
    $game_screen.start_tone_change(@parameters[0], @parameters[1] * 2)
    # 继续
    return true
  end
  #--------------------------------------------------------------------------
  # ● 画面闪烁
  #--------------------------------------------------------------------------
  def command_224
    # 开始闪烁
    $game_screen.start_flash(@parameters[0], @parameters[1] * 2)
    # 继续
    return true
  end
  #--------------------------------------------------------------------------
  # ● 画面震动
  #--------------------------------------------------------------------------
  def command_225
    # 震动开始
    $game_screen.start_shake(@parameters[0], @parameters[1],
      @parameters[2] * 2)
    # 继续
    return true
  end
  #--------------------------------------------------------------------------
  # ● 显示图片
  #--------------------------------------------------------------------------
  def command_231
    # 获取图片编号
    number = @parameters[0] + ($game_temp.in_battle ? 50 : 0)
    # 指定方法为 [直接指定] 的情况下
    if @parameters[3] == 0
      x = @parameters[4]
      y = @parameters[5]
    # 指定方法为 [使用变量指定] 的情况下
    else
      x = $game_variables[@parameters[4]]
      y = $game_variables[@parameters[5]]
    end
    # 显示图片
    $game_screen.pictures[number].show(@parameters[1], @parameters[2],
      x, y, @parameters[6], @parameters[7], @parameters[8], @parameters[9])
    # 继续
    return true
  end
  #--------------------------------------------------------------------------
  # ● 移动图片
  #--------------------------------------------------------------------------
  def command_232
    # 获取图片编号
    number = @parameters[0] + ($game_temp.in_battle ? 50 : 0)
    # 指定方法为 [直接指定] 的情况下
    if @parameters[3] == 0
      x = @parameters[4]
      y = @parameters[5]
    # 指定方法为 [使用变量指定] 的情况下
    else
      x = $game_variables[@parameters[4]]
      y = $game_variables[@parameters[5]]
    end
    # 移动图片
    $game_screen.pictures[number].move(@parameters[1] * 2, @parameters[2],
      x, y, @parameters[6], @parameters[7], @parameters[8], @parameters[9])
    # 继续
    return true
  end
  #--------------------------------------------------------------------------
  # ● 旋转图片
  #--------------------------------------------------------------------------
  def command_233
    # 获取图片编号
    number = @parameters[0] + ($game_temp.in_battle ? 50 : 0)
    # 设置旋转速度
    $game_screen.pictures[number].rotate(@parameters[1])
    # 继续
    return true
  end
  #--------------------------------------------------------------------------
  # ● 更改图片色调
  #--------------------------------------------------------------------------
  def command_234
    # 获取图片编号
    number = @parameters[0] + ($game_temp.in_battle ? 50 : 0)
    # 开始更改色调
    $game_screen.pictures[number].start_tone_change(@parameters[1],
      @parameters[2] * 2)
    # 继续
    return true
  end
  #--------------------------------------------------------------------------
  # ● 删除图片
  #--------------------------------------------------------------------------
  def command_235
    # 获取图片编号
    number = @parameters[0] + ($game_temp.in_battle ? 50 : 0)
    # 删除图片
    $game_screen.pictures[number].erase
    # 继续
    return true
  end
  #--------------------------------------------------------------------------
  # ● 天候设置
  #--------------------------------------------------------------------------
  def command_236
    # 设置天候
    $game_screen.weather(@parameters[0], @parameters[1], @parameters[2])
    # 继续
    return true
  end
  #--------------------------------------------------------------------------
  # ● 演奏 BGM
  #--------------------------------------------------------------------------
  def command_241
    # 演奏 BGM
    $game_system.bgm_play(@parameters[0])
    # 继续
    return true
  end
  #--------------------------------------------------------------------------
  # ● BGM 的淡入淡出
  #--------------------------------------------------------------------------
  def command_242
    # 淡入淡出 BGM
    $game_system.bgm_fade(@parameters[0])
    # 继续
    return true
  end
  #--------------------------------------------------------------------------
  # ● 演奏 BGS
  #--------------------------------------------------------------------------
  def command_245
    # 演奏 BGS
    $game_system.bgs_play(@parameters[0])
    # 继续
    return true
  end
  #--------------------------------------------------------------------------
  # ● BGS 的淡入淡出
  #--------------------------------------------------------------------------
  def command_246
    # 淡入淡出 BGS
    $game_system.bgs_fade(@parameters[0])
    # 继续
    return true
  end
  #--------------------------------------------------------------------------
  # ● 记忆 BGM / BGS
  #--------------------------------------------------------------------------
  def command_247
    # 记忆 BGM / BGS
    $game_system.bgm_memorize
    $game_system.bgs_memorize
    # 继续
    return true
  end
  #--------------------------------------------------------------------------
  # ● 还原 BGM / BGS
  #--------------------------------------------------------------------------
  def command_248
    # 还原 BGM / BGS
    $game_system.bgm_restore
    $game_system.bgs_restore
    # 继续
    return true
  end
  #--------------------------------------------------------------------------
  # ● 演奏 ME
  #--------------------------------------------------------------------------
  def command_249
    # 演奏 ME
    $game_system.me_play(@parameters[0])
    # 继续
    return true
  end
  #--------------------------------------------------------------------------
  # ● 演奏 SE
  #--------------------------------------------------------------------------
  def command_250
    # 演奏 SE
    $game_system.se_play(@parameters[0])
    # 继续
    return true
  end
  #--------------------------------------------------------------------------
  # ● 停止 SE
  #--------------------------------------------------------------------------
  def command_251
    # 停止 SE
    Audio.se_stop
    # 继续
    return true
  end
end
#==============================================================================
# ■ Interpreter (分割定义 6)
#------------------------------------------------------------------------------
# 　执行事件命令的解释器。本类在 Game_System 类
# 和 Game_Event 类的内部使用。
#==============================================================================

class Interpreter
  #--------------------------------------------------------------------------
  # ● 战斗处理
  #--------------------------------------------------------------------------
  def command_301
    # 如果不是无效的队伍
    if $data_troops[@parameters[0]] != nil
      # 设置中断战斗标志
      $game_temp.battle_abort = true
      # 设置战斗调用标志
      $game_temp.battle_calling = true
      $game_temp.battle_troop_id = @parameters[0]
      $game_temp.battle_can_escape = @parameters[1]
      $game_temp.battle_can_lose = @parameters[2]
      # 设置返回调用
      current_indent = @list[@index].indent
      $game_temp.battle_proc = Proc.new { |n| @branch[current_indent] = n }
    end
    # 推进索引
    @index += 1
    # 结束
    return false
  end
  #--------------------------------------------------------------------------
  # ● 胜利的情况下
  #--------------------------------------------------------------------------
  def command_601
    # 战斗结果为胜利的情况下
    if @branch[@list[@index].indent] == 0
      # 删除分支数据
      @branch.delete(@list[@index].indent)
      # 继续
      return true
    end
    # 不符合条件的情况下 : 指令跳转
    return command_skip
  end
  #--------------------------------------------------------------------------
  # ● 逃跑的情况下
  #--------------------------------------------------------------------------
  def command_602
    # 战斗结果为逃跑的情况下
    if @branch[@list[@index].indent] == 1
      # 删除分支数据
      @branch.delete(@list[@index].indent)
      # 继续
      return true
    end
    # 不符合条件的情况下 : 指令跳转
    return command_skip
  end
  #--------------------------------------------------------------------------
  # ● 失败的情况下
  #--------------------------------------------------------------------------
  def command_603
    # 战斗结果为失败的情况下
    if @branch[@list[@index].indent] == 2
      # 删除分支数据
      @branch.delete(@list[@index].indent)
      # 继续
      return true
    end
    # 不符合条件的情况下 : 指令跳转
    return command_skip
  end
  #--------------------------------------------------------------------------
  # ● 商店的处理
  #--------------------------------------------------------------------------
  def command_302
    # 设置战斗中断标志
    $game_temp.battle_abort = true
    # 设置商店调用标志
    $game_temp.shop_calling = true
    # 设置商品列表的新项目
    $game_temp.shop_goods = [@parameters]
    # 循环
    loop do
      # 推进索引
      @index += 1
      # 下一个事件命令在商店两行以上的情况下
      if @list[@index].code == 605
        # 在商品列表中添加新项目
        $game_temp.shop_goods.push(@list[@index].parameters)
      # 事件命令不在商店两行以上的情况下
      else
        # 技术
        return false
      end
    end
  end
  #--------------------------------------------------------------------------
  # ● 名称输入处理
  #--------------------------------------------------------------------------
  def command_303
    # 如果不是无效的角色
    if $data_actors[@parameters[0]] != nil
      # 设置战斗中断标志
      $game_temp.battle_abort = true
      # 设置名称输入调用标志
      $game_temp.name_calling = true
      $game_temp.name_actor_id = @parameters[0]
      $game_temp.name_max_char = @parameters[1]
    end
    # 推进索引
    @index += 1
    # 结束
    return false
  end
  #--------------------------------------------------------------------------
  # ● 增减 HP
  #--------------------------------------------------------------------------
  def command_311
    # 获取操作值
    value = operate_value(@parameters[1], @parameters[2], @parameters[3])
    # 处理重复
    iterate_actor(@parameters[0]) do |actor|
      # HP 不为 0 的情况下
      if actor.hp > 0
        # 更改 HP (如果不允许战斗不能的状态就设置为 1)
        if @parameters[4] == false and actor.hp + value <= 0
          actor.hp = 1
        else
          actor.hp += value
        end
      end
    end
    # 游戏结束判定
    $game_temp.gameover = $game_party.all_dead?
    # 继续
    return true
  end
  #--------------------------------------------------------------------------
  # ● 增减 SP
  #--------------------------------------------------------------------------
  def command_312
    # 获取操作值
    value = operate_value(@parameters[1], @parameters[2], @parameters[3])
    # 处理重复
    iterate_actor(@parameters[0]) do |actor|
      # 更改角色的 SP
      actor.sp += value
    end
    # 继续
    return true
  end
  #--------------------------------------------------------------------------
  # ● 更改状态
  #--------------------------------------------------------------------------
  def command_313
    # 处理重复
    iterate_actor(@parameters[0]) do |actor|
      # 更改状态
      if @parameters[1] == 0
        actor.add_state(@parameters[2])
      else
        actor.remove_state(@parameters[2])
      end
    end
    # 继续
    return true
  end
  #--------------------------------------------------------------------------
  # ● 全回复
  #--------------------------------------------------------------------------
  def command_314
    # 处理重复
    iterate_actor(@parameters[0]) do |actor|
      # 角色全回复
      actor.recover_all
    end
    # 继续
    return true
  end
  #--------------------------------------------------------------------------
  # ● 增减 EXP
  #--------------------------------------------------------------------------
  def command_315
    # 获取操作值
    value = operate_value(@parameters[1], @parameters[2], @parameters[3])
    # 处理重复
    iterate_actor(@parameters[0]) do |actor|
      # 更改角色 EXP
      actor.exp += value
    end
    # 继续
    return true
  end
  #--------------------------------------------------------------------------
  # ● 增减等级
  #--------------------------------------------------------------------------
  def command_316
    # 获取操作值
    value = operate_value(@parameters[1], @parameters[2], @parameters[3])
    # 处理重复
    iterate_actor(@parameters[0]) do |actor|
      # 更改角色的等级
      actor.level += value
    end
    # 继续
    return true
  end
  #--------------------------------------------------------------------------
  # ● 增减能力值
  #--------------------------------------------------------------------------
  def command_317
    # 获取操作值
    value = operate_value(@parameters[2], @parameters[3], @parameters[4])
    # 获取角色
    actor = $game_actors[@parameters[0]]
    # 更改能力值
    if actor != nil
      case @parameters[1]
      when 0  # MaxHP
        actor.maxhp += value
      when 1  # MaxSP
        actor.maxsp += value
      when 2  # 力量
        actor.str += value
      when 3  # 灵巧
        actor.dex += value
      when 4  # 速度
        actor.agi += value
      when 5  # 魔力
        actor.int += value
      end
    end
    # 继续
    return true
  end
  #--------------------------------------------------------------------------
  # ● 增减特技
  #--------------------------------------------------------------------------
  def command_318
    # 获取角色
    actor = $game_actors[@parameters[0]]
    # 增减特技
    if actor != nil
      if @parameters[1] == 0
        actor.learn_skill(@parameters[2])
      else
        actor.forget_skill(@parameters[2])
      end
    end
    # 继续
    return true
  end
  #--------------------------------------------------------------------------
  # ● 变更装备
  #--------------------------------------------------------------------------
  def command_319
    # 获取角色
    actor = $game_actors[@parameters[0]]
    # 变更角色
    if actor != nil
      actor.equip(@parameters[1], @parameters[2])
    end
    # 继续
    return true
  end
  #--------------------------------------------------------------------------
  # ● 更改角色的名字
  #--------------------------------------------------------------------------
  def command_320
    # 获取角色
    actor = $game_actors[@parameters[0]]
    # 更改名字
    if actor != nil
      actor.name = @parameters[1]
    end
    # 继续
    return true
  end
  #--------------------------------------------------------------------------
  # ● 更改角色的职业
  #--------------------------------------------------------------------------
  def command_321
    # 获取角色
    actor = $game_actors[@parameters[0]]
    # 更改职业
    if actor != nil
      actor.class_id = @parameters[1]
    end
    # 继续
    return true
  end
  #--------------------------------------------------------------------------
  # ● 更改角色的图形
  #--------------------------------------------------------------------------
  def command_322
    # 获取角色
    actor = $game_actors[@parameters[0]]
    # 更改图形
    if actor != nil
      actor.set_graphic(@parameters[1], @parameters[2],
        @parameters[3], @parameters[4])
    end
    # 刷新角色
    $game_player.refresh
    # 继续
    return true
  end
end
#==============================================================================
# ■ Interpreter (分割定义 7)
#------------------------------------------------------------------------------
# 　执行事件命令的解释器。本类在 Game_System 类
# 和 Game_Event 类的内部使用。
#==============================================================================

class Interpreter
  #--------------------------------------------------------------------------
  # ● 增减敌人的 HP
  #--------------------------------------------------------------------------
  def command_331
    # 获取操作值
    value = operate_value(@parameters[1], @parameters[2], @parameters[3])
    # 处理循环
    iterate_enemy(@parameters[0]) do |enemy|
      # HP 不为 0 的情况下
      if enemy.hp > 0
        # 更改 HP (如果不允许战斗不能的状态就设置为 1)
        if @parameters[4] == false and enemy.hp + value <= 0
          enemy.hp = 1
        else
          enemy.hp += value
        end
      end
    end
    # 继续
    return true
  end
  #--------------------------------------------------------------------------
  # ● 增减敌人的 SP
  #--------------------------------------------------------------------------
  def command_332
    # 获取操作值
    value = operate_value(@parameters[1], @parameters[2], @parameters[3])
    # 处理循环
    iterate_enemy(@parameters[0]) do |enemy|
      # 更改 SP
      enemy.sp += value
    end
    # 继续
    return true
  end
  #--------------------------------------------------------------------------
  # ● 更改敌人的状态
  #--------------------------------------------------------------------------
  def command_333
    # 处理循环
    iterate_enemy(@parameters[0]) do |enemy|
      # 状态选项 [当作 HP 为 0 的状态] 有效的情况下
      if $data_states[@parameters[2]].zero_hp
        # 清除不死身标志
        enemy.immortal = false
      end
      # 更改状态
      if @parameters[1] == 0
        enemy.add_state(@parameters[2])
      else
        enemy.remove_state(@parameters[2])
      end
    end
    # 继续
    return true
  end
  #--------------------------------------------------------------------------
  # ● 敌人的全回复
  #--------------------------------------------------------------------------
  def command_334
    # 处理循环
    iterate_enemy(@parameters[0]) do |enemy|
      # 全回复
      enemy.recover_all
    end
    # 继续
    return true
  end
  #--------------------------------------------------------------------------
  # ● 敌人出现
  #--------------------------------------------------------------------------
  def command_335
    # 获取敌人
    enemy = $game_troop.enemies[@parameters[0]]
    # 清除隐藏标志
    if enemy != nil
      enemy.hidden = false
    end
    # 继续
    return true
  end
  #--------------------------------------------------------------------------
  # ● 敌人变身
  #--------------------------------------------------------------------------
  def command_336
    # 获取敌人
    enemy = $game_troop.enemies[@parameters[0]]
    # 变身处理
    if enemy != nil
      enemy.transform(@parameters[1])
    end
    # 继续
    return true
  end
  #--------------------------------------------------------------------------
  # ● 显示动画
  #--------------------------------------------------------------------------
  def command_337
    # 处理循环
    iterate_battler(@parameters[0], @parameters[1]) do |battler|
      # 战斗者存在的情况下
      if battler.exist?
        # 设置动画 ID
        battler.animation_id = @parameters[2]
      end
    end
    # 继续
    return true
  end
  #--------------------------------------------------------------------------
  # ● 伤害处理
  #--------------------------------------------------------------------------
  def command_338
    # 获取操作值
    value = operate_value(0, @parameters[2], @parameters[3])
    # 处理循环
    iterate_battler(@parameters[0], @parameters[1]) do |battler|
      # 战斗者存在的情况下
      if battler.exist?
        # 更改 HP
        battler.hp -= value
        # 如果在战斗中
        if $game_temp.in_battle
          # 设置伤害
          battler.damage = value
          battler.damage_pop = true
        end
      end
    end
    # 继续
    return true
  end
  #--------------------------------------------------------------------------
  # ● 强制行动
  #--------------------------------------------------------------------------
  def command_339
    # 忽视是否在战斗中
    unless $game_temp.in_battle
      return true
    end
    # 忽视回合数为 0
    if $game_temp.battle_turn == 0
      return true
    end
    # 处理循环 (为了方便、不需要存在复数)
    iterate_battler(@parameters[0], @parameters[1]) do |battler|
      # 战斗者存在的情况下
      if battler.exist?
        # 设置行动
        battler.current_action.kind = @parameters[2]
        if battler.current_action.kind == 0
          battler.current_action.basic = @parameters[3]
        else
          battler.current_action.skill_id = @parameters[3]
        end
        # 设置行动对像
        if @parameters[4] == -2
          if battler.is_a?(Game_Enemy)
            battler.current_action.decide_last_target_for_enemy
          else
            battler.current_action.decide_last_target_for_actor
          end
        elsif @parameters[4] == -1
          if battler.is_a?(Game_Enemy)
            battler.current_action.decide_random_target_for_enemy
          else
            battler.current_action.decide_random_target_for_actor
          end
        elsif @parameters[4] >= 0
          battler.current_action.target_index = @parameters[4]
        end
        # 设置强制标志
        battler.current_action.forcing = true
        # 行动有效并且是 [立即执行] 的情况下
        if battler.current_action.valid? and @parameters[5] == 1
          # 设置强制对像的战斗者
          $game_temp.forcing_battler = battler
          # 推进索引
          @index += 1
          # 结束
          return false
        end
      end
    end
    # 继续
    return true
  end
  #--------------------------------------------------------------------------
  # ● 战斗中断
  #--------------------------------------------------------------------------
  def command_340
    # 设置战斗中断标志
    $game_temp.battle_abort = true
    # 推进索引
    @index += 1
    # 结束
    return false
  end
  #--------------------------------------------------------------------------
  # ● 调用菜单画面
  #--------------------------------------------------------------------------
  def command_351
    # 设置战斗中断标志
    $game_temp.battle_abort = true
    # 设置调用菜单标志
    $game_temp.menu_calling = true
    # 推进索引
    @index += 1
    # 结束
    return false
  end
  #--------------------------------------------------------------------------
  # ● 调用存档画面
  #--------------------------------------------------------------------------
  def command_352
    # 设置战斗中断标志
    $game_temp.battle_abort = true
    # 设置调用存档标志
    $game_temp.save_calling = true
    # 推进索引
    @index += 1
    # 结束
    return false
  end
  #--------------------------------------------------------------------------
  # ● 游戏结束
  #--------------------------------------------------------------------------
  def command_353
    # 设置游戏结束标志
    $game_temp.gameover = true
    # 结束
    return false
  end
  #--------------------------------------------------------------------------
  # ● 返回标题画面
  #--------------------------------------------------------------------------
  def command_354
    # 设置返回标题画面标志
    $game_temp.to_title = true
    # 结束
    return false
  end
  #--------------------------------------------------------------------------
  # ● 脚本
  #--------------------------------------------------------------------------
  def command_355
    # script 设置第一行
    script = @list[@index].parameters[0] + "\n"
    # 循环
    loop do
      # 下一个事件指令在脚本 2 行以上的情况下
      if @list[@index+1].code == 655
        # 添加到 script 2 行以后
        script += @list[@index+1].parameters[0] + "\n"
      # 事件指令不在脚本 2 行以上的情况下
      else
        # 中断循环
        break
      end
      # 推进索引
      @index += 1
    end
    # 评价
    result = eval(script)
    # 返回值为 false 的情况下
    if result == false
      # 结束
      return false
    end
    # 继续
    return true
  end
end
#==============================================================================
# ■ Scene_Title
#------------------------------------------------------------------------------
# 　处理标题画面的类。
#==============================================================================

class Scene_Title
  #--------------------------------------------------------------------------
  # ● 主处理
  #--------------------------------------------------------------------------
  def main
    # 战斗测试的情况下
    if $BTEST
      battle_test
      return
    end
    # 载入数据库
    $data_actors        = load_data("Data/Actors.rxdata")
    $data_classes       = load_data("Data/Classes.rxdata")
    $data_skills        = load_data("Data/Skills.rxdata")
    $data_items         = load_data("Data/Items.rxdata")
    $data_weapons       = load_data("Data/Weapons.rxdata")
    $data_armors        = load_data("Data/Armors.rxdata")
    $data_enemies       = load_data("Data/Enemies.rxdata")
    $data_troops        = load_data("Data/Troops.rxdata")
    $data_states        = load_data("Data/States.rxdata")
    $data_animations    = load_data("Data/Animations.rxdata")
    $data_tilesets      = load_data("Data/Tilesets.rxdata")
    $data_common_events = load_data("Data/CommonEvents.rxdata")
    $data_system        = load_data("Data/System.rxdata")
    $data_mapinfos      = load_data("Data/MapInfos.rxdata")
    # 生成系统对像
    $game_system = Game_System.new
    $bad_man_count=0
    $bad_man_turn=0
    $stone_tm=-180
    $data_enemies[125].lv=0
    $save_time=Graphics.frame_count/Graphics.frame_rate
    if FileTest.exist?("Gmud.sav")
      $game_temp = Game_Temp.new
      file=File.open("Gmud.sav", "rb")
      read_save_data(file)
      file.close     
      $save_time=Graphics.frame_count/Graphics.frame_rate
      p_time=($game_variables[157]-14)*6000+$game_variables[158]+1
      $game_variables[152]=Zlib.crc32($game_variables[19].to_s,51) if $game_variables[152]==0
      $game_variables[153]=$game_variables[20]+3 if $game_variables[153]==0
      $game_variables[151]=Zlib.crc32($game_party.gold.to_s,51) if $game_variables[151]==0
      $game_switches[3]=true
      if $game_variables[21]==3
        $game_actors[1].maxhp=$game_variables[24]/4+100+[($game_variables[157]-14)*20,300].min
        $game_actors[1].hp=$game_actors[1].maxhp if $game_actors[1].hp>$game_actors[1].maxhp
      end
      $game_party.lose_weapon(30,1) if $game_switches[101]==true and $game_party.weapon_number(30)>0
      # 还原 BGM、BGS
      $game_map.autoplay
      # 刷新地图 (执行并行事件)
      $game_map.update
      $scene=Scene_Map.new
    else
      $gender="男"
      $live=[]
      for i in 0..124
        $live.push true
      end
      $scene=Scene_Begin.new
    end
  end
  #--------------------------------------------------------------------------
  # ● 战斗测试
  #--------------------------------------------------------------------------
  def battle_test
    # 载入数据库 (战斗测试用)
    $data_actors        = load_data("Data/BT_Actors.rxdata")
    $data_classes       = load_data("Data/BT_Classes.rxdata")
    $data_skills        = load_data("Data/BT_Skills.rxdata")
    $data_items         = load_data("Data/BT_Items.rxdata")
    $data_weapons       = load_data("Data/BT_Weapons.rxdata")
    $data_armors        = load_data("Data/BT_Armors.rxdata")
    $data_enemies       = load_data("Data/BT_Enemies.rxdata")
    $data_troops        = load_data("Data/BT_Troops.rxdata")
    $data_states        = load_data("Data/BT_States.rxdata")
    $data_animations    = load_data("Data/BT_Animations.rxdata")
    $data_tilesets      = load_data("Data/BT_Tilesets.rxdata")
    $data_common_events = load_data("Data/BT_CommonEvents.rxdata")
    $data_system        = load_data("Data/BT_System.rxdata")
    # 重置测量游戏时间用的画面计数器
    Graphics.frame_count = 0
    # 生成各种游戏对像
    $game_temp          = Game_Temp.new
    $game_system        = Game_System.new
    $game_switches      = Game_Switches.new
    $game_variables     = Game_Variables.new
    $game_self_switches = Game_SelfSwitches.new
    $game_screen        = Game_Screen.new
    $game_actors        = Game_Actors.new
    $game_party         = Game_Party.new
    $game_troop         = Game_Troop.new
    $game_map           = Game_Map.new
    $game_player        = Game_Player.new
    # 设置战斗测试用同伴
    $game_party.setup_battle_test_members
    # 设置队伍 ID、可以逃走标志、战斗背景
    $game_temp.battle_troop_id = $data_system.test_troop_id
    $game_temp.battle_can_escape = true
    $game_map.battleback_name = $data_system.battleback_name
    # 演奏战斗开始 BGM
    $game_system.se_play($data_system.battle_start_se)
    # 演奏战斗 BGM
    $game_system.bgm_play($game_system.battle_bgm)
    # 切换到战斗画面
    $scene = Scene_Battle.new
  end
end
#----------------------------------------------------------------------------
# ■ Scene_Begin 开场
#----------------------------------------------------------------------------
class Scene_Begin
  CREDIT=<<_b_
111111111
_b_
end
class Scene_Begin
  def initialize(return_scene = nil)
    @sprite = Sprite.new
    @sprite.bitmap = Bitmap.new("Graphics/Pictures/BG.png")
    @sprite.x = 0
    @sprite.y = 0
    @tit=Sprite.new
    @tit.bitmap=Bitmap.new(640,24)
    color=Color.new(144,176,87)
    temp_rect=@tit.bitmap.rect
    n="===========================序幕==========================="
    @tit.bitmap.fill_rect(temp_rect,color)
    @tit.bitmap.font.color.set(0,0,0)
    @tit.bitmap.draw_text(0,0,640,24,n)
  end
  def scene_start
    credit_lines = CREDIT.split(/\n/)
    @credit_bitmap = Bitmap.new(640,32 * credit_lines.size)
    @credit_bitmap.font.color.set(0,0,0)
    credit_lines.each_index do |i|
      line = credit_lines[i]
      @credit_bitmap.draw_text(0,i * 32,640,32,line,1)
    end
    @credit_sprite = Sprite.new(Viewport.new(0,50,640,380))
    @credit_sprite.bitmap = @credit_bitmap
    @credit_sprite.oy = -430
    @frame_index = 0
    @last_flag = false
  end
  def scene_end
    @credit_bitmap.clear
    @credit_sprite.dispose
    @credit_bitmap.dispose
    @tit.bitmap.clear
    @tit.bitmap.dispose
    @tit.dispose
    @sprite.dispose
  end
  def last?
    return (@frame_index >= @credit_sprite.bitmap.height + 480)
  end
  def last
    if not @last_flag
      Audio.bgm_fade(3000)
      @last_flag = true
      @last_count = 0
    else
      @last_count += 1
    end
    if @last_count >= 15
      command_new_game
    end
  end
  def update
    @frame_index += 1
    return if cancel?
    last if last?
    @credit_sprite.oy += 1
  end
  def cancel?
    if Input.trigger?(Input::B)
      $scene = Scene_Create.new
      return true
    end
    return false
  end
  def main
    command_new_game
  end
end
def command_new_game
  Audio.bgm_stop
  Graphics.frame_count = 0
  $game_temp          = Game_Temp.new
  $game_system        = Game_System.new
  $game_switches      = Game_Switches.new
  $game_variables     = Game_Variables.new
  $game_self_switches = Game_SelfSwitches.new
  $game_screen        = Game_Screen.new
  $game_actors        = Game_Actors.new
  $game_party         = Game_Party.new
  $game_troop         = Game_Troop.new
  $game_map           = Game_Map.new
  $game_player        = Game_Player.new
  # 设置初期同伴位置
  $game_party.setup_starting_members
  # 设置初期位置的地图
  $game_map.setup($data_system.start_map_id)
  # 主角向初期位置移动
  $game_player.moveto($data_system.start_x, $data_system.start_y)
  # 刷新主角
  $game_player.refresh
  # 执行地图设置的 BGM 与 BGS 的自动切换
  $game_map.autoplay
  # 刷新地图 (执行并行事件)
  $game_map.update
  # 切换创建角色画面
  $scene = Scene_Create.new
end
#==============================================================================
# 本脚本来自www.66RPG.com，使用和转载请保留此信息
#============================================================================== 
#==============================================================================
# ■ Scene_Create
#------------------------------------------------------------------------------
# 　自定义创建一个新角色
#==============================================================================
class Scene_Create
  #--------------------------------------------------------------------------
  # ● 主处理
  #--------------------------------------------------------------------------
  def main
    # 生成索引
    @index = 0
    $game_variables[11] = 20
    $game_variables[12] = 20
    $game_variables[13] = 20
    $game_variables[14] = 20
    # 生成窗口
    @create_window = Window_Create.new
    @create_window.index = 0
    Audio.bgm_play("Audio/BGM/创建人物.mp3") 
    # 执行过渡
    Graphics.transition
    # 主循环
    loop do
      Graphics.frame_reset
      # 刷新游戏画面
      Graphics.update
      # 刷新输入情报
      Input.update
      # 刷新画面
      update
      # 如果画面被切换的话就中断循环
      if $scene != self
        break
      end
    end
    # 准备过渡
    Graphics.freeze
    # 释放窗口
    @create_window.dispose
  end
  #--------------------------------------------------------------------------
  # ● 选择退出
  #--------------------------------------------------------------------------
  def on_cancel
    # 播放取消SE
    $game_system.se_play($data_system.cancel_se)
    # 淡入淡出 BGM、BGS、ME
    Audio.bgm_fade(800)
    Audio.bgs_fade(800)
    Audio.me_fade(800)
    $scene = nil
  end
  #--------------------------------------------------------------------------
  # ● 改变角色名称
  #--------------------------------------------------------------------------
  def change_name
    if Input.trigger?(Input::C)
      $game_system.se_play($data_system.decision_se)
      $game_temp.name_actor_id = 1
      name_thread=Thread.new{ActorNameInput(1)}
      name_thread.exit
    end
  end
  #--------------------------------------------------------------------------
  # ● 改变角色性别
  #--------------------------------------------------------------------------
  def change_gender
    if $game_variables[11]>15
      $gender = "男"
    else
      $gender = "女"
    end    
  end
  #--------------------------------------------------------------------------
  # ● 改变角色膂力
  #--------------------------------------------------------------------------
  def change_a
    if Input.trigger?(Input::LEFT)
      $game_system.se_play($data_system.cursor_se)
      $game_variables[11] -= 1
      if $game_variables[11]<10
        $game_variables[11]=10
      end
      return
    elsif Input.trigger?(Input::RIGHT)
      if $game_variables[11]+$game_variables[12]+$game_variables[13]+$game_variables[14]<80
        $game_system.se_play($data_system.cursor_se)
        $game_variables[11] += 1
        if $game_variables[11]>30
          $game_variables[11]=30
        end
      else
        Audio.se_play("Audio/SE/Buzzer1.ogg")
      end
    end
  end
  #--------------------------------------------------------------------------
  # ● 改变角色敏捷
  #--------------------------------------------------------------------------
  def change_b
    if Input.trigger?(Input::LEFT)
      $game_system.se_play($data_system.cursor_se)
      $game_variables[12] -= 1
      if $game_variables[12]<10
        $game_variables[12]=10
      end
      return
    elsif Input.trigger?(Input::RIGHT)
      if $game_variables[11]+$game_variables[12]+$game_variables[13]+$game_variables[14]<80
        $game_system.se_play($data_system.cursor_se)
        $game_variables[12] += 1
        if $game_variables[12]>30
          $game_variables[12]=99999
        end
      else
        Audio.se_play("Audio/SE/Buzzer1.ogg")
      end
    end
  end
  #--------------------------------------------------------------------------
  # ● 改变角色悟性
  #--------------------------------------------------------------------------
  def change_c
    if Input.trigger?(Input::LEFT)
      $game_system.se_play($data_system.cursor_se)
      $game_variables[13] -= 1
      if $game_variables[13]<10
        $game_variables[13]=10
      end
      return
    elsif Input.trigger?(Input::RIGHT)
      if $game_variables[11]+$game_variables[12]+$game_variables[13]+$game_variables[14]<80
        $game_system.se_play($data_system.cursor_se)
        $game_variables[13] += 1
        if $game_variables[13]>30
          $game_variables[13]=30
        end
      else
       Audio.se_play("Audio/SE/Buzzer1.ogg")
      end
    end
  end
  #--------------------------------------------------------------------------
  # ● 改变角色根骨
  #--------------------------------------------------------------------------
  def change_d
    if Input.trigger?(Input::LEFT)
      $game_system.se_play($data_system.cursor_se)
      $game_variables[14] -= 1
      if $game_variables[14]<10
        $game_variables[14]=10
      end
      return
    elsif Input.trigger?(Input::RIGHT)
      if $game_variables[11]+$game_variables[12]+$game_variables[13]+$game_variables[14]<80
        $game_system.se_play($data_system.cursor_se)
        $game_variables[14] +=1
        if $game_variables[14]>30
          $game_variables[14]=30
        end
      else
        Audio.se_play("Audio/SE/Buzzer1.ogg")
      end
    end
  end
  #--------------------------------------------------------------------------
  # ● 创建完毕
  #--------------------------------------------------------------------------
  def create
    if Input.trigger?(Input::C)
      if ($game_variables[11]+$game_variables[12]+$game_variables[13]+$game_variables[14])!=80
        Audio.se_play("Audio/SE/Buzzer1.ogg")
        return
      end
      s=false
      for i in 1..143
        s=true if $game_party.actors[0].name ==$data_enemies[i].name
        break if s
      end
      for i in 0..7
        for j in 0..7
          s=true if $task1[0][i]+$task1[1][j]==$game_party.actors[0].name
          break if s
        end
      end
      s=true if $game_party.actors[0].name==""
      if s
        Audio.se_play("Audio/SE/Buzzer1.ogg")
        return
      end
      $scene = Scene_Map.new
    end
  end  
  #--------------------------------------------------------------------------
  # ● 控制处理
  #--------------------------------------------------------------------------
  def update_commands
    if Input.trigger?(Input::B)
      on_cancel
    elsif Input.trigger?(Input::UP)
      $game_system.se_play($data_system.cursor_se)
      @index = (@index + 6) % 7
      if @index==1
        @index=0
      end
      @create_window.index = @index
      return
    elsif Input.trigger?(Input::DOWN)
      $game_system.se_play($data_system.cursor_se)        
      @index = (@index + 1) % 7
      if @index==1
        @index=2
      end
      @create_window.index = @index
      return
    end
  end    
  #--------------------------------------------------------------------------
  # ● 刷新
  #--------------------------------------------------------------------------
  def update
    change_gender
    case @index    
    when 0
      change_name
    when 2
      change_a  
    when 3
      change_b
    when 4
      change_c
    when 5
      change_d
    when 6
      create
    end
    update_commands    
    @create_window.update
  end
end
#----------------------------------------------------------------------------
# ■ Scene_Finish 
#    结局字幕
#----------------------------------------------------------------------------
class Scene_Finish
  $credit=[]
  $credit[2]=<<_END_
道德和尚：你赢了。但是请施主记住，正义终将战胜邪恶。

只可惜你却看不到那一天了。                          
          
我慢慢走近，一刀劈了下去。                          

就象砍进棉花里，没有任何声音，道德和尚在一瞬间消失  

了。难道说。。。                                    

轰－！                                              

我惊异地发现，这一刀斩在了时空转换装置上。          
    
周围的景物在迅速的变更，感觉如同掉进了无尽的深渊。  
    
                    。。。。。。                     

_END_
  $credit[1]=<<_END_
东方求败：为了所谓的正义，可以不择手段吗？我只是做
    
了自己想做的事，我错了吗？倒是你，一直生活在正义的
    
阴影下，失去了自我，那才是可悲呢。                
    
住口！你这样的人也配谈正义吗？                    
    
东方求败：想杀人灭口吗？可惜我还不想死。再见了。  
    
不知什么时候东方求败打开了时空转换装置。看着他渐渐
    
变小的背影，我毫不犹豫地冲了上去。                
    
                    。。。。。。                    

_END_
  $credit[3]=<<_END_
我是谁：不要以为你真的打败了我，这只是剧情的安排。
    
其实还有两个更精采的结……                        
    
画外音：快下场！你已经说的够多了。                
    
我走到六芒星阵中央，按下了时空转换的按钮。        
    
                  。。。。。。                    
                      
_END_
end
class Scene_Finish
  def initialize(id,return_scene = nil)
    @id=id
    @sprite = Sprite.new
    @sprite.bitmap = Bitmap.new("Graphics/Pictures/BG.png")
    @sprite.x = 0
    @sprite.y = 0
    @tit=Sprite.new
    @tit.bitmap=Bitmap.new(640,24)
    color=Color.new(144,176,87)
    temp_rect=@tit.bitmap.rect
    n="                          *尾声*                          "
    @tit.bitmap.fill_rect(temp_rect,color)
    @tit.bitmap.font.color.set(0,0,0)
    @tit.bitmap.draw_text(0,0,640,24,n)
  end
  def scene_start
    credit_lines = $credit[@id].split(/\n/)
    @credit_bitmap = Bitmap.new(640,32 * credit_lines.size)
    @credit_bitmap.font.color.set(0,0,0)
    credit_lines.each_index do |i|
      line = credit_lines[i]
      @credit_bitmap.draw_text(0,i * 32,640,32,line,1)
    end
    @credit_sprite = Sprite.new(Viewport.new(0,50,640,380))
    @credit_sprite.bitmap = @credit_bitmap
    @credit_sprite.oy = -430
    @frame_index = 0
    @last_flag = false
  end
  def scene_end
    @credit_bitmap.clear
    @credit_sprite.dispose
    @credit_bitmap.dispose
    @tit.bitmap.clear
    @tit.bitmap.dispose
    @tit.dispose
    @sprite.dispose
  end
  def last?
    return (@frame_index >= @credit_sprite.bitmap.height + 480)
  end
  def last
    if not @last_flag
      @last_flag = true
      @last_count = 0
    else
      @last_count += 1
    end
    if @last_count >= 15
      @time=Graphics.frame_count/Graphics.frame_rate
      final_end
    end
  end
  def update
    @frame_index += 1
    last if last?
    @credit_sprite.oy += 1
  end
  def final_end
    window=Window_Base.new(0,0,640,480)
    window.contents=Bitmap.new(608,448)
    window.contents.font.color.set(0,0,0)
    window.contents.clear
    hour=@time/60/60
    min=@time/60%60
    sec=@time%60
    dead=0
    for i in 1..124
      dead+=1 if $live[i]==false
    end
    #普通菜鸟
    i=0
    #舞林高手，灌篮高手
    i=9 if $game_variables[155]>=5000 and $game_variables[156]<=$game_variables[155]
    i=10 if $game_variables[156]>=5000 and $game_variables[155]<=$game_variables[156]
    #神行太保
    i=2 if $game_variables[157]<20
    #浪子杀手
    i=1 if $game_variables[154]>47
    #冷血屠夫
    i=3 if dead>63
    #绝代佳人
    i=8 if $game_variables[22]+$game_variables[49]/10>47 and $gender=="女"
    #邪恶天使
    i=4 if i==8 and dead>63
    #无情名捕
    i=7 if $game_variables[159]>63
    #好好先生
    i=6 if $game_variables[159]==0 and dead==0
    #盖世大侠
    i=5 if $game_variables[160]==160
    time_string = sprintf("%02d:%02d:%02d", hour, min, sec)
    window.contents.draw_text(152,144,304,32,"时间："+time_string)
    window.contents.draw_text(152,176,304,32,"杀NPC数："+dead.to_s)
    window.contents.draw_text(152,208,304,32,"追杀数："+$game_variables[159].to_s)
    window.contents.draw_text(152,240,304,32,"名声："+$game_variables[160].to_s)
    window.contents.draw_text(152,272,304,32,"等级评定："+$end_com[i])
    loop do
      Graphics.update
      Input.update
      if Input.trigger?(Input::C)
        window.contents.clear
        break
      end
    end
    if rand(160)<$game_variables[160]
      enflag=1
    else
      enflag=2
    end
    window.contents.clear
    case enflag
    when 1
      window.contents.draw_text(32,128,576,32,"“喂，喂！醒醒！太阳都晒到屁股了。")
      window.contents.draw_text(32,160,576,32,"再不起床就要迟到啦。”")
      window.contents.draw_text(32,192,576,32,"？？？")
      window.contents.draw_text(32,224,576,32,"一阵忙乱之后。")
      window.contents.draw_text(32,256,576,32,"“有没有搞错？今天可是星期日啊！”")
      window.contents.draw_text(32,288,576,32,"。。。。。。")
    when 2
      window.contents.draw_text(32,128,576,32,"终于着陆了。眼前是一个嘈杂的市场。")
      window.contents.draw_text(32,160,576,32,"到处都是蓝眼睛白皮肤的外国人，而且装扮也很奇怪。")
      window.contents.draw_text(32,192,576,32,"“请问，这里是拍片现场吗？”")
      window.contents.draw_text(32,224,576,32,"“WHAT YOU SAY？”")
      window.contents.draw_text(32,256,576,32,"不会吧？竟然来到了中世纪的欧洲。")
      window.contents.draw_text(32,288,576,32,"MY GOD！")
    end
    loop do
      Graphics.update
      Input.update
      if Input.trigger?(Input::C)
        break
      end
    end
    window.contents.dispose
    window.dispose
    $scene=nil
  end
  def main
    scene_start
    Graphics.transition
    loop do
      Graphics.update
      Input.update
      update
      if $scene != self
        break
      end
    end
    Graphics.freeze
    scene_end
  end
end#==============================================================================
# ■ Scene_Map
#------------------------------------------------------------------------------
# 　处理地图画面的类。
#==============================================================================

class Scene_Map
  #--------------------------------------------------------------------------
  # ● 主处理
  #--------------------------------------------------------------------------
  def main
    # 生成活动块
    @spriteset = Spriteset_Map.new
    # 生成信息窗口
    @message_window = Window_Message.new
    # 执行过渡
    Graphics.transition
    # 主循环
    loop do
      display_mapname
      # 刷新游戏画面
      Graphics.update
      # 刷新输入信息
      Input.update
      # 刷新画面
      update
      # 如果画面切换的话就中断循环
      if $scene != self
        break
      end
    end
    # 准备过渡
    Graphics.freeze
    # 释放活动块
    @spriteset.dispose
    # 释放信息窗口
    @message_window.dispose
    # 标题画面切换中的情况下
    if $scene.is_a?(Scene_Title)
      # 淡入淡出画面
      Graphics.transition
      Graphics.freeze
    end
  end
  #--------------------------------------------------------------------------
  # ● 刷新画面
  #--------------------------------------------------------------------------
  def update
    # 循环
    loop do
      # 按照地图、实例、主角的顺序刷新
      # (本更新顺序不会在满足事件的执行条件下成为给予角色瞬间移动
      #  的机会的重要因素)
      $game_map.update
      @name.dispose if @name !=nil
      $game_system.map_interpreter.update
      $game_player.update
      # 系统 (计时器)、画面刷新
      $game_system.update
      $game_screen.update
      # 如果主角在场所移动中就中断循环
      unless $game_temp.player_transferring
        break
      end
      # 执行场所移动
      transfer_player
      # 处理过渡中的情况下、中断循环
      if $game_temp.transition_processing
        break
      end
    end
    # 刷新活动块
    @spriteset.update
    # 刷新信息窗口
    @message_window.update
    # 游戏结束的情况下
    if $game_temp.gameover
      # 切换的游戏结束画面
      $scene = Scene_Gameover.new
      return
    end
    # 返回标题画面的情况下
    if $game_temp.to_title
      # 切换到标题画面
      $scene = Scene_Title.new
      return
    end
    # 处理过渡中的情况下
    if $game_temp.transition_processing
      # 清除过渡处理中标志
      $game_temp.transition_processing = false
      # 执行过渡
      if $game_temp.transition_name == ""
        Graphics.transition(20)
      else
        Graphics.transition(40, "Graphics/Transitions/" +
          $game_temp.transition_name)
      end
    end
    # 显示信息窗口中的情况下
    if $game_temp.message_window_showing
      return
    end
    # 遇敌计数为 0 且、且遇敌列表不为空的情况下
    if $game_player.encounter_count == 0 and $game_map.encounter_list != []
      # 不是在事件执行中或者禁止遇敌中
      unless $game_system.map_interpreter.running? or
             $game_system.encounter_disabled
        # 确定队伍
        n = rand($game_map.encounter_list.size)
        troop_id = $game_map.encounter_list[n]
        # 队伍有效的话
        if $data_troops[troop_id] != nil
          # 设置调用战斗标志
          $game_temp.battle_calling = true
          $game_temp.battle_troop_id = troop_id
          $game_temp.battle_can_escape = true
          $game_temp.battle_can_lose = false
          $game_temp.battle_proc = nil
        end
      end
    end
    # 按下 B 键的情况下
    if Input.trigger?(Input::B)
      # 不是在事件执行中或菜单禁止中
      unless $game_system.map_interpreter.running? or
             $game_system.menu_disabled
        # 设置菜单调用标志以及 SE 演奏
        $game_temp.menu_calling = true
        $game_temp.menu_beep = true
      end
    end
    # 调试模式为 ON 并且按下 F9 键的情况下
    if $DEBUG and Input.press?(Input::F9)
      # 设置调用调试标志
      $game_temp.debug_calling = true
    end
    # 不在主角移动中的情况下
    unless $game_player.moving?
      # 执行各种画面的调用
      if $game_temp.battle_calling
        call_battle
      elsif $game_temp.shop_calling
        call_shop
      elsif $game_temp.name_calling
        call_name
      elsif $game_temp.menu_calling
        call_menu
      elsif $game_temp.save_calling
        call_save
      elsif $game_temp.debug_calling
        call_debug
      end
    end
  end
  #--------------------------------------------------------------------------
  # ● 调用战斗
  #--------------------------------------------------------------------------
  def call_battle
    # 清除战斗调用标志
    $game_temp.battle_calling = false
    # 清除菜单调用标志
    $game_temp.menu_calling = false
    $game_temp.menu_beep = false
    # 生成遇敌计数
    $game_player.make_encounter_count
    # 记忆地图 BGM 、停止 BGM
    $game_temp.map_bgm = $game_system.playing_bgm
    $game_system.bgm_stop
    # 演奏战斗开始 SE
    $game_system.se_play($data_system.battle_start_se)
    # 演奏战斗 BGM
    $game_system.bgm_play($game_system.battle_bgm)
    # 矫正主角姿势
    #$game_player.straighten
    # 切换到战斗画面
    $scene = Scene_Battle.new
  end
  #--------------------------------------------------------------------------
  # ● 调用商店
  #--------------------------------------------------------------------------
  def call_shop
    # 清除商店调用标志
    $game_temp.shop_calling = false
    # 矫正主角姿势
    #$game_player.straighten
    # 切换到商店画面
    $scene = Scene_Shop.new
  end
  #--------------------------------------------------------------------------
  # ● 调用名称输入
  #--------------------------------------------------------------------------
  def call_name
    # 清除调用名称输入标志
    $game_temp.name_calling = false
    # 矫正主角姿势
    #$game_player.straighten
    # 切换到名称输入画面
    $scene = Scene_Name.new
  end
  #--------------------------------------------------------------------------
  # ● 调用菜单
  #--------------------------------------------------------------------------
  def call_menu
    # 清除菜单调用标志
    $game_temp.menu_calling = false
    # 已经设置了菜单 SE 演奏标志的情况下
    if $game_temp.menu_beep
      # 演奏确定 SE
      $game_system.se_play($data_system.decision_se)
      # 清除菜单演奏 SE 标志
      $game_temp.menu_beep = false
    end
    # 矫正主角姿势
    #$game_player.straighten
    # 切换到菜单画面
    $scene = Scene_Menu.new
  end
  #--------------------------------------------------------------------------
  # ● 调用存档
  #--------------------------------------------------------------------------
  def call_save
    # 矫正主角姿势
    #$game_player.straighten
    # 切换到存档画面
    $scene = Scene_Save.new
  end
  #--------------------------------------------------------------------------
  # ● 调用调试
  #--------------------------------------------------------------------------
  def call_debug
    # 清除调用调试标志
    $game_temp.debug_calling = false
    # 演奏确定 SE
    $game_system.se_play($data_system.decision_se)
    # 矫正主角姿势
    $game_player.straighten
    # 切换到调试画面
    $scene = Scene_Debug.new
  end
  #--------------------------------------------------------------------------
  # ● 显示地图名
  #--------------------------------------------------------------------------
  def display_mapname
    id=$game_map.map_id
    return if id==2
    # 获取地图名
    n=$data_mapinfos[id].name
    # 生成显示视窗
    @name = Sprite.new
    @name.bitmap=Bitmap.new(n.size*8,24)
    # 设置背景色
    color=Color.new(144,176,87)
    temp_rect=@name.bitmap.rect
    # 填充
    @name.bitmap.fill_rect(temp_rect,color)
    @name.bitmap.font.color.set(0,0,0)
    # 描绘地图名
    @name.bitmap.draw_text(0, 0, n.size*12, 24, n)
  end
  #--------------------------------------------------------------------------
  # ● 主角的场所移动
  #--------------------------------------------------------------------------
  def transfer_player
    # 清除主角场所移动调试标志
    $game_temp.player_transferring = false
    # 移动目标与现在的地图有差异的情况下
    if $game_map.map_id != $game_temp.player_new_map_id
      # 设置新地图
      $game_map.setup($game_temp.player_new_map_id)
    end
    # 设置主角位置
    $game_player.moveto($game_temp.player_new_x, $game_temp.player_new_y)
    # 设置主角朝向
    case $game_temp.player_new_direction
    when 2  # 下
      $game_player.turn_down
    when 4  # 左
      $game_player.turn_left
    when 6  # 右
      $game_player.turn_right
    when 8  # 上
      $game_player.turn_up
    end
    # 矫正主角姿势
    $game_player.straighten
    # 刷新地图 (执行并行事件)
    $game_map.update
    # 在生成活动块
    @spriteset.dispose
    @spriteset = Spriteset_Map.new
    # 处理过渡中的情况下
    if $game_temp.transition_processing
      # 清除过渡处理中标志
      $game_temp.transition_processing = false
      # 执行过渡
      Graphics.transition(20)
    end
    # 执行地图设置的 BGM、BGS 的自动切换
    $game_map.autoplay
    # 设置画面
    Graphics.frame_reset
    # 刷新输入信息
    Input.update
  end
end
#==============================================================================
# ■ Scene_Menu
#------------------------------------------------------------------------------
# 　处理主菜单画面的类。
#==============================================================================
class Scene_Menu
  #--------------------------------------------------------------------------
  # ● 初始化对像
  #     menu_index : 命令光标的初期位置
  #--------------------------------------------------------------------------
  def initialize(menu_index = 0)
    @menu_index = menu_index
  end
  #--------------------------------------------------------------------------
  # ● 主处理
  #--------------------------------------------------------------------------
  def main
    # 生成命令窗口
    @screen = Spriteset_Map.new
    @command_window = Window_Command.new(640, ["查看","物品","技能","功能"],4)
    @command_window.index = @menu_index
    # 执行过渡
    Graphics.transition
    # 主循环
    loop do
      # 刷新游戏画面
      Graphics.update
      # 刷新输入信息
      Input.update
      # 刷新画面
      update
      # 如果切换画面就中断循环
      if $scene != self
        break
      end
    end
    # 准备过渡
    Graphics.freeze
    # 释放窗口
    @command_window.dispose
    @screen.dispose
  end
  #--------------------------------------------------------------------------
  # ● 刷新画面
  #--------------------------------------------------------------------------
  def update
    # 刷新窗口
    @command_window.update
    # 命令窗口被激活的情况下: 调用 update_command
    if @command_window.active
      update_command
      return
    end
  end
  #--------------------------------------------------------------------------
  # ● 刷新画面 (命令窗口被激活的情况下)
  #--------------------------------------------------------------------------
  def update_command
    # 按下 B 键的情况下
    if Input.trigger?(Input::B)
      # 演奏取消 SE
      $game_system.se_play($data_system.cancel_se)
      # 切换的地图画面
      $scene = Scene_Map.new
      return
    end
    # 按下 C 键的情况下
    if Input.trigger?(Input::C)
      # 命令窗口的光标位置分支
      case @command_window.index
      when 0  # 查看（状态）
        # 演奏确定 SE
        $game_system.se_play($data_system.decision_se)
        # 切换到物品画面
        $scene = Scene_Status.new(true)
      when 1  # 物品
        # 演奏确定 SE
        $game_system.se_play($data_system.decision_se)
        # 激活状态窗口
        $scene = Scene_Item.new(true)
      when 2  # 装备
        # 演奏确定 SE
        $game_system.se_play($data_system.decision_se)
        # 激活状态窗口
        $scene = Scene_Skill.new(true)
      when 3  # 功能
        # 演奏确定 SE
        $game_system.se_play($data_system.decision_se)
        # 切换到游戏结束画面
        $scene = Scene_End.new
      end
      return
    end
  end
end#==============================================================================
# ■ Scene_Item
#------------------------------------------------------------------------------
# 　处理物品画面的类。
#==============================================================================

class Scene_Item
  #--------------------------------------------------------------------------
  # ● 初始化对像
  #--------------------------------------------------------------------------
  def initialize(menu=false)
    @actor=$game_actors[1]
  end
  #--------------------------------------------------------------------------
  # ● 主处理
  #--------------------------------------------------------------------------
  def main
    draw_main_menu
    @screen = Spriteset_Map.new
    # 生成分类窗口
    @category_window=Window_Command.new(96,["食物","药物","武器","装备","其他","丢弃"],1)
    @category_window.x=0
    @category_window.y=64
    @category_window.index=0
    # 生成帮助窗口、物品窗口
    @help_window = Window_Help.new
    @help_window.y=416
    @item_window = Window_Item.new
    @item_window.y=64
    # 关联帮助窗口
    @item_window.help_window = @help_window
    @help_window.visible=false
    @item_window.active=false
    #@help_window.contents.clear
    @category_window.active=true
    # 执行过度
    Graphics.transition
    # 主循环
    loop do
      # 刷新游戏画面
      Graphics.update
      # 刷新输入信息
      Input.update
      # 刷新画面
      update
      # 如果画面切换就中断循环
      if $scene != self
        break
      end
    end
    # 装备过渡
    Graphics.freeze
    # 释放窗口
    @screen.dispose
    @category_window.dispose
    @help_window.dispose
    @item_window.dispose
    @top_menu.dispose
  end
  #--------------------------------------------------------------------------
  # ● 刷新画面
  #--------------------------------------------------------------------------
  def update
    # 刷新窗口
    @help_window.update
    @help_window.visible=false
    @category_window.update
    @item_window.category=@category_window.index
    @item_window.update
    @item_window.refresh
    update_item
  end
  #--------------------------------------------------------------------------
  # ● 刷新画面 (物品窗口被激活的情况下)
  #--------------------------------------------------------------------------
  def update_item
    if @category_window.active
      @item_window.category=@category_window.index
      @item_window.update
      if Input.trigger?(Input::B)
        # 演奏取消 SE
        $game_system.se_play($data_system.cancel_se)
        # 切换到菜单画面
        $scene = Scene_Menu.new(1)
        return
      end
      if Input.trigger?(Input::C)
        @category_window.active=false
        @item_window.active=true
        @item_window.index=0
        if @item_window.item==nil
          $game_system.se_play($data_system.buzzer_se)
          return_category
          return
        end
        $game_system.se_play($data_system.decision_se)
        @item_window.refresh
        @help_window.visible=true
      end
    else
      if @item_window.active
        # 按下 B 键的情况下
        if Input.trigger?(Input::B)
          # 演奏取消 SE
          $game_system.se_play($data_system.cancel_se)
          # 切换到分类
          return_category
          return
        end
        # 按下 C 键的情况下
        if Input.trigger?(Input::C)
          # 获取物品窗口当前选中的物品数据
          @item = @item_window.item
          # 武器窗口处理
          unless @category_window.index !=2
            equip_weapon
            return
          end
          # 装备窗口处理
          unless @category_window.index !=3
            equip_armor
            return
          end
          # 丢弃窗口处理
          unless @category_window.index !=5
            drop_item
            return
          end
          # 不能使用的情况下
          unless $game_party.item_can_use?(@item.id)
            # 演奏冻结 SE
            $game_system.se_play($data_system.buzzer_se)
            return
          end
          # 如果物品用完的情况下
          if $game_party.item_number(@item.id) == 0
            # 演奏冻结 SE
            $game_system.se_play($data_system.buzzer_se)
            return
          end
          # 演奏物品使用时的 SE
          $game_system.se_play(@item.menu_se)
          # 消耗品的情况下
          if @item.consumable
            # 使用的物品数减 1
            $game_party.lose_item(@item.id, 1)
            # 再描绘物品窗口的项目
            @item_window.draw_item(@item_window.index)
          end
          # 公共事件 ID 有效的情况下
          if @item.common_event_id > 0
            a=@item.common_event_id
            if (a>=19 and a<=22) or a==9
              # 预约调用公共事件
              $game_temp.common_event_id = a
              $scene=Scene_Map.new
            else
              common_event=Game_CommonEvent.new(@item.common_event_id)
              list=common_event.list
              event_interpreter=Interpreter.new
            end
            if event_interpreter != nil
              # 如果不是在执行中就设置
              unless event_interpreter.running?
                event_interpreter.setup(list, @item.common_event_id)
              end
              # 更新解释器
              event_interpreter.update
            end
          end
          return_category
        end
        return
      end
    end
  end
  #--------------------------------------------------------------------------
  # ● 返回分类
  #--------------------------------------------------------------------------
  def return_category
    @item_window.refresh
    @item_window.active=false
    @item_window.index=-1
    @category_window.active=true
    @help_window.visible=false
  end
  #--------------------------------------------------------------------------
  # ● 武器窗口
  #--------------------------------------------------------------------------
  def equip_weapon
    if $game_actors[1].weapon_id==@item.id
      @actor.equip(0,0)
    else
      @actor.equip(0,@item.id)
    end
    $game_system.se_play($data_system.equip_se)
    return_category
  end
  #--------------------------------------------------------------------------
  # ● 装备窗口
  #--------------------------------------------------------------------------
  def equip_armor
    if  $game_actors[1].armor_equiped?(@item.id)
      @actor.equip(@item.kind+1,0)
    else
      @actor.equip(@item.kind+1,@item.id)
    end
    $game_system.se_play($data_system.equip_se)
    #@item_window.draw_item(@item_window.index)
    return_category
  end
  #--------------------------------------------------------------------------
  # ● 丢弃物品
  #--------------------------------------------------------------------------
  def drop_item
    $game_system.se_play($data_system.decision_se)
    id=@item.id
    case @item
    when RPG::Item
      $game_party.gain_item(id,-99)
    when RPG::Weapon
      if $game_actors[1].weapon_id==id 
        $game_party.gain_weapon(id,1-$game_party.weapon_number(id))
      else
        $game_party.gain_weapon(id,-99)
      end
    when RPG::Armor
      if $game_actors[1].armor_equiped?(id)
        $game_party.gain_armor(id,1-$game_party.armor_number(id))
      else
        $game_party.gain_armor(id,-99)
      end
    end
    $game_system.se_play($data_system.decision_se)
    @item_window.draw_item(@item_window.index)
    return_category
  end
end#==============================================================================
# ■ Scene_Skill
#------------------------------------------------------------------------------
# 　处理特技画面的类。
#==============================================================================

class Scene_Skill
  #--------------------------------------------------------------------------
  # ● 初始化对像
  #     actor_index : 角色索引
  #--------------------------------------------------------------------------
  def initialize(menu=false)
    @menu=menu
    @actor=$game_actors[1]
  end
  #--------------------------------------------------------------------------
  # ● 主处理
  #--------------------------------------------------------------------------
  def main
    draw_main_menu
    @screen = Spriteset_Map.new
    # 生成窗口
    @help_window=Window_Help.new
    @help_window.x=96
    @help_window.y=416
    @help_window.width=544
    @category_window=Window_Command.new(96,["拳脚","兵刃","轻功","内功","招架","知识"],1)
    @category_window.x=0
    @category_window.y=64
    @category_window.index=0
    @item_window=Window_Skill.new
    # 关联帮助窗口
    @item_window.help_window = @help_window
    @item_window.active=false
    @help_window.visible=false
    @category_window.active=true
    # 执行过度
    Graphics.transition
    # 主循环
    loop do
      # 刷新游戏画面
      Graphics.update
      # 刷新输入信息
      Input.update
      # 刷新画面
      update
      # 如果画面切换就中断循环
      if $scene != self
        break
      end
    end
    # 装备过渡
    Graphics.freeze
    # 释放窗口
    @screen.dispose
    @category_window.dispose
    @help_window.dispose
    @item_window.dispose
    @top_menu.dispose
  end
  #--------------------------------------------------------------------------
  # ● 刷新画面
  #--------------------------------------------------------------------------
  def update
    # 刷新窗口
    @help_window.update
    @help_window.visible=false
    @category_window.update
    @item_window.category=@category_window.index
    @item_window.update
    @item_window.refresh
    update_item
  end
  #--------------------------------------------------------------------------
  # ● 返回分类
  #--------------------------------------------------------------------------
  def return_category
    @item_window.refresh
    @item_window.active=false
    @item_window.index=-1
    @category_window.active=true
    @help_window.visible=false
  end
  #--------------------------------------------------------------------------
  # ● 刷新画面 (物品窗口被激活的情况下)
  #--------------------------------------------------------------------------
  def update_item
    if @category_window.active
      @item_window.category=@category_window.index
      @item_window.update
      if Input.trigger?(Input::B)
        # 演奏取消 SE
        $game_system.se_play($data_system.cancel_se)
        # 切换到菜单画面
        $scene = Scene_Menu.new(2)
        return
      end
      if Input.trigger?(Input::C)
        @category_window.active=false
        @item_window.active=true
        @item_window.index=0
        if @item_window.item==nil
          $game_system.se_play($data_system.buzzer_se)
          return_category
          return
        end
        $game_system.se_play($data_system.decision_se)
        @help_window.visible=true
      end
    else
      if @item_window.active
        # 按下 B 键的情况下
        if Input.trigger?(Input::B)
          # 演奏取消 SE
          $game_system.se_play($data_system.cancel_se)
          # 切换到分类
          return_category
          @item_window.refresh
          return
        end
        # 按下 C 键的情况下
        if Input.trigger?(Input::C)
          # 获取物品窗口当前选中的物品数据
          @item = @item_window.item
          if @category_window.index==5 or $data_system.variables[@item]["基本"] != nil
            $game_system.se_play($data_system.buzzer_se)
            return
          end
          # 演奏装备 SE
          $game_system.se_play($data_system.equip_se)
          if @item==$game_variables[29+@category_window.index]
            $game_variables[29+@category_window.index]=0
          else
            $game_variables[29+@category_window.index]=@item
          end
          return_category
          return
        end
      end
    end
  end
end
          #==============================================================================
# ■ Scene_Status
#------------------------------------------------------------------------------
# 　处理状态画面的类。
#==============================================================================

class Scene_Status
  #--------------------------------------------------------------------------
  # ● 初始化对像
  #     actor_index : 角色索引
  #--------------------------------------------------------------------------
  def initialize(menu=false,actor_index = 0, equip_index = 0)
    @menu=menu
    @actor_index = actor_index
    @menu_index=0
  end
  #--------------------------------------------------------------------------
  # ● 主处理
  #--------------------------------------------------------------------------
  def main
    @screen = Spriteset_Map.new
    draw_main_menu
    # 获取角色
    @actor = $game_party.actors[0]
    # 生成状态窗口
    @look_window= Window_Command.new(396,["状态","描述","属性"],3)
    @look_window.x=122
    @look_window.y=64
    @look_window.index = @menu_index
    @status_window = Window_Status.new(@actor)
    @status_window.y=128
    # 执行过渡
    Graphics.transition
    # 主循环
    loop do
      # 刷新游戏画面
      Graphics.update
      # 刷新输入信息
      Input.update
      # 刷新画面
      $game_system.update
      update
      # 如果画面被切换的话就中断循环
      if $scene != self
        break
      end
    end
    # 准备过渡
    Graphics.freeze
    # 释放窗口
    @screen.dispose
    @top_menu.dispose
    @status_window.dispose
    @look_window.dispose
  end
  #--------------------------------------------------------------------------
  # ● 刷新画面
  #--------------------------------------------------------------------------
  def update
    @look_window.update
    if @look_window.active
      # 按下 B 键的情况下
      if Input.trigger?(Input::B)
        # 演奏取消 SE
        $game_system.se_play($data_system.cancel_se)
        if @menu
          $scene = Scene_Menu.new(0)
          return
        else
          $scene = Scene_Map.new
          return
        end
      else
        case @look_window.index
        when 0
          @status_window.look0
        when 1
          @status_window.look1
        when 2
          @status_window.look2
        end
      end
    end
    return
  end
endclass Scene_ThrowBall
  def main
    Audio.bgm_play("Audio/BGM/投篮.mp3",100,100)
    @score=0
    @dir=1 #1:right 2:left
    @step=1
    @ball_x=114
    @other_ball_x=155
    @other_ball_y=220
    @help_window = Window_Help.new
    @help_window.y=416
    #@help_window.opacity=160
    @char_pic=Bitmap.new("Graphics/Characters/"+$game_party.actors[0].character_name)
    ch = @char_pic.rect.height / 4
    @right_char_rect=Rect.new(0,2*ch,@char_pic.rect.width / 4,ch)
    @main_window=Window_Base.new(0,0,640,416)
    @main_window.contents=Bitmap.new(608,384)
    @main_window.contents.font.color.set(0,0,0)
    @wrong=0
    Graphics.frame_rate = 40
    Graphics.transition
    loop do
      Graphics.update
      Input.update
      update
      if $scene != self
        break
      end
    end
    #Detect.make_snapshot
    Graphics.freeze
    Graphics.frame_rate = 40
    @main_window.dispose
    @help_window.dispose
  end
  def update
    @main_window.contents.clear
    update_main
    if Input.trigger?(Input::B)
      Audio.bgm_stop
      $scene = Scene_Map.new
      Audio.bgm_play("Audio/BGM/失落的世界1.mp3",100,100)
      return
    end
    if Input.trigger?(Input::C)
      case @step
      when 1
        @step=2
      when 2
        if @ball_x>107 and @ball_x<121
          @step=3
          @score+=10
        else
          @step=1
          @ball_x=114
          @wrong +=1
          for i in 0..10
            Graphics.update
          end
          if @wrong==7
            Audio.bgm_stop
            $scene = Scene_Map.new
            Audio.bgm_play("Audio/BGM/失落的世界1.mp3",100,100)
            return
          end
        end
      end
    end
    $game_variables[156]=@score if $game_variables[156]<@score
    update_score
  end
  def update_score
    @help_window.set_text("SCORE:"+@score.to_s+"    TOP:"+
      $game_variables[156].to_s,1)
  end
  def update_main
    draw_frame
    update_ball
  end
  def draw_frame
    @main_window.contents.fill_rect(450, 100, 2, 210,Color.new(0,0,0))
    @main_window.contents.fill_rect(400, 85, 2, 60,Color.new(0,0,0))
    @main_window.contents.fill_rect(400, 105, 50, 1,Color.new(0,0,0))
    @main_window.contents.fill_rect(400, 135, 50, 1,Color.new(0,0,0))
    @main_window.contents.fill_rect(370, 125, 30, 1,Color.new(0,0,0))
    @main_window.contents.fill_rect(375, 135, 20, 1,Color.new(0,0,0))
    @main_window.contents.fill_rect(375, 125, 1, 17,Color.new(0,0,0))
    @main_window.contents.fill_rect(395, 125, 1, 17,Color.new(0,0,0))
    @main_window.contents.fill_rect(20, 310, 568, 1,Color.new(0,0,0))
    @main_window.contents.blt(125,265,@char_pic,@right_char_rect)
    @main_window.contents.fill_rect(50, 60, 150, 1,Color.new(0,0,0))
    @main_window.contents.fill_rect(50, 83, 150, 1,Color.new(0,0,0))
    @main_window.contents.fill_rect(50, 60, 1, 23,Color.new(0,0,0))
    @main_window.contents.fill_rect(200, 60, 1, 24,Color.new(0,0,0))
    @main_window.contents.fill_rect(115, 83, 1, 5,Color.new(0,0,0))
    @main_window.contents.fill_rect(135, 83, 1, 5,Color.new(0,0,0))
  end
  def update_ball
    case @step
    when 1
      @other_ball_x=155
      @ball_x=114
      @main_window.contents.draw_text(@ball_x,56,32,32,"◎")
      @main_window.contents.draw_text(@other_ball_x,283,32,32,"◎")
    when 2
      case @dir
      when 1
        @ball_x+=rand(4)+1
        @dir=2 if @ball_x>=178
      when 2
        @ball_x-=rand(4)+1
        @dir=1 if @ball_x<=53
      end
      @main_window.contents.draw_text(@ball_x,56,32,32,"◎")
      @main_window.contents.draw_text(@other_ball_x,283,32,32,"◎")
    when 3
      @main_window.contents.draw_text(@ball_x,56,32,32,"◎")
      y=get_ball_y
      @main_window.contents.draw_text(@other_ball_x,y,32,32,"◎")
      @other_ball_x+=2 if @other_ball_x<375
      #@main_window.contents.draw_text(375,100,32,32,"◎")
    end
  end
  def get_ball_y
    if @other_ball_x==155
      @other_ball_y=100
      return 283
    end
    if @other_ball_x==375
      @other_ball_y+=2
      @step=1 if @other_ball_y>=283
      return @other_ball_y
    end
    ss=(375-@other_ball_x)**2
    ss*=0.004162330905
    return ss+95
  end
endclass Scene_Dance
  def initialize
    $game_temp.map_bgm = $game_system.playing_bgm
    Audio.bgs_stop
  end
  def main
    @count=0
    @hit=false
    @score=0
    @help_window = Window_Help.new
    @help_window.y=416
    @backgound=Sprite.new
    @backgound.bitmap = Bitmap.new("Graphics/Pictures/BG")
    @char_pic=$game_party.actors[0].character_name
    @dir_window=Window_Base.new(0,0,640,96)
    @dir_window.contents=Bitmap.new(608,64)
    @char_window=Window_Base.new(320,96,320,320)
    @char_window.contents=Bitmap.new(288,288)
    @pad_window=Window_Base.new(0,96,320,320)
    @pad_window.contents=Bitmap.new(288,288)
    bitmap = RPG::Cache.picture("PAD")
    @pad_window.contents.blt(98, 98, bitmap, Rect.new(0, 0, 93, 93),255)
    @char_pic=Bitmap.new("Graphics/Characters/"+@char_pic)
    cw = @char_pic.rect.width / 4
    ch = @char_pic.rect.height / 4
    @up_char_rect=Rect.new(3*cw,3*ch,cw,ch)
    @left_char_rect=Rect.new(cw,ch,cw,ch)
    @right_char_rect=Rect.new(cw,2*ch,cw,ch)
    @down_char_rect=Rect.new(0,0,cw,ch)
    @dir_pic=Bitmap.new("Graphics/Pictures/Dir")
    @last_rect=@down_char_rect
    Graphics.frame_rate =40
    Audio.bgm_play("Audio/BGM/跳舞.mp3",100,100)
    # 执行过渡
    Graphics.transition
    # 主循环
    loop do
      # 刷新游戏画面
      Graphics.update
      # 刷新输入情报
      Input.update
      # 刷新画面
      update
      # 如果画面切换的话就中断循环
      if $scene != self
        break
      end
    end
    # 准备过渡
    #Detect.make_snapshot
    Graphics.freeze
    Graphics.frame_rate =40
    # 释放窗口
    @help_window.dispose
    @backgound.bitmap.dispose
    @backgound.dispose
    @pad_window.dispose
    @char_window.dispose
    @dir_window.dispose
  end
  def update_score
    @help_window.set_text("SCORE:"+@score.to_s+"    TOP:"+
      $game_variables[155].to_s,1)
  end
  def update
    if @count==0
      make_new_dir
    else
      @count-=1
    end
    if Input.trigger?(Input::B)
      Audio.bgm_stop
      $scene = Scene_Map.new
      Audio.bgm_play("Audio/BGM/失落的世界1.mp3",100,100)
      return
    end
    update_dir
    update_char
    if Input.repeat?(Input::LEFT)
      if @char_status==0 and @count>4
        @char_status=1
        @char_status_count=28
        if @dir==1
          @score+=3 
        else
          Audio.bgm_stop
          $scene = Scene_Map.new
          Audio.bgm_play("Audio/BGM/失落的世界1.mp3",100,100)
          return
        end
      end
    end
    if Input.repeat?(Input::UP)
      if @char_status==0 and @count>4
        @char_status=2
        @char_status_count=28
        if @dir==2
          @score+=3 
        else
          Audio.bgm_stop
          $scene = Scene_Map.new
          Audio.bgm_play("Audio/BGM/失落的世界1.mp3",100,100)
          return
        end
      end
    end
    if Input.repeat?(Input::DOWN)
      if @char_status==0 and @count>4
        @char_status=3
        @char_status_count=28
        if @dir==3
          @score+=3 
        else
          Audio.bgm_stop
          $scene = Scene_Map.new
          Audio.bgm_play("Audio/BGM/失落的世界1.mp3",100,100)
          return
        end
      end
    end
    if Input.repeat?(Input::RIGHT)
      if @char_status==0 and @count>4
        @char_status=4
        @char_status_count=28
        if @dir==4
          @score+=3
        else
          Audio.bgm_stop
          $scene = Scene_Map.new
          Audio.bgm_play("Audio/BGM/失落的世界1.mp3",100,100)
          return
        end
      end
    end
    $game_variables[155]=@score if @score>$game_variables[155]
    update_score
  end
  def update_dir
    @dir_window.contents.clear
    case @dir
    #left
    when 1
      @dir_window.contents.blt(39,10,@dir_pic,Rect.new(31,0,31,31))
    #up
    when 2
      @dir_window.contents.blt(192,10,@dir_pic,Rect.new(0,0,31,31))
    #down
    when 3
      @dir_window.contents.blt(343,10,@dir_pic,Rect.new(62,0,31,31))
    #right
    when 4
      @dir_window.contents.blt(495,10,@dir_pic,Rect.new(93,0,31,31))
    end
  end
  def update_char
    @char_window.contents.clear
    @char_window.contents.fill_rect(20, 220, 288, 1,Color.new(0,0,0))
    if @char_status_count >0
      #@char_status=0
    #else
      @char_status_count-=1
    end
    case @char_status
    when 0
      @char_window.contents.blt(144,175,@char_pic,@last_rect)
    when 1
      @char_window.contents.blt(144,175,@char_pic,@left_char_rect)
      @last_rect=@left_char_rect
    when 2
      @char_window.contents.blt(144,175,@char_pic,@up_char_rect)
      @last_rect=@up_char_rect
    when 3
      @char_window.contents.blt(144,175,@char_pic,@down_char_rect)
      @last_rect=@down_char_rect
    when 4
      @char_window.contents.blt(144,175,@char_pic,@right_char_rect)
      @last_rect=@right_char_rect
    end
  end
  def make_new_dir
    new_dir=@dir
    while new_dir==@dir
      new_dir=rand(4)+1
    end
    @dir=new_dir
    @count=28
    @char_status=0
    @char_status_count=0
  end
end#==============================================================================
# ■ Scene_End
#------------------------------------------------------------------------------
# 　处理游戏结束画面的类。
#==============================================================================

class Scene_End
  #--------------------------------------------------------------------------
  # ● 初始化对像
  #     menu_index : 命令光标的初期位置
  #--------------------------------------------------------------------------
  def initialize(menu_index = 0)
    @menu_index = menu_index
  end
  #--------------------------------------------------------------------------
  # ● 主处理
  #--------------------------------------------------------------------------
  def main
    @screen = Spriteset_Map.new
    draw_main_menu
    @help_window=Window_Help.new
    @help_window.width=416
    @help_window.height=64
    @help_window.contents=Bitmap.new(384,32)
    @help_window.x=112
    @help_window.y=176
    @help_window.z=500
    @help_window.visible=false
    @yesno=Window_Command.new(416,["确定","放弃"],2)
    @yesno.x=112
    @yesno.y=240
    @yesno.z=500
    @yesno.visible=false
    @yesno.active=false
    @yesno2=Window_Command.new(416,["确定","放弃"],2)
    @yesno2.x=112
    @yesno2.y=240
    @yesno2.z=500
    @yesno2.visible=false
    @yesno2.active=false
    # 生成命令窗口
    @command_window = Window_Command.new(96, ["内力","练功","存档","结束"],1)
    @command_window.x = 624 - @command_window.width
    @command_window.y = 64
    @command_window.index = @menu_index
    # 执行过渡
    Graphics.transition
    # 主循环
    loop do
      # 刷新游戏画面
      Graphics.update
      # 刷新输入情报
      Input.update
      # 刷新画面
      update
      # 如果画面切换的话就中断循环
      if $scene != self
        break
      end
    end
    # 准备过渡
    Graphics.freeze
    # 释放窗口
    @command_window.dispose
    @help_window.dispose
    @yesno.dispose
    @yesno2.dispose
    @top_menu.dispose
    @screen.dispose
    # 如果在标题画面切换中的情况下
    if $scene.is_a?(Scene_Title)
      # 淡入淡出画面
      Graphics.transition
      Graphics.freeze
    end
  end
  #--------------------------------------------------------------------------
  # ● 刷新画面
  #--------------------------------------------------------------------------
  def update
    # 刷新命令窗口
    @command_window.update
    # 按下 B 键的情况下
    if Input.trigger?(Input::B)
      # 演奏取消 SE
      $game_system.se_play($data_system.cancel_se)
      # 切换到菜单画面
      $scene = Scene_Menu.new(3)
      return
    end
    # 按下 C 键的场合下
    if Input.trigger?(Input::C)
      # 命令窗口光标位置分支
      case @command_window.index
      when 2
        # 禁止存档的情况下
        if $game_system.save_disabled
          # 演奏冻结 SE
          $game_system.se_play($data_system.buzzer_se)
          return
        end
        # 演奏确定 SE
        $game_system.se_play($data_system.decision_se)
        # 切换到存档画面
        command_save_file
      when 0  #内力
        # 演奏确定 SE
        $game_system.se_play($data_system.decision_se)
        # 切换到游戏结束画面
        $scene = Scene_FP.new(true)
      when 1  # 练功
        for i in 29..31
          if $game_variables[$game_variables[i]]>0
            $game_system.se_play($data_system.decision_se)
            $scene = Scene_Practice.new(true)
            return
          end
        end
        $game_system.se_play($data_system.buzzer_se)
        return
      when 3  # 退出
        # 演奏确定 SE
        $game_system.se_play($data_system.decision_se)
        @help_window.set_text("真的退出游戏吗？")
        @help_window.visible=true
        @command_window.visible=false
        @yesno.visible=true
        @yesno.active=true
        # 主循环
        loop do
          # 刷新游戏画面
          Graphics.update
          # 刷新输入情报
          Input.update
          @yesno.update
          # 按下 B 键的情况下
          if Input.trigger?(Input::B)
            # 演奏取消 SE
            $game_system.se_play($data_system.cancel_se)
            # 切换到菜单画面
            $scene = Scene_Menu.new(3)
            break
            return
          end
          if Input.trigger?(Input::C)
            # 演奏确定 SE
            $game_system.se_play($data_system.decision_se)
            case @yesno.index
            when 0
              stime=Graphics.frame_count/Graphics.frame_rate
              if stime-$save_time>600
                @help_window.set_text("你已经好久没存档了，现在保存吗？")
                @yesno.visible=false
                @yesno.active=false
                @yesno2.visible=true
                @yesno2.active=true
                # 主循环
                loop do
                  # 刷新游戏画面
                  Graphics.update
                  # 刷新输入情报
                  Input.update
                  @yesno2.update
                  # 按下 B 键的情况下
                  if Input.trigger?(Input::B)
                    # 演奏取消 SE
                    $game_system.se_play($data_system.cancel_se)
                    # 切换到菜单画面
                    $scene = Scene_Menu.new(3)
                    break
                    return
                  end
                  if Input.trigger?(Input::C)
                    # 演奏确定 SE
                    $game_system.se_play($data_system.decision_se)
                    case @yesno2.index
                    when 0
                      file = File.open("Gmud.sav", "wb")
                      write_save_data(file)
                      file.close
                      command_to_title
                      break
                    when 1
                      command_to_title
                      break
                    end
                  end
                end
                break
                return
              else
                command_to_title
                break
              end
            when 1
              # 演奏取消 SE
              $game_system.se_play($data_system.cancel_se)
              @help_window.visible=false
              @yesno.visible=false
              @yesno.active=false
              # 切换到菜单画面
              $scene = Scene_Menu.new(3)
              break
              return
            end
          end
        end
      end
      return
    end
  end
  
  #--------------------------------------------------------------------------
  # ● 选择命令 [返回标题画面] 时的处理
  #--------------------------------------------------------------------------
  def command_to_title
    # 演奏确定 SE
    $game_system.se_play($data_system.decision_se)
    # 淡入淡出 BGM、BGS、ME
    Audio.bgm_fade(800)
    Audio.bgs_fade(800)
    Audio.me_fade(800)
    # 切换到标题画面
    $scene = nil
  end
  def command_save_file
    file = File.open("Gmud.sav", "wb")
    write_save_data(file)
    file.close
    $save_time=Graphics.frame_count/Graphics.frame_rate
    save_msg
    return
  end
  #显示存档成功
  def save_msg
    good=Window_Base.new(376,128,152,64)
    good.contents=Bitmap.new(120,32)
    good.contents.font.size = 24
    good.contents.font.color.set(0,0,0)
    good.contents.draw_text(0,0,120,32,"存档成功！",1)
    # 演奏读档 SE
    $game_system.se_play($data_system.save_se)
    for i in 0..50
      Graphics.update
    end
    good.dispose
    $scene=Scene_Menu.new(3)
  end

  #--------------------------------------------------------------------------
  # ● 生成文件名
  #     file_index : 文件名的索引 (0～3)
  #--------------------------------------------------------------------------
  def make_filename(file_index)
    return "Gmud.sav"
  end
end
#==============================================================================
# ■ Scene_FP
#------------------------------------------------------------------------------
# 　处理内力画面的类。
#==============================================================================
class Scene_FP
  def initialize(menu=false)
    @menu=menu
  end
  #--------------------------------------------------------------------------
  # ● 主处理
  #--------------------------------------------------------------------------
  def main
    @screen = Spriteset_Map.new
    @command_window = Window_Command.new(96, ["打坐","加力","吸气","疗伤"],1)
    @command_window.x = 538 - @command_window.width
    @command_window.y=64
    @info = Window_Base.new(80,304,480,160)
    @info.contents = Bitmap.new(@info.width - 32, @info.height - 32)
    @info.contents.font.color=Color.new(0, 0, 0, 255)
    @info.visible=false
    Graphics.transition
    loop do
      Graphics.update
      Input.update
      $game_system.update
      update
      if $scene != self
        break
      end
    end
    Graphics.freeze    
    @command_window.dispose
    @info.dispose
    @screen.dispose
  end
  #--------------------------------------------------------------------------
  # ● 刷新画面
  #--------------------------------------------------------------------------
  def update
    @command_window.update
    if @command_window.active
      update_command
      return
    end
  end
  #--------------------------------------------------------------------------
  # ● 刷新画面 (命令窗口被激活的情况下)
  #--------------------------------------------------------------------------
  def update_command
    if Input.trigger?(Input::B)
      $game_system.se_play($data_system.cancel_se)
      if @menu
        $scene = Scene_Menu.new(3)
        return
      else 
        $scene = Scene_Map.new
        return
      end
    end
    if Input.trigger?(Input::C)
      if $game_variables[32]==nil or $game_variables[32]==0
        draw_disable
        return
      end
      case @command_window.index
      when 0
        Graphics.frame_rate =120
        $game_system.se_play($data_system.decision_se)
        $game_switches[3]=false
        dazuo($game_party.actors[0])
        Graphics.frame_rate =40
      when 1
        $game_system.se_play($data_system.decision_se)
        plus
      when 2
        $game_system.se_play($data_system.decision_se)
        hp_max($game_party.actors[0])
      when 3
        $game_system.se_play($data_system.decision_se)
        recover($game_party.actors[0])
      end
      return
    end
  end
  def draw_disable
    @info.draw_words("请先选择你所要使用的内功心法！")
    @info.visible=true
    for i in 0..40
      Graphics.update
    end
    @info.visible=false
    return
  end
  def dazuo(actor)
    ex=Window_Base.new(160,400,352,64)
    ex.contents=Bitmap.new(320,32)
    age = $game_variables[157] - 14
    #age =[age,8].min
    lv_max=$game_variables[45]/2*10+$game_variables[$game_variables[32]]*10
    lv_max+=$game_variables[19]/1000
    lv_max+=[20*age,920].min
    lv_max=[lv_max,65535].min
    ex.contents.font.color = Color.new(0, 0, 0, 255)
    loop do
      Input.update
      if Input.trigger?(Input::B)
        break
      end
      step=$game_variables[45]*7+$game_variables[$game_variables[32]]*10+($game_variables[14])*20
      step/=100
      step=1 if step<1
      actor.sp+=step
      if $game_variables[24]==0
        actor.maxsp=1
      else
        actor.maxsp=$game_variables[24]*2
      end
      process=200*actor.sp/actor.maxsp
      Graphics.update
      Input.update
      draw_process(process,ex)
      for i in 0..4
        Graphics.update
        if Input.trigger?(Input::B)
          ex.dispose
          return
        end
      end
      if actor.sp>=actor.maxsp
        actor.sp=actor.maxsp
        $game_variables[24]+=1
        if $game_variables[24]>lv_max
          $game_variables[24]-=1
          actor.sp=$game_variables[24]
          ex.contents.clear
          ex.visible=false
          @info.visible=true
          @info.draw_words("你内功等级不够！")
          for i in 0..120
            Graphics.update
          end
          break
        end
        actor.sp=0
      end
    end
    @info.visible=false
    ex.dispose
    $game_switches[3]=true
    return
  end
  def draw_process(process,obj)
    actor=$game_party.actors[0]
    obj.update
    obj.contents.clear
    #边框
    obj.contents.fill_rect(5,9,200,1,Color.new(0, 0, 0, 255))
    obj.contents.fill_rect(5,24,200,1,Color.new(0, 0, 0, 255))
    obj.contents.fill_rect(5,9,1,15,Color.new(0, 0, 0, 255))
    obj.contents.fill_rect(205,9,1,16,Color.new(0, 0, 0, 255))
    #进度条
    obj.contents.fill_rect(5,9,process,15,Color.new(0, 0, 0, 255))
    #点数/等级
    obj.contents.draw_text(216,0,128,32,actor.sp.to_s+"/"+
    $game_variables[24].to_s)
  end
  def plus
    li=Window_InputNumber.new(3)
    li.x=320
    li.y=96
    li.opacity=255
    li.back_opacity=255
    li.number=$game_variables[23]
    loop do
      Graphics.update
      Input.update
      li.update
      if Input.trigger?(Input::B)
        $game_system.se_play($data_system.cancel_se)
        break
      end
      if Input.trigger?(Input::C)
        $game_variables[23]=li.number
        break
      end
    end
    max=$game_variables[45]+$game_variables[$game_variables[32]]*2
    max/=4
    li.dispose
    if $game_variables[23]>=max
      $game_variables[23]=max
      p=Window_Base.new(128,400,352,64)
      p.contents=Bitmap.new(320,32)
      p.contents.font.color.set(0,0,0)
      p.contents.draw_text(0,0,320,32,"你目前加力上限为:"+max.to_s,1)
      for i in 0..40
        Graphics.update
      end
      p.dispose
    end
    return
  end
  def hp_max(actor)
    full_hp=$game_variables[24]/4
    full_hp+=100
    full_hp+=[($game_variables[157]-14)*20,300].min
    if actor.sp<15 or $game_variables[24]<50
      @info.draw_words("你的内力不够！")
      @info.visible=true
      for i in 0..40
        Graphics.update
      end
      @info.visible=false
      return
    end
    if actor.hp>=actor.maxhp
      s="你现在体力充沛!"
      actor.hp=actor.maxhp
    else
      if actor.sp<actor.maxhp-actor.hp
        actor.hp+=actor.sp
        actor.sp=0
      else
        actor.sp-=(actor.maxhp-actor.hp)
        actor.hp=actor.maxhp
      end
      s="你深深吸了口气，脸色看起来好多了！"
    end
    @info.draw_words(s)
    @info.visible=true
    for i in 0..40
      Graphics.update
    end
    @info.visible=false
    return
  end
  def recover(actor)
    full_hp=100+$game_variables[24]/4
    full_hp+=[($game_variables[157]-14)*20,300].min
    if actor.maxhp<(full_hp*0.33)
      @info.draw_words("你已受伤过重，只怕一运真气便有生命危险。")
      @info.visible=true
      for i in 0..40
        Graphics.update
      end
      @info.visible=false
      return
    end
    if actor.sp<60
      @info.draw_words("你内力不够，不能疗伤！")
      @info.visible=true
      for i in 0..40
        Graphics.update
      end
      @info.visible=false
      return
    end
    if $game_variables[$game_variables[32]]<30 or $game_variables[45]<30
      @info.draw_words("你运功良久，一抖衣袖，长叹一声站起身来。")
      @info.visible=true
      for i in 0..40
        Graphics.update
      end
      @info.visible=false
      return
    end
    if actor.maxhp>=full_hp
      @info.draw_words("你现在并没有受伤！")
      @info.visible=true
      for i in 0..40
        Graphics.update
      end
      @info.visible=false
      return
    else
      actor.maxhp+=(full_hp*0.05)
      actor.sp-=54
      actor.maxhp=full_hp if actor.maxhp>full_hp
      @info.draw_words("你全身放松，坐下来开始运功疗伤。")
      @info.visible=true
      for i in 0..35
        Graphics.update
      end
      @info.draw_words("你催动真气，脸上一阵白一阵红，哇地一声，吐出一口淤血，脸色看起来好多了。")
      for i in 0..45
        Graphics.update
      end
      @info.visible=false
      return
    end
  end
end#==============================================================================
# ■ Scene_Practice
#------------------------------------------------------------------------------
# 　处理练功画面的类。
#==============================================================================
class Scene_Practice
  def initialize(menu=false)
    @menu=menu
    @err=["你的功夫很难再有所提高了，还是向师傅请教一下吧",
          "趁手的兵器都没有一把，瞎比划什么？",
          "你的内力修为不足，要勤修内功！",
          "你受伤了，还是先治疗要紧！",
          "你的武学经验不足，无法领会更深的功夫"]
  end
  #--------------------------------------------------------------------------
  # ● 主处理
  #--------------------------------------------------------------------------
  def main
    @screen = Spriteset_Map.new
    draw_main_menu
    @list=[]
    @command_list=[]
    for i in 29..31
      if $game_variables[$game_variables[i]]>0
        @list.push $game_variables[i]
        @command_list.push $data_system.variables[$game_variables[i]]
      end
    end
    @skill_window = Window_Command.new(160, @command_list,1)
    @skill_window.x = 490 - @skill_window.width
    @skill_window.y = 64
    $game_switches[3]=false
    Graphics.transition
    loop do
      Graphics.update
      Input.update
      $game_system.update
      update
      if $scene != self
       # study_skill
        break
      end
    end
    #Detect.make_snapshot
    Graphics.freeze
    $game_switches[3]=true
    @skill_window.dispose
    @top_menu.dispose
    @screen.dispose
  end
  #--------------------------------------------------------------------------
  # ● 刷新画面
  #--------------------------------------------------------------------------
  def update
    @skill_window.update
    if @skill_window.active
      update_command
      return
    else
      update_ex
    end
  end
  #--------------------------------------------------------------------------
  # ● 刷新画面 (命令窗口被激活的情况下)
  #--------------------------------------------------------------------------
  def update_command
    if Input.trigger?(Input::B)
      $game_system.se_play($data_system.cancel_se)
      if @menu
        $scene = Scene_Menu.new(3)
        return
      else
        Graphics.frame_rate =120
        $scene = Scene_Map.new
        Graphics.frame_rate =40
        return
      end
    end
    if Input.trigger?(Input::C)
      $game_system.se_play($data_system.decision_se)
      @skill_window.active=false
      return
    end
  end
  def update_ex
    loop do
      Graphics.update
      Input.update
      skill_number=@list[@skill_window.index]
      skill_point=skill_number+60
      if check(skill_number)
        draw2(skill_number,skill_point)
      else
        draw1
        @skill_window.active=true
        return
      end
      if Input.trigger?(Input::B)
        # 演奏取消 SE
        $game_system.se_play($data_system.cancel_se)
        @skill_window.active=true
        return
      end
    end
  end
  #检查合法性
  def check(skill_number)
    actor=$game_party.actors[0]
    full_hp=100+$game_variables[24]/4
    full_hp+=[($game_variables[157]-14)*20,300].min
    ph=[100*actor.maxhp/full_hp,100].min
    if ph !=100
      @msg=@err[3]
      return false
    end
    unless ckeck_exp_maxlv(skill_number)
      @msg=@err[4]
      return false
    end
    if skill_number>=64 and skill_number<=69 #轻功
      if $game_variables[skill_number]>$game_variables[46]
        @msg=@err[0]
        return false
      elsif $game_variables[skill_number]>$game_variables[24]/15
        @msg=@err[2]
        return false
      else
        return true
      end
    end
    if actor.weapon_id==0
      #没有武器的情况下
      if skill_number>=53 and skill_number<=61
        if $game_variables[skill_number]>$game_variables[40]
          @msg=@err[0]
          return false
        elsif $game_variables[skill_number]>$game_variables[24]/15
          @msg=@err[2]
          return false
        end
      else
        @msg=@err[1]
        return false
      end
    else
      #有武器的情况下
      if weapon_matching_skill?(skill_number)
        if $game_variables[skill_number]>$game_variables[weapon_skill_base(skill_number)]
          @msg=@err[0]
          return false
        elsif $game_variables[skill_number]>$game_variables[24]/15
          @msg=@err[2]
          return false
        end
      else
        @msg=@err[1]
        return false
      end
    end
    return true
  end
  #描绘不能练功的提示
  def draw1
    @info_window=Window_Base.new((608-@msg.length*8)/2,400, @msg.length*8+32, 64)
    @info_window.contents=Bitmap.new(@msg.length*8,32)
    @info_window.contents.font.color.set(0,0,0)
    @info_window.contents.draw_text(0,0,@msg.length*8,32,@msg,1)
    for i in 0..50
      Graphics.update
    end
    @info_window.dispose
    return
  end
  #描绘练功的进度
  def draw2(level,point)
    max=$game_variables[level]**2
    step=$game_variables[get_all_skill_base(level)]/5
    step*=($game_variables[13]+$game_variables[48]/10+$game_variables[93])
    step/=15
    if step<=0
      step=1
    end
    ex=Window_Base.new(160,400,352,64)
    ex.contents=Bitmap.new(320,32)
    ex.contents.font.color.set(0,0,0)
    loop do
      Graphics.update
      Input.update
      if Input.trigger?(Input::B)
        ex.dispose
        return
      end
      process=200*$game_variables[point]/max
      draw_process(process,ex,point,level)
      Graphics.update
      Graphics.update
      $game_variables[point]+=step
      if $game_variables[point]>=max
        $game_variables[level]+=1
        $game_variables[point]=0
        #Detect.make_snapshot
        ex.contents.clear
        ex.contents.draw_text(0, 0, 448, 32, "你的功夫进步了！")
        for i in 0..30
          Graphics.update
        end
        break
      end
    end
    ex.dispose
  end
  def draw_process(process,ex,point,level)
    ex.contents.clear
    #边框
    ex.contents.fill_rect(5,9,200,1,Color.new(0, 0, 0, 255))
    ex.contents.fill_rect(5,24,200,1,Color.new(0, 0, 0, 255))
    ex.contents.fill_rect(5,9,1,15,Color.new(0, 0, 0, 255))
    ex.contents.fill_rect(205,9,1,16,Color.new(0, 0, 0, 255))
    #进度条
    ex.contents.fill_rect(5,9,process,15,Color.new(0, 0, 0, 255))
    #点数/等级
    ex.contents.draw_text(216,0,160,32,$game_variables[point].to_s+
    "/"+$game_variables[level].to_s)
  end
end#==============================================================================
# ■ Scene_Battle (分割定义 1)
#------------------------------------------------------------------------------
# 　处理战斗画面的类。
#==============================================================================

class Scene_Battle
  #--------------------------------------------------------------------------
  # ● 主处理
  #--------------------------------------------------------------------------
  def main
    Graphics.frame_rate = 40
    remove_damage_error
    # 初始化战斗用的各种暂时数据
    $game_temp.in_battle = true
    $game_temp.battle_turn = 0
    $game_temp.battle_event_flags.clear
    $game_temp.battle_abort = false
    $game_temp.battle_main_phase = false
    $game_temp.battleback_name = $game_map.battleback_name
    $game_temp.forcing_battler = nil
    # 初始化战斗用事件解释器
    $game_system.battle_interpreter.setup(nil, 0)
    # 准备队伍
    @troop_id = $game_temp.battle_troop_id
    $game_troop.setup(@troop_id)
    # 生成角色命令窗口
    @actor_command_window = Window_Command.new(400, ["攻击","绝招","吸气","物品","逃跑"],5)
    @actor_command_window.x = 120
    @actor_command_window.y = 300
    @actor_command_window.active = false
    @actor_command_window.visible = false
    @disable_skill=false
    get_npc_data($game_troop.enemies[0].id) if $game_troop.enemies[0].id !=125
    $game_troop.enemies[0].hp=$game_troop.enemies[0].maxhp
    $game_troop.enemies[0].sp=$game_troop.enemies[0].maxsp
    # 生成其它窗口
    @back = Sprite.new
    @back.bitmap = Bitmap.new("Graphics/Pictures/BG.png") 
    @back.y = 0
    @back.z = 0
    @help_window = Window_Help.new
    @help_window.y=352
    @help_window.height=128
    @help_window.contents=Bitmap.new(@help_window.width-32,@help_window.height-32)
    @help_window.visible = false
    @status_window = Window_BattleStatus.new
    @status_window.x = 72
    @status_window.y = 150
    @status_window.opacity = 0
    @yesno=Window_Command.new(640,["确定","放弃"],1)
    @yesno.y=64
    @yesno.active=false
    @yesno.visible=false
    $game_switches[3]=false
    @message_window = Window_Message.new
    # 生成活动块
    @spriteset = Spriteset_Battle.new
    # 初始化等待计数
    @wait_count = 0
    # 执行过渡
    if $data_system.battle_transition == ""
      Graphics.transition(20)
    else
      Graphics.transition(40, "Graphics/Transitions/" +
        $data_system.battle_transition)
    end
    # 开始自由战斗回合
    start_phase1
    # 主循环
    loop do
      # 刷新游戏画面
      Graphics.update
      # 刷新输入信息
      Input.update
      # 刷新画面
      update
      # 如果画面切换的话就中断循环
      if $scene != self
        break
      end
    end
    # 刷新地图
    $game_map.refresh
    # 准备过渡
    Graphics.freeze
    # 释放窗口
    @status_window.dispose
    @actor_command_window.dispose
    @help_window.dispose
    @back.dispose
    @yesno.dispose
    @message_window.dispose
    if @skill_window != nil
      @skill_window.dispose
    end
    if @item_window != nil
      @item_window.dispose
    end
    if @result_window != nil
      @result_window.dispose
    end
    $trea1=""
    $trea2=""
    $trea3=""
    $trea4=""
    $game_switches[3]=true
    # 释放活动块
    $game_temp.battle_can_lose = false
    @spriteset.dispose
    # 标题画面切换中的情况
    if $scene.is_a?(Scene_Title)
      # 淡入淡出画面
      Graphics.transition
      Graphics.freeze
    end
    # 战斗测试或者游戏结束以外的画面切换中的情况
    if $BTEST and not $scene.is_a?(Scene_Gameover)
      $scene = nil
    end
  end
  def window_swap
    @help_window.visible=true
    @skill_window.visible=false
    for i in 1..40
      Graphics.update
    end
    @help_window.visible=false
    @skill_window.visible=true
  end
  #--------------------------------------------------------------------------
  # ● 清除人物身上的动画id
  #--------------------------------------------------------------------------
  def remove_damage_error
    $game_party.actors.each do |battler|
      battler.damage = nil
      battler.animation_id = 0
    end
  end
  #--------------------------------------------------------------------------
  # ● 胜负判定
  #--------------------------------------------------------------------------
  def judge
    # 全灭判定是真、并且同伴人数为 0 的情况下
    if $game_party.all_dead? or $game_party.actors.size == 0
      # 允许失败的情况下
      if $game_temp.battle_can_lose
        # 还原为战斗开始前的 BGM
        $game_system.bgm_play($game_temp.map_bgm)
        # 战斗结束
        battle_end(2)
        # 返回 true
        return true
      end
      # 设置游戏结束标志
      $game_temp.gameover = true
      # 返回 true
      return true
    end
    # 如果存在任意 1 个敌人就返回 false
    for enemy in $game_troop.enemies
      if enemy.exist?
        return false
      end
    end
    # 开始结束战斗回合 (胜利)
    start_phase5
    # 返回 true
    return true
  end
  #--------------------------------------------------------------------------
  # ● 战斗结束
  #     result : 結果 (0:胜利 1:逃跑 2:失败)
  #--------------------------------------------------------------------------
  def battle_end(result)
    $game_actors[1].hp=1 if result==2
    # 清除战斗中标志
    $game_temp.in_battle = false
    # 清除全体同伴的行动
    $game_party.clear_actions
    # 解除战斗用状态
    for actor in $game_party.actors
      actor.remove_states_battle
    end
    # 清除敌人
    $game_troop.enemies.clear
    # 调用战斗返回调用
    if $game_temp.battle_proc != nil
      $game_temp.battle_proc.call(result)
      $game_temp.battle_proc = nil
    end
    # 切换到地图画面
    $scene = Scene_Map.new
  end
  #--------------------------------------------------------------------------
  # ● 设置战斗事件
  #--------------------------------------------------------------------------
  def setup_battle_event
    # 正在执行战斗事件的情况下
    if $game_system.battle_interpreter.running?
      return
    end
    # 搜索全部页的战斗事件
    for index in 0...$data_troops[@troop_id].pages.size
      # 获取事件页
      page = $data_troops[@troop_id].pages[index]
      # 事件条件可以参考 c
      c = page.condition
      # 没有指定任何条件的情况下转到下一页
      unless c.turn_valid or c.enemy_valid or
             c.actor_valid or c.switch_valid
        next
      end
      # 执行完毕的情况下转到下一页
      if $game_temp.battle_event_flags[index]
        next
      end
      # 确认回合条件
      if c.turn_valid
        n = $game_temp.battle_turn
        a = c.turn_a
        b = c.turn_b
        if (b == 0 and n != a) or
           (b > 0 and (n < 1 or n < a or n % b != a % b))
          next
        end
      end
      # 确认敌人条件
      if c.enemy_valid
        enemy = $game_troop.enemies[c.enemy_index]
        if enemy == nil or enemy.hp * 100.0 / enemy.maxhp > c.enemy_hp
          next
        end
      end
      # 确认角色条件
      if c.actor_valid
        actor = $game_actors[c.actor_id]
        if actor == nil or actor.hp * 100.0 / actor.maxhp > c.actor_hp
          next
        end
      end
      # 确认开关条件
      if c.switch_valid
        if $game_switches[c.switch_id] == false
          next
        end
      end
      # 设置事件
      $game_system.battle_interpreter.setup(page.list, 0)
      # 本页的范围是 [战斗] 或 [回合] 的情况下
      if page.span <= 1
        # 设置执行结束标志
        $game_temp.battle_event_flags[index] = true
      end
      return
    end
  end
  #--------------------------------------------------------------------------
  # ● 刷新画面
  #--------------------------------------------------------------------------
  def update
    # 执行战斗事件中的情况下
    if $game_system.battle_interpreter.running?
      # 刷新解释器
      $game_system.battle_interpreter.update
      # 强制行动的战斗者不存在的情况下
      if $game_temp.forcing_battler == nil
        # 执行战斗事件结束的情况下
        unless $game_system.battle_interpreter.running?
          # 继续战斗的情况下、再执行战斗事件的设置
          unless judge
            setup_battle_event
          end
        end
        # 如果不是结束战斗回合的情况下
        if @phase != 5
          # 刷新状态窗口
          @status_window.refresh
        end
      end
    end
    # 系统 (计时器)、刷新画面
    $game_system.update
    $game_screen.update
    # 刷新窗口
    @help_window.update
    @actor_command_window.update
    @status_window.update
    @yesno.update
    @message_window.update
    # 刷新活动块
    @spriteset.update
    # 处理过渡中的情况下
    if $game_temp.transition_processing
      # 清除处理过渡中标志
      $game_temp.transition_processing = false
      # 执行过渡
      if $game_temp.transition_name == ""
        Graphics.transition(20)
      else
        Graphics.transition(40, "Graphics/Transitions/" +
          $game_temp.transition_name)
      end
    end
    # 显示信息窗口中的情况下
    if $game_temp.message_window_showing
      return
    end
    # 显示效果中的情况下
    if @spriteset.effect?
      return
    end
    # 游戏结束的情况下
    if $game_temp.gameover
      # 切换到游戏结束画面
      $scene = Scene_Gameover.new
      return
    end
    # 返回标题画面的情况下
    if $game_temp.to_title
      # 切换到标题画面
      $scene = Scene_Title.new
      return
    end
    # 中断战斗的情况下
    if $game_temp.battle_abort
      # 还原为战斗前的 BGM
      $game_system.bgm_play($game_temp.map_bgm)
      # 战斗结束
      battle_end(1)
      return
    end
    # 等待中的情况下
    if @wait_count > 0
      # 减少等待计数
      @wait_count -= 1
      return
    end
    # 强制行动的角色存在、
    # 并且战斗事件正在执行的情况下
    if $game_temp.forcing_battler == nil and
       $game_system.battle_interpreter.running?
      return
    end
    # 回合分支
    case @phase
    when 1  # 自由战斗回合
      update_phase1
    when 2  # 同伴命令回合
      update_phase2
    when 3  # 角色命令回合
      update_phase3
    when 4  # 主回合
      update_phase4
    when 5  # 战斗结束回合
      update_phase5
    end
  end
end
#==============================================================================
# ■ Scene_Battle (分割定义 2)
#------------------------------------------------------------------------------
# 　处理战斗画面的类。
#==============================================================================

class Scene_Battle
  #--------------------------------------------------------------------------
  # ● 开始自由战斗回合
  #--------------------------------------------------------------------------
  def start_phase1
    # 转移到回合 1
    @phase = 1
    # 清除全体同伴的行动
    $game_party.clear_actions
    # 设置战斗事件
    setup_battle_event
  end
  #--------------------------------------------------------------------------
  # ● 刷新画面 (自由战斗回合)
  #--------------------------------------------------------------------------
  def update_phase1
    # 胜败判定
    if judge
      # 胜利或者失败的情况下 : 过程结束
      return
    end
    # 直接开始角色命令
    start_phase3
  end
  #--------------------------------------------------------------------------
  # ● 开始同伴命令回合
  #--------------------------------------------------------------------------
  def start_phase2
    # 转移到回合 2
    @phase = 2
    # 设置角色为非选择状态
    @actor_index = -1
    @active_battler = nil
    # 无效化角色指令窗口
    @actor_command_window.active = false
    @actor_command_window.visible = false
    # 清除主回合标志
    $game_temp.battle_main_phase = false
    # 清除全体同伴的行动
    $game_party.clear_actions
    # 不能输入命令的情况下
    unless $game_party.inputable?
      # 开始主回合
      start_phase4
    end
  end
  #--------------------------------------------------------------------------
  # ● 刷新画面 (同伴命令回合)
  #--------------------------------------------------------------------------
  def update_phase2
    return
  end
  #--------------------------------------------------------------------------
  # ● 画面更新 (同伴指令回合 : 逃跑)
  #--------------------------------------------------------------------------
  def update_phase2_escape
    # 计算敌人速度的平均值
    enemies_agi = 0
    enemies_number = 0
    for enemy in $game_troop.enemies
      if enemy.exist?
        enemies_agi += enemy.agi
        enemies_number += 1
      end
    end
    if enemies_number > 0
      enemies_agi /= enemies_number
    end
    # 计算角色速度的平均值
    actors_agi = 0
    actors_number = 0
    for actor in $game_party.actors
      if actor.exist?
        actors_agi += actor.agi
        actors_number += 1
      end
    end
    if actors_number > 0
      actors_agi /= actors_number
    end
    # 逃跑成功判定
    success = rand(100) < [40 * actors_agi / enemies_agi,80].min
    # 成功逃跑的情况下
    if success
      # 演奏逃跑 SE
      @help_window.visible=true
      @help_window.contents.clear
      @help_window.draw_words("哼，哪里逃！")
      for i in 0..40
        Graphics.update
      end
      @help_window.visible=false
      $game_system.se_play($data_system.escape_se)
      # 还原为战斗开始前的 BGM
      $game_system.bgm_play($game_temp.map_bgm)
      # 战斗结束
      battle_end(1)
    # 逃跑失败的情况下
    else
      # 清除全体同伴的行动
      $game_party.clear_actions
      @actor_command_window.active = false
      @actor_command_window.visible = false
      @help_window.visible=true
      @help_window.contents.clear
      @help_window.draw_words("你转身想溜,被"+
                           $game_troop.enemies[0].name+"一把抓住：想跑？没门儿！")
      for i in 0..40
        Graphics.update
      end
      @help_window.visible=false
      # 开始主回合
      start_phase4
    end
  end
  #--------------------------------------------------------------------------
  # ● 开始结束战斗回合
  #--------------------------------------------------------------------------
  def start_phase5
    # 转移到回合 5
    @phase = 5
    # 演奏战斗结束 ME
    $game_system.me_play($game_system.battle_end_me)
    # 还原为战斗开始前的 BGM
    $game_system.bgm_play($game_temp.map_bgm)
    @ene_id=$game_troop.enemies[0].id
    unless (@ene_id>125 and @ene_id<136) or (@ene_id>139 and @ene_id<142)
      @help_window.visible=true
      @help_window.contents.clear
      @help_window.y=0
      @help_window.height=64
      @help_window.draw_words($game_actors[1].name+"这一刀是劈还是不劈呢？")
      @yesno.active=true
      @yesno.visible=true
      @yesno.index=1
      @yesno.z=1000
      loop do
        # 刷新游戏画面
        Graphics.update
        # 刷新输入信息
        @yesno.update
        Input.update
        if Input.trigger?(Input::B)
          $game_system.se_play($data_system.buzzer_se)
        else
          if Input.trigger?(Input::C)
            @help_window.contents.clear
            @help_window.height=128
            @help_window.z=1000
            #杀头
            if @yesno.index==0
              $game_switches[95]=true
              dead_words
            else
              $game_switches[95]=false
              @help_window.draw_words("..............")
            end
            $game_system.se_play($data_system.decision_se)
            @yesno.visible=false
            @help_window.visible=true
            for i in 1..80
              Graphics.update
            end
            @help_window.visible=false
            @yesno.active=false
            break
          end
        end
      end
      # 初始化 EXP、金钱、宝物
      gold = 0
      # 循环
      enemy=$game_troop.enemies[0]
      # 敌人不是隐藏状态的情况下
      unless enemy.hidden
        # 获得 EXP、增加金钱
        gold += enemy.gold
      end
      # 获得金钱
      gold=[gold,50001].min
      $game_party.gain_gold(gold)
      # 生成战斗结果窗口
      @result_window = Window_BattleResult.new(gold, $trea1,$trea2,$trea3,$trea4)
      # 设置等待计数
      Audio.se_play("Audio/SE/Item3.ogg")
    end
    @phase5_wait_count = 10
  end
  #--------------------------------------------------------------------------
  # ● 死亡对话
  #--------------------------------------------------------------------------
  def dead_words
    i=rand(5)
    case i
    when 0
      d="二十年后又是一条好汉！"
    when 1
      d="有的人活着，他已经死了，有……哎，我还没说完……"
    when 2
      d="我会在地狱里等着你的。"
    when 3
      d="啊-----！"
    when 4
      d="可恶！我怎么会死呢。"
    end
    @help_window.draw_words(d)
  end
  #--------------------------------------------------------------------------
  # ● 画面更新 (结束战斗回合)
  #--------------------------------------------------------------------------
  def update_phase5
    # 等待计数大于 0 的情况下
    if @phase5_wait_count > 0
      # 减少等待计数
      @phase5_wait_count -= 1
      # 等待计数为 0 的情况下
      if @phase5_wait_count == 0
        # 显示结果窗口
        @result_window.visible = true if @result_window !=nil
        # 清除主回合标志
        $game_temp.battle_main_phase = false
        # 刷新状态窗口
        @status_window.refresh
      end
      return
    end
    # 按下 C 键的情况下
    if Input.trigger?(Input::C)
      # 战斗结束
      battle_end(0)
    end
  end
end
#==============================================================================
# ■ Scene_Battle (分割定义 3)
#------------------------------------------------------------------------------
# 　处理战斗画面的类。
#==============================================================================

class Scene_Battle
  #--------------------------------------------------------------------------
  # ● 开始角色命令回合
  #--------------------------------------------------------------------------
  def start_phase3
    # 转移到回合 3
    @phase = 3
    # 设置觉得为非选择状态
    @actor_index = -1
    @active_battler = nil
    # 输入下一个角色的命令
    phase3_next_actor
  end
  #--------------------------------------------------------------------------
  # ● 转到输入下一个角色的命令
  #--------------------------------------------------------------------------
  def phase3_next_actor
    # 循环
    begin
      # 角色的明灭效果 OFF
      if @active_battler != nil
        @active_battler.blink = false
      end
      # 最后的角色的情况
      if @actor_index == $game_party.actors.size-1
        # 开始主回合
        start_phase4
        return
      end
      # 推进角色索引
      @actor_index += 1
      @active_battler = $game_party.actors[@actor_index]
      @active_battler.blink = false
    # 如果角色是在无法接受指令的状态就再试
    end until @active_battler.inputable?
    # 设置角色的命令窗口
    phase3_setup_command_window
  end
  #--------------------------------------------------------------------------
  # ● 转向前一个角色的命令输入
  #--------------------------------------------------------------------------
  def phase3_prior_actor
    # 循环
    begin
      # 角色的明灭效果 OFF
      if @active_battler != nil
        @active_battler.blink = false
      end
      # 最初的角色的情况下
      if @actor_index == 0
        # 开始同伴指令回合
        start_phase3
        return
      end
      # 返回角色索引
      @actor_index -= 1
      @active_battler = $game_party.actors[@actor_index]
      @active_battler.blink = false
    # 如果角色是在无法接受指令的状态就再试
    end until @active_battler.inputable?
    # 设置角色的命令窗口
    phase3_setup_command_window
  end
  #--------------------------------------------------------------------------
  # ● 设置角色指令窗口
  #--------------------------------------------------------------------------
  def phase3_setup_command_window
    @actor_command_window.active = true
    @actor_command_window.visible = true
    # 设置索引为 0
    @actor_command_window.index = 0
  end
  #--------------------------------------------------------------------------
  # ● 刷新画面 (角色命令回合)
  #--------------------------------------------------------------------------
  def update_phase3
    # 敌人光标有效的情况下
    if @enemy_arrow != nil
      update_phase3_enemy_select
    # 角色光标有效的情况下
    elsif @actor_arrow != nil
      update_phase3_actor_select
    # 特技窗口有效的情况下
    elsif @skill_window != nil
      update_phase3_skill_select
    # 物品窗口有效的情况下
    elsif @item_window != nil
      update_phase3_item_select
    # 角色指令窗口有效的情况下
    elsif @actor_command_window.active
      update_phase3_basic_command
    end
  end
  #--------------------------------------------------------------------------
  # ● 刷新画面 (角色命令回合 : 基本命令)
  #--------------------------------------------------------------------------
  def update_phase3_basic_command
    # 按下 B 键的情况下
    if Input.trigger?(Input::B)
      # 演奏取消 SE
      $game_system.se_play($data_system.cancel_se)
      start_phase3
      return
    end
    # 按下 C 键的情况下
    if Input.trigger?(Input::C)
      # 角色指令窗口光标位置分之
      case @actor_command_window.index
      when 0  # 攻击
        # 演奏确定 SE
        $game_system.se_play($data_system.decision_se)
        # 设置行动
        @active_battler.current_action.kind = 0
        @active_battler.current_action.basic = 0
        #转到下一个角色指令输入。
        @active_battler.current_action.target_index = $game_troop.enemies[0].index
        phase3_next_actor
        # 开始选择敌人
        #start_enemy_select
      when 1  # 特技
        if @disable_skill
          $game_system.se_play($data_system.buzzer_se)
          draw_disable_skill
          start_phase3
        else
          # 演奏确定 SE
          $game_system.se_play($data_system.decision_se)
          # 设置行动
          @active_battler.current_action.kind = 1
          # 开始选择特技
          start_skill_select
        end
      when 3  # 物品
        # 演奏确定 SE
        $game_system.se_play($data_system.decision_se)
        # 开始选择物品
        start_item_select
        @status_window.refresh
        start_phase3
      when 2 # 疗伤
        # 设置行动
        recover
        @status_window.refresh
        start_phase3
      when 4 # 逃跑
        $game_system.se_play($data_system.decision_se)
        update_phase2_escape
      end
      return
    end
  end
  #不能释放绝招
  def draw_disable_skill
    @actor_command_window.active = false
    @actor_command_window.visible = false
    @help_window.visible=true
    @help_window.contents.clear
    @help_window.draw_words("你刚用完外功，还是先歇歇吧。")
    for i in 0..40
      Graphics.update
    end
    @help_window.visible=false
    @actor_command_window.active = true
    @actor_command_window.visible =true
  end
  #吸气
  def recover
    @actor_command_window.active = false
    @actor_command_window.visible = false
    @help_window.visible=true
    @help_window.contents.clear
    if $game_variables[32]==0
      # 演奏 SE
      $game_system.se_play($data_system.buzzer_se)
      @help_window.draw_words("你必须先选择你要用的内功心法！")
      for i in 0..40
        Graphics.update
      end
      @help_window.visible=false
      @actor_command_window.active = true
      @actor_command_window.visible =true
      return
    end
    if $game_variables[24]<50 or $game_actors[1].sp<15
      # 演奏 SE
      $game_system.se_play($data_system.buzzer_se)
      @help_window.draw_words("你的内力不够！")
      for i in 0..40
        Graphics.update
      end
      @help_window.visible=false
      @actor_command_window.active = true
      @actor_command_window.visible =true
      return
    end
    if $game_actors[1].maxhp==$game_actors[1].hp
      # 演奏 SE
      $game_system.se_play($data_system.buzzer_se)
      @help_window.draw_words("你现在体力充沛！")
      for i in 0..40
        Graphics.update
      end
      @help_window.visible=false
      @actor_command_window.active = true
      @actor_command_window.visible =true
      return
    end
    if $game_party.actors[0].sp<($game_party.actors[0].maxhp-$game_party.actors[0].hp)
      $game_party.actors[0].hp+=$game_party.actors[0].sp
      $game_party.actors[0].sp=0
    else
      $game_party.actors[0].sp-=$game_party.actors[0].maxhp-$game_party.actors[0].hp
      $game_party.actors[0].hp=$game_party.actors[0].maxhp
    end
    # 演奏确定 SE
    $game_system.se_play($data_system.decision_se)
    @help_window.draw_words("你深深吸了口气，脸色看起来好多了！")
    for i in 0..40
      Graphics.update
    end
    @help_window.visible=false
    @actor_command_window.active = true
    @actor_command_window.visible =true
  end
  #--------------------------------------------------------------------------
  # ● 刷新画面 (角色命令回合 : 选择特技)
  #--------------------------------------------------------------------------
  def update_phase3_skill_select
    # 设置特技窗口为可视状态
    @skill_window.visible = true
    # 刷新特技窗口
    @skill_window.update
    # 按下 B 键的情况下
    if Input.trigger?(Input::B)
      # 演奏取消 SE
      $game_system.se_play($data_system.cancel_se)
      # 结束特技选择
      end_skill_select
      return
    end
    # 按下 C 键的情况下
    if Input.trigger?(Input::C)
      # 获取特技选择窗口现在选择的特技的数据
      @skill = @skill_window.skill
      skill_check(@skill.id)
      if @can_use==false  
        return
      end
      # 无法使用的情况下
      if @skill == nil or not @active_battler.skill_can_use?(@skill.id)
        # 演奏冻结 SE
        $game_system.se_play($data_system.buzzer_se)
        if @active_battler.sp<@skill.sp_cost
          @help_window.draw_words("你内力修为不足，无法使用"+@skill.name+"！")
          window_swap
        end
        return
      end
      # 演奏确定 SE
      $game_system.se_play($data_system.decision_se)
      # 设置行动
      @active_battler.current_action.skill_id = @skill.id
      # 设置特技窗口为不可见状态
      @skill_window.visible = false
      # 效果范围是敌单体的情况下
      if @skill.scope == 1
        # 开始选择敌人
        start_enemy_select
      # 效果范围是我方单体的情况下
      elsif @skill.scope == 3 or @skill.scope == 5
        # 开始选择角色
        start_actor_select
      # 效果范围不是单体的情况下
      else
        # 选择特技结束
        end_skill_select
        # 转到下一位角色的指令输入
        start_phase4
      end
      return
    end
  end
  #--------------------------------------------------------------------------
  # ● 刷新画面 (角色命令回合 : 选择物品)
  #--------------------------------------------------------------------------
  def update_phase3_item_select
    @actor_command_window.active = false
    @actor_command_window.visible = false
    # 设置物品窗口为可视状态
    @item_window.visible = true
    # 刷新物品窗口
    @item_window.update
    # 按下 B 键的情况下
    if Input.trigger?(Input::B)
      # 演奏取消 SE
      $game_system.se_play($data_system.cancel_se)
      # 选择物品结束
      end_item_select
      return
    end
    # 按下 C 键的情况下
    if Input.trigger?(Input::C)
      # 获取物品窗口现在选择的物品资料
      @item = @item_window.item
      # 无法使用的情况下
      unless $game_party.item_can_use?(@item.id)
        # 演奏冻结 SE
        $game_system.se_play($data_system.buzzer_se)
        return
      end
      # 演奏确定 SE
      $game_system.se_play($data_system.decision_se)
      # 设置行动
      @active_battler.current_action.item_id = @item.id
      # 设置物品窗口为不可见状态
      @item_window.visible = false
      # 效果范围是敌单体的情况下
      if @item.scope == 1
        # 开始选择敌人
        start_enemy_select
      # 效果范围是我方单体的情况下
      elsif @item.scope == 3 or @item.scope == 5
        # 开始选择角色
        start_actor_select
      # 效果范围不是单体的情况下
      else
        # 物品选择结束
        end_item_select
        make_item_action_result
        @status_window.refresh
      end
      return
    end
  end
  #--------------------------------------------------------------------------
  # ● 刷新画面画面 (角色命令回合 : 选择敌人)
  #--------------------------------------------------------------------------
  def update_phase3_enemy_select
    # 刷新敌人箭头
    @enemy_arrow.update
    # 按下 B 键的情况下
    if Input.trigger?(Input::B)
      # 演奏取消 SE
      $game_system.se_play($data_system.cancel_se)
      # 选择敌人结束
      end_enemy_select
      return
    end
    # 按下 C 键的情况下
    if Input.trigger?(Input::C)
      # 演奏确定 SE
      $game_system.se_play($data_system.decision_se)
      # 设置行动
      @active_battler.current_action.target_index = @enemy_arrow.index
      # 选择敌人结束
      end_enemy_select
      # 显示特技窗口中的情况下
      if @skill_window != nil
        # 结束特技选择
        end_skill_select
      end
      # 显示物品窗口的情况下
      if @item_window != nil
        # 结束物品选择
        end_item_select
      end
      # 转到下一位角色的指令输入
      start_phase4
    end
  end
  #--------------------------------------------------------------------------
  # ● 画面更新 (角色指令回合 : 选择角色)
  #--------------------------------------------------------------------------
  def update_phase3_actor_select
    # 刷新角色箭头
    @actor_arrow.update
    # 按下 B 键的情况下
    if Input.trigger?(Input::B)
      # 演奏取消 SE
      $game_system.se_play($data_system.cancel_se)
      # 选择角色结束
      end_actor_select
      return
    end
    # 按下 C 键的情况下
    if Input.trigger?(Input::C)
      # 演奏确定 SE
      $game_system.se_play($data_system.decision_se)
      # 设置行动
      @active_battler.current_action.target_index = @actor_arrow.index
      # 选择角色结束
      end_actor_select
      # 显示特技窗口中的情况下
      if @skill_window != nil
        # 结束特技选择
        end_skill_select
      end
      # 显示物品窗口的情况下
      if @item_window != nil
        # 结束物品选择
        end_item_select
      end
      # 转到下一位角色的指令输入
      phase3_next_actor
    end
  end
  #--------------------------------------------------------------------------
  # ● 开始选择敌人
  #--------------------------------------------------------------------------
  def start_enemy_select
    # 生成敌人箭头
    @enemy_arrow = Arrow_Enemy.new(@spriteset.viewport1)
    # 无效化角色指令窗口
    @actor_command_window.active = false
    @actor_command_window.visible = false
  end
  #--------------------------------------------------------------------------
  # ● 结束选择敌人
  #--------------------------------------------------------------------------
  def end_enemy_select
    # 释放敌人箭头
    @enemy_arrow.dispose
    @enemy_arrow = nil
    # 指令为 [战斗] 的情况下
    if @actor_command_window.index == 0
      # 有效化角色指令窗口
      @actor_command_window.active = true
      @actor_command_window.visible = true
      # 隐藏帮助窗口
      @help_window.visible = false
    end
  end
  #--------------------------------------------------------------------------
  # ● 开始选择角色
  #--------------------------------------------------------------------------
  def start_actor_select
    # 生成角色箭头
    #@actor_arrow = Arrow_Actor.new(@spriteset.viewport2)
    #@actor_arrow.index = @actor_index
    # 无效化角色指令窗口
    @actor_command_window.active = false
    @actor_command_window.visible = false
  end
  #--------------------------------------------------------------------------
  # ● 结束选择角色
  #--------------------------------------------------------------------------
  def end_actor_select
    # 释放角色箭头
    @actor_arrow.dispose
    @actor_arrow = nil
  end
  #--------------------------------------------------------------------------
  # ● 开始选择特技
  #--------------------------------------------------------------------------
  def start_skill_select
    study_skill
    if $game_actors[1].skills.size==0
      $game_system.se_play($data_system.buzzer_se)
      start_phase3
      return
    end
    # 生成特技窗口
    @skill_window = Window_BattleSkill.new
    # 无效化角色指令窗口
    @actor_command_window.active = false
    @actor_command_window.visible = false
  end
  #--------------------------------------------------------------------------
  # ● 选择特技结束
  #--------------------------------------------------------------------------
  def end_skill_select
    # 释放特技窗口
    @skill_window.dispose
    @skill_window = nil
    # 隐藏帮助窗口
    @help_window.visible = false
    # 有效化角色指令窗口
    @actor_command_window.active = true
    @actor_command_window.visible = true
  end
  #--------------------------------------------------------------------------
  # ● 开始选择物品
  #--------------------------------------------------------------------------
  def start_item_select
    # 生成物品窗口
    @item_window = Window_BattleItem.new
    # 关联帮助窗口
    #@item_window.help_window = @help_window
    # 无效化角色指令窗口
    @actor_command_window.active = false
    @actor_command_window.visible = false
  end
  #--------------------------------------------------------------------------
  # ● 结束选择物品
  #--------------------------------------------------------------------------
  def end_item_select
    # 释放物品窗口
    @item_window.dispose
    @item_window = nil
    # 隐藏帮助窗口
    #@help_window.visible = false
    # 有效化角色指令窗口
    @actor_command_window.active = true
    @actor_command_window.visible = true
  end
end
#==============================================================================
# ■ Scene_Battle (分割定义 4)
#------------------------------------------------------------------------------
# 　处理战斗画面的类。
#==============================================================================

class Scene_Battle
  #--------------------------------------------------------------------------
  # ● 开始主回合
  #--------------------------------------------------------------------------
  def start_phase4
    $game_party.actors[0].blink = false
    # 转移到回合 4
    @phase = 4
    # 回合数计数
    $game_temp.battle_turn += 1
    # 搜索全页的战斗事件
    for index in 0...$data_troops[@troop_id].pages.size
      # 获取事件页
      page = $data_troops[@troop_id].pages[index]
      # 本页的范围是 [回合] 的情况下
      if page.span == 1
        # 设置已经执行标志
        $game_temp.battle_event_flags[index] = false
      end
    end
    # 设置角色为非选择状态
    @actor_index = -1
    @active_battler = nil
    # 无效化角色指令窗口
    @actor_command_window.active = false
    @actor_command_window.visible = false
    # 设置主回合标志
    $game_temp.battle_main_phase = true
    # 生成敌人行动
    for enemy in $game_troop.enemies
      enemy.make_action
    end
    # 生成行动顺序
    make_action_orders
    # 移动到步骤 1
    @phase4_step = 1
  end
  #--------------------------------------------------------------------------
  # ● 生成行动循序
  #--------------------------------------------------------------------------
  def make_action_orders
    # 初始化序列 @action_battlers
    @action_battlers = []
    # 添加敌人到 @action_battlers 序列
    for enemy in $game_troop.enemies
      @action_battlers.push(enemy)
    end
    # 添加角色到 @action_battlers 序列
    for actor in $game_party.actors
      @action_battlers.push(actor)
    end
    # 确定全体的行动速度
    for battler in @action_battlers
      battler.make_action_speed
    end
    # 按照行动速度从大到小排列
    @action_battlers.sort! {|a,b|
      b.current_action.speed - a.current_action.speed }
  end
  #--------------------------------------------------------------------------
  # ● 刷新画面 (主回合)
  #--------------------------------------------------------------------------
  def update_phase4
    case @phase4_step
    when 1
      update_phase4_step1
    when 2
      update_phase4_step2
    when 3
      update_phase4_step3
    when 4
      update_phase4_step4
    when 5
      update_phase4_step5
    when 6
      update_phase4_step6
    end
  end
  #--------------------------------------------------------------------------
  # ● 刷新画面 (主回合步骤 1 : 准备行动)
  #--------------------------------------------------------------------------
  def update_phase4_step1
    # 隐藏帮助窗口
    @help_window.visible = false
    # 判定胜败
    if judge
      # 胜利或者失败的情况下 : 过程结束
      return
    end
    # 强制行动的战斗者不存在的情况下
    if $game_temp.forcing_battler == nil
      # 设置战斗事件
      setup_battle_event
      # 执行战斗事件中的情况下
      if $game_system.battle_interpreter.running?
        return
      end
    end
    # 强制行动的战斗者存在的情况下
    if $game_temp.forcing_battler != nil
      # 在头部添加后移动
      @action_battlers.delete($game_temp.forcing_battler)
      @action_battlers.unshift($game_temp.forcing_battler)
    end
    # 未行动的战斗者不存在的情况下 (全员已经行动)
    if @action_battlers.size == 0
      # 开始同伴命令回合
      start_phase3
      return
    end
    # 初始化动画 ID 和公共事件 ID
    @animation1_id = 0
    @animation2_id = 0
    @common_event_id = 0
    # 未行动的战斗者移动到序列的头部
    @active_battler = @action_battlers.shift
    # 如果已经在战斗之外的情况下
    if @active_battler.index == nil
      return
    end
    # 连续伤害
    if @active_battler.hp > 0 and @active_battler.slip_damage?
      @active_battler.slip_damage_effect
      @active_battler.damage_pop = false
    end
    # 自然解除状态
    @active_battler.remove_states_auto(@help_window)
    if judge
      # 胜利或者失败的情况下 : 过程结束
      return
    end
    # 刷新状态窗口
    @status_window.refresh
    # 移至步骤 2
    @phase4_step = 2
  end
  #--------------------------------------------------------------------------
  # ● 刷新画面 (主回合步骤 2 : 开始行动)
  #--------------------------------------------------------------------------
  def update_phase4_step2
    # 如果不是强制行动
    unless @active_battler.current_action.forcing
      # 限制为 [敌人为普通攻击] 或 [我方为普通攻击] 的情况下
      if @active_battler.restriction == 2 or @active_battler.restriction == 3
        # 设置行动为攻击
        @active_battler.current_action.kind = 0
        @active_battler.current_action.basic = 0
      end
      # 限制为 [不能行动] 的情况下
      if @active_battler.restriction == 4
        draw_stop
        # 清除行动强制对像的战斗者
        $game_temp.forcing_battler = nil
        # 移至步骤 1
        @phase4_step = 1
        return
      end
    end
    # 清除对像战斗者
    @target_battlers = []
    # 行动种类分支
    case @active_battler.current_action.kind
    when 0  # 基本
      make_basic_action_result
    when 1  # 特技
      make_skill_action_result
    when 2  # 物品
      make_item_action_result
    end
    # 移至步骤 3
    if @phase4_step == 2
      @phase4_step = 3
    end
  end
  def draw_stop
    if @active_battler.is_a?(Game_Actor)
      @help_window.draw_words("你现在呆若木鸡！")
    else
      @help_window.draw_words(@active_battler.name+"现在呆若木鸡!")
    end
    for i in 0..50
      Graphics.update
    end
    @help_window.contents.clear
    @help_window.visible=false
  end
  #--------------------------------------------------------------------------
  # ● 生成基本行动结果
  #--------------------------------------------------------------------------
  def make_basic_action_result
    # 攻击的情况下
    if @active_battler.current_action.basic == 0
      # 设置攻击 ID
      @animation1_id = @active_battler.animation1_id
      @animation2_id = @active_battler.animation2_id
      # 行动方的战斗者是敌人的情况下
      if @active_battler.is_a?(Game_Enemy)
        if @active_battler.restriction == 3
          target = $game_troop.random_target_enemy
        elsif @active_battler.restriction == 2
          target = $game_party.random_target_actor
        else
          index = @active_battler.current_action.target_index
          target = $game_party.smooth_target_actor(index)
        end
      end
      # 行动方的战斗者是角色的情况下
      if @active_battler.is_a?(Game_Actor)
        @actor_command_window.able_item(1)
        @disable_skill=false
        if @active_battler.restriction == 3
          target = $game_party.random_target_actor
        elsif @active_battler.restriction == 2
          target = $game_troop.random_target_enemy
        else
          index = @active_battler.current_action.target_index
          target = $game_troop.smooth_target_enemy(index)
        end
      end
      #s_atk=draw_atk_text(@active_battler,target).split('|')
      # 设置对像方的战斗者序列
      @target_battlers = [target]
      if @active_battler.is_a?(Game_Enemy) and @active_battler.id==135
        for target in @target_battlers
          target.skill_effect(@active_battler,$data_skills[26],@help_window)
        end
        return
      end
      if @active_battler.is_a?(Game_Actor) and $game_switches[100]==true and $game_variables[13]<=16
        for target in @target_battlers
          target.skill_effect(@active_battler,$data_skills[27],@help_window)
        end
        return
      end
      s_atk=draw_atk_text(@active_battler,target).split('|')
      # 应用通常攻击效果
      for target in @target_battlers
        target.attack_effect(@active_battler,s_atk[0],s_atk[1],s_atk[2])
      end
      return
    end
    # 防御的情况下
    if @active_battler.current_action.basic == 1
      # 帮助窗口显示"防御"
      @help_window.set_text($data_system.words.guard, 1)
      return
    end
    # 逃跑的情况下
    if @active_battler.is_a?(Game_Enemy) and
       @active_battler.current_action.basic == 2
      #  帮助窗口显示"逃跑"
      @help_window.set_text("逃跑", 1)
      # 逃跑
      @active_battler.escape
      return
    end
    # 什么也不做的情况下
    if @active_battler.current_action.basic == 3
      # 清除强制行动对像的战斗者
      $game_temp.forcing_battler = nil
      # 移至步骤 1
      @phase4_step = 1
      return
    end
  end
  #--------------------------------------------------------------------------
  # ● 设置物品或特技对像方的战斗者
  #     scope : 特技或者是物品的范围
  #--------------------------------------------------------------------------
  def set_target_battlers(scope)
    # 行动方的战斗者是敌人的情况下
    if @active_battler.is_a?(Game_Enemy)
      # 效果范围分支
      case scope
      when 1  # 敌单体
        index = @active_battler.current_action.target_index
        @target_battlers.push($game_party.smooth_target_actor(index))
      when 2  # 敌全体
        for actor in $game_party.actors
          if actor.exist?
            @target_battlers.push(actor)
          end
        end
      when 3  # 我方单体
        index = @active_battler.current_action.target_index
        @target_battlers.push($game_troop.smooth_target_enemy(index))
      when 4  # 我方全体
        for enemy in $game_troop.enemies
          if enemy.exist?
            @target_battlers.push(enemy)
          end
        end
      when 5  # 我方单体 (HP 0) 
        index = @active_battler.current_action.target_index
        enemy = $game_troop.enemies[index]
        if enemy != nil and enemy.hp0?
          @target_battlers.push(enemy)
        end
      when 6  # 我方全体 (HP 0) 
        for enemy in $game_troop.enemies
          if enemy != nil and enemy.hp0?
            @target_battlers.push(enemy)
          end
        end
      when 7  # 使用者
        @target_battlers.push(@active_battler)
      end
    end
    # 行动方的战斗者是角色的情况下
    if @active_battler.is_a?(Game_Actor)
      # 效果范围分支
      case scope
      when 1  # 敌单体
        index = @active_battler.current_action.target_index
        @target_battlers.push($game_troop.smooth_target_enemy(index))
      when 2  # 敌全体
        for enemy in $game_troop.enemies
          if enemy.exist?
            @target_battlers.push(enemy)
          end
        end
      when 3  # 我方单体
        index = @active_battler.current_action.target_index
        @target_battlers.push($game_party.smooth_target_actor(index))
      when 4  # 我方全体
        for actor in $game_party.actors
          if actor.exist?
            @target_battlers.push(actor)
          end
        end
      when 5  # 我方单体 (HP 0) 
        index = @active_battler.current_action.target_index
        actor = $game_party.actors[index]
        if actor != nil and actor.hp0?
          @target_battlers.push(actor)
        end
      when 6  # 我方全体 (HP 0) 
        for actor in $game_party.actors
          if actor != nil and actor.hp0?
            @target_battlers.push(actor)
          end
        end
      when 7  # 使用者
        @target_battlers.push(@active_battler)
      end
    end
  end
  #--------------------------------------------------------------------------
  # ● 生成特技行动结果
  #--------------------------------------------------------------------------
  def make_skill_action_result
    # 获取特技
    @skill = $data_skills[@active_battler.current_action.skill_id]
    # 如果不是强制行动
    unless @active_battler.current_action.forcing
      # 因为 SP 耗尽而无法使用的情况下
      unless @active_battler.skill_can_use?(@skill.id)
        # 清除强制行动对像的战斗者
        $game_temp.forcing_battler = nil
        # 移至步骤 1
        @phase4_step = 1
        return
      end
    end
    # 消耗 SP
    @active_battler.sp -= @skill.sp_cost
    if @active_battler.is_a?(Game_Actor)
      @actor_command_window.disable_item(1)
      @disable_skill=true
    end
    # 刷新状态窗口
    @status_window.refresh
    # 设置动画 ID
    @animation1_id = @skill.animation1_id
    @animation2_id = @skill.animation2_id
    # 设置公共事件 ID
    @common_event_id = @skill.common_event_id
    # 设置对像侧战斗者
    set_target_battlers(@skill.scope)
    # 应用特技效果
    for target in @target_battlers
      target.skill_effect(@active_battler, @skill, @help_window)
    end
  end
  #--------------------------------------------------------------------------
  # ● 生成物品行动结果
  #--------------------------------------------------------------------------
  def make_item_action_result
    @target=$game_party.actors[0]
    # 获取物品
    @item = $data_items[@active_battler.current_action.item_id]
    # 因为物品耗尽而无法使用的情况下
    unless $game_party.item_can_use?(@item.id)
      return
    end
    $game_party.lose_item(@item.id, 1)
    full_hp=100+$game_variables[24]/4
    full_hp+=[($game_variables[157]-14)*20,300].min
    case @item.id
    when 8
      maxhp=@target.maxhp
      if full_hp==maxhp
        $game_party.gain_item(@item.id,1)
        $game_system.se_play($data_system.buzzer_se)
      else
        maxhp+=full_hp/4
        @target.maxhp=[maxhp,full_hp].min
      end
    when 9
      maxhp=@target.maxhp
      if full_hp==maxhp
        $game_party.gain_item(@item.id,1)
        $game_system.se_play($data_system.buzzer_se)
      else
        maxhp+=full_hp/2
        @target.maxhp=[maxhp,full_hp].min
      end
    when 10
      $game_variables[24] +=5
    end
  end
  #--------------------------------------------------------------------------
  # ● 刷新画面 (主回合步骤 3 : 行动方动画)
  #--------------------------------------------------------------------------
  def update_phase4_step3
    # 行动方动画 (ID 为 0 的情况下是白色闪烁)
    if @animation1_id == 0
      @active_battler.white_flash = false
    else
      @active_battler.animation_id = @animation1_id
      @active_battler.animation_hit = true
    end
    @help_window.draw_words($defend_text)
    # 对像方动画
    for target in @target_battlers
      target.animation_id = @animation2_id
      target.animation_hit = (target.damage != "Miss")
      if ["Miss",""].include?(target.damage)
        Audio.se_play("Audio/SE/Miss.ogg")
      else
        target.animation_id = 1
      end
    end
    # 限制动画长度、最低 8 帧
    @wait_count = 18
    # 移至步骤 5
    @phase4_step = 5
  end

  #--------------------------------------------------------------------------
  # ● 刷新画面 (主回合步骤 5 : 显示伤害)
  #--------------------------------------------------------------------------
  def update_phase4_step5
    # 刷新状态窗口
    @status_window.refresh
    # 显示伤害
    for target in @target_battlers
      if target.damage != nil
        target.damage_pop = false
      end
    end
    # 隐藏帮助窗口
    @help_window.visible = false
    # 移至步骤 6
    @phase4_step = 6
  end
  #--------------------------------------------------------------------------
  # ● 刷新画面 (主回合步骤 6 : 刷新)
  #--------------------------------------------------------------------------
  def update_phase4_step6
    # 清除强制行动对像的战斗者
    $game_temp.forcing_battler = nil
    # 公共事件 ID 有效的情况下
    if @common_event_id > 0
      # 设置事件
      common_event = $data_common_events[@common_event_id]
      $game_system.battle_interpreter.setup(common_event.list, 0)
    end
    # 移至步骤 1
    @phase4_step = 1
  end
  #--------------------------------------------------------------------------
  # ● 检查能否使用绝招
  #--------------------------------------------------------------------------
  def skill_check(id)
    @can_use=true
    @actor=$game_actors[1]
    skill_levels={2=>[[32,72],[29,54],[72,90],[45,90],[54,90],[40,90]],
                 3=>[[32,72],[29,53],[72,70],[45,70],[53,70],[40,70]],
                 4=>[[32,72],[29,53],[30,80],[72,70],[45,70],[80,90]],
                 5=>[[32,72],[29,54],[30,80],[72,70],[45,70],[80,90]],
                 6=>[[32,73],[73,60],[45,60]],
                 7=>[[32,73],[30,88],[73,80],[45,80],[88,80],[44,80]],
                 8=>[[32,73],[30,81],[73,100],[45,100],[81,100],[42,100]],
                 11=>[[32,74],[30,89],[74,80],[45,80],[89,80],[43,80]],
                 9=>[[32,74],[74,60],[45,60]],
                 10=>[[32,74],[74,80],[45,80]],
                 12=>[[32,75],[75,60],[45,60]],
                 13=>[[32,75],[75,70],[45,70]],
                 14=>[[32,75],[30,82],[75,60],[45,60],[82,60],[42,60]],
                 15=>[[32,75],[30,82],[75,80],[45,80],[82,80],[42,80]],
                 16=>[[32,76],[29,58],[76,70],[45,70],[58,70],[40,70]],
                 17=>[[32,76],[29,58],[76,100],[45,100],[58,100],[40,100]],
                 18=>[[32,76],[29,58],[76,120],[45,120],[58,120],[40,120]],
                 19=>[[32,76],[29,58],[76,60],[45,60],[58,60],[40,60]],
                 20=>[[32,76],[30,85],[76,80],[45,80],[85,80],[41,80]],
                 21=>[[32,76],[30,85],[76,80],[45,80],[85,80],[41,80]],
                 22=>[[32,76],[30,85],[76,120],[45,120],[85,120],[41,120]],
                 23=>[[32,77],[29,59],[77,100],[45,100],[59,80],[40,80]],
                 24=>[[32,77],[30,86],[77,60],[45,60],[86,60],[41,60]],
                 25=>[[32,77],[77,60],[45,60]]}
    #检查技能
    for index in skill_levels[id]
      if index[0]<38
        if $game_variables[index[0]]!=index[1]
          if index[0]==32
            $game_system.se_play($data_system.buzzer_se)
            @help_window.draw_words($data_skills[id].name+"必须配合"+
                                    $data_system.variables[index[1]]+"使用！")
            window_swap
          end
          @can_use=false
          return
        end
      else
        if $game_variables[index[0]]<index[1]
          if [45,72,73,74,75,76,77].include?(index[0])
            $game_system.se_play($data_system.buzzer_se)
            @help_window.draw_words("你的"+$data_system.variables[skill_levels[id][0][1]]+
                                    "修为不够！")
            window_swap
            @can_use=false
            return
          else
            if [80,81,82,83,84,85,86,87,88,89,39,41,42,43,44].include?(index[0])
              i=30
            else
              i=29
            end
            $game_system.se_play($data_system.buzzer_se)
            @help_window.draw_words("你的"+$data_system.variables[$game_variables[i]]+
                                    "修为不够！")
            window_swap
            @can_use=false
            return
          end
        end
      end
    end
    if id==11 and $game_variables[11]+$game_variables[40]/10<33
      $game_system.se_play($data_system.buzzer_se)
      @help_window.draw_words("你臂力不够，无法使用流星飞掷！")
      window_swap
      @can_use=false
      return
    end
    @can_use=true
  end
end#==============================================================================
# ■ Scene_PreNetBattle
#------------------------------------------------------------------------------
# 　准备联机对战的类。
#==============================================================================

class Scene_PreNetBattle
  def initialize(type)
    @is_server=type
    $game_temp.msg_for_socket
    @wait_count=1200
    $game_temp.battle_calling = false
    $game_temp.menu_calling = false
    $game_temp.menu_beep = false
    @connected=false
    @server_ready=false
  end
  def main
    @screen = Spriteset_Map.new
    @help_window = Window_Help.new
    @help_window.y=416
    Graphics.transition
    loop do
      Graphics.update
      Input.update
      update
      if $scene != self
        break
      end
    end
    Graphics.freeze 
    @screen.dispose
    @help_window.dispose
  end
  def close_connect
    unless @client_sock.nil?
      Win32API.new('ws2_32','closesocket','p','v').call(@client_sock)
      @client_sock=nil
    end
    unless @server_sock.nil?
      Win32API.new('ws2_32','closesocket','p','v').call(@server_sock)
      @server_sock=nil
    end
  end
  def update
    if @is_server
      update_server_connect
    else
      update_client_connect
    end
  end
  def update_client_connect
    if @client_sock.nil?
      enter_ip
      unless check_ip(@serverip)
        print "IP格式不正确，请重新输入！"
        return
      end
      @client_sock=Win32API.new('Lib/NetworkSupport','create_client','v','L').call
      @wait_count=1200
      @help_window.draw_words("正在连接到："+@serverip)
    elsif @connected
      unless @server_ready
        Win32API.new('Lib/NetworkSupport','cli_merry_send','ppp','v').call(@client_sock,@actor_data,@serverip)
        msg=Win32API.new('Lib/NetworkSupport','cli_merry_recv','pp','p').call(@client_sock,@serverip)
        if msg=="recieved"
          @server_ready=true
          return
        end
      else
        msg=Win32API.new('Lib/NetworkSupport','cli_merry_recv','pp','p').call(@client_sock,@serverip)
        if msg["actor_data"]=="actor_data"
          $game_temp.msg_for_net_battler=msg
          Win32API.new('Lib/NetworkSupport','cli_merry_send','ppp','v').call(@client_sock,"recieved",@serverip)
          Win32API.new('Lib/NetworkSupport','cli_merry_send','ppp','v').call(@client_sock,"recieved",@serverip)
          Win32API.new('Lib/NetworkSupport','cli_merry_send','ppp','v').call(@client_sock,"recieved",@serverip)
          Win32API.new('Lib/NetworkSupport','cli_merry_send','ppp','v').call(@client_sock,"recieved",@serverip)
          Win32API.new('Lib/NetworkSupport','cli_merry_send','ppp','v').call(@client_sock,"recieved",@serverip)
          $game_temp.msg_for_socket=@serverip
          $game_party.gain_gold(-2000)
          $scene=Scene_NetBattle.new(false,@client_sock)
          return
        end
      end
    else
      if @wait_count==-1
        close_connect
        p "超时，请检查网络！"
        $scene=Scene_Map.new
        return
      end
      if Input.trigger?(Input::B)
        close_connect
        p "已中断连接！"
        $scene=Scene_Map.new
        return
      end
      @wait_count-=1
      if 1==Win32API.new('Lib/NetworkSupport','client_connect','pp','i').call(@client_sock,@serverip)
        @connected=true
        @help_window.set_text("已连接！")
        encode_actor_data
        $game_temp.msg_for_net_battler=""
      end
    end
  end
  def update_server_connect
    if @server_sock.nil?
      @server_sock=Win32API.new('Lib/NetworkSupport','create_server','v','L').call
      self_ip=Win32API.new('Lib/NetworkSupport','get_host_ip_string','v','p').call
      if Win32API.new('Lib/NetworkSupport','check_InternalIP','v','i').call==1
        type="  类型：外网"
      else
        type="  类型：内网"
      end
      @help_window.set_text("本机IP:"+self_ip+type)
      @wait_count=1200
    elsif @connected
      msg=Win32API.new('Lib/NetworkSupport','srv_merry_recv','ppp','p').call(@server_sock,@client_msg.split(':')[0],@client_msg.split(':')[1])
      if @client_ready
        if msg=="recieved"
          $game_party.gain_gold(-2000)
          $scene=Scene_NetBattle.new(true,@server_sock)
          return
        else
          Win32API.new('Lib/NetworkSupport','srv_merry_send','pppp','v').call(@server_sock,@actor_data,@client_msg.split(':')[0],@client_msg.split(':')[1])
        end
      else
        if msg["actor_data"]=="actor_data"
          @client_ready=true
          $game_temp.msg_for_net_battler=msg
          Win32API.new('Lib/NetworkSupport','srv_merry_send','pppp','v').call(@server_sock,"recieved",@client_msg.split(':')[0],@client_msg.split(':')[1])
          Win32API.new('Lib/NetworkSupport','srv_merry_send','pppp','v').call(@server_sock,"recieved",@client_msg.split(':')[0],@client_msg.split(':')[1])
          Win32API.new('Lib/NetworkSupport','srv_merry_send','pppp','v').call(@server_sock,"recieved",@client_msg.split(':')[0],@client_msg.split(':')[1])
          Win32API.new('Lib/NetworkSupport','srv_merry_send','pppp','v').call(@server_sock,"recieved",@client_msg.split(':')[0],@client_msg.split(':')[1])
          Win32API.new('Lib/NetworkSupport','srv_merry_send','pppp','v').call(@server_sock,"recieved",@client_msg.split(':')[0],@client_msg.split(':')[1])
        end
      end
    else
      if @wait_count==-1
        close_connect
        p "超时，请检查网络！"
        $scene=Scene_Map.new
        return
      end
      if Input.trigger?(Input::B)
        close_connect
        p "已中断连接！"
        $scene=Scene_Map.new
        return
      end
      @wait_count-=1
      @client_msg=Win32API.new('Lib/NetworkSupport','server_accept','p','p').call(@server_sock)
      if @client_msg !="0"
        @connected=true
        @client_ready=false
        $game_temp.msg_for_socket=@client_msg
        @help_window.set_text("已连接！")
        $game_temp.msg_for_net_battler=""
        encode_actor_data
      end
    end
  end
  def encode_actor_data
    actor=$game_party.actors[0]
    @actor_data="actor_data"+"|"+actor.name+"|"+$gender+"|"+
      actor.hp.to_s+"|"+actor.sp.to_s+"|"+
      actor.maxhp.to_s+"|"+actor.maxsp.to_s+"|"+$game_variables[23].to_s+"|"+
      $game_variables[11].to_s+"|"+$game_variables[12].to_s+
      "|"+$game_variables[13].to_s+"|"+$game_variables[14].to_s+"|"
    for i in 29..33
      @actor_data+=$game_variables[i].to_s+"|"
    end
    @actor_data+=actor.weapon_id.to_s+"|"+actor.armor3_id.to_s+"|"+
      actor.armor4_id.to_s+"| 40 |"+$game_variables[40].to_s+"| 45 |"+
      $game_variables[45].to_s+"| 46 |"+$game_variables[46].to_s+"| 47 |"+
      $game_variables[47].to_s+"| 48 |"+$game_variables[48].to_s+"|"
    if actor.weapon_id !=0
      sk_id=get_weapon_base_skill
      @actor_data+=sk_id.to_s+"|"+$game_variables[sk_id].to_s+"| 0 | 0 |"
    else
      @actor_data+="0 | 0 | 0 | 0 |"
    end
    for i in [51,$game_variables[29],$game_variables[30],$game_variables[31],
              $game_variables[32]]
      @actor_data+=i.to_s+"|"+$game_variables[i].to_s+"|"
    end
    @actor_data+=$game_variables[94].to_s+"|"+$game_variables[95].to_s+"|"+
                 $game_variables[19].to_s+"|"+$game_variables[21].to_s+"|"+
                 $game_variables[96].to_s+"|"+$game_variables[91].to_s+"|"+
                 $game_variables[92].to_s+"|"
  end
  def enter_ip
    Win32API.new("Lib/ActorNameSupport.dll", "CreateInputBox", [], '').call
    Win32API.new("Lib/ActorNameSupport.dll", "SetEdit", ['I','I','I','I','I','I','I'], '').Call(50,20,200,32,0,128,128)
    Win32API.new("Lib/ActorNameSupport.dll", "SetEditFont", ['P','I','I','I','I'], '').call('宋体',12,255,255,255)
    Win32API.new("Lib/ActorNameSupport.dll", "SetBox", ['I','I','I'], '').Call(300,72,0)
    ip_thread = Thread.new{@serverip=Win32API.new("Lib/ActorNameSupport.dll", "NameInputBox", ['P'], 'P').call("1.0.0.1")}
  end
  def check_ip(str_ip)
    check_char = "0123456789.".scan(/./)
    dot_num = 0
    for char in str_ip.scan(/./)
      dot_num += 1 if char == "."
      if !check_char.include? char
        return false
      end
    end
    if dot_num != 3
      return false
    end
    g_char = str_ip.split(/\./)
    if g_char.size != 4
      return false
    end
    for i in g_char
      if i.to_i < 0 or i.to_i > 255
        return false
      end
    end
    return true
  end
end#==============================================================================
# ■ Scene_NetBattle (分割定义 1)
#------------------------------------------------------------------------------
# 　处理联机战斗画面的类。
#==============================================================================
class Scene_NetBattle
  def initialize(type,self_sock)
    @is_server=type
    @self_sock=self_sock
    if type
      @clientmsg=$game_temp.msg_for_socket
    else
      @serverip=$game_temp.msg_for_socket
    end
    $game_temp.map_bgm = $game_system.playing_bgm
    $game_system.bgm_stop
    Audio.bgm_play("Audio/BGM/战斗1", 100, 100)
  end
  def exchange_data
    enemy_data=$game_temp.msg_for_net_battler
    dt=enemy_data.split('|')
    $data_enemies[143].name=dt[1]
    $data_enemies[143].maxhp=dt[5].to_i
    $data_enemies[143].maxsp=dt[6].to_i
    $data_enemies[143].exp=dt[7].to_i
    $game_troop.setup(143)
    $game_troop.enemies[0].hp=dt[3].to_i
    $game_troop.enemies[0].sp=dt[4].to_i
    $npc_data=[]
    for i in 8..19
      $npc_data.push(dt[i].to_i)
    end
    for i in 10..21
      $npc_data.push([dt[2*i].to_i,dt[2*i+1].to_i])
    end
    for i in 44..50
      $npc_data.push(dt[i].to_i)
    end
  end
  #--------------------------------------------------------------------------
  # ● 主处理
  #--------------------------------------------------------------------------
  def main
    Graphics.frame_rate = 40
    remove_damage_error
    # 初始化战斗用的各种暂时数据
    $game_temp.in_battle = true
    $game_temp.battle_turn = 0
    $game_temp.battle_event_flags.clear
    $game_temp.battle_abort = false
    $game_temp.battle_main_phase = false
    $game_temp.battleback_name = $game_map.battleback_name
    $game_temp.forcing_battler = nil
    # 初始化战斗用事件解释器
    $game_system.battle_interpreter.setup(nil, 0)
    # 准备队伍
    exchange_data
    # 生成角色命令窗口
    @actor_command_window = Window_Command.new(400, ["攻击","绝招","吸气","物品","逃跑"],5)
    @actor_command_window.x = 120
    @actor_command_window.y = 300
    @actor_command_window.active = false
    @actor_command_window.visible = false
    @disable_skill=false
    # 生成其它窗口
    @back = Sprite.new
    @back.bitmap = Bitmap.new("Graphics/Pictures/BG.png") 
    @back.y = 0
    @back.z = 0
    @help_window = Window_Help.new
    @help_window.y=352
    @help_window.height=128
    @help_window.contents=Bitmap.new(@help_window.width-32,@help_window.height-32)
    @help_window.visible = false
    @status_window = Window_BattleStatus.new
    @status_window.x = 72
    @status_window.y = 150
    @status_window.opacity = 0
    @message_window = Window_Message.new
    # 生成活动块
    @spriteset = Spriteset_Battle.new
    # 初始化等待计数
    @wait_count = 600
    # 执行过渡
    if $data_system.battle_transition == ""
      Graphics.transition(20)
    else
      Graphics.transition(40, "Graphics/Transitions/" +
        $data_system.battle_transition)
    end
    # 开始自由战斗回合
    start_phase1
    # 主循环
    loop do
      # 刷新游戏画面
      Graphics.update
      # 刷新输入信息
      Input.update
      # 刷新画面
      update
      # 如果画面切换的话就中断循环
      if $scene != self
        break
      end
    end
    # 刷新地图
    $game_map.refresh
    # 准备过渡
    Graphics.freeze
    # 释放窗口
    @status_window.dispose
    @actor_command_window.dispose
    @help_window.dispose
    @back.dispose
    @message_window.dispose
    if @skill_window != nil
      @skill_window.dispose
    end
    if @item_window != nil
      @item_window.dispose
    end
    if @result_window != nil
      @result_window.dispose
    end
    Win32API.new('ws2_32','closesocket','p','v').call(@self_sock)
    @spriteset.dispose
  end
  #--------------------------------------------------------------------------
  # ● 清除人物身上的动画id
  #--------------------------------------------------------------------------
  def remove_damage_error
    $game_party.actors.each do |battler|
      battler.damage = nil
      battler.animation_id = 0
    end
  end
  #--------------------------------------------------------------------------
  # ● 胜负判定
  #--------------------------------------------------------------------------
  def judge
    if $game_party.all_dead? or $game_party.actors.size == 0
      battle_end(1)
      return true
    end
    if $game_troop.enemies[0].exist?
      return false
    end
    # 胜利
    start_phase5
    return true
  end
  #--------------------------------------------------------------------------
  # ● 战斗结束
  #     result : 結果 (0:胜利 1:逃跑 2:失败)
  #--------------------------------------------------------------------------
  def battle_end(result)
    $game_actors[1].hp=1 if result>0
    # 清除战斗中标志
    $game_temp.in_battle = false
    # 清除全体同伴的行动
    $game_party.clear_actions
    # 解除战斗用状态
    for actor in $game_party.actors
      actor.remove_states_battle
    end
    $game_troop.enemies.clear
    if $game_temp.battle_proc != nil
      $game_temp.battle_proc.call(result)
      $game_temp.battle_proc = nil
    end
    $game_system.bgm_play($game_temp.map_bgm)
    $scene = Scene_Map.new
  end
  #--------------------------------------------------------------------------
  # ● 刷新画面
  #--------------------------------------------------------------------------
  def update  
    # 系统 (计时器)、刷新画面
    $game_system.update
    $game_screen.update
    # 刷新窗口
    @help_window.update
    @actor_command_window.update
    @status_window.update
    @message_window.update
    # 刷新活动块
    @spriteset.update
    # 处理过渡中的情况下
    if $game_temp.transition_processing
      # 清除处理过渡中标志
      $game_temp.transition_processing = false
      # 执行过渡
      if $game_temp.transition_name == ""
        Graphics.transition(20)
      else
        Graphics.transition(40, "Graphics/Transitions/" +
          $game_temp.transition_name)
      end
    end
    # 显示信息窗口中的情况下
    if $game_temp.message_window_showing
      return
    end
    # 显示效果中的情况下
    if @spriteset.effect?
      return
    end
    # 中断战斗的情况下
    if $game_temp.battle_abort
      # 还原为战斗前的 BGM
      $game_system.bgm_play($game_temp.map_bgm)
      # 战斗结束
      battle_end(1)
      return
    end
    # 强制行动的角色存在、
    # 并且战斗事件正在执行的情况下
    if $game_temp.forcing_battler == nil and
       $game_system.battle_interpreter.running?
      return
    end
    # 回合分支
    case @phase
    when 1  # 自由战斗回合
      update_phase1
    when 3  # 角色命令回合
      update_phase3
    when 4  # 主回合
      update_phase4
    when 5  # 战斗结束回合
      update_phase5
    end
  end
  def recv
    if @is_server
      return Win32API.new("Lib/NetworkSupport.dll",'srv_merry_recv','ppp','p').call(@self_sock,@clientmsg.split(':')[0],@clientmsg.split(':')[1])
    else
      return Win32API.new("Lib/NetworkSupport.dll",'cli_merry_recv','pp','p').call(@self_sock,@serverip)
    end
  end
  def send(msg)
    if @is_server
      return Win32API.new("Lib/NetworkSupport.dll",'srv_merry_send','pppp','v').call(@self_sock,msg,@clientmsg.split(':')[0],@clientmsg.split(':')[1])
    else
      return Win32API.new("Lib/NetworkSupport.dll",'cli_merry_send','ppp','v').call(@self_sock,msg,@serverip)
    end
  end
  #--------------------------------------------------------------------------
  # ● 开始自由战斗回合
  #--------------------------------------------------------------------------
  def start_phase1
    # 清除全体同伴的行动
    $game_party.clear_actions
    if @is_server
      @phase=1
    else
      start_phase3
    end
  end
  #--------------------------------------------------------------------------
  # ● 刷新画面 (自由战斗回合)
  #--------------------------------------------------------------------------
  def update_phase1
    # 胜败判定
    if judge
      # 胜利或者失败的情况下 : 过程结束
      return
    end
    @help_window.visible=true
    @help_window.contents.clear
    if $game_party.actors[0].inputable?
      @help_window.draw_words("等待对方操作……")
    else
      @help_window.draw_words("你现在呆若木鸡，等待对方操作……")
    end
    message=recv
    if message=="next"
      start_phase3
    elsif message["action"] !=nil
      @wait_count=600
      decode_action(message)
      return
    elsif message=="you_win"
      @help_window.contents.clear
      @help_window.draw_words("对方已认输，你获胜了！")
      start_phase5
      return
    elsif message=="active"
      @wait_count-=1
      if @wait_count==0
        p "网络出现异常，连接已断开"
        $game_party.gain_gold(2000)
        battle_end(1)
      end
    end
  end
  def decode_action(message)
    msg=message.split('|')
    @wait_count=600
    type=msg[1].to_i
    case type
    #攻击
    when 1
      send("recieved")
      send("active")
      s_atk=draw_atk_text($game_troop.enemies[0],$game_party.actors[0],0,msg[6].to_i,msg[8].to_i).split('|')
      hit_result=msg[2].to_i
      if msg[3]=="Miss"
        $game_party.actors[0].damage=msg[3]
        case hit_result
        when 1
          text=draw_defend_text($game_party.actors[0],$game_troop.enemies[0],msg[7].to_i).split('|')
        when 2
          text=draw_defend2_text($game_party.actors[0],msg[7].to_i).split('|')
        end
        $defend_text=text[0]
        Audio.se_play("Audio/SE/Miss.ogg")
      else
        $game_party.actors[0].damage=msg[3].to_i
        full_hp=100+$game_variables[24]/4
        full_hp+=[($game_variables[157]-14)*20,300].min
        result_array=draw_hit_result("你",s_atk[2])
        index=get_hit_index($game_party.actors[0].damage)
        index=[index,result_array.size-1].min
        $defend_text=result_array[index]+draw_hurt_text("你",$game_party.actors[0].hp-$game_party.actors[0].damage,full_hp,0)
        $game_party.actors[0].animation_id=1
        Audio.se_play("Audio/SE/Blow8.ogg")
      end
      @help_window.draw_words($defend_text)
      for i in 1..20
        Graphics.update
      end
      send("active")
      $game_party.actors[0].damage_pop=false
      $game_party.actors[0].hp=msg[4].to_i
      $game_party.actors[0].maxhp=msg[5].to_i
      $game_party.actors[0].states=[]
      for i in 9..msg.size
        state=msg[i].to_i
        $game_party.actors[0].states.push state if state!=0
      end
      @status_window.refresh
      @spriteset.update
      start_phase3
    #绝招
    when 2
      send("recieved")
      skill=$data_skills[msg[2].to_i]
      words=get_skill_words($game_troop.enemies[0] ,$game_party.actors[0] ,skill.id)
      damage=msg[3]
      dis_id=msg[6].to_i
      add_abi=[29,30,24,25,28,91,92,94,95,96]
      for i in 0..4
        $npc_data[add_abi[i]]=msg[7+i].to_i
      end
      for i in 5..9
        $game_variables[add_abi[i]]=msg[7+i].to_i
      end
      unless damage=="Miss"
        damage=msg[3].to_i
      end
      @help_window.draw_words(words[0])
      for i in 0..20
        send("active")
        Graphics.update
      end
      if skill.scope<3
        $game_party.actors[0].damage=damage
        $game_party.actors[0].damage_pop=false
        $game_party.actors[0].hp=msg[4].to_i
        $game_party.actors[0].maxhp=msg[5].to_i
        $game_party.actors[0].states=[]
        for i in 17..msg.size
          state=msg[i].to_i
          $game_party.actors[0].states.push state if state!=0
        end
        if skill.id==18
          case dis_id
          when 100
            s_atk=draw_atk_text($game_troop.enemies[0],$game_party.actors[0],58,0,0,window).split('|')
            if damage != "Miss"
              full_hp=100+$game_variables[24]/4
              full_hp+=[($game_variables[157]-14)*20,300].min
              result_array=draw_hit_result("你",s_atk[2])
              index=get_hit_index($game_party.actors[0].damage)
              index=[index,result_array.size-1].min
              $defend_text=result_array[index]+draw_hurt_text("你",$game_party.actors[0].hp-$game_party.actors[0].damage,full_hp,0)
              $game_party.actors[0].animation_id=1
              Audio.se_play("Audio/SE/Blow8.ogg")
            else
              text=draw_defend_text($game_party.actors[0],$game_troop.enemies[0]).split('|')
              $defend_text=text[0]
              Audio.se_play("Audio/SE/Miss.ogg")
            end
          when 12
            @help_window.draw_words(words[1])
            for i in 0..20
              Graphics.update
            end
            $defend_text=words[2]
          when 13
            @help_window.draw_words(words[1])
            for i in 0..20
              Graphics.update
            end
            $defend_text=words[3]
          end
        elsif [4,5,24,22,14,15,8,26,27].include?(skill.id)
          s_atk=draw_atk_text($game_troop.enemies[0],$game_party.actors[0]).split('|')
          if damage != "Miss"
            full_hp=100+$game_variables[24]/4
            full_hp+=[($game_variables[157]-14)*20,300].min
            result_array=draw_hit_result("你",s_atk[2])
            index=get_hit_index($game_party.actors[0].damage)
            index=[index,result_array.size-1].min
            $defend_text=result_array[index]+draw_hurt_text("你",$game_party.actors[0].hp-$game_party.actors[0].damage,full_hp,0)
            $game_party.actors[0].animation_id=1
            Audio.se_play("Audio/SE/Blow8.ogg")
          else
            text=draw_defend_text($game_party.actors[0],$game_troop.enemies[0]).split('|')
            $defend_text=text[0]
            Audio.se_play("Audio/SE/Miss.ogg")
          end
        else
          $defend_text= dis_id==100 ? "" : words[dis_id]
        end
      else
        $game_troop.enemies[0].damage=""
        $game_troop.enemies[0].damage_pop=false
        $game_troop.enemies[0].hp=msg[4].to_i
        $game_troop.enemies[0].maxhp=msg[5].to_i
        for i in 17..msg.size
          $game_troop.enemies[0].states=[]
          state=msg[i].to_i
          $game_troop.enemies[0].states.push state if state!=0
        end
      end
      @help_window.draw_words($defend_text)
      for i in 1..20
        Graphics.update
      end
      send("active")
      @status_window.refresh
      @spriteset.update
      start_phase3
    #吸气，物品
    when 3,4
      $game_troop.enemies[0].hp=msg[2].to_i
      $data_enemies[143].maxhp=msg[3].to_i
      @status_window.refresh
      return
    end
  end
  #--------------------------------------------------------------------------
  # ● 认输并结束战斗
  #--------------------------------------------------------------------------
  def escape
    send("you_win")
    send("you_win")
    send("you_win")
    send("you_win")
    send("you_win")
    battle_end(1)
  end
  #--------------------------------------------------------------------------
  # ● 开始结束战斗回合
  #--------------------------------------------------------------------------
  def start_phase5
    $game_party.actors[0].recover_all
    @phase = 5
    $game_system.me_play($game_system.battle_end_me)
    $game_party.gain_gold(4000)
    @result_window = Window_BattleResult.new(4000,"","","","")
    @phase5_wait_count = 50
  end
  #--------------------------------------------------------------------------
  # ● 画面更新 (结束战斗回合)
  #--------------------------------------------------------------------------
  def update_phase5
    if @phase5_wait_count > 0
      @phase5_wait_count -= 1
      if @phase5_wait_count == 0
        @result_window.visible = true
        $game_temp.battle_main_phase = false
        @status_window.refresh
      end
      return
    end
    if Input.trigger?(Input::C)
      battle_end(0)
    end
  end
end#==============================================================================
# ■ Scene_NetBattle (分割定义 2)
#------------------------------------------------------------------------------
# 　处理联机战斗画面的类。
#==============================================================================
class Scene_NetBattle
  #--------------------------------------------------------------------------
  # ● 开始角色命令回合
  #--------------------------------------------------------------------------
  def start_phase3
    send("active")
    # 转移到回合 3
    @phase = 3
    @help_window.visible=false
    # 设置觉得为非选择状态
    @actor_index = -1
    @active_battler = nil
    if judge
      return
    end
    @wait_count=600
    # 输入下一个角色的命令
    phase3_next_actor
  end
  #--------------------------------------------------------------------------
  # ● 转到输入下一个角色的命令
  #--------------------------------------------------------------------------
  def phase3_next_actor
    unless $game_party.actors[0].inputable?
      @phase = 1
      send("next")
      return
    end
    begin
      # 角色的明灭效果 OFF
      if @active_battler != nil
        @active_battler.blink = false
      end
      # 最后的角色的情况
      if @actor_index == $game_party.actors.size-1
        # 开始主回合
        start_phase4
        return
      end
      # 推进角色索引
      @actor_index += 1
      @active_battler = $game_party.actors[@actor_index]
      @active_battler.blink = true
    # 如果角色是在无法接受指令的状态就再试
    end until @active_battler.inputable?
    # 设置角色的命令窗口
    phase3_setup_command_window
  end
  #--------------------------------------------------------------------------
  # ● 设置角色指令窗口
  #--------------------------------------------------------------------------
  def phase3_setup_command_window
    @actor_command_window.active = true
    @actor_command_window.visible = true
    # 设置索引为 0
    @actor_command_window.index = 0
  end
  #--------------------------------------------------------------------------
  # ● 刷新画面 (角色命令回合)
  #--------------------------------------------------------------------------
  def update_phase3
    @help_window.visible=false
    @help_window.update
    send("active")
    # 敌人光标有效的情况下
    if @enemy_arrow != nil
      update_phase3_enemy_select
    # 角色光标有效的情况下
    elsif @actor_arrow != nil
      update_phase3_actor_select
    # 特技窗口有效的情况下
    elsif @skill_window != nil
      update_phase3_skill_select
    # 物品窗口有效的情况下
    elsif @item_window != nil
      update_phase3_item_select
    # 角色指令窗口有效的情况下
    elsif @actor_command_window.active
      update_phase3_basic_command
    end
  end
  #--------------------------------------------------------------------------
  # ● 刷新画面 (角色命令回合 : 基本命令)
  #--------------------------------------------------------------------------
  def update_phase3_basic_command
    # 按下 B 键的情况下
    if Input.trigger?(Input::B)
      # 演奏取消 SE
      $game_system.se_play($data_system.cancel_se)
      start_phase3
      return
    end
    # 按下 C 键的情况下
    if Input.trigger?(Input::C)
      # 角色指令窗口光标位置分之
      case @actor_command_window.index
      when 0  # 攻击
        # 演奏确定 SE
        $game_system.se_play($data_system.decision_se)
        # 设置行动
        @active_battler.current_action.kind = 0
        @active_battler.current_action.basic = 0
        # 开始选择敌人
        @active_battler.current_action.target_index = $game_troop.enemies[0].index
        phase3_next_actor
      when 1  # 绝招
        if @disable_skill
          $game_system.se_play($data_system.buzzer_se)
          draw_disable_skill
          start_phase3
        else
          # 演奏确定 SE
          $game_system.se_play($data_system.decision_se)
          # 设置行动
          @active_battler.current_action.kind = 1
          # 开始选择特技
          start_skill_select
        end
      when 3  # 物品
        # 演奏确定 SE
        $game_system.se_play($data_system.decision_se)
        # 开始选择物品
        start_item_select
        @status_window.refresh
        start_phase3
      when 2 # 吸气
        # 设置行动
        recover
        @status_window.refresh
        start_phase3
      when 4 # 逃跑
        $game_system.se_play($data_system.decision_se)
        escape
      end
      return
    end
  end
  def draw_disable_skill
    @actor_command_window.active = false
    @actor_command_window.visible = false
    @help_window.visible=true
    @help_window.contents.clear
    @help_window.draw_words("你刚用完外功，还是先歇歇吧。")
    for i in 0..40
      Graphics.update
    end
    @help_window.visible=false
    @actor_command_window.active = true
    @actor_command_window.visible =true
  end
  def recover
    @actor_command_window.active = false
    @actor_command_window.visible = false
    @help_window.visible=true
    @help_window.contents.clear
    if $game_variables[32]==0
      # 演奏 SE
      $game_system.se_play($data_system.buzzer_se)
      @help_window.draw_words("你必须先选择你要用的内功心法！")
      for i in 0..40
        Graphics.update
      end
      @help_window.visible=false
      @actor_command_window.active = true
      @actor_command_window.visible =true
      return
    end
    if $game_variables[24]<50 or $game_actors[1].sp<15
      # 演奏 SE
      $game_system.se_play($data_system.buzzer_se)
      @help_window.draw_words("你的内力不够！")
      for i in 0..40
        Graphics.update
      end
      @help_window.visible=false
      @actor_command_window.active = true
      @actor_command_window.visible =true
      return
    end
    if $game_actors[1].maxhp==$game_actors[1].hp
      # 演奏 SE
      $game_system.se_play($data_system.buzzer_se)
      @help_window.draw_words("你现在体力充沛。")
      for i in 0..40
        Graphics.update
      end
      @help_window.visible=false
      @actor_command_window.active = true
      @actor_command_window.visible =true
      return
    end
    if $game_party.actors[0].sp<($game_party.actors[0].maxhp-$game_party.actors[0].hp)
      $game_party.actors[0].hp+=$game_party.actors[0].sp
      $game_party.actors[0].sp=0
    else
      $game_party.actors[0].sp-=$game_party.actors[0].maxhp-$game_party.actors[0].hp
      $game_party.actors[0].hp=$game_party.actors[0].maxhp
    end
    # 演奏确定 SE
    $game_system.se_play($data_system.decision_se)
    send_recover
    @help_window.draw_words("你深深吸了口气，脸色看起来好多了！")
    for i in 0..40
      Graphics.update
    end
    @help_window.visible=false
    @actor_command_window.active = true
    @actor_command_window.visible =true
  end
  def send_recover
    msg="action| 4 |"+$game_party.actors[0].hp.to_s+"|"+$game_party.actors[0].maxhp.to_s
    send(msg)
    send(msg)
  end
  #--------------------------------------------------------------------------
  # ● 刷新画面 (角色命令回合 : 选择特技)
  #--------------------------------------------------------------------------
  def update_phase3_skill_select
    # 设置特技窗口为可视状态
    @skill_window.visible = true
    # 刷新特技窗口
    @skill_window.update
    # 按下 B 键的情况下
    if Input.trigger?(Input::B)
      # 演奏取消 SE
      $game_system.se_play($data_system.cancel_se)
      # 结束特技选择
      end_skill_select
      return
    end
    # 按下 C 键的情况下
    if Input.trigger?(Input::C)
      # 获取特技选择窗口现在选择的特技的数据
      @skill = @skill_window.skill
      skill_check(@skill.id)
      if @can_use==false  
        return
      end
      # 无法使用的情况下
      if @skill == nil or not @active_battler.skill_can_use?(@skill.id)
        # 演奏冻结 SE
        $game_system.se_play($data_system.buzzer_se)
        if @active_battler.sp<@skill.sp_cost
          @help_window.draw_words("你内力修为不足，无法使用"+@skill.name+"！")
          window_swap
        end
        return
      end
      # 演奏确定 SE
      $game_system.se_play($data_system.decision_se)
      # 设置行动
      @active_battler.current_action.skill_id = @skill.id
      # 设置特技窗口为不可见状态
      @skill_window.visible = false
      # 效果范围是敌单体的情况下
      if @skill.scope == 1
        # 开始选择敌人
        start_enemy_select
      # 效果范围是我方单体的情况下
      elsif @skill.scope == 3 or @skill.scope == 5
        # 开始选择角色
        start_actor_select
      # 效果范围不是单体的情况下
      else
        # 选择特技结束
        end_skill_select
        # 转到下一位角色的指令输入
        start_phase4
      end
      return
    end
  end
  #--------------------------------------------------------------------------
  # ● 刷新画面 (角色命令回合 : 选择物品)
  #--------------------------------------------------------------------------
  def update_phase3_item_select
    @actor_command_window.active = false
    @actor_command_window.visible = false
    # 设置物品窗口为可视状态
    @item_window.visible = true
    # 刷新物品窗口
    @item_window.update
    # 按下 B 键的情况下
    if Input.trigger?(Input::B)
      # 演奏取消 SE
      $game_system.se_play($data_system.cancel_se)
      # 选择物品结束
      end_item_select
      return
    end
    # 按下 C 键的情况下
    if Input.trigger?(Input::C)
      # 获取物品窗口现在选择的物品资料
      @item = @item_window.item
      # 无法使用的情况下
      unless $game_party.item_can_use?(@item.id)
        # 演奏冻结 SE
        $game_system.se_play($data_system.buzzer_se)
        return
      end
      # 演奏确定 SE
      $game_system.se_play($data_system.decision_se)
      # 设置行动
      @active_battler.current_action.item_id = @item.id
      # 设置物品窗口为不可见状态
      @item_window.visible = false
      # 效果范围是敌单体的情况下
      if @item.scope == 1
        # 开始选择敌人
        start_enemy_select
      # 效果范围是我方单体的情况下
      elsif @item.scope == 3 or @item.scope == 5
        # 开始选择角色
        start_actor_select
      # 效果范围不是单体的情况下
      else
        # 物品选择结束
        end_item_select
        make_item_action_result
        @status_window.refresh
      end
      return
    end
  end
  #--------------------------------------------------------------------------
  # ● 刷新画面画面 (角色命令回合 : 选择敌人)
  #--------------------------------------------------------------------------
  def update_phase3_enemy_select
    # 刷新敌人箭头
    @enemy_arrow.update
    # 按下 B 键的情况下
    if Input.trigger?(Input::B)
      # 演奏取消 SE
      $game_system.se_play($data_system.cancel_se)
      # 选择敌人结束
      end_enemy_select
      return
    end
    # 按下 C 键的情况下
    if Input.trigger?(Input::C)
      # 演奏确定 SE
      $game_system.se_play($data_system.decision_se)
      # 设置行动
      @active_battler.current_action.target_index = @enemy_arrow.index
      # 选择敌人结束
      end_enemy_select
      # 显示特技窗口中的情况下
      if @skill_window != nil
        # 结束特技选择
        end_skill_select
      end
      # 显示物品窗口的情况下
      if @item_window != nil
        # 结束物品选择
        end_item_select
      end
      # 转到下一位角色的指令输入
      start_phase4
    end
  end
  #--------------------------------------------------------------------------
  # ● 画面更新 (角色指令回合 : 选择角色)
  #--------------------------------------------------------------------------
  def update_phase3_actor_select
    # 刷新角色箭头
    @actor_arrow.update
    # 按下 B 键的情况下
    if Input.trigger?(Input::B)
      # 演奏取消 SE
      $game_system.se_play($data_system.cancel_se)
      # 选择角色结束
      end_actor_select
      return
    end
    # 按下 C 键的情况下
    if Input.trigger?(Input::C)
      # 演奏确定 SE
      $game_system.se_play($data_system.decision_se)
      # 设置行动
      @active_battler.current_action.target_index = @actor_arrow.index
      # 选择角色结束
      end_actor_select
      # 显示特技窗口中的情况下
      if @skill_window != nil
        # 结束特技选择
        end_skill_select
      end
      # 显示物品窗口的情况下
      if @item_window != nil
        # 结束物品选择
        end_item_select
      end
      # 转到下一位角色的指令输入
      phase3_next_actor
    end
  end
  #--------------------------------------------------------------------------
  # ● 开始选择角色
  #--------------------------------------------------------------------------
  def start_actor_select
    # 生成角色箭头
    #@actor_arrow = Arrow_Actor.new(@spriteset.viewport2)
    #@actor_arrow.index = @actor_index
    # 无效化角色指令窗口
    @actor_command_window.active = false
    @actor_command_window.visible = false
  end
  #--------------------------------------------------------------------------
  # ● 结束选择角色
  #--------------------------------------------------------------------------
  def end_actor_select
    # 释放角色箭头
    @actor_arrow.dispose
    @actor_arrow = nil
  end
  #--------------------------------------------------------------------------
  # ● 开始选择特技
  #--------------------------------------------------------------------------
  def start_skill_select
    study_skill
    if $game_actors[1].skills.size==0
      $game_system.se_play($data_system.buzzer_se)
      start_phase3
      return
    end
    # 生成特技窗口
    @skill_window = Window_BattleSkill.new
    # 无效化角色指令窗口
    @actor_command_window.active = false
    @actor_command_window.visible = false
  end
  #--------------------------------------------------------------------------
  # ● 选择特技结束
  #--------------------------------------------------------------------------
  def end_skill_select
    # 释放特技窗口
    @skill_window.dispose
    @skill_window = nil
    # 隐藏帮助窗口
    @help_window.visible = false
    # 有效化角色指令窗口
    @actor_command_window.active = true
    @actor_command_window.visible = true
  end
  #--------------------------------------------------------------------------
  # ● 开始选择物品
  #--------------------------------------------------------------------------
  def start_item_select
    # 生成物品窗口
    @item_window = Window_BattleItem.new
    # 关联帮助窗口
    #@item_window.help_window = @help_window
    # 无效化角色指令窗口
    @actor_command_window.active = false
    @actor_command_window.visible = false
  end
  #--------------------------------------------------------------------------
  # ● 结束选择物品
  #--------------------------------------------------------------------------
  def end_item_select
    # 释放物品窗口
    @item_window.dispose
    @item_window = nil
    # 隐藏帮助窗口
    #@help_window.visible = false
    # 有效化角色指令窗口
    @actor_command_window.active = true
    @actor_command_window.visible = true
  end
end#==============================================================================
# ■ Scene_NetBattle (分割定义 2)
#------------------------------------------------------------------------------
# 　处理联机战斗画面的类。
#==============================================================================
class Scene_NetBattle
  #--------------------------------------------------------------------------
  # ● 开始主回合
  #--------------------------------------------------------------------------
  def start_phase4
    $game_troop.enemies[0].remove_states_auto(@help_window)
    $game_party.actors[0].blink = false
    @wait_count=600
    # 转移到回合 4
    @phase = 4
    # 回合数计数
    $game_temp.battle_turn += 1
    # 设置角色为非选择状态
    @actor_index = -1
    @active_battler = nil
    # 无效化角色指令窗口
    @actor_command_window.active = false
    @actor_command_window.visible = false
    # 设置主回合标志
    $game_temp.battle_main_phase = true
    # 生成行动顺序
    @action_battlers=[$game_party.actors[0]]
    # 移动到步骤 1
    @phase4_step = 1
  end
  #--------------------------------------------------------------------------
  # ● 刷新画面 (主回合)
  #--------------------------------------------------------------------------
  def update_phase4
    case @phase4_step
    when 1
      update_phase4_step1
    when 2
      update_phase4_step2
    when 3
      update_phase4_step3
    when 4
      update_phase4_step4
    when 5
      update_phase4_step5
    when 6
      update_phase4_step6
    end
  end
  #--------------------------------------------------------------------------
  # ● 刷新画面 (主回合步骤 1 : 准备行动)
  #--------------------------------------------------------------------------
  def update_phase4_step1
    # 隐藏帮助窗口
    @help_window.visible = false
    # 判定胜败
    if judge
      return
    end
    # 强制行动的战斗者不存在的情况下
    if $game_temp.forcing_battler == nil
      # 设置战斗事件
      #setup_battle_event
      # 执行战斗事件中的情况下
      if $game_system.battle_interpreter.running?
        return
      end
    end
    # 强制行动的战斗者存在的情况下
    if $game_temp.forcing_battler != nil
      # 在头部添加后移动
      @action_battlers.delete($game_temp.forcing_battler)
      @action_battlers.unshift($game_temp.forcing_battler)
    end
    # 未行动的战斗者不存在的情况下 (全员已经行动)
    if @action_battlers.size == 0
      msg=recv
      # 开始同伴命令回合
      if msg=="recieved"
        @phase=1 
        @wait_count=600
      end
      @wait_count-=1
      if @wait_count<0
        p "网络出现异常，连接已断开"
        $game_party.gain_gold(2000)
        battle_end(1)
      end
      return
    end
    # 初始化动画 ID 和公共事件 ID
    @animation1_id = 0
    @animation2_id = 0
    @common_event_id = 0
    # 未行动的战斗者移动到序列的头部
    @active_battler = @action_battlers.shift
    # 如果已经在战斗之外的情况下
    if @active_battler.index == nil
      return
    end
    # 连续伤害
    if @active_battler.hp > 0 and @active_battler.slip_damage?
      @active_battler.slip_damage_effect
      @active_battler.damage_pop = false
    end
    # 自然解除状态
    @active_battler.remove_states_auto(@help_window)
    if judge
      # 胜利或者失败的情况下 : 过程结束
      return
    end
    # 刷新状态窗口
    @status_window.refresh
    # 移至步骤 2
    @phase4_step = 2
  end
  #--------------------------------------------------------------------------
  # ● 刷新画面 (主回合步骤 2 : 开始行动)
  #--------------------------------------------------------------------------
  def update_phase4_step2
    # 如果不是强制行动
    unless @active_battler.current_action.forcing
      # 限制为 [敌人为普通攻击] 或 [我方为普通攻击] 的情况下
      if @active_battler.restriction == 2 or @active_battler.restriction == 3
        # 设置行动为攻击
        @active_battler.current_action.kind = 0
        @active_battler.current_action.basic = 0
      end
      # 限制为 [不能行动] 的情况下
      if @active_battler.restriction == 4
        # 清除行动强制对像的战斗者
        $game_temp.forcing_battler = nil
        # 移至步骤 1
        @phase4_step = 1
        return
      end
    end
    # 清除对像战斗者
    @target_battlers = []
    # 行动种类分支
    case @active_battler.current_action.kind
    when 0  # 基本
      make_basic_action_result
    when 1  # 特技
      make_skill_action_result
    when 2  # 物品
      make_item_action_result
    end
    # 移至步骤 3
    if @phase4_step == 2
      @phase4_step = 3
    end
  end
  #--------------------------------------------------------------------------
  # ● 生成基本行动结果
  #--------------------------------------------------------------------------
  def make_basic_action_result
    # 攻击的情况下
    if @active_battler.current_action.basic == 0
      # 设置攻击 ID
      @animation1_id = @active_battler.animation1_id
      @animation2_id = @active_battler.animation2_id
      # 行动方的战斗者是角色的情况下
      if @active_battler.is_a?(Game_Actor)
        @actor_command_window.able_item(1)
        @disable_skill=false
        if @active_battler.restriction == 3
          target = $game_party.random_target_actor
        elsif @active_battler.restriction == 2
          target = $game_troop.random_target_enemy
        else
          index = @active_battler.current_action.target_index
          target = $game_troop.smooth_target_enemy(index)
        end
      end
      # 设置对像方的战斗者序列
      @target_battlers = [target]
      if @active_battler.is_a?(Game_Actor) and $game_switches[100]==true and $game_variables[13]<=16
        for target in @target_battlers
          target.skill_effect(@active_battler,$data_skills[27],@help_window)
        end
        s_atk=[0,0,0,0,0]
      else
        # 应用通常攻击效果
        s_atk=draw_atk_text(@active_battler,target).split('|')
        for target in @target_battlers
          target.attack_effect(@active_battler,s_atk[0],s_atk[1],s_atk[2])
        end
      end
      hit_result=$game_troop.enemies[0].damage
      if hit_result.is_a?(Numeric)
        if hit_result>0
          hit_result=0
          $dis_id=100
        else
          hit_result=2
        end
      else
        hit_result=1
        hit_result=2 if $gedang
      end
      msg="action|1|"+hit_result.to_s+"|"+$game_troop.enemies[0].damage.to_s+"|"+
        $game_troop.enemies[0].hp.to_s+"|"+$game_troop.enemies[0].maxhp.to_s+"|"+
        s_atk[3].to_s+"|"+$dis_id.to_s+"|"+s_atk[4].to_s+"|"
      for i in $game_troop.enemies[0].states
        msg+=i.to_s+"|"
      end
      send(msg)
      return
    end
  end
  #--------------------------------------------------------------------------
  # ● 设置物品或特技对像方的战斗者
  #     scope : 特技或者是物品的范围
  #--------------------------------------------------------------------------
  def set_target_battlers(scope)
    # 行动方的战斗者是角色的情况下
    if @active_battler.is_a?(Game_Actor)
      # 效果范围分支
      case scope
      when 1  # 敌单体
        index = @active_battler.current_action.target_index
        @target_battlers.push($game_troop.smooth_target_enemy(index))
      when 2  # 敌全体
        for enemy in $game_troop.enemies
          if enemy.exist?
            @target_battlers.push(enemy)
          end
        end
      when 3  # 我方单体
        index = @active_battler.current_action.target_index
        @target_battlers.push($game_party.smooth_target_actor(index))
      when 4  # 我方全体
        for actor in $game_party.actors
          if actor.exist?
            @target_battlers.push(actor)
          end
        end
      when 5  # 我方单体 (HP 0) 
        index = @active_battler.current_action.target_index
        actor = $game_party.actors[index]
        if actor != nil and actor.hp0?
          @target_battlers.push(actor)
        end
      when 6  # 我方全体 (HP 0) 
        for actor in $game_party.actors
          if actor != nil and actor.hp0?
            @target_battlers.push(actor)
          end
        end
      when 7  # 使用者
        @target_battlers.push(@active_battler)
      end
    end
  end
  #--------------------------------------------------------------------------
  # ● 生成特技行动结果
  #--------------------------------------------------------------------------
  def make_skill_action_result
    # 获取特技
    @skill = $data_skills[@active_battler.current_action.skill_id]
    # 如果不是强制行动
    unless @active_battler.current_action.forcing
      # 因为 SP 耗尽而无法使用的情况下
      unless @active_battler.skill_can_use?(@skill.id)
        # 清除强制行动对像的战斗者
        $game_temp.forcing_battler = nil
        # 移至步骤 1
        @phase4_step = 1
        return
      end
    end
    # 消耗 SP
    @active_battler.sp -= @skill.sp_cost
    if @active_battler.is_a?(Game_Actor)
      @actor_command_window.disable_item(1)
      @disable_skill=true
    end
    # 刷新状态窗口
    @status_window.refresh
    # 设置动画 ID
    @animation1_id = @skill.animation1_id
    @animation2_id = @skill.animation2_id
    # 设置公共事件 ID
    @common_event_id = @skill.common_event_id
    # 设置对像侧战斗者
    set_target_battlers(@skill.scope)
    # 应用特技效果
    for target in @target_battlers
      target.skill_effect(@active_battler, @skill, @help_window)
    end
    msg="action|2|"+@skill.id.to_s+"|"+@target_battlers[0].damage.to_s+"|"+
      @target_battlers[0].hp.to_s+"|"+@target_battlers[0].maxhp.to_s+"|"+
      $dis_id2.to_s+"|"+$game_variables[91].to_s+"|"+$game_variables[92].to_s+
      +"|"+$game_variables[94].to_s+"|"+$game_variables[95].to_s+
      "|"+$game_variables[96].to_s+"|"+$npc_data[29]+"|"+$npc_data[30]+
      "|"+$npc_data[24]+"|"+$npc_data[25]+"|"+$npc_data[28]+"|"
    for i in @target_battlers[0].states
      msg+=i.to_s+"|"
    end
    send(msg)
  end
  #--------------------------------------------------------------------------
  # ● 生成物品行动结果
  #--------------------------------------------------------------------------
  def make_item_action_result
    @target=$game_party.actors[0]
    # 获取物品
    @item = $data_items[@active_battler.current_action.item_id]
    # 因为物品耗尽而无法使用的情况下
    unless $game_party.item_can_use?(@item.id)
      return
    end
    $game_party.lose_item(@item.id, 1)
    full_hp=100+$game_variables[24]/4
    full_hp+=[($game_variables[157]-14)*20,300].min
    case @item.id
    when 8
      maxhp=@target.maxhp
      if full_hp==maxhp
        $game_party.gain_item(@item.id,1)
        $game_system.se_play($data_system.buzzer_se)
      else
        maxhp+=full_hp/4
        @target.maxhp=[maxhp,full_hp].min
      end
    when 9
      maxhp=@target.maxhp
      if full_hp==maxhp
        $game_party.gain_item(@item.id,1)
        $game_system.se_play($data_system.buzzer_se)
      else
        maxhp+=full_hp/2
        @target.maxhp=[maxhp,full_hp].min
      end
    when 10
      $game_variables[24] +=5
    end
    send_item
  end
  def send_item
    msg="action|3|"+$game_party.actors[0].hp.to_s+"|"+$game_party.actors[0].maxhp.to_s
    send(msg)
    send(msg)
  end
  #--------------------------------------------------------------------------
  # ● 刷新画面 (主回合步骤 3 : 行动方动画)
  #--------------------------------------------------------------------------
  def update_phase4_step3
    def update_phase4_step3
    # 行动方动画 (ID 为 0 的情况下是白色闪烁)
    if @animation1_id == 0
      @active_battler.white_flash = false
    else
      @active_battler.animation_id = @animation1_id
      @active_battler.animation_hit = true
    end
    @help_window.draw_words($defend_text)
    # 对像方动画
    for target in @target_battlers
      target.animation_id = @animation2_id
      target.animation_hit = (target.damage != "Miss")
      if ["Miss",""].include?(target.damage)
        Audio.se_play("Audio/SE/Miss.ogg")
      else
        target.animation_id = 1
      end
    end
    # 限制动画长度、最低 8 帧
    @wait_count = 18
    # 移至步骤 5
    @phase4_step = 5
  end
  end
  #--------------------------------------------------------------------------
  # ● 刷新画面 (主回合步骤 5 : 显示伤害)
  #--------------------------------------------------------------------------
  def update_phase4_step5
    # 刷新状态窗口
    @status_window.refresh
    # 显示伤害
    for target in @target_battlers
      if target.damage != nil
        target.damage_pop = false
      end
    end
    # 隐藏帮助窗口
    @help_window.visible = false
    # 移至步骤 6
    @phase4_step = 6
  end
  #--------------------------------------------------------------------------
  # ● 刷新画面 (主回合步骤 6 : 刷新)
  #--------------------------------------------------------------------------
  def update_phase4_step6
    # 清除强制行动对像的战斗者
    $game_temp.forcing_battler = nil
    # 公共事件 ID 有效的情况下
    if @common_event_id > 0
      # 设置事件
      common_event = $data_common_events[@common_event_id]
      $game_system.battle_interpreter.setup(common_event.list, 0)
    end
    # 移至步骤 1
    @phase4_step = 1
  end
end
#==============================================================================
# ■ Scene_NetBattle (分割定义 2)
#------------------------------------------------------------------------------
# 　处理联机战斗画面的类。
#==============================================================================
class Scene_NetBattle
  def get_sk_id
    if $npc_data[9]==0 
      sk_id=$npc_data[4]
      sk_id=40 if sk_id==0
    else
      sk_id=$npc_data[5]
      if sk_id==0
        case $npc_data[9]
        when 8,9,10,11,12,13,14,1,28,29
          sk_id=42
        when 2,3,4,6,7,15,16,17,18,19,20,30
          sk_id=41
        when 5,21,22,23,24
          sk_id=44
        when 25,26,27
          sk_id=43
        end
      end
    end
    return sk_id
  end
  #--------------------------------------------------------------------------
  # ● 获取击中描述序号
  #--------------------------------------------------------------------------
  def get_hit_index(damage)
    return 0 if damage<10
    return 1 if damage<20
    return 2 if damage<40
    return 3 if damage<80
    return 4 if damage<120
    return 5 if damage<160
    return 6 if damage<200
    return 7
  end
  #--------------------------------------------------------------------------
  # ● 检查能否使用绝招
  #--------------------------------------------------------------------------
  def skill_check(id)
    @can_use=true
    @actor=$game_actors[1]
    skill_levels={2=>[[32,72],[29,54],[72,90],[45,90],[54,90],[40,90]],
                 3=>[[32,72],[29,53],[72,70],[45,70],[53,70],[40,70]],
                 4=>[[32,72],[29,53],[30,80],[72,70],[45,70],[80,90]],
                 5=>[[32,72],[29,54],[30,80],[72,70],[45,70],[80,90]],
                 6=>[[32,73],[73,60],[45,60]],
                 7=>[[32,73],[30,88],[73,80],[45,80],[88,80],[44,80]],
                 8=>[[32,73],[30,81],[73,100],[45,100],[81,100],[42,100]],
                 11=>[[32,74],[30,89],[74,80],[45,80],[89,80],[43,80]],
                 9=>[[32,74],[74,60],[45,60]],
                 10=>[[32,74],[74,80],[45,80]],
                 12=>[[32,75],[75,60],[45,60]],
                 13=>[[32,75],[75,70],[45,70]],
                 14=>[[32,75],[30,82],[75,60],[45,60],[82,60],[42,60]],
                 15=>[[32,75],[30,82],[75,80],[45,80],[82,80],[42,80]],
                 16=>[[32,76],[29,58],[76,70],[45,70],[58,70],[40,70]],
                 17=>[[32,76],[29,58],[76,100],[45,100],[58,100],[40,100]],
                 18=>[[32,76],[29,58],[76,120],[45,120],[58,120],[40,120]],
                 19=>[[32,76],[29,58],[76,60],[45,60],[58,60],[40,60]],
                 20=>[[32,76],[30,85],[76,80],[45,80],[85,80],[41,80]],
                 21=>[[32,76],[30,85],[76,80],[45,80],[85,80],[41,80]],
                 22=>[[32,76],[30,85],[76,120],[45,120],[85,120],[41,120]],
                 23=>[[32,77],[29,59],[77,100],[45,100],[59,80],[40,80]],
                 24=>[[32,77],[30,86],[77,60],[45,60],[86,60],[41,60]],
                 25=>[[32,77],[77,60],[45,60]]}
    #检查技能
    for index in skill_levels[id]
      if index[0]<38
        if $game_variables[index[0]]!=index[1]
          if index[0]==32
            $game_system.se_play($data_system.buzzer_se)
            @help_window.draw_words($data_skills[id].name+"必须配合"+
                                    $data_system.variables[index[1]]+"使用！")
            window_swap
          end
          @can_use=false
          return
        end
      else
        if $game_variables[index[0]]<index[1]
          if [45,72,73,74,75,76,77].include?(index[0])
            $game_system.se_play($data_system.buzzer_se)
            @help_window.draw_words("你的"+$data_system.variables[skill_levels[id][0][1]]+
                                    "修为不够！")
            window_swap
            @can_use=false
            return
          else
            if [80,81,82,83,84,85,86,87,88,89,39,41,42,43,44].include?(index[0])
              i=30
            else
              i=29
            end
            $game_system.se_play($data_system.buzzer_se)
            @help_window.draw_words("你的"+$data_system.variables[$game_variables[i]]+
                                    "修为不够！")
            window_swap
            @can_use=false
            return
          end
        end
      end
    end
    if id==11 and $game_variables[11]+$game_variables[40]/10<33
      $game_system.se_play($data_system.buzzer_se)
      @help_window.draw_words("你臂力不够，无法使用流星飞掷！")
      window_swap
      @can_use=false
      return
    end
    @can_use=true
  end
end
#==============================================================================
# ■ Scene_Shop
#------------------------------------------------------------------------------
# 　处理商店画面的类。
#      只能购买的商店：
#      在商店前面一行事件添加脚本：$game_temp.shop_type = 1
#      只能卖出的商店：
#      在商店前面一行事件添加脚本：$game_temp.shop_type = 2
#==============================================================================
class Scene_Shop
  def main
    @screen = Spriteset_Map.new
    @command_window = Window_ShopCommand.new
    @gold_window = Window_Gold.new
    @gold_window.x = 0
    @gold_window.y = 416
    #购买窗口
    @buy_window = Window_ShopBuy.new($game_temp.shop_goods)
    @buy_window.active = false
    @buy_window.visible = false
    #卖出窗口
    @sell_window = Window_ShopSell.new
    @sell_window.active = false
    @sell_window.visible = false
    #个数窗口
    @number_window = Window_ShopNumber.new
    @number_window.active = false
    @number_window.visible = false
    @number_window.z=200
    @status_window = Window_ShopStatus.new
    @status_window.visible = false
    if $game_temp.shop_type == 1
      @command_window.index = 0
      @command_window.active = false
      @buy_window.active = true
      @buy_window.visible = true
      @buy_window.refresh
      @status_window.visible = true
      @gold_window.y=$game_temp.shop_goods.size*32+96
      @status_window.y=$game_temp.shop_goods.size*32+96
    else
      @command_window.index = 1
      @command_window.active = false
      @sell_window.active = true
      @sell_window.visible = true
      @status_window.visible = true
      @sell_window.refresh
      @gold_window.x=0
    end
    Graphics.transition
    loop do
      Graphics.update
      Input.update
      update
      if $scene != self
        break
      end
    end
    Graphics.freeze
    @status_window.item = nil
    @status_window.refresh
    @command_window.dispose
    @gold_window.dispose
    @buy_window.dispose
    @sell_window.dispose
    @number_window.dispose
    @status_window.dispose
    @screen.dispose
    $game_temp.shop_type = 1
  end
  # 刷新--------------------------
  def update
    @command_window.update
    @gold_window.update
    @buy_window.update
    @sell_window.update
    @number_window.update
    @status_window.update
    if @command_window.active
      update_command
      return
    end
    if @buy_window.active
      update_buy
      return
    end
    if @sell_window.active
      update_sell
      return
    end
    if @number_window.active
      update_number
      return
    end
  end
  # --------------------------
  def update_command
    if Input.trigger?(Input::B)
      $game_system.se_play($data_system.cancel_se)
      $scene = Scene_Map.new
      return
    end
    if Input.trigger?(Input::C)
      case @command_window.index
      when 0
        $game_system.se_play($data_system.decision_se)
        @command_window.active = false
        @buy_window.active = true
        @buy_window.visible = true
        @buy_window.refresh
        @status_window.visible = true
      when 1
        $game_system.se_play($data_system.decision_se)
        @command_window.active = false
        @sell_window.active = true
        @sell_window.visible = true
        @sell_window.refresh
        @status_window.visible = true
      when 2
        $game_system.se_play($data_system.decision_se)
        $scene = Scene_Map.new
      end
      return
    end
  end
  # --------------------------
  def update_buy
    @status_window.item = @buy_window.item
    if Input.trigger?(Input::B)
      if $game_temp.shop_type == 1
        $game_system.se_play($data_system.cancel_se)
        $scene = Scene_Map.new
      else
        $game_system.se_play($data_system.cancel_se)
        @command_window.active = true
        @buy_window.active = false
        @buy_window.visible = true
        @status_window.visible = false
        @status_window.item = nil
      end
      return
    end
    if Input.trigger?(Input::C)
      @item = @buy_window.item
      if @item == nil or @item.price > $game_party.gold
        $game_system.se_play($data_system.buzzer_se)
        return
      end
      case @item
      when RPG::Item
        number = $game_party.item_number(@item.id)
      when RPG::Weapon
        number = $game_party.weapon_number(@item.id)
      when RPG::Armor
        number = $game_party.armor_number(@item.id)
      end
      if number == 99
        $game_system.se_play($data_system.buzzer_se)
        return
      end
      $game_system.se_play($data_system.decision_se)
      max = @item.price == 0 ? 99 : $game_party.gold / @item.price
      max = [max, 99 - number].min
      @buy_window.active = false
      @buy_window.visible = true
      @number_window.set(@item, max, @item.price)
      @number_window.active = true
      @number_window.visible = true
    end
  end
  # --------------------------
  def update_sell
    @number_window.y=128
    @item = @sell_window.item
    @status_window.item = @item
    if Input.trigger?(Input::B)
      if $game_temp.shop_type == 2
        $game_system.se_play($data_system.cancel_se)
        $scene = Scene_Map.new
      else
        $game_system.se_play($data_system.cancel_se)
        @command_window.active = true
        @sell_window.active = false
        @sell_window.visible = false
        @status_window.visible = false
        @status_window.item = nil
        return
      end
    end
    if Input.trigger?(Input::C)
      @item = @sell_window.item
      if @item == nil
        $game_system.se_play($data_system.buzzer_se)
        return
      end
      $game_system.se_play($data_system.decision_se)
      case @item
      when RPG::Item
        number = $game_party.item_number(@item.id)
      when RPG::Weapon
        number = $game_party.weapon_number(@item.id)
        number-=1 if $game_actors[1].weapon_id==@item.id
      when RPG::Armor
        number = $game_party.armor_number(@item.id)
        number-=1 if $game_actors[1].armor_equiped?(@item.id)
      end
      max = number
      @sell_window.active = false
      #@sell_window.visible = false
      @number_window.set(@item, max, @item.price/2+@item.price/5)
      @number_window.active = true
      @number_window.visible = true
      #@status_window.visible = true
    end
  end
  # --------------------------
  def update_number
    if Input.trigger?(Input::B)
      $game_system.se_play($data_system.cancel_se)
      @number_window.active = false
      @number_window.visible = false
      case @command_window.index
      when 0
        @buy_window.active = true
        @buy_window.visible = true
      when 1
        @sell_window.active = true
        @sell_window.visible = true
      end
      return
    end
    if Input.trigger?(Input::C)
      $game_system.se_play($data_system.shop_se)
      @number_window.active = false
      @number_window.visible = false
      case @command_window.index
      when 0
        $game_party.lose_gold(@number_window.number * @item.price)
        case @item
        when RPG::Item
          $game_party.gain_item(@item.id, @number_window.number)
        when RPG::Weapon
          $game_party.gain_weapon(@item.id, @number_window.number)
        when RPG::Armor
          $game_party.gain_armor(@item.id, @number_window.number)
        end
        @gold_window.refresh
        @buy_window.refresh
        @status_window.refresh
        @buy_window.active = true
        @buy_window.visible = true
      when 1
        $game_party.gain_gold(@number_window.number * (@item.price/2+@item.price/5))
        case @item
        when RPG::Item
          $game_party.lose_item(@item.id, @number_window.number)
        when RPG::Weapon
          $game_party.lose_weapon(@item.id, @number_window.number)
        when RPG::Armor
          $game_party.lose_armor(@item.id, @number_window.number)
        end
        @gold_window.refresh
        @sell_window.refresh
        @status_window.refresh
        @sell_window.active = true
        @sell_window.visible = true
        @status_window.visible = true
      end
      return
    end
  end
end#==============================================================================
# ■ Scene_Name
#------------------------------------------------------------------------------
# 　处理名称输入画面的类。
#==============================================================================

class Scene_Name
  #--------------------------------------------------------------------------
  # ● 主处理
  #--------------------------------------------------------------------------
  def main
    # 获取角色
    @actor = $game_actors[$game_temp.name_actor_id]
    # 生成窗口
    @edit_window = Window_NameEdit.new(@actor, $game_temp.name_max_char)
    @input_window = Window_NameInput.new
    # 执行过渡
    Graphics.transition
    # 主循环
    loop do
      # 刷新游戏画面
      Graphics.update
      # 刷新输入信息
      Input.update
      # 刷新信息
      update
      # 如果画面切换就中断循环
      if $scene != self
        break
      end
    end
    # 准备过渡
    Graphics.freeze
    # 释放窗口
    @edit_window.dispose
    @input_window.dispose
  end
  #--------------------------------------------------------------------------
  # ● 刷新画面
  #--------------------------------------------------------------------------
  def update
    # 刷新窗口
    @edit_window.update
    @input_window.update
    # 按下 B 键的情况下
    if Input.repeat?(Input::B)
      # 光标位置为 0 的情况下
      if @edit_window.index == 0
        return
      end
      # 演奏取消 SE
      $game_system.se_play($data_system.cancel_se)
      # 删除文字
      @edit_window.back
      return
    end
    # 按下 C 键的情况下
    if Input.trigger?(Input::C)
      # 光标位置为 [确定] 的情况下
      if @input_window.character == nil
        # 名称为空的情况下
        if @edit_window.name == ""
          # 还原为默认名称
          @edit_window.restore_default
          # 名称为空的情况下
          if @edit_window.name == ""
            # 演奏冻结 SE
            $game_system.se_play($data_system.buzzer_se)
            return
          end
          # 演奏确定 SE
          $game_system.se_play($data_system.decision_se)
          return
        end
        # 更改角色名称
        @actor.name = @edit_window.name
        # 演奏确定 SE
        $game_system.se_play($data_system.decision_se)
        # 切换到地图画面
        $scene = Scene_Map.new
        return
      end
      # 光标位置为最大的情况下
      if @edit_window.index == $game_temp.name_max_char
        # 演奏冻结 SE
        $game_system.se_play($data_system.buzzer_se)
        return
      end
      # 文字为空的情况下
      if @input_window.character == ""
        # 演奏冻结 SE
        $game_system.se_play($data_system.buzzer_se)
        return
      end
      # 演奏确定 SE
      $game_system.se_play($data_system.decision_se)
      # 添加文字
      @edit_window.add(@input_window.character)
      return
    end
  end
end
#==============================================================================
# ■ Scene_Gameover
#------------------------------------------------------------------------------
# 　处理游戏结束画面的类。
#==============================================================================

class Scene_Gameover
  #--------------------------------------------------------------------------
  # ● 主处理
  #--------------------------------------------------------------------------
  def main
    # 生成游戏结束图形
    #@sprite = Sprite.new
    #@sprite.bitmap = RPG::Cache.gameover($data_system.gameover_name)
    # 停止 BGM、BGS
    $game_system.bgm_play(nil)
    $game_system.bgs_play(nil)
    # 演奏游戏结束 ME
    $game_system.me_play($data_system.gameover_me)
    # 执行过渡
    Graphics.transition(120)
    # 主循环
    loop do
      # 刷新游戏画面
      Graphics.update
      # 刷新输入信息
      Input.update
      # 刷新画面情报
      update
      # 如果画面被切换的话就中断循环
      if $scene != self
        break
      end
    end
    # 准备过渡
    Graphics.freeze
    # 释放游戏结束图形
    #@sprite.bitmap.dispose
    #@sprite.dispose
    # 执行过度
    Graphics.transition(40)
    # 准备过渡
    Graphics.freeze
    # 战斗测试的情况下
    if $BTEST
      $scene = nil
    end
  end
  #--------------------------------------------------------------------------
  # ● 刷新画面
  #--------------------------------------------------------------------------
  def update
    # 按下 C 键的情况下
    #if Input.trigger?(Input::C)
      # 切换到标题画面
    $scene = nil
  end
end
#==============================================================================
# ■ Scene_Debug
#------------------------------------------------------------------------------
# 　处理调试画面的类。
#==============================================================================

class Scene_Debug
  #--------------------------------------------------------------------------
  # ● 主处理
  #--------------------------------------------------------------------------
  def main
    # 生成窗口
    @left_window = Window_DebugLeft.new
    @right_window = Window_DebugRight.new
    @help_window = Window_Base.new(192, 352, 448, 128)
    @help_window.contents = Bitmap.new(406, 96)
    @help_window.contents.font.color.set(0,0,0)
    # 还原为上次选择的项目
    @left_window.top_row = $game_temp.debug_top_row
    @left_window.index = $game_temp.debug_index
    @right_window.mode = @left_window.mode
    @right_window.top_id = @left_window.top_id
    # 执行过渡
    Graphics.transition
    # 主循环
    loop do
      # 刷新游戏画面
      Graphics.update
      # 刷新输入情报
      Input.update
      # 刷新画面
      update
      # 如果画面被切换的话就中断循环
      if $scene != self
        break
      end
    end
    # 刷新地图
    $game_map.refresh
    # 装备过渡
    Graphics.freeze
    # 释放窗口
    @left_window.dispose
    @right_window.dispose
    @help_window.dispose
  end
  #--------------------------------------------------------------------------
  # ● 刷新画面
  #--------------------------------------------------------------------------
  def update
    # 刷新窗口
    @right_window.mode = @left_window.mode
    @right_window.top_id = @left_window.top_id
    @left_window.update
    @right_window.update
    # 记忆选择中的项目
    $game_temp.debug_top_row = @left_window.top_row
    $game_temp.debug_index = @left_window.index
    # 左侧窗口被激活的情况下: 调用 update_left
    if @left_window.active
      update_left
      return
    end
    # 右侧窗口被激活的情况下: 调用 update_right
    if @right_window.active
      update_right
      return
    end
  end
  #--------------------------------------------------------------------------
  # ● 刷新画面 (左侧窗口被激活的情况下)
  #--------------------------------------------------------------------------
  def update_left
    # 按下 B 键的情况下
    if Input.trigger?(Input::B)
      # 演奏取消 SE
      $game_system.se_play($data_system.cancel_se)
      # 切换到地图画面
      $scene = Scene_Map.new
      return
    end
    # 按下 C 键的情况下
    if Input.trigger?(Input::C)
      # 演奏确定 SE
      $game_system.se_play($data_system.decision_se)
      # 显示帮助
      if @left_window.mode == 0
        text1 = "C (Enter) : ON / OFF"
        @help_window.contents.draw_text(4, 0, 406, 32, text1)
      else
        text1 = "← : -1   → : +1"
        text2 = "L (Pageup) : -10"
        text3 = "R (Pagedown) : +10"
        @help_window.contents.draw_text(4, 0, 406, 32, text1)
        @help_window.contents.draw_text(4, 32, 406, 32, text2)
        @help_window.contents.draw_text(4, 64, 406, 32, text3)
      end
      # 激活右侧窗口
      @left_window.active = false
      @right_window.active = true
      @right_window.index = 0
      return
    end
  end
  #--------------------------------------------------------------------------
  # ● 刷新画面 (右侧窗口被激活的情况下)
  #--------------------------------------------------------------------------
  def update_right
    # 按下 B 键的情况下
    if Input.trigger?(Input::B)
      # 演奏取消 SE
      $game_system.se_play($data_system.cancel_se)
      # 激活左侧窗口
      @left_window.active = true
      @right_window.active = false
      @right_window.index = -1
      # 删除帮助
      @help_window.contents.clear
      return
    end
    # 获取被选择的开关 / 变量的 ID
    current_id = @right_window.top_id + @right_window.index
    # 开关的情况下
    if @right_window.mode == 0
      # 按下 C 键的情况下
      if Input.trigger?(Input::C)
        # 演奏确定 SE
        $game_system.se_play($data_system.decision_se)
        # 逆转 ON / OFF 状态
        $game_switches[current_id] = (not $game_switches[current_id])
        @right_window.refresh
        return
      end
    end
    # 变量的情况下
    if @right_window.mode == 1
      # 按下右键的情况下
      if Input.repeat?(Input::RIGHT)
        # 演奏光标 SE
        $game_system.se_play($data_system.cursor_se)
        # 变量加 1
        $game_variables[current_id] += 1
        # 检查上限
        if $game_variables[current_id] > 99999999
          $game_variables[current_id] = 99999999
        end
        @right_window.refresh
        return
      end
      # 按下左键的情况下
      if Input.repeat?(Input::LEFT)
        # 演奏光标 SE
        $game_system.se_play($data_system.cursor_se)
        # 变量减 1
        $game_variables[current_id] -= 1
        # 检查下限
        if $game_variables[current_id] < -99999999
          $game_variables[current_id] = -99999999
        end
        @right_window.refresh
        return
      end
      # 按下 R 键的情况下
      if Input.repeat?(Input::R)
        # 演奏光标 SE
        $game_system.se_play($data_system.cursor_se)
        # 变量加 10
        $game_variables[current_id] += 10
        # 检查上限
        if $game_variables[current_id] > 99999999
          $game_variables[current_id] = 99999999
        end
        @right_window.refresh
        return
      end
      # 按下 L 键的情况下
      if Input.repeat?(Input::L)
        # 演奏光标 SE
        $game_system.se_play($data_system.cursor_se)
        # 变量减 10
        $game_variables[current_id] -= 10
        # 检查下限
        if $game_variables[current_id] < -99999999
          $game_variables[current_id] = -99999999
        end
        @right_window.refresh
        return
      end
    end
  end
end
#==============================================================================
# ■ Scene_Study
#------------------------------------------------------------------------------
# 　处理请教画面的类。
#==============================================================================
class Scene_Study
  def initialize(school_id,teacher_id=1)
    @school=school_id
    @teacher=teacher_id
    case @school
    when 0
      case @teacher
      when 1#顾炎武
        @skill_list=[[48,180]]
      when 2#独行大侠
        @skill_list=[[40,250],[41,250],[42,250],[39,250],[43,250],[44,250],
        [45,250],[46,250],[47,250]]
      end
    when 1
      case @teacher
      when 1#商宝震
        @skill_list=[[40,60],[42,60],[46,60],[45,80],[47,60],[53,60],[80,60],
        [64,60],[72,60],[48,50]]
      when 2#商剑鸣
        @skill_list=[[40,110],[42,110],[46,110],[45,110],[47,110],[53,110],
        [80,110],[64,110],[72,150],[48,50]]
      when 3#王维扬
        @skill_list=[[40,160],[42,160],[46,160],[45,160],[47,160],[53,110],
        [54,180],[80,180],[64,160],[72,250],[48,60]]
      end
    when 2
      case @teacher
      when 1#平婆婆
        @skill_list=[[40,70],[46,70],[45,70],[47,50],[55,70],[65,60],[73,80],
        [48,60]]
      when 2#桑青虹
        @skill_list=[[40,100],[44,130],[46,110],[45,100],[47,100],[55,100],
        [88,130],[65,100],[73,150],[48,100],[49,120]]
      when 3#唐婉辞
        @skill_list=[[40,100],[42,120],[46,120],[45,100],[47,100],[55,100],
        [81,120],[65,120],[73,150],[48,100],[49,80]]
      when 4#李清照
        @skill_list=[[40,150],[44,160],[42,160],[46,140],[45,140],[47,140],
        [55,180],[88,180],[81,180],[65,150],[73,250],[48,150],[49,150]]
      end
    when 3
      case @teacher
      when 1#方长老
        @skill_list=[[40,150],[43,120],[45,120],[46,120],[47,120],
        [56,120],[89,120],[66,120],[74,150],[48,50],[50,120]]
      when 2#余鸿儒
        @skill_list=[[40,160],[43,160],[45,160],[46,160],[47,160],
        [56,180],[89,180],[66,160],[74,250],[48,150],[50,180]]
      end
    when 4
      case @teacher
      when 1#滕王丸
        @skill_list=[[40,120],[42,80],[46,100],[45,100],[47,100],
        [57,120],[82,60],[67,100],[75,150],[48,60]]
      when 2#陈美娜
        @skill_list=[[40,80],[42,120],[46,100],[45,100],[47,100],
        [57,60],[82,120],[67,100],[75,150],[48,60]]
      when 3#和仲阳
        @skill_list=[[40,150],[42,180],[46,140],[45,160],[47,140],
        [57,150],[82,180],[67,170],[75,250],[48,120]]
      end
    when 5
      case @teacher
      when 1#苍月道长
        @skill_list=[[40,120],[42,130],[46,130],[45,130],[47,130],
        [83,130],[68,130],[76,150],[48,100]]
      when 2#古松道长
        @skill_list=[[40,120],[46,120],[45,120],[47,120],
        [58,120],[68,120],[76,120]]
      when 3#清虚道长
        @skill_list=[[40,200],[42,200],[41,200],[46,200],[45,200],[47,200],
        [58,220],[85,220],[68,220],[76,250],[48,130]]
      end
    when 6
      case @teacher
      when 1#雪山教头
        @skill_list=[[40,50],[41,50],[46,50],[45,50],[47,50],
        [87,60],[69,50],[77,50]]
      when 2#封万剑
        @skill_list=[[40,120],[41,120],[46,120],[45,120],[47,120],
        [87,120],[86,120],[69,120],[77,120]]
      when 3#白瑞德
        @skill_list=[[40,150],[41,150],[46,140],[45,140],[47,140],
        [59,180],[86,170],[69,150],[77,250],[48,80]]
      end
    when 7
      case @teacher
      when 1#手抄本
        @skill_list=[[45,250],[73,250]]
      when 2#惊天刀谱
        @skill_list=[[42,250],[82,200]]
      when 3#焦黄纸页
        @skill_list=[[47,250],[46,250]]
      when 4#拳经
        @skill_list=[[40,250],[60,200]]
      when 5#菜花宝典
        @skill_list=[[49,250],[51,100]]
      end
    end
    if @school !=7
      @top_window=Window_Base.new(0, 0, 640, 64)
      @top_window.contents = Bitmap.new(288, 32)
      @top_window.contents.font.color.set(0,0,0)
      @top_window.contents.draw_text(4, 0, 256, 32, "你想学什么就说吧")
    end
    @list=[]
    for i in @skill_list
      sk=$data_system.variables[i[0]]
      case sk.size
      when 9
        sk+=" "*4
      when 12
        sk+=" "*2
      end
      sk+=" " if i[1]<100
      sk+="×"+i[1].to_s
      @list.push sk
    end
    @skill_window=Window_Command.new(224,@list)
    @skill_window.y=48
    @skill_window.x=8
    @confirm_window = Window_Base.new(80, 368, 480, 64)
    @confirm_window.contents = Bitmap.new(448, 32)
    @confirm_window.contents.font.color.set(0,0,0)
    @confirm_window.contents.draw_text(0, 0, 448, 32, "你的功夫进步了！继续学习吗？",1)
    @confirm_window.visible = false
    @confirm_window.z = 1300
    @yes_no_window = Window_Command.new(256, ["确定","放弃"],2)
    @yes_no_window.visible = false
    @yes_no_window.active = false
    @yes_no_window.index = 0
    @yes_no_window.x = 192
    @yes_no_window.y = 416
    @yes_no_window.z = 1500
    @info = Window_Base.new(80,304,480,160)
    @info.contents = Bitmap.new(@info.width - 32, @info.height - 32)
    @info.contents.font.color=Color.new(0, 0, 0, 255)
    @info.visible=false
    @continue = true
  end
  def main
    @screen = Spriteset_Map.new
    Graphics.transition
    # 主循环
    loop do
      $scene=Scene_Map.new if @skill_list.size==0
      # 刷新游戏画面
      Graphics.update
      # 刷新输入信息
      Input.update
      # 刷新信息
      update
      # 如果画面切换就中断循环
      if $scene != self
        break
      end
    end
    #Detect.make_snapshot
    # 准备过渡
    Graphics.freeze
    # 释放窗口
    @top_window.dispose if @school !=7
    @skill_window.dispose
    @yes_no_window.dispose
    @confirm_window.dispose
    @info.dispose
    @screen.dispose
  end
  def update
    @skill_window.update
    @yes_no_window.update
    if @yes_no_window.active
      update_command_2
      return
    end
    if @skill_window.active
      update_command_1
    end
  end
  #--------------------------------------------------------------------------
  # ● 刷新画面 (命令窗口被激活的情况下)
  #--------------------------------------------------------------------------
  def update_command_1
    # 按下 B 键的情况下
    if Input.trigger?(Input::B)
      #study_skill
      $scene = Scene_Map.new
    end
    # 按下 C 键的情况下
    if Input.trigger?(Input::C)
      @skill_window.active=false
      sk=@skill_list[@skill_window.index]
      Graphics.frame_rate = 120
      study(sk)
      Graphics.frame_rate = 40
    end
  end
  def update_command_2
    # 按下 B 键的情况下
    if Input.trigger?(Input::B)
      @skill_window.active=true
      @yes_no_window.active=false
      @confirm_window.visible = false
      @yes_no_window.visible = false
      @yes_no_window.index=0
    end
    # 按下 C 键的情况下
    if Input.trigger?(Input::C)
      if @yes_no_window.index==0
        @yes_no_window.active=false
        @confirm_window.visible = false
        @yes_no_window.visible = false
        sk=@skill_list[@skill_window.index]
        Graphics.frame_rate = 120
        study(sk)
        Graphics.frame_rate = 40
      else
        @skill_window.active=true
        @yes_no_window.active=false
        @confirm_window.visible = false
        @yes_no_window.visible = false
        @yes_no_window.index=0
      end
    end
  end
  def study(sk)
    skill_number=sk[0]
    skill_point=skill_number+60
    @max_level=sk[1]
    ex=Window_Base.new(160,400,352,64)
    ex.contents=Bitmap.new(320,32)
    ex.contents.font.color.set(0,0,0)
    actor = $game_party.actors[0]
    agi=$game_variables[48]/10+$game_variables[13]+$game_variables[93]
    agi /=2
    point_max=($game_variables[skill_number]+1) **2
    point_max*=((rand(100)+9950.9)/10000.11)
    ex.contents.font.color = Color.new(0, 0, 0, 255)
    loop do
      unless ckeck_exp_maxlv(skill_number)
        ex.contents.clear
        ex.visible=false
        @info.draw_words("你的武学经验不足,无法领会更深的功夫！")
        for i in 0..120
          Graphics.update
        end
        @continue=false
        break
      end
      if $game_variables[20]>0
        $game_variables[20]-=1
        $game_variables[skill_point]+=agi
        if skill_number==48
          if $game_party.gold>=study_gold($game_variables[48])
            $game_party.gain_gold(-1*study_gold($game_variables[48]))
          else
            $game_variables[20]+=1
            $game_variables[skill_point]-=agi
            ex.contents.clear
            ex.visible=false
            @info.draw_words("没钱读什么书啊，回去准备够学费再来吧！")
            @continue=false
            for i in 0..120
              Graphics.update
            end
            break
          end
        end
      end
      if $game_variables[20]<=0
        $game_variables[20]=0
        ex.contents.clear
        ex.visible=false
        @info.draw_words("你的潜能已经发挥到极限了，没有办法再成长了。")
        for i in 0..120
          Graphics.update
        end
        @continue=false
        break
      end
      if $game_variables[skill_number]>@max_level
        $game_variables[20]+=1
        $game_variables[skill_point]=0
        ex.contents.clear
        ex.visible=false
        @info.draw_words(0,0,320,32,"你的功夫已经不输为师了，真是可喜可贺呀！")
        for i in 0..120
          Graphics.update
        end
        @continue=false
        break
      end
      Graphics.update
      Input.update
      process=200*$game_variables[skill_point]/point_max
      Graphics.update
      draw_process(process,ex,skill_point,skill_number)
      if $game_variables[skill_point]>=point_max.truncate+1
        $game_variables[skill_point]=0
        $game_variables[skill_number]+=1
        @continue=true
        for i in 0..10
          Graphics.update
        end
        break
      end
      if Input.trigger?(Input::B)
        $game_variables[skill_point]-=1
        @continue=false
        break
      end
    end
    if @continue
      @confirm_window.visible = true
      @yes_no_window.visible = true
      @yes_no_window.active = true
      @skill_window.active=false
      @continue=false
    else
      @confirm_window.visible = false
      @yes_no_window.visible = false
      @yes_no_window.active = false
      @skill_window.active=true
    end
    ex.dispose
    @info.visible=false
    Input.update
  end
  def draw_process(process,ex,skill_point,skill_number)
    process=200 if process>=200
    ex.contents.clear
    #边框
    ex.contents.fill_rect(5,9,200,1,Color.new(0,0, 0, 255))
    ex.contents.fill_rect(5,24,200,1,Color.new(0,0, 0, 255))
    ex.contents.fill_rect(5,9,1,15,Color.new(0,0, 0, 255))
    ex.contents.fill_rect(205,9,1,16,Color.new(0,0, 0, 255))
    #进度条
    ex.contents.fill_rect(5,9,process,15,Color.new(0,0, 0, 255))
    #点数/等级
    ex.contents.draw_text(216,0,128,32,$game_variables[skill_point].to_s+
    "/"+$game_variables[skill_number].to_s)
  end
  def study_gold(lv)
    return 5 if lv<=20
    return 10 if lv<=30
    return 50 if lv<=50
    return 100 if lv<=60
    return 150 if lv<=80
    return 300 if lv<=100
    return 500 if lv<=120
    return 1000
  end
end#==============================================================================
# ■ lookover
#------------------------------------------------------------------------------
# 　处理查看事件
#   每行介绍最多25个字
#==============================================================================

class Lookover
  def initialize(name,age,level,attack,items="",str1="",str2="",str3="",str4="",str5="")
    @name=name
    @age=age
    @lv=level
    @attack=attack
    @items=items
    @str1=str1
    @str2=str2
    @str3=str3
    @str4=str4
    @str5=str5
  end
  def main
    @screen = Spriteset_Map.new
    look = Window_Base.new((640-512)/2,(480-320)/2,512,320)
    look.contents = Bitmap.new(look.width - 32, look.height - 32)
    Graphics.transition
    loop do
      Graphics.update
      Input.update
      look.contents.clear
      look.contents.font.color.set(0,0,0)
      look.contents.font.size=24
      look.contents.draw_text(0,0,480,32,@name+"看起来约"+@age+"0多岁")
      look.contents.draw_text(0,32,480,32,"武艺看起来"+@lv)
      look.contents.draw_text(0,64,480,32,"出手似乎"+@attack)
      look.contents.draw_text(0,96,480,32,"带着："+@items)
      look.contents.draw_text(0,128,480,32,@str1)
      look.contents.draw_text(0,160,480,32,@str2)
      look.contents.draw_text(0,192,480,32,@str3)
      look.contents.draw_text(0,224,480,32,@str4)
      look.contents.draw_text(0,256,480,32,@str5)
      update_command
      # 如果画面切换就中断循环
      if $scene != self
        break
      end
    end
    # 准备过渡
    Graphics.freeze
    # 释放窗口
    Input.update
    look.dispose
    @screen.dispose
  end
  #--------------------------------------------------------------------------
  # ● 刷新画面 (命令窗口被激活的情况下)
  #--------------------------------------------------------------------------
  def update_command
    # 按下 B 键的情况下
    if Input.trigger?(Input::B)
       $scene = Scene_Map.new
    end
    # 按下 C 键的情况下
    if Input.trigger?(Input::C)
      $scene = Scene_Map.new
    end
  end
end #==============================================================================
 # ■ 凌的容错脚本 v3 [120929]
 #------------------------------------------------------------------------------
 # 　解决游戏因发布时缺少文件等错误而使游戏无法正常进行的问题。
 #   附赠功能：创建多层文件夹
 #==============================================================================
 # 　[120927]：基础版，支持Bitmap及Audio容错
 # 　[120928]：修正IOError问题，感谢orzFly和雷达喵
 # 　[120928]：支持Graphics.transition容错及save_data自动创建目录
 #             修正部分BUG，感谢霜月冬音
 #==============================================================================
 File.open("errors.txt","w+"){|io|}
 class Dir
   class << self
     alias :lynn_mkdir :mkdir unless $@
   end
   def self.mkdir(path, mode = 0777)
     last_dir = ""
     path.gsub(/\w*\//) {|m|
       m.gsub(/\/|\\/){}
       if last_dir != ""
         last_dir = "#{last_dir}/#{m}"
       else
         last_dir = "#{m}"
       end
       if !FileTest.exist?(m) && !FileTest.directory?(m) 
         self.lynn_mkdir(last_dir)
       end
     }
   end
 end
 module Kernel
   def write_errors(argu)
     open("errors.txt","a+"){|io| io.write(argu+"\n")if !io.read.to_s.include?(argu)}
   end
   def save_data(obj, filename)
     Dir.mkdir(filename) unless FileTest.exist?(filename)
     File.open(filename, "wb") { |io|
       Marshal.dump(obj, io)
     }
   end
 end
 class Bitmap
   alias :lynn_initialize :initialize unless $@
   def initialize(* argu)
     begin
       lynn_initialize(* argu)
     rescue Errno::ENOENT
       lynn_initialize(1,1)
       write_errors "Error:File not found on Bitmap.new\n#{argu[0]}"
     end
   end
 end
 module Audio
   class << self
     alias_method :lynn_bgm_play, :bgm_play unless $@
     alias_method :lynn_bgs_play, :bgs_play unless $@
     alias_method :lynn_me_play, :me_play unless $@
     alias_method :lynn_se_play, :se_play unless $@
   end
   def self.bgm_play(* argu)
     begin
       self.lynn_bgm_play(* argu)
     rescue Errno::ENOENT
       write_errors "Error:File not found on Audio.bgm_play\n#{argu[0]}"
     end
   end
   def self.bgs_play(* argu)
     begin
       self.lynn_bgs_play(* argu)
     rescue Errno::ENOENT
       write_errors "Error:File not found on Audio.bgs_play\n#{argu[0]}"
     end
   end
   def self.me_play(* argu) 
     begin
       self.lynn_me_play(* argu)
     rescue Errno::ENOENT
       write_errors "Error:File not found on Audio.me_play\n#{argu[0]}"
     end
   end
   def self.se_play(* argu) 
     begin
       self.lynn_se_play(* argu)
     rescue Errno::ENOENT
       write_errors "Error:File not found on Audio.se_play\n#{argu[0]}"
     end
   end
 end
 module Graphics
   class << self
     alias_method :lynn_transition, :transition unless $@
   end
   def self.transition(duration = 8, filename = "", vague = 40)
     if filename != ""
       if !FileTest.exist?(filename)
         write_errors "Error:File not found on Graphics.transition\n#{filename}"
         filename = ""
       end
     end
     self.lynn_transition(duration,filename,vague)
   end
 end
 #==============================================================================
 # ■ 凌的容错脚本 v3 附加包 [120929] [RMXP版本]
 #------------------------------------------------------------------------------
 # 　解决游戏因发布时缺少文件等错误而使游戏无法正常进行的问题。
 #==============================================================================
 # 　[120929]：支援在事件中执行脚本的容错功能，同时输出所在地图与事件ID
 #==============================================================================
 # 　* 注意本脚本只能用于标准事件解释器结构的工程
 #==============================================================================
 class Interpreter
   #--------------------------------------------------------------------------
   # ● 脚本
   #--------------------------------------------------------------------------
   def command_355
     # script 设置第一行
     script = @list[@index].parameters[0] + "\n"
     # 循环
     loop do
       # 下一个事件指令在脚本 2 行以上的情况下
       if @list[@index+1].code == 655
         # 添加到 script 2 行以后
         script += @list[@index+1].parameters[0] + "\n"
       # 事件指令不在脚本 2 行以上的情况下
       else
         # 中断循环
         break
       end
       # 推进索引
       @index += 1
     end
     # 评价
     result = eval(script)
     # 返回值为 false 的情况下
     if result == false
       # 结束
       return false
     end
     # 继续
     return true
   end
 end$data_scripts = load_data("Data/Scripts.rxdata")
txt = open("Scripts.txt","w")
$data_scripts.each{|i|txt.write(Zlib::Inflate.inflate(i[2]).to_s)}#==============================================================================
# ■ Main
#------------------------------------------------------------------------------
# 　各定义结束后、从这里开始实际处理。
#==============================================================================
class Reset < Exception
end
begin
  # 准备过渡
  # 设置系统默认字体
  Font.default_name = (["宋体"])
  Graphics.freeze
  # 生成场景对像 (标题画面)
  $scene = Scene_Title.new
  # $scene 为有效的情况下调用 main 过程
  while $scene != nil
    begin
     $scene.main
    rescue Reset
    end
  end
  # 淡入淡出
  Graphics.transition(20)
rescue Errno::ENOENT
  # 补充 Errno::ENOENT 以外错误
  # 无法打开文件的情况下、显示信息后结束
  filename = $!.message.sub("No such file or directory - ", "")
  print("找不到文件 #{filename}。 ")
end
