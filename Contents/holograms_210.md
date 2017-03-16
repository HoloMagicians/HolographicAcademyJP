**ホログラム 210 **

[*視線*](https://developer.microsoft.com/ja-jp/windows/holographic/gaze)は最初の入力形式で、ユーザーの意図や認知を明らかにします。ホログラム
210 （別名、プロジェクト エクスプローラー) は、Windows Holographic
の視線関連の考え方に深く関わっています。ここでは、これまでのカーソルとホログラムに状況認知を加え、ユーザーの視線をアプリが認識し、これを利用するようにします。

ここでは気さくな宇宙飛行士を使って視線の考え方を学びます。[*ホログラム
101*](https://developer.microsoft.com/ja-jp/windows/holographic/holograms_101)
では、視線に追従するだけのシンプルなカーソルを導入しました。今度は、このカーソルを以下のように少し高度にします。

-   カーソルとホログラムに視線を認識させます。つまり、ユーザーが見ている場所と見ていない場所に応じてカーソルとホログラムを両方変化させます。これにより、カーソルとホログラムに状況を認知させます。

-   カーソルとホログラムにフィードバックを追加し、ターゲットについての多くの状況をユーザーに提供します。このようなフィードバックには、オーディオやビジュアル効果を使用できます。

-   ユーザーが小さなターゲットをヒットできるように、ターゲット指定のテクニックを紹介します。

-   方向インジケーターを使って、ユーザーの注意をホログラムに引き付ける方法を紹介します。

-   仮想の世界をユーザーが動き回る動作にホログラムを追従させるテクニックを紹介します。

**前提条件**

-   適切な[*ツールをインストールして*](https://developer.microsoft.com/ja-jp/windows/holographic/install_the_tools)構成した
    Windows 10 PC。

-   ある程度基本的な C\# プログラミング能力。

-   [*ホログラム
    101*](https://developer.microsoft.com/ja-jp/windows/holographic/holograms_101)
    の修了。

-   [*開発用に構成した*](https://developer.microsoft.com/ja-jp/windows/holographic/Using_Visual_Studio.html#enabling_developer_mode)
    HoloLens デバイス。

**プロジェクト ファイル**

-   プロジェクトに必要な[*ファイル*](https://github.com/Microsoft/HolographicAcademy/archive/Holograms-210-Gaze.zip)はダウンロードします。Unity
    5.5 が必要です。

    -   依然として Unity 5.4
        のサポートが必要な場合は、[*こちらのリリース*](https://github.com/Microsoft/HolographicAcademy/archive/v1.5.4-210.zip)を使用してください。

-   デスクトップなどのアクセスしやすい場所にファイルを解凍します。

**正誤表と注意事項**

-   コードをブレークポイントで停止するには、\[ツール\]、\[オプション\]、\[デバッグ\]
    の順に選び、\[マイ コードのみ\] を無効にする (チェック
    ボックスをオフにする) 必要があります。

**チュートリアルの内容**

-   [*1 第 1 章 - Unity
    のセットアップ*](https://developer.microsoft.com/ja-jp/windows/holographic/holograms_210#chapter_1_-_unity_setup)

    -   [*1.1 HoloLens 用の Unity
        の設定*](https://developer.microsoft.com/ja-jp/windows/holographic/holograms_210#unity_settings_for_hololens)

    -   [*1.2 アート
        アセットのインポート*](https://developer.microsoft.com/ja-jp/windows/holographic/holograms_210#import_art_assets)

    -   [*1.3
        シーンのセットアップ*](https://developer.microsoft.com/ja-jp/windows/holographic/holograms_210#setup_the_scene)

    -   [*1.4
        プロジェクトのビルド*](https://developer.microsoft.com/ja-jp/windows/holographic/holograms_210#build_the_project)

-   [*2 第 2 章 - カーソルとターゲット
    フィードバック*](https://developer.microsoft.com/ja-jp/windows/holographic/holograms_210#chapter_2_-_cursor_and_target_feedback)

-   [*3 第 3 章 -
    ターゲット指定のテクニック*](https://developer.microsoft.com/ja-jp/windows/holographic/holograms_210#chapter_3_-_targeting_techniques)

-   [*4 第 4 章 -
    方向インジケーター*](https://developer.microsoft.com/ja-jp/windows/holographic/holograms_210#chapter_4_-_directional_indicator)

-   [*5 第 5 章 -
    ビルボーディング*](https://developer.microsoft.com/ja-jp/windows/holographic/holograms_210#chapter_5_-_billboarding)

-   [*6 第 6 章 -
    追従*](https://developer.microsoft.com/ja-jp/windows/holographic/holograms_210#chapter_6_-_tag-along)

**第 1 章 - Unity のセットアップ**

**目標**

-   HoloLens 開発用に Unity を最適化する。

-   アセットをインポートしてシーンをセットアップする。

-   HoloLens に宇宙飛行士を表示する。

**手順**

-   Unity を起動します。

-   \[New Project\] (新しいプロジェクト) を選びます。

-   プロジェクトに「ModelExplorer」という名前を付けます。

-   最初にファイルを解凍した Gaze フォルダーの場所を入力します。

-   プロジェクトが \[3D\] に設定されていることを確認します。

-   \[Create Project\] (プロジェクトの作成) をクリックします。

**HoloLens 用の Unity の設定**

ここで、エクスポートするアプリが 2D ビューではなくホログラフィック
ビューを作成することを Unity
に認識させる必要があります。そのためには、HoloLens
を仮想現実デバイスとして追加します。

-   \[Edit\] (編集)、\[Project Settings\]
    (プロジェクトの設定)、\[Player\] (プレイヤー) に移動します。

-   \[Inspector\] (インスペクター) パネルで、\[Player Settings\]
    (プレイヤーの設定) に対して Windows ストア アイコンを選びます。

-   \[Other Settings\] (その他の設定) グループを展開します。

-   \[Rendering\] (レンダリング) セクションで、\[Virtual Reality
    Supported\] (仮想現実のサポート) チェック
    ボックスをオンにして、新しい仮想現実 SDK の一覧を追加します。

-   Windows Holographic
    が一覧に表示されることを確認します。表示されない場合は、一覧下部にある
    \[+\] を選んで、\[Windows Holographic\] を選びます。

-   \[Edit\] (編集)、\[Project Settings\]
    (プロジェクトの設定)、\[Quality\] (画質) の順に移動します。

-   \[Windows Store\] (Windows ストア) アイコン下の \[Default\] (既定)
    列で、下矢印をクリックします。

-   \[Windows Store Apps\] (Windows ストア アプリ) に対して \[Fastest\]
    (最速) を選びます。

**アート アセットのインポート**

-   \[Project\] (プロジェクト) パネルで Assets
    フォルダーを右クリックします。

-   \[Import Package\] (パッケージのインポート)、\[Custom Package\]
    (カスタム パッケージ) の順にクリックします。

-   ダウンロードしたプロジェクト
    ファイルに移動して、ModelExplorer.unitypackage をクリックします。

-   \[Open\] (開く) をクリックします。

-   パッケージが読み込まれたら、\[Import\] (インポート)
    をクリックします。

**シーンのセットアップ**

-   \[Hierarchy\] (階層) パネルで \[Main Camera\] (メイン カメラ)
    を削除します。

-   HoloToolkit フォルダー、Utilities フォルダー、Prefabs
    フォルダーの順に開きます。

-   Prefabs フォルダーから \[Main Camera\] (メイン カメラ)
    をドラッグして、\[Hierarchy\] (階層) パネルにドロップします。

-   \[Hierarchy\] (階層) パネルで Directional Light
    オブジェクトを右クリックして、\[Delete\] (削除) を選びます。

-   Holograms フォルダーで、以下のアセットをドラッグして \[Hierarchy\]
    (階層) パネルのルートにドロップします。

    -   **AstroMan**

    -   **Lights**

    -   **SpaceAudioSource**

    -   **SpaceBackground**

-   \[Play Mode\] (プレイ モード) を開始して、宇宙飛行士を表示します。

-   \[Play Mode\] (プレイ モード) を再度クリックすると、停止します。

-   Holograms フォルダーの Fitbox アセットをドラッグして、\[Hierarchy\]
    (階層) パネルのルートにドロップします。

-   \[Hierarchy\] (階層) パネルで Fitbox を選びます。

-   \[Inspector\] (インスペクター) パネルの Fitbox の \[Hologram
    Collection\] プロパティまで、AstroMan コレクションをドラッグします。

**プロジェクトのビルド**

-   \[File\] (ファイル)、\[Save Scene As\] (シーンに名前を付けて保存)
    の順に選び、新しいシーンを保存します。

-   \[New Folder\] (新しいフォルダー)
    をクリックし、フォルダーに「Scenes」という名前を付けます。

-   ファイルに「ModelExplorer」という名前を付け、Scenes
    フォルダーに保存します。

-   Unity で、\[File\] (ファイル)、\[Build Settings\] (ビルド設定)
    の順に選びます。

-   \[Add Open Scenes\] (オープン シーンの追加)
    をクリックして、シーンを追加します。

-   \[Platform\] (プラットフォーム) の一覧で \[Windows Store\] (Windows
    ストア) を選び、\[Switch Platform\] (プラットフォームの切り替え)
    をクリックします。

-   \[SDK\] を \[Universal 10\] に、\[Build Type\] (ビルドの種類) を
    \[D3D\] に設定します。

-   \[Unity C\# Projects\] (Unity C\# プロジェクト) チェック
    ボックスをオンにします。

-   \[Build\] (ビルド) をクリックします。

-   \[New Folder\] (新しいフォルダー)
    をクリックし、フォルダーに「App」という名前を付けます。

-   \[App\] フォルダーをシングル クリックします。

-   \[Select Folder\] (フォルダーの選択) をクリックします。

-   Unity を終了すると、エクスプローラー ウィンドウが表示されます。

-   App フォルダーを開きます。

-   Visual Studio ソリューション「ModelExplorer」を開きます。

-   Visual Studio で、ソリューション エクスプローラーの
    \[Package.appxmanifest\] を右クリックし、\[コードの表示\]
    を選びます。

-   TargetDeviceFamily を指定している行を探し、Name="Windows.Universal"
    を Name="Windows.Holographic" に変更します。

-   Package.appxmanifest を保存します。

-   Visual Studio 上部のツール バーを使って、ターゲットを \[Debug\] から
    \[Release\]、\[ARM\] から \[X86\] に変更します。

-   \[デバイス\] ボタンの横にある矢印をクリックして、\[リモート
    コンピューター\] を選びます。

-   デバイスの IP アドレスを入力し、\[認証モード\] を \[ユニバーサル
    (暗号化されていないプロトコル)\] に設定します。\[選択\]
    をクリックします。デバイスの IP
    アドレスがわからない場合は、\[設定\]、\[ネットワークとインターネット\]、\[詳細オプション\]
    の順に選んで、確認します。

-   上部のメニュー バーで \[デバッグ\]、\[デバッグなしで開始\]
    の順に選ぶか、**Ctrl** キーを押しながら **F5**
    キーを押します。デバイスに初めて配置する場合は、[*Visual Studio
    とのペアリング*](https://developer.microsoft.com/ja-jp/windows/holographic/Using_Visual_Studio.html#pairing_your_device)が必要です。

-   アプリを配置したら、「選ぶ」ジェスチャーを使って Fitbox を消します。

**第 2 章 - カーソルとターゲットのフィードバック**

**目標**

-   カーソルのビジュアル デザインと動作

-   視線に応じたカーソルのフィードバック

-   視線に応じたホログラムのフィードバック

ここでは、以下に示すカーソルのデザイン原則を基に作業します。

1.  カーソルは常時表示します。

2.  カーソルは適切なサイズに保ちます。

3.  コンテンツの邪魔にならないようにします。

**手順**

-   \[Hierarchy\] (階層) パネル上部の \[Create\] (作成)
    メニューをクリックします。

-   \[Create Empty\] (空オブジェクトの作成) を選びます。

-   新しい GameObject を右クリックして、名前を「Managers」に変更します。

-   \[Hierarchy\] (階層) パネルで Managers オブジェクトを選びます。

-   \[Inspector\] (インスペクター) パネルで \[Add Component\]
    (コンポーネントの追加) をクリックします。

-   メニューの検索ボックスに「Gaze
    Manager」と入力します。検索結果を選びます。

-   \[Inspector\] (インスペクター) パネルの \[RaycastLayerMask\]
    ボックスの一覧で \[TransparentFX\] の選択を解除します。

-   HoloToolkit フォルダー、Input フォルダー、Prefabs
    フォルダーの順に移動し Cursor アセットを探します。

-   Cursor アセットをドラッグして、\[Hierarchy\] (階層)
    パネルにドロップします。

-   \[Hierarchy\] (階層) パネルで Cursor オブジェクトを選びます。

-   \[Inspector\] (インスペクター) パネルで \[Add Component\]
    (コンポーネントの追加) をクリックします。

-   メニューの検索ボックスに「Cursor
    Manager」と入力します。検索結果を選びます。

-   \[Hierarchy\] (階層) パネルで Cursor オブジェクトを展開します。

-   CursorOnHolograms オブジェクトをドラッグして、\[Inspector\]
    (インスペクター) パネルの \[Cursor On Holograms\]
    プロパティにドロップします。

-   CursorOffHolograms オブジェクトをドラッグして、\[Inspector\]
    (インスペクター) パネルの \[Cursor Off Holograms\]
    プロパティにドロップします。

この時点で、GazeManager.cs
ファイルを編集して、以下のタスクを実行するように変更します。

1.  物理レイキャストを実行します。

2.  レイキャストが交差する位置と法線を保存します。

3.  レイキャストがヒットしなかった場合、位置と法線に既定値を設定します。

GazeManager.cs で "Coding Exercise"
というコメントを探し、自身でコードを記述してもかまいません。コメントはそれぞれ
1 行のコードに対応します。以下の完成版を使用してもかまいません。

GazeManager.cs \[表示\]

次に、CusorManager.cs を編集して、以下のことを行います。

1.  アクティブにするカーソルを決めます。

2.  カーソルがホログラム上にあるかどうかに応じてカーソルを更新します。

3.  ユーザーの視線の先にカーソルを位置付けます。

ここでも、CursorManager.cs で "Coding Exercise"
というコメントを探して、自身でコードを記述できます。または、以下のコードを使用してもかまいません。

CursorManager.cs \[表示\]

-   \[File\] (ファイル)、\[Build Settings\] (ビルド設定)
    の順に選んで、アプリをリビルドします。

-   App フォルダーを開きます。

-   Visual Studio ソリューション「ModelExplorer」を開きます。

-   \[デバッグ\]、\[デバッグなしで開始\] の順に選ぶか、**Ctrl**
    キーを押しながら **F5** キーを押します。

-   カーソルが描画されるようす、カーソルがホログラムに触れると表示が変化するようすを観察します。

-   \[Hierarchy\] (階層) パネルで Managers オブジェクトを選びます。

-   \[Inspector\] (インスペクター) パネルで \[Add Component\]
    (コンポーネントの追加) をクリックします。

-   メニューの検索ボックスに「Interactible
    Manager」と入力します。検索結果を選びます。

-   \[Hierarchy\] (階層) パネルで AstroMan オブジェクトを選びます。

-   \[Inspector\] (インスペクター) パネルで \[Add Component\]
    (コンポーネントの追加) をクリックします。

-   メニューの検索ボックスに「Interactible」と入力します。検索結果を選びます。

InteractibleManager.cs と Interactible.cs
の両方を編集して、以下のことを行います。

1.  InteractibleManager.cs
    では、視線のレイキャストがヒットした位置をフェッチし、ヒットした
    GameObject を保存します。

2.  視線の先に操作可能なオブジェクトがある場合は、GazeEntered
    メッセージを送信します。

3.  操作可能なオブジェクトから視線がそれた場合は、GazeExited
    メッセージを送信します。

4.  Interactible.cs では、GazeEntered コールバックと GazeExited
    コールバックを処理します。

InteractibleManager.cs と Interactible.cs で "Coding Exercise"
というコメントを探して、自身でコードを記述し、試してみることができます。または、以下のソリューションを使用してもかまいません。

InteractibleManager.cs \[表示\]

Interactible.cs \[表示\]

-   先ほどと同様、プロジェクトをビルドして HoloLens に配置します。

-   視線の先にオブジェクトがあるかないかに応じて何が起こるか観察します。

**第 3 章 - ターゲット指定のテクニック**

**目標**

-   ホログラムへのターゲット指定を容易にする。

-   頭の自然な動きを安定させる。

**手順**

1.  \[Hierarchy\] (階層) パネルで Managers オブジェクトを選びます。

2.  \[Inspector\] (インスペクター) パネルで \[Add Component\]
    (コンポーネントの追加) をクリックします。

3.  メニューの検索ボックスに「Gaze
    Stabilizer」と入力します。検索結果を選びます。

ここで、GazeStabilizer を使用するように GazeManager を変更します。

1.  Visual Studio で GazeManager スクリプトを開きます。

2.  以下のコードを GazeManager.cs にコピーするか、"Coding Excercise 3.a"
    を自身で完成します。

GazeManager.cs \[表示\]

**第 4 章 - 方向インジケーター**

**目標**

-   カーソルに方向インジケーターを追加して、ホログラムを見つけるのを補助する。

**手順**

ここでは DirectionalIndicator.cs
を使用します。このコードは、以下のように動作します。

1.  ユーザーの視線の先にホログラムがない場合は方向インジケーターを表示します。

2.  ユーザーの視線の先にホログラムがある場合は方向インジケーターを非表示にします。

3.  ホログラムを指すように方向インジケーターを更新します。

では、始めましょう。

-   \[Hierarchy\] (階層) パネルで AstroMan
    オブジェクトを選び、矢印をクリックしてオブジェクトを展開します。

-   \[Hierarchy\] (階層) パネルの AstroMan で DirectionalIndicator
    オブジェクトを選びます。

-   \[Inspector\] (インスペクター) パネルで \[Add Component\]
    (コンポーネントの追加) をクリックします。

-   メニューの検索ボックスに「Direction
    Indicator」と入力します。検索結果を選びます。

-   \[Hierarchy\] (階層) パネルの Cursor
    オブジェクトをドラッグし、\[Inspector\] (インスペクター) パネルの
    \[Cursor\] プロパティにドロップします。

-   \[Project\] (プロジェクト) パネルの Holograms フォルダーから
    DirectionalIndicator アセットをドラッグし、\[Inspector\]
    (インスペクター) パネルの \[Directional Indicator\]
    プロパティにドロップします。

-   アプリをビルドして HoloLens に配置します。

-   方向インジケーター
    オブジェクトによって宇宙飛行士が見つやすくなることを観察します。

**第 5 章 - ビルボーディング**

**目標**

-   ビルボーディングを使って、ホログラムが常にユーザーの方を向くようにする。

ここでは Billboard.cs を使用して、GameObject
が常にユーザーの方を向き続けるようにします。

-   \[Hierarchy\] (階層) パネルで AstroMan オブジェクトを選びます。

-   \[Inspector\] (インスペクター) パネルで \[Add Component\]
    (コンポーネントの追加) をクリックします。

-   メニューの検索ボックスに「Billboard」と入力します。検索結果を選びます。

-   \[Inspector\] (インスペクター) パネルで \[Pivot Axis\] を \[Y\]
    に設定します。

-   試してみます。先ほどと同様、アプリをビルドして HoloLens
    に配置します。

-   視点を変えても Billboard
    オブジェクトがユーザーの方を向くことを確認します。

-   この時点では、AstroMan からスクリプトを削除します。

**第 6 章 - 追従**

**目標**

-   追従を使って、部屋の中でホログラムが動きを追うようにする。

この課題の作業では、次のような設計上の制約に従います。

-   コンテンツからは常に目をそらします。

-   コンテンツは移動の邪魔にならないようにします。

-   頭を固定するコンテンツは望ましくありません。

ここで使用するソリューションは、「追従」アプローチです。

追従オブジェクトがユーザーの視界から完全に外れることはありません。追従オブジェクトは、ユーザーの頭にゴムバンドでくくり付けられたオブジェクトと考えてもかまいません。ユーザーが移動すると、コンテンツは視界の端に向かってスライドし、完全に消えることなく、簡単に目を向けられる範囲内にとどまります。ユーザーが追従オブジェクトの方に目を向けると、オブジェクトが完全に視界に入ります。

-   \[Hierarchy\] (階層) パネルで Managers オブジェクトを選びます。

-   \[Inspector\] (インスペクター) パネルで \[Add Component\]
    (コンポーネントの追加) をクリックします。

-   メニューの検索ボックスに「Gesture
    Manager」と入力します。検索結果を選びます。

ここでは、以下のように動作する SimpleTagalong.cs を使用します。

1.  追従オブジェクトがカメラの境界内にあるかどうかを判断します。

2.  追従オブジェクトが視錘台内にない場合は、視錘台の内部に入るよう追従オブジェクトを位置付けます。

3.  それ以外の場合は、追従オブジェクトをユーザーから既定の距離に位置付けます。

そのためには、以下を行います。

-   Holograms フォルダーの Tagalong アセットをクリックします。

-   \[Inspector\] (インスペクター) パネルで、\[Tag\] (タグ)
    ボックスの一覧から \[Add Tag…\] (タグの追加) をクリックします。

-   \[+\] 記号をクリックして、名前を「Tag
    0」から「agAlong」に変更します。

-   Holograms フォルダーで Tagalong アセットをクリックし、\[Tag\] (タグ)
    ボックスの一覧をクリックします。

-   \[TagAlong\] タグを選びます。

-   最初に、InteractibleAction にメッセージを送信するように
    Interactible.cs スクリプトを変更する必要があります。

-   "Coding Excercise" を完成するか、以下を使用して Interactible.cs
    を編集します。

Interactible.cs \[表示\]

視線をホログラムに向けると、InteractibleAction.cs スクリプトはカスタム
アクションを実行します。では、追従を使用するために更新してみましょう。

-   Scripts フォルダーの InteractibleAction.cs
    アセットをダブルクリックして Visual Studio で開きます。

-   "Coding Exercise" を完成するか、以下のように変更します。

    -   \[Hierarchy\] (階層)
        パネル上部の検索バーに「ChestButton\_Center」と入力し、検索結果を選びます。

    -   \[Inspector\] (インスペクター) パネルで \[Add Component\]
        (コンポーネントの追加) をクリックします。

    -   メニューの検索ボックスに「Interactible
        Action」と入力します。検索結果を選びます。

    -   Holograms フォルダーの Tagalong アセットに移動します。

    -   \[Hierarchy\] (階層) パネルで ChestButton\_Center
        オブジェクトを選びます。TagAlong
        オブジェクトをドラッグして、\[Inspector\] (インスペクター)
        パネルの \[Object to TagAlong\] プロパティにドロップします。

    -   InteractibleAction スクリプトをダブルクリックして Visual Studio
        で開きます。

ここで、以下を追加する必要があります。

-   InteractibleAction スクリプトの PerformTagAlong
    関数に機能を追加します。

-   視線の先のオブジェクトにビルボーディングを追加して、\[Pivot Axis\]
    に \[free\] を設定します。

-   その後、シンプルな追従をオブジェクトに追加します。

ソリューションは次のようになります。

InteractibleAction.cs \[表示\]

-   試してみます。アプリをビルドして HoloLens に配置します。

-   コンテンツが、連続的ではなく、邪魔になることもなく、視線の中心に追従するようすを観察します。


