**ホログラム 211 **

[*ジェスチャー*](https://developer.microsoft.com/ja-jp/windows/holographic/gestures)は、ユーザーの意図を動きで表します。ユーザーはジェスチャーを使ってホログラムを操作できます。このチュートリアルでは、ユーザーの手の動きを追跡し、ユーザー入力に反応して、手の状態と位置に応じてユーザーにフィードバックを提供する方法について説明します。

[*ホログラム
101*](https://developer.microsoft.com/ja-jp/windows/holographic/holograms_101)
では、簡単に空中をタップするジェスチャーを使ってホログラムを操作しました。今回は、空中をタップするよりも複雑なジェスチャーを取り上げ、以下を行うために新しい考え方を示します。

-   ユーザーの手が追跡されていることを検知し、ユーザーにフィードバックを提供する。

-   ナビゲーションのジェスチャーを使って、ホログラムを回転させる。

-   ユーザーの手が視界から外れる直前にフィードバックを提供する。

-   操縦イベントを使って、ユーザーがホログラムを手で動かせるようにする。

このチュートリアルでは、[*ホログラム
210*](https://developer.microsoft.com/ja-jp/windows/holographic/holograms_210)
でビルドした Unity プロジェクト「Model
Explorer」を再び使用します。気さくな宇宙飛行士が再び登場し、ジェスチャーの新しい考え方を説明する手助けをします。

**前提条件**

-   適切な[*ツールをインストールして*](https://developer.microsoft.com/ja-jp/windows/holographic/install_the_tools)構成した
    Windows 10 PC。

-   ある程度基本的な C\# プログラミング能力。

-   [*ホログラム
    101*](https://developer.microsoft.com/ja-jp/windows/holographic/holograms_101)
    の修了。

-   [*ホログラム
    210*](https://developer.microsoft.com/ja-jp/windows/holographic/holograms_210)
    の修了。

-   [*開発用に構成した*](https://developer.microsoft.com/ja-jp/windows/holographic/Using_Visual_Studio.html#enabling_developer_mode)
    HoloLens デバイス。

**プロジェクト ファイル**

-   プロジェクトに必要な[*ファイル*](https://github.com/Microsoft/HolographicAcademy/archive/Holograms-211-Gesture.zip)はダウンロードします。Unity
    5.5 が必要です。

    -   依然として Unity 5.4
        のサポートが必要な場合は、[*こちらのリリース*](https://github.com/Microsoft/HolographicAcademy/archive/v1.5.4-211.zip)を使用してください。

-   デスクトップなどのアクセスしやすい場所にファイルを解凍します。

**正誤表と注意事項**

-   コードをブレークポイントで停止するには、\[ツール\]、\[オプション\]、\[デバッグ\]
    の順に選び、\[マイ コードのみ\] を無効にする (チェック
    ボックスをオフにする) 必要があります。

**チュートリアルの内容**

-   [*1 Unity
    のセットアップ*](https://developer.microsoft.com/ja-jp/windows/holographic/holograms_211#unity_setup)

-   [*2 第 1 章 -
    手の検出とフィードバック*](https://developer.microsoft.com/ja-jp/windows/holographic/holograms_211#chapter_1_-_hand_detected_feedback)

-   [*3 第 2 章 –
    ナビゲーション*](https://developer.microsoft.com/ja-jp/windows/holographic/holograms_211#chapter_2_-_navigation)

-   [*4 第 3 章 –
    手の誘導*](https://developer.microsoft.com/ja-jp/windows/holographic/holograms_211#chapter_3_-_hand_guidance)

-   [*5 第 4 章 -
    操縦*](https://developer.microsoft.com/ja-jp/windows/holographic/holograms_211#chapter_4_-_manipulation)

-   [*6 第 5 章 -
    モデルの展開*](https://developer.microsoft.com/ja-jp/windows/holographic/holograms_211#chapter_5_-_model_expansion)

-   [*7
    終わりに*](https://developer.microsoft.com/ja-jp/windows/holographic/holograms_211#the_end)

**Unity のセットアップ**

**手順**

-   Unity を起動します。

-   \[Open\] (開く) を選びます。

-   最初にファイルを解凍した Gesture フォルダーに移動します。

-   Model Explorer フォルダーを探して選びます。

-   \[Select Folder\] (フォルダーの選択) をクリックします。

-   \[Project\] (プロジェクト) パネルの Scenes フォルダーを展開します。

-   ModelExplorer シーンをダブルクリックして、Unity に読み込みます。

-   Unity で、\[File\] (ファイル)、\[Build Settings\] (ビルド設定)
    の順に選びます。

-   \[Scenes In Build\] (ビルドに含むシーン) の一覧に
    \[Scenes/ModelExplorer\] がない場合は、\[Add Open Scenes\] (オープン
    シーンの追加) をクリックして、シーンを追加します。

-   \[Platform\] (プラットフォーム) の一覧で \[Windows Store\] (Windows
    ストア) を選び、\[Switch Platform\] (プラットフォームの切り替え)
    をクリックします。

-   \[SDK\] を \[Universal 10\] に、\[UWP Build Type\] (UWP
    ビルドの種類) を \[D3D\] に設定します。

-   \[Unity C\# Projects\] (Unity C\# プロジェクト) チェック
    ボックスをオンにします。

-   \[Build\] (ビルド) をクリックします。

-   \[New Folder\] (新しいフォルダー)
    をクリックし、フォルダーに「App」という名前を付けます。

-   \[App\] フォルダーをシングル クリックします。

-   \[Select Folder\] (フォルダーの選択) をクリックすると、Unity
    によって Visual Studio 向けにプロジェクトのビルドが始まります。

-   Unity によるビルドが終了すると、エクスプローラー
    ウィンドウが表示されます。

-   App フォルダーを開きます。

-   Visual Studio ソリューション「ModelExplorer」を開きます。

-   上部にあるボックスの一覧で、\[Debug\] を \[Release\]に、\[ARM\] を
    \[x86\] に変更します。

-   \[ローカル コンピューター\] の横にある矢印をクリックし、\[リモート
    コンピューター\] を選びます。

-   デバイスの IP アドレスを入力して、\[認証モード\] を \[ユニバーサル
    (暗号化されていないプロトコル)\] に設定します。\[選択\]
    をクリックします。HoloLens デバイスの IP
    アドレスがわからない場合は、\[設定\]、\[ネットワークとインターネット\]、\[詳細オプション\]
    の順にクリックして IP アドレスを確認するか、Cortana に「私の IP
    アドレスを教えて」と質問します。

-   メニューで \[デバッグ\]、\[デバッグなしで開始\]
    の順に選ぶか、**Ctrl** キーを押しながら **F5**
    キーを押します。デバイスに初めて配置する場合は、Visual Studio
    とのペアリングが必要です。「[*HoloLens と Visual Studio
    のペアリング*](https://developer.microsoft.com/ja-jp/windows/holographic/Using_Visual_Studio.html#pairing_your_device)」の指示に従います。

-   **メモ:** Visual Studio の \[エラー\]
    パネルに、赤でエラーがいくつか表示されることがあります。これらのエラーは無視しても問題は生じません。\[出力\]
    パネルに切り替えて、実際のビルドの進捗状況を表示します。\[出力\]
    パネルにエラーが表示される場合は解決する必要があります
    (エラーの原因はほぼスクリプト内でのミスによるものです)。

**第 1 章 - 手の検出とフィードバック**

**目標**

-   手を追跡するイベントをサブスクライブする。

-   カーソルのフィードバックを使って、手が追跡されていることをユーザーに示す。

**手順**

-   \[Hierarchy\] (階層) パネルで Managers オブジェクトを選びます。

-   \[Inspector\] (インスペクター) パネルで \[Add Component\]
    (コンポーネントの追加) をクリックします。

-   メニューの検索ボックスに「Hands
    Manager」と入力します。検索結果を選びます。

HandsManager.cs スクリプトによって以下の手順が実行されます。

1.  SourceDetected イベントと SourceLost
    イベントをサブスクライブします。

2.  HandDetected 状態を設定します。

3.  SourceDetected イベントと SourceLost
    イベントのサブスクライブを解除します。

-   \[Hierarchy\] (階層) パネルで Cursor オブジェクトを選びます。

-   \[Inspector\] (インスペクター) パネルで \[Add Component\]
    (コンポーネントの追加) をクリックします。

-   メニューの検索ボックスに「Cursor
    Feedback」と入力します。検索結果を選びます。

-   \[Project\] (プロジェクト) パネルの Holograms フォルダーで
    HandDetectedFeedback アセッに移動します。

-   HandDetectedFeedback アセットをドラッグして、\[Cursor Feedback
    (Script)\] コンポーネントの \[Hand Detected Asset\]
    プロパティにドロップします。

-   \[Hierarchy\] (階層) パネルの Cursor オブジェクトを展開します。

-   CursorBillboard をドラッグして、\[Cursor Feedback (Script)\]
    コンポーネントの \[Feedback Parent\] プロパティにドロップします。

CursorFeedback.cs スクリプトでは以下のような作業が行われます。

1.  HandDetectedFeedback アセットのインスタンスを作成します。

2.  HandDetectedFeedback アセットを CursorBillboard
    オブジェクトの親にします。

3.  HandDetected 状態に応じて HandDetectedFeedback
    を有効または無効にします。

**ビルドと配置**

-   Unity で、\[File\] (ファイル)、\[Build Settings\] (ビルド設定)
    の順に選んで、アプリをリビルドします。

-   App フォルダーを開きます。

-   Visual Studio ソリューションの ModelExplorer
    をまだ開いていない場合は開きます。

    -   (セットアップ中にこのプロジェクトを Visual Studio
        で既にビルドして配置した場合は、VS
        のインスタンスを開いて、メッセージが表示されたときに
        \[再読み込み\] をクリックします)

-   Visual Studio で 、\[デバッグ\]、\[デバッグなしで開始\]
    の順に選ぶか、**Ctrl** キーを押しながら **F5** キーを押します。

-   アプリを HoloLens に配置したら、空中をタップするジェスチャーで
    Fitbox を取り除きます。

-   手が視野に入るまで動かし、人差し指を上に向けて、手の追跡を開始します。

-   手を上下左右に動かします。

-   手が検出された後視界から外れたときに、カーソルが変化するようすを観察します。

**第 2 章 – ナビゲーション**

**目標**

-   ナビゲーション
    ジェスチャーのイベントを使ってホログラムを回転させる。

**手順**

アプリでナビゲーションのジェスチャーを使うには、以下を行うように 4
つのスクリプトを編集します。

1.  HandsManager.cs
    では、フォーカスが設定されているオブジェクトを追跡します。

2.  GestureManager.cs では、ナビゲーションのイベントを処理します。

3.  GestureAction.cs
    では、ナビゲーションのジェスチャーが行われたときにオブジェクトを回転させます。

4.  CursorStates.cs
    では、カーソルによってナビゲーションのフィードバックをユーザーに提供します。

では、始めましょう。

-   Visual Studio で HandsManager.cs スクリプトを開きます。

HandsManager.cs では、フォーカスが設定されている Interactible
オブジェクトを追跡します。完成版のコードを HandsManager.cs
にコピーするか、コメントを参考に独自にコーディングします。

HandsManager.cs \[表示\]

次に、ユーザーがナビゲーションのジェスチャーを実行するたびに宇宙飛行士を回転させます。

-   \[Hierarchy\] (階層) パネルの Cursor をクリックします。

-   HoloToolkit フォルダー、Input フォルダー、Prefabs
    フォルダーの順に移動し ScrollFeedback アセットを探します。

-   ScrollFeedback アセットをドラッグして、\[Inspector\]
    (インスペクター) パネルにある \[Cursor Feedback (Script)\]
    コンポーネントの \[Scroll Detected Asset\]
    プロパティにドロップします。

-   \[Hierarchy\] (階層) パネルで AstroMan オブジェクトを選びます。

-   \[Inspector\] (インスペクター) パネルで \[Add Component\]
    (コンポーネントの追加) をクリックします。

-   メニューの検索ボックスに「Gesture
    Action」と入力します。検索結果を選びます。

-   \[Hierarchy\] (階層) パネルの Managers
    オブジェクトに移動して選びます。

-   GestureManager スクリプトをダブルクリックして Visual Studio
    で開きます。

以下の手順を実行するように GestureManager.cs ファイルを編集します。

1.  NavigationRecognizer の新しいインスタンスを GestureRecognizer
    として作成します。

2.  SetRecognizableGestures を使って、NavigationX ジェスチャーと Tap
    ジェスチャーを認識させます。

3.  NavigationStarted イベント、NavigationUpdated
    イベント、NavigationCompleted イベント、NavigationCanceled
    イベントを処理します。

GestureManager.cs
のコメントを参考にコーディングするか、ファイルのコンテンツを以下のコード
ブロックに置き換えます。

GestureManager.cs \[表示\]

次に、Visual Studio で GestureAction.cs
を開きます。このスクリプトを以下を行うように編集します。

1.  ナビゲーションのジェスチャーが実行されるたびに AstroMan
    オブジェクトを回転させます。

2.  rotationFactor
    を計算して、オブジェクトに適用する回転の量を制御します。

3.  ユーザーが手を左右に動かすと、y
    軸を中心にオブジェクトを回転させます。

スクリプトでこのコーディングを完成させるか、コードを以下の完成版のソリューションに置き換えます。

GestureAction.cs \[表示\]

**ビルドと配置**

-   Unity でアプリをリビルド後、Visual Studio
    でビルドして配置し、HoloLens でアプリを実行します。

-   宇宙飛行士に視線を向けると、カーソルの両側に 2
    つの矢印が表示されます。この新しい目印は、宇宙飛行士を回転できることを示します。

-   手を構える (人差し指を上に向ける) と、HoloLens
    が手の追跡を開始します。

-   宇宙飛行士を回転させるには、人差し指を下ろして、親指と人差し指でつまむようにしてから、手を左右に動かして
    NavigationX ジェスチャーをトリガーします。

**第 3 章 – 手の誘導**

**目標**

-   手の誘導スコアを使って、手の追跡が途切れるタイミングを予測できるようにする。

-   カーソルにフィードバックを提供して、ユーザーの手がカメラの視界の端に近づいたことを知らせる。

**手順**

-   \[Hierarchy\] (階層) パネルで Managers オブジェクトを選びます。

-   \[Inspector\] (インスペクター) パネルで \[Add Component\]
    (コンポーネントの追加) をクリックします。

-   メニューの検索ボックスに「Hand
    Guidance」と入力します。検索結果を選びます。

-   \[Project\] (プロジェクト) パネルで HoloToolkit フォルダー、Input
    フォルダー、Prefabs フォルダーの順に移動し、HandGuidanceFeedback
    アセットを探します。

-   HandGuidanceFeedback アセットをドラッグし、\[Inspector\]
    (インスペクター) パネルの \[Hand Guidance Indicator\]
    プロパティにドロップします。

-   \[Hierarchy\] (階層) パネルの Cursor オブジェクトを展開します。

-   \[Hierarchy\] (階層) パネルで Managers オブジェクトを選びます。

-   \[Hierarchy\] (階層) パネルの CursorBillboard
    をドラッグして、\[Inspector\] (インスペクター) パネルの \[Indicator
    Parent\] プロパティにドロップします。

**ビルドと配置**

-   Unity でアプリをリビルド後、Visual Studio
    でビルドして配置し、HoloLens でアプリを実行します。

-   手が視界に入るまで動かし、人差し指を上に向て、手の追跡を開始します。

-   ナビゲーションのジェスチャー (人差し指と親指でつまむ)
    を使って宇宙飛行士を回転させます。

-   手を、上下左右に大きく動かします。

-   手がジェスチャー
    フレームの端に近づくと、カーソルの横に矢印が表示され、手の追跡が途切れることを警告します。矢印が示すのは、追跡が途切れないように手を動かす方向です。

**第 4 章 - 操縦**

**目標**

-   操縦のイベントを使って、宇宙飛行士を手で動かす。

-   カーソルにフィードバックを提供し、いつ操縦できるかユーザーがわかるようにする。

**手順**

GestureManager.cs と AstronautManager.cs
によって、以下のことが可能になります。

1.  「Move Astronaut」 (宇宙飛行士を動かす)
    というキーワードを発話すると、操縦のジェスチャーを有効にします。

2.  Manipulation Gesture Recognizer を使うように切り替えます。

3.  ナビゲーションと操縦のジェスチャーを切り替えるとき、GestureRecognizer
    の遷移を管理します。

では、始めましょう。

-   \[Hierarchy\] (階層) パネルで Managers オブジェクトを選びます。

-   \[Inspector\] (インスペクター) パネルで \[Add Component\]
    (コンポーネントの追加) をクリックします。

-   メニューの検索ボックスに「Astronaut
    Manager」と入力します。検索結果を選びます。

-   \[Hierarchy\] (階層) パネルの Cursor をクリックします。

-   \[Project\] (プロジェクト) パネルで Holotoolkit フォルダー、Input
    フォルダー、Prefabs フォルダーの順に移動し、PathingFeedback
    アセットを探します。

-   PathingFeedback アセットをドラッグし、\[Inspector\] (インスペクター)
    パネルの \[Cursor States (Script)\] コンポーネントの \[Pathing
    Detected Asset\] プロパティにドロップします。

ここで、GestureAction.cs にコードを追加して、以下を可能にします。

1.  関数 PerformManipulationUpdate
    にコードを追加し、操縦のジェスチャーを検出したら宇宙飛行士を移動します。

2.  移動のベクトルを計算して、手の位置を基に宇宙飛行士の移動先を決定します。

3.  新しい位置に宇宙飛行士を移動します。

GestureAction.cs
でのコメントを参考にコーディングを完成するか、以下の完成版ソリューションを使用します。

GestureAction.cs \[表示\]

**ビルドと配置**

-   Unity でアプリをリビルド後、Visual Studio
    でビルドして配置し、HoloLens でアプリを実行します。

-   HoloLens の前で手を動かし、人差し指を上に向けて追跡を開始します。

-   宇宙飛行士の上にカーソルを移動し、フォーカスを設定します。

-   「Move Astronaut」 (宇宙飛行士を動かす)
    と発話し、操縦のジェスチャーを使って宇宙飛行士を動かします。

-   カーソルの周りに 4
    つの矢印が表示され、プログラムが操縦のイベントに応答しているのがわかります。

-   人差し指を親指に触れるまで下げ、つまむようにします。

-   頭を動かすと、宇宙飛行士も移動します。これが操縦です。

-   人差し指を上に向け、宇宙飛行士の操縦を停止します。

-   メモ: 手を動かす前に「Move Astronaut」 (宇宙飛行士を動かす)
    と発話しないと、ナビゲーションのジェスチャーが使用されます。

**第 5 章 - モデルの展開**

**目標**

-   宇宙飛行士のモデルを複数の小さなパーツに展開し、ユーザーが操作できるようにする。

-   ナビゲーションと操縦のジェスチャーを使って、各パーツを個別に動かす。

**手順**

ここでは、以下の作業を行います。

1.  宇宙飛行士のモデルを展開するため、「Expand Model」 (モデルを展開)
    という新しいキーワードを追加します。

2.  モデルを元の形状に戻すために、「Reset Model」 (モデルのリセット)
    という新しいキーワードを追加します。

AstronautManager.cs
でコメントを参考にコーディングを完成するか、以下の完成版のコードをコピーして貼り付けます。

AstronautManager.cs \[表示\]

**ビルドと配置**

-   試してみます。アプリをビルドして HoloLens に配置します。

-   「Expand Model」 (モデルを展開)
    と発話し、宇宙飛行士のモデルが展開されるのを確認します。

-   ナビゲーションのジェスチャーを使って、宇宙服のパーツを個別に回転させます。

-   「Move Astronaut」 (宇宙飛行士を動かす)
    と発話してから操縦のジェスチャーを使って、宇宙服のパーツを個別に移動します。

-   「Reset Model」 (モデルのリセット)
    と発話して、モデルを元の形状に戻します。

**終わりに**

お疲れ様でした。これで、チュートリアル「ホログラム 211 -
ジェスチャー」は終わりです。

-   手の追跡、ナビゲーション、操縦のイベントを検出して反応する方法を学びました。

-   ナビゲーションのジェスチャーと操縦のジェスチャーの違いを学びました。

-   手を検出したとき、手が画面から外れそうなとき、オブジェクトが異なる操作
    (ナビゲーションと操縦)
    をサポートしているときにカーソルを変更して、ビジュアル
    フィードバックを提供する方法を学びました。


