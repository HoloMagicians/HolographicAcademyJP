**ホログラム 101E **

このチュートリアルでは、Unity
を使ってビルドするプロジェクト全体について順を追って説明します。このプロジェクトでは、[*視線*](https://developer.microsoft.com/ja-jp/windows/holographic/gaze)、[*ジェスチャー*](https://developer.microsoft.com/ja-jp/windows/holographic/gestures)、[*音声入力*](https://developer.microsoft.com/ja-jp/windows/holographic/voice_input)、[*空間音響*](https://developer.microsoft.com/ja-jp/windows/holographic/spatial_sound)、[*空間マッピング*](https://developer.microsoft.com/ja-jp/windows/holographic/spatial_mapping)など、Windows
Holographic Platform と HoloLens
の核となる機能を示します。このチュートリアルの所要時間は約 1 時間です。

**前提条件**

-   [*適切なツールをインストール*](https://developer.microsoft.com/ja-jp/windows/holographic/install_the_tools)して構成した
    Windows 10 PC。

**プロジェクト ファイル**

-   プロジェクトに必要な[*ファイル*](https://github.com/Microsoft/HolographicAcademy/archive/Holograms-101.zip)はダウンロードします。Unity
    5.5 が必要です。

    -   依然として Unity 5.4
        のサポートが必要な場合は、[*こちらのリリース*](https://github.com/Microsoft/HolographicAcademy/archive/v1.5.4-101.zip)を使用してください。

-   デスクトップなどのアクセスしやすい場所にファイルを解凍します。フォルダー名はそのまま
    Origami を使用します。

**チュートリアルの内容**

-   [*1 第 １ 章 -
    「ホログラム」の世界*](https://developer.microsoft.com/ja-jp/windows/holographic/holograms_101e#chapter_1_-_.22holo.22_world)

-   [*2 第 2 章 –
    視線*](https://developer.microsoft.com/ja-jp/windows/holographic/holograms_101e#chapter_2_-_gaze)

-   [*3 第 3 章 –
    ジェスチャー*](https://developer.microsoft.com/ja-jp/windows/holographic/holograms_101e#chapter_3_-_gestures)

-   [*4 第 4 章 –
    音声*](https://developer.microsoft.com/ja-jp/windows/holographic/holograms_101e#chapter_4_-_voice)

-   [*5 第 5 章 –
    空間音響*](https://developer.microsoft.com/ja-jp/windows/holographic/holograms_101e#chapter_5_-_spatial_sound)

-   [*6 第 6 章 –
    空間マッピング*](https://developer.microsoft.com/ja-jp/windows/holographic/holograms_101e#chapter_6_-_spatial_mapping)

-   [*7
    終わりに*](https://developer.microsoft.com/ja-jp/windows/holographic/holograms_101e#the_end)

-   [*8
    関連項目*](https://developer.microsoft.com/ja-jp/windows/holographic/holograms_101e#see_also)

**第 1 章 - 「ホログラム」の世界**

この章では、このチュートリアル最初の Unity
プロジェクトをセットアップし、ビルドと配置のプロセスについて順を追って説明します。

**目標**

-   ホログラフィック開発向けに Unity をセットアップする。

-   ホログラムを作成する。

-   作成したホログラムを確認する。

**手順**

-   Unity を起動します。

-   \[Open\] (開く) を選びます。

-   最初にファイルを解凍した Origami フォルダーの場所を入力します。

-   \[Origami\] を選び、\[Select Folder\] (フォルダーの選択)
    をクリックします。

-   \[File\] (ファイル)、\[Save Scene As\] (シーンに名前を付けて保存)
    の順に選び、新しいシーンを保存します。

-   新しいシーンに「Origami」という名前を付けて、\[Save\] (保存)
    をクリックします。

**メイン カメラのセットアップ**

-   \[Hierarchy\] (階層) パネルで \[Main Camera\] (メイン カメラ)
    を選びます。

-   \[Inspector\] (インスペクター) パネルの \[Transform\] (変換)
    コンポーネントで \[Position\] (位置) を (**x**:0, **y**:0, **z**:0)
    に設定します。

-   \[Clear Flags\] (クリア フラグ) プロパティの一覧で \[Skybox\]
    (スカイボックス) を \[Solid color\] (単色) に変更します。

-   \[Background\] (背景)
    フィールドをクリックして色の選択ツールを開きます。

-   \[R\]、\[G\]、\[B\] および \[A\] の各フィールドに 0 を設定します。

**シーンのセットアップ**

-   \[Hierarchy\] (階層) パネルで、\[Create\] (作成)、\[Create Empty\]
    (空オブジェクトの作成) の順にクリックします。

-   新しく作成された GameObject を右クリックして、\[Rename\]
    (名前の変更) を選びます。GameObject
    の名前を「OrigamiCollection」に変更します。

-   \[Project\] (プロジェクト) パネルで \[Holograms\]
    フォルダーから以下の操作を行います。

    -   OrigamiCollection の子になるように、Stage を \[Hierarchy\]
        (階層) パネルにドラッグします。

    -   OrigamiCollection の子になるように、Sphere1 を \[Hierarchy\]
        (階層) パネルにドラッグします。

    -   OrigamiCollection の子になるように、Sphere2 を \[Hierarchy\]
        (階層) パネルにドラッグします。

-   \[Hierarchy\] (階層) パネルで Directional Light
    オブジェクトを右クリックし、\[Delete\] (削除) を選びます。

-   \[Holograms\] フォルダーから Lights を \[Hierarchy\] (階層)
    パネルのルートにドラッグします。

-   \[Hierarchy\] (階層) パネルで OrigamiCollection を選びます。

-   \[Inspector\] (インスペクター) パネルの \[Transform\] (変換)
    コンポーネントで \[Position\] (位置) を (**x**:0, **y**:-0.5,
    **z**:2.0) に設定します。

-   Unity で \[Play\] (プレイ)
    をクリックしてホログラムをプレビューします。

-   プレビュー ウィンドウに Origami オブジェクトが表示されます。

-   再度 \[Play\] (プレイ) をクリックすると、プレビュー
    モードが停止します。

**Unity から Visual Studio へのプロジェクトのエクスポート**

-   Unity で、\[File\] (ファイル)、\[Build Settings\] (ビルド設定)
    の順に選びます。

-   \[Platform\] (プラットフォーム) の一覧で \[Windows Store\] (Windows
    ストア) を選び、\[Switch Platform\] (プラットフォームの切り替え)
    をクリックします。

-   \[SDK\] を \[Universal 10\] に、\[Build Type\] (ビルドの種類) を
    \[D3D\] に設定します。

-   \[Unity C\# Projects\] (Unity C\# プロジェクト) チェック
    ボックスをオンにします。

-   \[Add Open Scenes\] (オープン シーンの追加)
    をクリックして、シーンを追加します。

-   \[Player Settings...\] (プレイヤーの設定) をクリックします。

-   \[Inspector\] (インスペクター) パネルで、Windows
    ストアのロゴを選びます。次に、\[Publishing Settings\] (発行の設定)
    を選びます。

-   \[Capabilities\] (機能) セクションで \[Microphone\] (マイク) と
    \[SpatialPerception\] (空間認知) を選びます。

-   \[Build Settings\] (ビルド設定) ウィンドウに戻り、\[Build\] (ビルド)
    をクリックします。

-   \[New Folder\] (新しいフォルダー)
    をクリックし、フォルダーに「App」という名前を付けます。

-   \[App\] フォルダーをシングル クリックします。

-   \[Select Folder\] (フォルダーの選択) をクリックします。

-   Unity を終了すると、エクスプローラー ウィンドウが表示されます。

-   App フォルダーを開きます。

-   Visual Studio ソリューション「Origami」を開きます。

-   Visual Studio 上部のツール バーを使って、ターゲットを \[Debug\] から
    \[Release\]、\[ARM\] から \[X86\] に変更します。

    -   \[デバイス\] ボタンの横にある矢印をクリックして、\[HoloLens
        Emulator\] (HoloLens エミュレーター) を選びます。

    -   \[デバッグ\]、\[デバッグなしで開始\] の順に選ぶか、**Ctrl**
        キーを押しながら **F5** キーを押します。

    -   しばらくすると、エミュレーターで Origami
        プロジェクトが開始されます。[*エミュレーター*](https://developer.microsoft.com/ja-jp/windows/holographic/using_the_hololens_emulator)の初回起動時は、開始まで
        15
        分程度かかることがあります。一度エミュレーターを起動したら、閉じないようにします。

**第 2 章 – 視線**

この章では、ホログラムを操作する 3 つの方法のうちの最初の １
つ、[*視線*](https://developer.microsoft.com/ja-jp/windows/holographic/gaze)について説明します。

**目標**

-   世界を固定するカーソルを使って視線を視覚化する。

**手順**

-   Unity プロジェクトに戻ります。\[Build Settings\] (ビルド設定)
    ウィンドウが開いたままの場合はこれを閉じます。

-   \[Project\] (プロジェクト) パネルで \[Holograms\]
    フォルダーを選びます。

-   Cursor オブジェクトを \[Hierarchy\] (階層) パネルのルート
    レベルにドラッグします。

-   Cursor
    オブジェクトをダブルクリックして、このオブジェクトを詳しく調べます。

-   \[Project\] (プロジェクト) パネルで \[Scripts\]
    フォルダーを右クリックします。

-   \[Create\] (作成) サブメニューをクリックします。

-   \[C\# Script\] (C\# スクリプト) を選びます。

-   スクリプトの名前を「WorldCursor」にします。メモ:
    名前は、大文字と小文字が区別されます。拡張子 .cs
    を追加する必要はありません。

-   \[Hierarchy\] (階層) パネルで Cursor オブジェクトを選びます。

-   WorldCursor スクリプトをドラッグして、\[Inspector\] (インスペクター)
    パネルにドロップします。

-   WorldCursor スクリプトをダブルクリックして Visual Studio
    で開きます。

-   次のコードをコピーして WorldCursor.cs に貼り付け、\[すべて保存\]
    をクリックします。

WorldCursor.cs \[表示\]

-   \[File\] (ファイル)、\[Build Settings\] (ビルド設定)
    の順に選んで、アプリをリビルドします。

-   前回エミュレーターへの配置に使用した Visual Studio
    ソリューションに戻ります。

-   確認が表示される場合には、\[再読み込み\] を選びます。

-   \[デバッグ\]、\[デバッグなしで開始\] の順に選ぶか、**Ctrl**
    キーを押しながら **F5** キーを押します。

-   Xbox
    コントローラーを使ってシーンを見回します。カーソルが物体の形状にどのように関わるかがわかります。

**第 3 章 – ジェスチャー**

この章では、[*ジェスチャー*](https://developer.microsoft.com/ja-jp/windows/holographic/gestures)のサポートを追加します。ここでは紙で作った球体をユーザーが選ぶと、その球体が落ちるようにします。そのため、Unity
の物理エンジンを使って重力を有効にします。

**目標**

-   「選ぶ」というジェスチャーを使ってホログラムを制御する。

**手順**

ここでは、最初にスクリプトを作成してから、「選ぶ」というジェスチャーを検出できるようにします。

-   \[Scripts\] フォルダーで、GazeGestureManager
    というスクリプトを作成します。

-   GazeGestureManager スクリプトを \[Hierarchy\] (階層) パネルの
    OrigamiCollection オブジェクトにドラッグします。

-   Visual Studio で GazeGestureManager
    スクリプトを開き、次のコードを追加します。

GazeGestureManager.cs \[表示\]

-   \[Scripts\] フォルダーでもう 1
    つスクリプトを作成し、今回は「SphereCommands」という名前を付けます。

-   \[Hierarchy\] (階層) ビューの OrigamiCollection
    オブジェクトを展開します。

-   SphereCommands スクリプトを \[Hierarchy\] (階層) パネルの Sphere1
    オブジェクトにドラッグします。

-   SphereCommands スクリプトを \[Hierarchy\] (階層) パネルの Sphere2
    オブジェクトにドラッグします。

-   編集のために Visual Studio
    でスクリプトを開き、スクリプト既定のコードを次のコードに置き換えます。

SphereCommands.cs \[表示\]

-   アプリをエクスポートしてビルドし、HoloLens
    エミュレーターに配置します。

-   シーンを見回し、球体の 1 つが中央にくるようにします。

-   Xbox コントローラーで **A** ボタンを押すか、スペース
    キーを押して、「選ぶ」ジェスチャーのシミュレーションを行います。

**第 4 章 – 音声**

この章では、2
つの[*音声コマンド*](https://developer.microsoft.com/ja-jp/windows/holographic/voice_input)のサポートを追加します。「Reset
world」 (世界をリセット) で落ちた球体を元の場所に戻し、「Drop sphere」
(球を落とせ) で球体を落下させます。

**目標**

-   常にバックグラウンドで聞こえる音声コマンドを追加する。

-   音声コマンドに反応するホログラムを作成する。

**手順**

-   \[Scripts\] フォルダーで、SpeechManager
    というスクリプトを作成します。

-   \[Hierarchy\] (階層) パネルの OrigamiCollection オブジェクトに
    SpeechManager スクリプトをドラッグします。

-   Visual Studio で SpeechManager スクリプトを開きます。

-   次のコードをコピーして SpeechManager.cs に貼り付け、\[すべて保存\]
    をクリックします。

SpeechManager.cs \[表示\]

-   Visual Studio で SphereCommands スクリプトを開きます。

-   このスクリプトを次のように更新します。

SphereCommands.cs \[表示\]

-   アプリをエクスポートしてビルドし、HoloLens
    エミュレーターに配置します。

-   エミュレーターは、PC
    のマイクをサポートし、音声に反応します。カーソルが球体の 1
    つの上にくるように表示を調整して、「Drop Sphere」(球を落とせ)
    と発話します。

-   「Reset World」 (世界をリセット)
    と発話し、球体を元の位置に戻します。

**第 5 章 – 空間音響**

この章では、アプリに音楽を追加してから、特定の動作で音響効果が引き起こされるようにします。ここでは[*空間音響*](https://developer.microsoft.com/ja-jp/windows/holographic/spatial_sound)を使用して、3D
空間の特定の場所に効果音を設定します。

**目標**

-   仮想の世界でホログラムを聞く。

**手順**

-   Unity 上部のメニューで \[Edit\] (編集)、\[Project Settings\]
    (プロジェクト設定)、\[Audio\] (オーディオ) の順に選びます。

-   \[SpatializerPlugin\] (空間プラグイン) の設定で \[MS HRTF
    Spatializer\] を選びます。

-   \[Holograms\] フォルダーから Ambience オブジェクトを \[Hierarchy\]
    (階層) パネルの OrigamiCollection オブジェクトにドラッグします。

-   OrigamiCollection を選び、\[Audio Source\] (オーディオ ソース)
    コンポーネントに移動します。以下のプロパティを変更します。

    -   \[Spatialize\] (空間) プロパティのチェック
        ボックスをオンにします。

    -   \[Play On Awake\] (起動時に再生) をチェック
        ボックスをオンにします。

    -   スライダーを右端までドラッグして、\[Spatial Blend\]
        (空間ブレンド) を \[3D\] に変更します。

    -   \[Loop\] (ループ) プロパティのチェック ボックスをオンにします。

    -   \[3D Sound Settings\] (3D 音響の設定) を展開して、\[Doppler
        Level\] (ドップラー レベル) に「0.1」を入力します。

    -   \[Volume Rolloff\] (音量と距離の関係) を \[Logarithmic Rolloff\]
        に設定します。

    -   \[Max Distance\] (最長距離) に「20」を設定します。

-   \[Scripts\] フォルダーで、SphereSounds
    というスクリプトを作成します。

-   SphereSounds をドラッグして、\[Hierarchy\] (階層) パネルの Sphere1
    オブジェクトとSphere2 オブジェクトにドロップします。

-   Visual Studio で SphereSounds を開き、次のようにコードを更新して
    \[すべて保存\] をクリックします。

SphereSounds.cs \[表示\]

-   スクリプトを保存し、Unity に戻ります。

-   アプリをエクスポートしてビルドし、HoloLens
    エミュレーターに配置します。

-   ヘッドフォンを付けて最大効果に設定し、ステージに近づいたり、離れたり、左右に動いて音の変化を聞き取ります。

**第 6 章 – 空間マッピング**

ここで、ゲーム
ボードを現実世界の現実の物体に持ち込むために、[*空間マッピング*](https://developer.microsoft.com/ja-jp/windows/holographic/spatial_mapping)を使用します。

**目標**

-   現実世界を仮想世界に持ち込む。

-   最も重要な場所にホログラムを配置する。

**手順**

-   \[Project\] (プロジェクト) パネルで \[Holograms\]
    フォルダーをクリックします。

-   \[Spatial Mapping\] (空間マッピング) アセットを \[Hierarchy\] (階層)
    パネルのルートにドラッグします。

-   \[Hierarchy\] (階層) パネルで Spatial Mapping
    オブジェクトをクリックします。

-   \[Inspector\] (インスペクター) パネルで次のプロパティを変更します。

    -   \[Draw Visual Meshes\] (ビジュアル メッシュの描画) チェック
        ボックスをオンにします。

    -   \[Draw Material\] (描画素材)
        に移動して、右側の円をクリックします。上部の検索フィールドに「wireframe」と入力します。結果をクリックしてウィンドウを閉じます。

-   アプリをエクスポートしてビルドし、HoloLens
    エミュレーターに配置します。

-   アプリを実行すると、以前にスキャンした現実世界のリビング
    ルームのメッシュがワイヤーフレームにレンダリングされます。

-   転がる球体がステージから床に落ちるようすを見守ります。

今度は、OrigamiCollection を新しい場所に移動する方法を示します。

-   \[Scripts\] フォルダーで、TapToPlaceParent
    というスクリプトを作成します。

-   \[Hierarchy\] (階層) パネルの OrigamiCollection を展開し、Stage
    オブジェクトを選択します。

-   TapToPlaceParent スクリプトを Stage オブジェクトにドラッグします。

-   Visual Studio で TapToPlaceParent
    スクリプトを開き、次のようにコードを変更します。

TapToPlaceParent.cs \[表示\]

-   アプリをエクスポートしてビルドし、配置します。

-   これで、ゲームに視線を送り、「選ぶ」ジェスチャー (**A**
    ボタンまたはスペースキー)
    を使ってゲームを新しい場所に移動して、再び「選ぶ」ジェスチャーを行うと、ゲームを特定の場所に移動できるようになります。

**終わりに**

これで、このチュートリアルは終わりです。

ここでは以下のことを学びました。

-   Unity でホログラフィック アプリを作成する方法。

-   視線、ジェスチャー、音声、音響、空間マッピングを利用する方法。

-   Visual Studio を使ってアプリをビルドおよび配置する方法。

これで、独自のホログラフィック アプリを作成する準備が整いました。

**関連項目**

-   [*ホログラム
    101*](https://developer.microsoft.com/ja-jp/windows/holographic/holograms_101)

-   [*視線*](https://developer.microsoft.com/ja-jp/windows/holographic/gaze)

-   [*ジェスチャー*](https://developer.microsoft.com/ja-jp/windows/holographic/gestures)

-   [*音声入力*](https://developer.microsoft.com/ja-jp/windows/holographic/voice_input)

-   [*空間音響*](https://developer.microsoft.com/ja-jp/windows/holographic/spatial_sound)

-   [*空間マッピング*](https://developer.microsoft.com/ja-jp/windows/holographic/spatial_mapping)


