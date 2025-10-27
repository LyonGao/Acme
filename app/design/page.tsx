import Image from 'next/image';

export default function DesignPage() {
  return (
    <div className="min-h-screen flex items-center justify-center bg-gray-100 p-8">
      <div className="relative w-[1280px] h-[720px] bg-[#FFFFFF]">
        {/* 主容器 - 1280x720, 白色背景 #FFFFFF */}
        
        {/* 左侧红色容器 - 391x688, 位置(16, 16), 背景色 #D44E30, 圆角 16px */}
        <div className="absolute left-[16px] top-[16px] w-[391px] h-[688px] bg-[#D44E30] rounded-2xl flex flex-col">
          {/* 内边距 64px */}
          <div className="p-16 flex flex-col gap-8 flex-1">
            {/* 标题 "设计模式" - 32px 字体，行高 45px */}
            <div>
              <h1 className="text-[#FFFFFF] text-[32px] leading-[45px] font-normal">
                设计模式
              </h1>
            </div>
            
            {/* 内容区域 - 列表项 263px宽, gap 20px */}
            <div className="flex flex-col gap-5">
              {/* 列表项 1 */}
              <div className="flex gap-2 items-start">
                <div className="w-6 h-6 rounded-full bg-[#FFFFFF] flex items-center justify-center flex-shrink-0">
                  <span className="text-[#D44E30] text-[16px] leading-[24px]">1</span>
                </div>
                <p className="flex-1 text-[#FFFFFF] text-[16px] leading-[24px]">
                  画布是你创作的地方 ，你可以随心所欲地设计，而不必担心空间不足
                </p>
              </div>
              
              {/* 列表项 2 */}
              <div className="flex gap-2 items-start">
                <div className="w-6 h-6 rounded-full bg-[#FFFFFF] flex items-center justify-center flex-shrink-0">
                  <span className="text-[#D44E30] text-[16px] leading-[24px]">2</span>
                </div>
                <p className="flex-1 text-[#FFFFFF] text-[16px] leading-[24px]">
                  工具栏包含你在 MasterGo 中可能会使用的各种工具和功能
                </p>
              </div>
              
              {/* 列表项 3 */}
              <div className="flex gap-2 items-start">
                <div className="w-6 h-6 rounded-full bg-[#FFFFFF] flex items-center justify-center flex-shrink-0">
                  <span className="text-[#D44E30] text-[16px] leading-[24px]">3</span>
                </div>
                <p className="flex-1 text-[#FFFFFF] text-[16px] leading-[24px]">
                  在属性栏中，你可以修改图层的属性，或者正在使用的工具或功能的属性
                </p>
              </div>
              
              {/* 列表项 4 */}
              <div className="flex gap-2 items-start">
                <div className="w-6 h-6 rounded-full bg-[#FFFFFF] flex items-center justify-center flex-shrink-0">
                  <span className="text-[#D44E30] text-[16px] leading-[24px]">4</span>
                </div>
                <p className="flex-1 text-[#FFFFFF] text-[16px] leading-[24px]">
                  在左侧导航面板，可以查看和选择文档中的所有页面，查看、搜索页面上的所有图层
                </p>
              </div>
              
              {/* 列表项 5 */}
              <div className="flex gap-2 items-start">
                <div className="w-6 h-6 rounded-full bg-[#FFFFFF] flex items-center justify-center flex-shrink-0">
                  <span className="text-[#D44E30] text-[16px] leading-[24px]">5</span>
                </div>
                <p className="flex-1 text-[#FFFFFF] text-[16px] leading-[24px]">
                  在导航栏中，除了可以修改视图设置，还可以实时查看协作者状态，以及分享文件给更多的人，haha
                </p>
              </div>
            </div>
          </div>
        </div>
        
        {/* 右侧图片 - 732x466, 位置(470, 130), 圆角 8px, 阴影效果 box-shadow: -14px 13px 24px 0px rgba(0, 0, 0, 0.302) */}
        <div className="absolute left-[470px] top-[130px] w-[732px] h-[466px]">
          <Image
            src="/design-pattern-image.png"
            alt="设计模式示意图"
            width={732}
            height={466}
            className="rounded-lg shadow-[-14px_13px_24px_0_rgba(0,0,0,0.302)]"
          />
        </div>
        
        {/* 编号指示器 1 - 位置(601, 423), 背景 #F14C4C, 边框2px白色 */}
        <div className="absolute left-[601px] top-[423px] w-8 h-8 bg-[#F14C4C] border-2 border-[#FFFFFF] rounded-[100px] flex items-center justify-center">
          <span className="text-[#FFFFFF] text-[16px] leading-[22px]">1</span>
        </div>
        
        {/* 编号指示器 2 - 位置(686, 137), 背景 #956B6B, 边框2px白色 */}
        <div className="absolute left-[686px] top-[137px] w-8 h-8 bg-[#956B6B] border-2 border-[#FFFFFF] rounded-[100px] flex items-center justify-center">
          <span className="text-[#FFFFFF] text-[16px] leading-[22px]">2</span>
        </div>
        
        {/* 编号指示器 3 - 位置(1114, 290), 背景 #F14C4C, 边框2px白色 */}
        <div className="absolute left-[1114px] top-[290px] w-8 h-8 bg-[#F14C4C] border-2 border-[#FFFFFF] rounded-[100px] flex items-center justify-center">
          <span className="text-[#FFFFFF] text-[16px] leading-[22px]">3</span>
        </div>
        
        {/* 编号指示器 4 - 位置(490, 360), 背景 #F14C4C, 边框2px白色 */}
        <div className="absolute left-[490px] top-[360px] w-8 h-8 bg-[#F14C4C] border-2 border-[#FFFFFF] rounded-[100px] flex items-center justify-center">
          <span className="text-[#FFFFFF] text-[16px] leading-[22px]">4</span>
        </div>
        
        {/* 编号指示器 5 - 位置(1060, 105), 背景 #F14C4C, 边框2px白色 */}
        <div className="absolute left-[1060px] top-[105px] w-8 h-8 bg-[#F14C4C] border-2 border-[#FFFFFF] rounded-[100px] flex items-center justify-center">
          <span className="text-[#FFFFFF] text-[16px] leading-[22px]">5</span>
        </div>
      </div>
    </div>
  );
}

