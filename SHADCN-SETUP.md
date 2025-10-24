# shadcn/ui 集成完成 ✅

本项目已成功集成 shadcn/ui 组件库。

## 📦 已安装的内容

### 核心依赖
- `tailwindcss-animate` - Tailwind CSS 动画插件
- `class-variance-authority` - 类变体管理工具
- `clsx` - 类名工具
- `tailwind-merge` - Tailwind 类名合并工具
- `lucide-react` - 图标库

### 已安装的组件
- ✅ Button - 按钮组件
- ✅ Card - 卡片组件
- ✅ Input - 输入框组件
- ✅ Label - 标签组件
- ✅ Select - 选择器组件
- ✅ Dropdown Menu - 下拉菜单组件
- ✅ Badge - 徽章组件
- ✅ Dialog - 对话框组件
- ✅ Table - 表格组件
- ✅ Toast - 提示消息组件
- ✅ Avatar - 头像组件

## 📁 文件结构

```
nextjs-dashboard/
├── components/
│   ├── ui/               # shadcn/ui 组件目录
│   │   ├── button.tsx
│   │   ├── card.tsx
│   │   ├── input.tsx
│   │   ├── label.tsx
│   │   ├── select.tsx
│   │   ├── dropdown-menu.tsx
│   │   ├── badge.tsx
│   │   ├── dialog.tsx
│   │   ├── table.tsx
│   │   ├── toast.tsx
│   │   ├── toaster.tsx
│   │   └── avatar.tsx
│   └── example-shadcn-usage.tsx  # 使用示例
├── hooks/
│   └── use-toast.ts      # Toast hook
├── lib/
│   └── utils.ts          # 工具函数（包含 cn 函数）
├── components.json       # shadcn/ui 配置文件
├── tailwind.config.ts    # 已更新支持 shadcn/ui
└── app/ui/global.css     # 已添加 CSS 变量
```

## 🚀 使用方法

### 1. 基本使用

```tsx
import { Button } from '@/components/ui/button';

export default function MyPage() {
  return (
    <div>
      <Button>Click me</Button>
      <Button variant="secondary">Secondary</Button>
      <Button variant="outline">Outline</Button>
    </div>
  );
}
```

### 2. 使用 Card 组件

```tsx
import {
  Card,
  CardContent,
  CardDescription,
  CardFooter,
  CardHeader,
  CardTitle,
} from '@/components/ui/card';

export default function MyCard() {
  return (
    <Card>
      <CardHeader>
        <CardTitle>Card Title</CardTitle>
        <CardDescription>Card Description</CardDescription>
      </CardHeader>
      <CardContent>
        <p>Card Content</p>
      </CardContent>
      <CardFooter>
        <p>Card Footer</p>
      </CardFooter>
    </Card>
  );
}
```

### 3. 使用 cn 工具函数

shadcn/ui 提供了一个 `cn` 函数用于合并 Tailwind CSS 类名：

```tsx
import { cn } from '@/app/lib/utils';

export default function MyComponent() {
  return (
    <div className={cn('base-class', 'additional-class', 'hover:text-blue-500')}>
      Content
    </div>
  );
}
```

### 4. 使用 Toast 通知

```tsx
'use client';

import { Button } from '@/components/ui/button';
import { useToast } from '@/hooks/use-toast';
import { Toaster } from '@/components/ui/toaster';

export default function MyPage() {
  const { toast } = useToast();

  return (
    <>
      <Button
        onClick={() => {
          toast({
            title: 'Success',
            description: 'Your action was successful!',
          });
        }}
      >
        Show Toast
      </Button>
      <Toaster />
    </>
  );
}
```

## 📚 添加更多组件

如果需要添加更多 shadcn/ui 组件，使用以下命令：

```bash
# 查看所有可用组件
pnpm dlx shadcn@latest add

# 添加单个组件
pnpm dlx shadcn@latest add [component-name]

# 一次添加多个组件
pnpm dlx shadcn@latest add [component-1] [component-2] [component-3]
```

例如：
```bash
pnpm dlx shadcn@latest add tabs accordion alert
```

## 🎨 主题定制

shadcn/ui 使用 CSS 变量进行主题定制。你可以在 `app/ui/global.css` 中修改颜色变量：

```css
:root {
  --primary: 222.2 47.4% 11.2%;
  --primary-foreground: 210 40% 98%;
  /* ... 更多变量 */
}
```

## 🔗 参考资源

- [shadcn/ui 官方文档](https://ui.shadcn.com/)
- [shadcn/ui 组件列表](https://ui.shadcn.com/docs/components)
- [Tailwind CSS 文档](https://tailwindcss.com/docs)

## 📝 示例

查看 `components/example-shadcn-usage.tsx` 文件获取更多使用示例。

---

现在你可以在项目中自由使用 shadcn/ui 组件了！🎉

