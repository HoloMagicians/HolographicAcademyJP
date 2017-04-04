# ホログラム 230

[*空間マッピング*](https://developer.microsoft.com/ja-jp/windows/mixed-reality/spatial_mapping)はホログラムに環境を教えることで、現実世界と仮想世界とを組み合わせます。ホログラム230 (プロジェクト Planetarium) では、次の方法を習得します。

-   環境をスキャンして、HoloLens から開発コンピューターにデータを転送する。
-   シェーダーについて調べ、空間の視覚化にシェーダーを使う。
-   メッシュ処理を使って室内のメッシュをシンプルな平面に分割する。
-   [*ホログラム101*](holograms_101.md)で習得した配置テクニックを活かして、環境のどこにホログラムを配置できるかについてのフィードバックを提供する。
-   オクルージョン効果を調べ、ホログラムが現実世界の物体の背後に隠れている場合でも、透視効果を使って見えるようにする。

## 前提条件

-   適切な[*ツールをインストール*](https://developer.microsoft.com/ja-jp/windows/mixed-reality/install_the_tools)して構成した Windows 10 PC。
-   ある程度基本的な C\# プログラミング能力。
-   [*ホログラム101*](holograms_101.md) の修了。
-   [*開発用に構成*](https://developer.microsoft.com/ja-jp/windows/mixed-reality/Using_Visual_Studio.html#enabling_developer_mode)した HoloLens デバイス。

## プロジェクト ファイル

-   プロジェクトに必要な[*ファイル*](https://github.com/Microsoft/HolographicAcademy/archive/Holograms-230-SpatialMapping.zip)はダウンロードします。Unity 5.5 が必要です。
    -   依然として Unity 5.4 のサポートが必要な場合は、[*こちらのリリース*](https://github.com/Microsoft/HolographicAcademy/archive/v1.5.4-230.zip)を使用してください。
-   デスクトップなどのアクセスしやすい場所にファイルを解凍します。

## メモ

-   コードをブレークポイントで停止するには、\[ツール\] 、\[オプション\] 、\[デバッグ\] の順に選び、\[マイ コードのみ\] を無効にする (チェックボックスをオフにする) 必要があります。

## チュートリアルの内容

-   [Unity のセットアップ](holograms_230.md#unity-のセットアップ)
-   [第 1 章 - スキャン](holograms_230.md#第-1-章---スキャン)
-   [第 2 章 - 視覚化](holograms_230.md#第-2-章---視覚化)
-   [第 3 章 - 処理](holograms_230.md#第-3-章---処理)
-   [第 4 章 - 配置](holograms_230.md#第-4-章---配置)
-   [第 5 章 - オクルージョン](holograms_230.md#第-5-章---オクルージョン)
-   [終わりに](holograms_230.md#終わりに)

## Unity のセットアップ

-   Unity を起動します。
-   \[New\] を選び、新しいプロジェクトを作成します。
-   プロジェクトに「Planetarium」という名前を付けます。
-   \[3D\] トグルが選択されていることを確認します。
-   \[Create Project\] をクリックします。
-   Unity が起動したら、\[Edit\] 、\[Project Settings\]  、\[Player\] の順に移動します。
-   \[Inspector\] パネルで、緑の \[Windows Store\] アイコンを選びます。
-   \[Other Settings\] を展開します。
-   \[Rendering\] セクションで、\[Virtual Reality Supported\] オプションのチェックボックスをオンにします。
-   \[Windows Holographic\] が \[Virtual Reality SDKs\] の一覧に表示されることを確認します。表示されない場合は、一覧下部にある \[+\] を選んで、\[Windows Holographic\] を選びます。
-   \[Publishing Settings\] を展開します。
-   \[Capabilities\] セクションで、以下の設定のチェックボックスをオンにします。
    -   InternetClientServer
    -   PrivateNetworkClientServer
    -   Microphone
    -   SpatialPerception
-   \[Edit\] 、\[Project Settings\] 、\[Quality\] の順に移動します。
-   \[Inspector\] パネルの \[Windows Store\] アイコン下の \[Default\] 列で、黒のドロップダウン矢印を選び、既定の設定を \[Fastest\] に変更します。
-   \[Assets\] 、\[Import Package\] 、\[Custom Package\]  の順に移動します。
-   ...\\HolographicAcademy-Holograms-230-SpatialMapping\\Starting フォルダーに移動します。
-   Planetarium.unitypackage をクリックします。
-   \[Open\] をクリックします。
-   \[Import Unity Package\] ウィンドウが表示されたら、\[Import\] をクリックします。
-   Unity がこのプロジェクトを完成するのに必要なすべてのアセットをインポートするのを待ちます。
-   \[Hierarchy\] パネルで、\[Main Camera\] を削除します。
-   \[Project\] パネルで HoloToolkit-SpatialMapping-230フォルダー、Utilities フォルダー、Prefabsフォルダーの順に移動し、Main Camera オブジェクトを探します。
-   \[Main Camera\] をドラッグし、\[Hierarchy\] パネルにドロップします。
-   \[Hierarchy\] パネルで Directional Light オブジェクトを削除します。
-   \[Project\] パネルで Holograms フォルダーの Cursor オブジェクトに移動します。
-   \[Cursor\] をドラッグして、\[Hierarchy\] にドロップします。
-   \[Hierarchy\] パネルで Cursor オブジェクトを選びます。
-   \[Inspector\] パネルで、\[Layer\] ドロップダウンをクリックして、\[Edit Layers...\] を選びます。
-   \[User Layer 31\] の名前を「SpatialMapping」にします。
-   \[File\] 、\[Save Scene As\] の順に選び、新しいシーンを保存します。
-   \[New Folder\] をクリックし、フォルダーに「Scenes」という名前を付けます。
-   ファイルに「Planetarium」という名前を付け、Scenesフォルダーに保存します。

## 第 1 章 - スキャン

### 目標

-   SurfaceObserver の詳細と、SurfaceObserverの設定がエクスペリエンスとパフォーマンスに与える影響を学ぶ。
-   室内のスキャン エクスペリエンスを作成し室内のメッシュを収集する。

### 手順

-   \[Project\] パネルで HoloToolkit-SpatialMapping-230フォルダー、SpatialMapping フォルダー、Prefabsフォルダーの順に移動し、SpatialMapping を探します。
-   SpatialMapping をドラッグし、\[Hierarchy\] パネルにドロップします。

### ビルドと配置 (パート1)

-   Unity で、\[File\] (ファイル)、\[Build Settings\] (ビルド設定)の順に選びます。
-   \[Add Open Scenes\] をクリックして、ビルドに Planetarium シーンを追加します。
-   \[Platform\] の一覧で \[Windows Store\] を選び、\[Switch Platform\] をクリックします。
-   \[SDK\] を \[Universal 10\] に、\[UWP Build Type\] を \[D3D\] に設定します。
-   \[Unity C\# Projects\] チェックボックスをオンにします。
-   \[Build\] をクリックします。
-   \[New Folder\] をクリックし、フォルダーに「App」という名前を付けます。
-   \[App\] フォルダーをシングル クリックします。
-   \[Select Folder\] をクリックします。
-   Unity によるビルドが終了すると、エクスプローラーウィンドウが表示されます。
-   App フォルダーをダブルクリックして開きます。
-   Planetarium.sln をダブルクリックして Visual Studio で読み込みます。
-   Visual Studio 上部のツールバーを使って、構成を \[Release\] に変更します。
-   プラットフォームを \[x86\] に変更します。
-   \[ローカル コンピューター\] の横にある矢印をクリックして、\[リモートコンピューター\] を選びます。
-   \[アドレス\] フィールドに[*デバイスの IP アドレス*](https://developer.microsoft.com/ja-jp/windows/mixed-reality/Connecting_to_Wi-Fi_on_HoloLens.html#identifying_the_hololens_ip_address_on_the_wi-fi_network)を入力し、\[認証モード\] を \[ユニバーサル (暗号化されていないプロトコル)\] に変更します。
-   \[デバッグ\] 、\[デバッグなしで開始\] の順に選ぶか、**Ctrl** キーを押しながら **F5** キーを押します。
-   Visual Studio の \[出力\] パネルで、ビルドと配置のようすを見守ります。
-   アプリの配置が完了したら、室内を歩き回ります。カメラを取り巻く面が黒と白のワイヤーフレームのメッシュに覆われます。
-   周囲をスキャンします。壁、天井、床を見るようにします。

### ビルドと配置 (パート2)

ここで、空間マッピングがパフォーマンスに与える影響を調べます。

-   Unity で、\[Window\] 、\[Profiler\] の順に選びます。
-   \[Add Profiler\] 、\[GPU\] の順にクリックします。
-   \[Active Profiler\] 、\[&lt;Enter IP&gt;\] (IP を入力) の順にクリックします。
-   HoloLens の IP アドレスを入力します。
-   \[Connect\] をクリックします。
-   GPU がフレームのレンダリングにかかるミリ秒数を観察します。
-   デバイスでのアプリの実行を停止します。
-   Visual Studio に戻り、SpatialMappingObserver.csを開きます。このファイルは、「Assembly-CSharp (ユニバーサル Windows)」プロジェクトの HoloToolkit\\SpatialMapping フォルダーにあります。
-   Awake() 関数を探して、次のコード行を追加します。**TrianglesPerCubicMeter = 1200;**
-   デバイスにプロジェクトを再配置し、プロファイラーに再接続します。フレームのレンダリングにかかるミリ秒数の変化を観察します。
-   デバイスでのアプリの実行を停止します。

### 保存と Unity での読み込み

最後に、室内のメッシュを保存して、Unity に読み込みます。

-   Visual Studio に戻り、前のセクションで Awake() 関数に追加した TrianglesPerCubicMeter 行を削除します。
-   デバイスにプロジェクトを再配置します。これで、1 立方メートルあたり 500 個の三角形が含まれる状態で実行されるようになります。
-   ブラウザーを開いて HoloLens の IP アドレスを入力し、\[Windows Device Portal\] に移動します。
-   左側のパネルで \[3D View\] オプションを選びます。
-   \[Surface reconstruction\] で、\[Update\] を選びます。
-   HoloLens でスキャンした領域がディスプレイウィンドウに表示されるのを見守ります。
-   室内のスキャン結果を保存するには、\[Save\] を押します。
-   Downloads フォルダーを開いて、室内のモデル SRMesh.obj に移動します。
-   SRMesh.obj を Unity プロジェクトの Assets フォルダーにコピーします。
-   Unity で、\[Hierarchy\] パネルの SpatialMapping オブジェクトを選びます。
-   \[Object Surface Observer (Script)\] コンポーネントに移動します。
-   \[Room Model\] プロパティの横にある円をクリックします。
-   SRMesh オブジェクトに移動して選び、ウィンドウを閉じます。
-   \[Inspector\] パネルの \[Room Model\] プロパティがSRMesh に設定されたことを確認します。
-   \[Play\] をクリックして、Unity のプレビューモードを開始します。
-   SpatialMappingコンポーネントによって保存済みの室内モデルのメッシュが読み込まれます。これで、Unity でこのメッシュを使用できるようになります。
-   \[Scene\] ビューに切り替えて、ワイヤーフレームシェーダーが付いた状態で表示される室内モデル全体を確認します。
-   もう一度 \[Play\] をクリックしてプレビューモードを終了します。

**メモ:** 次回 Unity でプレビューモードに入ると、保存済みの室内メッシュが既定で読み込まれます。

## 第 2 章 - 視覚化

### 目標

-   シェーダーの基礎を習得する。
-   周囲の状況を視覚化する。

### 手順
-   Unity の \[Hierarchy\] パネルで、SpatialMapping オブジェクトを選びます。
-   \[Inspector\] パネルの \[Spatial Mapping Manager (Script)\] コンポーネントに移動します。
-   \[Surface Material\] プロパティの横にある円をクリックします。
-   \[BlueLinesOnWalls\] マテリアルを見つけて選び、ウィンドウを閉じます。
-   \[Project\] パネルの Shaders フォルダーの \[BlueLinesOnWalls\] をダブルクリックして Visual Studio でこのシェーダーを開きます。
-   このシェーダーはシンプルなピクセル (頂点からフラグメントまでの) シェーダーで、以下のタスクを行います。
    1.  頂点の位置を仮想空間の位置に変換します。
    2.  頂点法線をチェックして、ピクセルが垂直かどうかを判断します。
    3.  レンダリングのためにピクセルの色を設定します。

### ビルドと配置

-   Unity に戻り、\[Play\] をクリックして、プレビューモードを開始します。
-   (保存したスキャン データから自動的に読み込まれる)室内メッシュのすべての垂直面に青い線がレンダリングされます。
-   \[Scene\] タブに切り替えて室内のビューを調整し、Unity で室内全体のメッシュがどのように表示されるか確認します。
-   \[プロジェクト (Project)\] パネルの Materials フォルダーに移動し、\[BlueLinesOnWalls\] マテリアルを選びます。
-   Unity エディターでいくつかプロパティを変更し、その変更がどのように表示されるか確認します。
    -   \[Inspector\] パネルで \[LineScale\] の値を変更して線の太さを調整します。
    -   \[Inspector\] パネルで \[LinesPerMeter\] の値を調整して、各壁面に表示される線の数を変更します。
-   再度 \[Play\] をクリックして、プレビューモードを終了します。
-   ビルドして HoloLens に配置し、シェーダーのレンダリングが実際の面にどのように表示されるか観察します。

Unity でも適切にマテリアルがプレビューされますが、常にデバイスでレンダリングする方が適切です。

## 第 3 章 - 処理

### 目標

-   アプリで使用するために空間マッピングデータを処理するテクニックを習得する。
-   空間マッピングデータを分析して平面を探し、三角形を削除する。
-   ホログラムの配置に平面を使用する。

### 手順

-   Unity で、\[Project\] パネルの Holograms フォルダーで SpatialProcessing オブジェクトに移動します。
-   SpatialProcessing オブジェクトをドラッグして、\[Hierarchy\] パネルにドロップします。

SpatialProcessing オブジェクトには、空間マッピングデータを処理するためのコンポーネントが含まれています。SurfaceMeshesToPlanes.cs は、空間マッピングデータに基づいて平面を見つけて、生成します。壁、床、天井を表現するために、アプリで平面を使用します。また、このオブジェクトには、空間マッピングのメッシュから頂点を削除できる RemoveSurfaceVertices.cs も含まれています。これは、メッシュに穴を開けたり、(平面を使用できるため)必要なくなった余分な三角形を削除するのに使用できます。

-   Unity で、\[Project\] パネルの Holograms フォルダーで SpaceCollection オブジェクトに移動します。
-   SpaceCollection オブジェクトをドラッグして、\[Hierarchy\] パネルにドロップします。
-   \[Hierarchy\] パネルで、SpatialProcessing オブジェクトを選びます。
-   \[Inspector\] パネルの \[Play Space Manager (Script)\] コンポーネントに移動します。
-   PlaySpaceManager.cs をダブルクリックして Visual Studio で開きます。

PlaySpaceManager.csには、アプリ固有のコードを含みます。このスクリプトに機能を追加して、以下の動作を実現します。

1.  スキャンの制限時間 (10 秒) を超えたら、空間マッピングデータの収集を停止します。
2.  空間マッピング データを以下のように処理します。
    1.  SurfaceMeshesToPlanes を使用して、(壁、床、天井などの)面として、仮想世界の簡単な表現を作成します。
    2.  RemoveSurfaceVertices を使用して、平面の境界内に収まる面の三角形を取り除きます。
3.  仮想世界のホログラムのコレクションを生成し、ユーザー近くの壁と床に配置します。

PlaySpaceManager.cs でマークを付けたコーディングを完成するか、スクリプトを以下の完成版ソリューションに置き換えます。

PlaySpaceManager.cs
```cs
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Windows.Speech;
using Academy.HoloToolkit.Unity;

/// <summary>
/// The SurfaceManager class allows applications to scan the environment for a specified amount of time
/// and then process the Spatial Mapping Mesh (find planes, remove vertices) after that time has expired.
/// </summary>
public class PlaySpaceManager : Singleton<PlaySpaceManager>
{
    [Tooltip("When checked, the SurfaceObserver will stop running after a specified amount of time.")]
    public bool limitScanningByTime = true;

    [Tooltip("How much time (in seconds) that the SurfaceObserver will run after being started; used when 'Limit Scanning By Time' is checked.")]
    public float scanTime = 30.0f;

    [Tooltip("Material to use when rendering Spatial Mapping meshes while the observer is running.")]
    public Material defaultMaterial;

    [Tooltip("Optional Material to use when rendering Spatial Mapping meshes after the observer has been stopped.")]
    public Material secondaryMaterial;

    [Tooltip("Minimum number of floor planes required in order to exit scanning/processing mode.")]
    public uint minimumFloors = 1;

    [Tooltip("Minimum number of wall planes required in order to exit scanning/processing mode.")]
    public uint minimumWalls = 1;

    /// <summary>
    /// Indicates if processing of the surface meshes is complete.
    /// </summary>
    private bool meshesProcessed = false;

    /// <summary>
    /// GameObject initialization.
    /// </summary>
    private void Start()
    {
        // Update surfaceObserver and storedMeshes to use the same material during scanning.
        SpatialMappingManager.Instance.SetSurfaceMaterial(defaultMaterial);

        // Register for the MakePlanesComplete event.
        SurfaceMeshesToPlanes.Instance.MakePlanesComplete += SurfaceMeshesToPlanes_MakePlanesComplete;
    }

    /// <summary>
    /// Called once per frame.
    /// </summary>
    private void Update()
    {
        // Check to see if the spatial mapping data has been processed
        // and if we are limiting how much time the user can spend scanning.
        if (!meshesProcessed && limitScanningByTime)
        {
            // If we have not processed the spatial mapping data
            // and scanning time is limited...

            // Check to see if enough scanning time has passed
            // since starting the observer.
            if (limitScanningByTime && ((Time.time - SpatialMappingManager.Instance.StartTime) < scanTime))
            {
                // If we have a limited scanning time, then we should wait until
                // enough time has passed before processing the mesh.
            }
            else
            {
                // The user should be done scanning their environment,
                // so start processing the spatial mapping data...

                /* TODO: 3.a DEVELOPER CODING EXERCISE 3.a */

                // 3.a: Check if IsObserverRunning() is true on the
                // SpatialMappingManager.Instance.
                if(SpatialMappingManager.Instance.IsObserverRunning())
                {
                    // 3.a: If running, Stop the observer by calling
                    // StopObserver() on the SpatialMappingManager.Instance.
                    SpatialMappingManager.Instance.StopObserver();
                }

                // 3.a: Call CreatePlanes() to generate planes.
                CreatePlanes();

                // 3.a: Set meshesProcessed to true.
                meshesProcessed = true;
            }
        }
    }

    /// <summary>
    /// Handler for the SurfaceMeshesToPlanes MakePlanesComplete event.
    /// </summary>
    /// <param name="source">Source of the event.</param>
    /// <param name="args">Args for the event.</param>
    private void SurfaceMeshesToPlanes_MakePlanesComplete(object source, System.EventArgs args)
    {
        /* TODO: 3.a DEVELOPER CODING EXERCISE 3.a */

        // Collection of floor and table planes that we can use to set horizontal items on.
        List<GameObject> horizontal = new List<GameObject>();

        // Collection of wall planes that we can use to set vertical items on.
        List<GameObject> vertical = new List<GameObject>();

        // 3.a: Get all floor and table planes by calling
        // SurfaceMeshesToPlanes.Instance.GetActivePlanes().
        // Assign the result to the 'horizontal' list.
        horizontal = SurfaceMeshesToPlanes.Instance.GetActivePlanes(PlaneTypes.Table | PlaneTypes.Floor);

        // 3.a: Get all wall planes by calling
        // SurfaceMeshesToPlanes.Instance.GetActivePlanes().
        // Assign the result to the 'vertical' list.
        vertical = SurfaceMeshesToPlanes.Instance.GetActivePlanes(PlaneTypes.Wall);

        // Check to see if we have enough horizontal planes (minimumFloors)
        // and vertical planes (minimumWalls), to set holograms on in the world.
        if (horizontal.Count >= minimumFloors && vertical.Count >= minimumWalls)
        {
            // We have enough floors and walls to place our holograms on...

            // 3.a: Let's reduce our triangle count by removing triangles
            // from SpatialMapping meshes that intersect with our active planes.
            // Call RemoveVertices().
            // Pass in all activePlanes found by SurfaceMeshesToPlanes.Instance.
            RemoveVertices(SurfaceMeshesToPlanes.Instance.ActivePlanes);

            // 3.a: We can indicate to the user that scanning is over by
            // changing the material applied to the Spatial Mapping meshes.
            // Call SpatialMappingManager.Instance.SetSurfaceMaterial().
            // Pass in the secondaryMaterial.
            SpatialMappingManager.Instance.SetSurfaceMaterial(secondaryMaterial);

            // 3.a: We are all done processing the mesh, so we can now
            // initialize a collection of Placeable holograms in the world
            // and use horizontal/vertical planes to set their starting positions.
            // Call SpaceCollectionManager.Instance.GenerateItemsInWorld().
            // Pass in the lists of horizontal and vertical planes that we found earlier.
            SpaceCollectionManager.Instance.GenerateItemsInWorld(horizontal, vertical);
        }
        else
        {
            // We do not have enough floors/walls to place our holograms on...

            // 3.a: Re-enter scanning mode so the user can find more surfaces by
            // calling StartObserver() on the SpatialMappingManager.Instance.
            SpatialMappingManager.Instance.StartObserver();

            // 3.a: Re-process spatial data after scanning completes by
            // re-setting meshesProcessed to false.
            meshesProcessed = false;
        }
    }

    /// <summary>
    /// Creates planes from the spatial mapping surfaces.
    /// </summary>
    private void CreatePlanes()
    {
        // Generate planes based on the spatial map.
        SurfaceMeshesToPlanes surfaceToPlanes = SurfaceMeshesToPlanes.Instance;
        if (surfaceToPlanes != null && surfaceToPlanes.enabled)
        {
            surfaceToPlanes.MakePlanes();
        }
    }

    /// <summary>
    /// Removes triangles from the spatial mapping surfaces.
    /// </summary>
    /// <param name="boundingObjects"></param>
    private void RemoveVertices(IEnumerable<GameObject> boundingObjects)
    {
        RemoveSurfaceVertices removeVerts = RemoveSurfaceVertices.Instance;
        if (removeVerts != null && removeVerts.enabled)
        {
            removeVerts.RemoveSurfaceVerticesWithinBounds(boundingObjects);
        }
    }

    /// <summary>
    /// Called when the GameObject is unloaded.
    /// </summary>
    private void OnDestroy()
    {
        if (SurfaceMeshesToPlanes.Instance != null)
        {
            SurfaceMeshesToPlanes.Instance.MakePlanesComplete -= SurfaceMeshesToPlanes_MakePlanesComplete;
        }
    }
}
```

### ビルドと配置

-   HoloLens に配置する前に、Unity で \[Play\] をクリックして、プレビュー モードを開始します。
-   ファイルから室内のメッシュが読み込まれたら、空間マッピングデータのメッシュで処理が始まるまで 10 秒間待ちます。
-   処理が完了すると、床、壁、天井などを表す面が表示されます。
-   すべての面が見つかったら、カメラ近くの床のテーブル上に太陽系が表示されます。
-   また、カメラ近くの壁にポスターが 2 枚表示されます。\[Game\] モードで表示されない場合は、\[Scene\] タブに切り替えます。
-   再度 \[Play\] をクリックして、プレビューモードを終了します。
-   いつものようにビルドして、HoloLens に配置します。
-   空間マッピング データのスキャンと処理が完了するのを待ちます。
-   各面が表示されたら、仮想世界で太陽系とポスターを確認します。

## 第 4 章 - 配置

### 目標

-   ホログラムが面にフィットするかどうかを判断する。
-   ホログラムが面にフィットするかどうかのフィードバックをユーザーに提供する。

### 手順

-   Unity の \[Hierarchy\] パネルで、SpatialProcessing オブジェクトを選びます。
-   \[Inspector\] パネルで \[Surface Meshes To Planes (Script)\] コンポーネントに移動します。
-   \[Draw Planes\] プロパティを \[Nothing\] に変更して、選択内容をクリアします。
-   \[Draw Planes\] プロパティを \[Wall\] に変更して、壁面だけをレンダリングします。
-   \[Project\] パネルの Scripts フォルダーで、\[Placeable.cs\] をダブルクリックして Visual Studio で開きます。

平面の検索が完了すると作成されるポスターとプロジェクションボックスには、Placeable スクリプトが既にアタッチされています。必要なのは、一部のコードのコメントを解除することだけです。このスクリプトは以下を行います。

1.  境界キューブの4つの角と中心からレイキャストすることで、ホログラムが面にフィットするかどうかを判断します。
2.  面法線をチェックし、ホログラムを配置するのに十分滑らかかどうかを判断します。
3.  ホログラムを囲む境界キューブをレンダリングして、配置中に実サイズを表示します。
4.  ホログラムの下と後ろに影を落として、壁または床のどこに配置するかを表示します。
5.  ホログラムを面に配置できない場合は影を赤でレンダリングし、配置できる場合は緑でレンダリングします。
6.  ホログラムの向きを再度設定して、面の種類 (垂直または水平)に揃え、一体感を出します。
7.  ジャンプやスナップの動作を避けるため、選択した面にホログラムを滑らかに配置します。

以下のコーディング作業のコメントをすべて解除するか、完成版のソリューションを使用します。

Placeable.cs
```cs
using System.Collections.Generic;
using UnityEngine;
using Academy.HoloToolkit.Unity;

/// <summary>
/// Enumeration containing the surfaces on which a GameObject
/// can be placed.  For simplicity of this sample, only one
/// surface type is allowed to be selected.
/// </summary>
public enum PlacementSurfaces
{
    // Horizontal surface with an upward pointing normal.    
    Horizontal = 1,

    // Vertical surface with a normal facing the user.
    Vertical = 2,
}

/// <summary>
/// The Placeable class implements the logic used to determine if a GameObject
/// can be placed on a target surface. Constraints for placement include:
/// * No part of the GameObject's box collider impacts with another object in the scene
/// * The object lays flat (within specified tolerances) against the surface
/// * The object would not fall off of the surface if gravity were enabled.
/// This class also provides the following visualizations.
/// * A transparent cube representing the object's box collider.
/// * Shadow on the target surface indicating whether or not placement is valid.
/// </summary>
public class Placeable : MonoBehaviour
{
    [Tooltip("The base material used to render the bounds asset when placement is allowed.")]
    public Material PlaceableBoundsMaterial = null;

    [Tooltip("The base material used to render the bounds asset when placement is not allowed.")]
    public Material NotPlaceableBoundsMaterial = null;

    [Tooltip("The material used to render the placement shadow when placement it allowed.")]
    public Material PlaceableShadowMaterial = null;

    [Tooltip("The material used to render the placement shadow when placement it not allowed.")]
    public Material NotPlaceableShadowMaterial = null;

    [Tooltip("The type of surface on which the object can be placed.")]
    public PlacementSurfaces PlacementSurface = PlacementSurfaces.Horizontal;

    [Tooltip("The child object(s) to hide during placement.")]
    public List<GameObject> ChildrenToHide = new List<GameObject>();

    /// <summary>
    /// Indicates if the object is in the process of being placed.
    /// </summary>
    public bool IsPlacing { get; private set; }

    // The most recent distance to the surface.  This is used to
    // locate the object when the user's gaze does not intersect
    // with the Spatial Mapping mesh.
    private float lastDistance = 2.0f;

    // The distance away from the target surface that the object should hover prior while being placed.
    private float hoverDistance = 0.15f;

    // Threshold (the closer to 0, the stricter the standard) used to determine if a surface is flat.
    private float distanceThreshold = 0.02f;

    // Threshold (the closer to 1, the stricter the standard) used to determine if a surface is vertical.
    private float upNormalThreshold = 0.9f;

    // Maximum distance, from the object, that placement is allowed.
    // This is used when raycasting to see if the object is near a placeable surface.
    private float maximumPlacementDistance = 5.0f;

    // Speed (1.0 being fastest) at which the object settles to the surface upon placement.
    private float placementVelocity = 0.06f;

    // Indicates whether or not this script manages the object's box collider.
    private bool managingBoxCollider = false;

    // The box collider used to determine of the object will fit in the desired location.
    // It is also used to size the bounding cube.
    private BoxCollider boxCollider = null;

    // Visible asset used to show the dimensions of the object. This asset is sized
    // using the box collider's bounds.
    private GameObject boundsAsset = null;

    // Visible asset used to show the where the object is attempting to be placed.
    // This asset is sized using the box collider's bounds.
    private GameObject shadowAsset = null;

    // The location at which the object will be placed.
    private Vector3 targetPosition;

    /// <summary>
    /// Called when the GameObject is created.
    /// </summary>
    private void Awake()
    {
        targetPosition = gameObject.transform.position;

        // Get the object's collider.
        boxCollider = gameObject.GetComponent<BoxCollider>();
        if (boxCollider == null)
        {
            // The object does not have a collider, create one and remember that
            // we are managing it.
            managingBoxCollider = true;
            boxCollider = gameObject.AddComponent<BoxCollider>();
            boxCollider.enabled = false;
        }

        // Create the object that will be used to indicate the bounds of the GameObject.
        boundsAsset = GameObject.CreatePrimitive(PrimitiveType.Cube);
        boundsAsset.transform.parent = gameObject.transform;
        boundsAsset.SetActive(false);

        // Create a object that will be used as a shadow.
        shadowAsset = GameObject.CreatePrimitive(PrimitiveType.Quad);
        shadowAsset.transform.parent = gameObject.transform;
        shadowAsset.SetActive(false);
    }

    /// <summary>
    /// Called when our object is selected.  Generally called by
    /// a gesture management component.
    /// </summary>
    public void OnSelect()
    {
        /* TODO: 4.a CODE ALONG 4.a */

        if (!IsPlacing)
        {
            OnPlacementStart();
        }
        else
        {
            OnPlacementStop();
        }
    }

    /// <summary>
    /// Called once per frame.
    /// </summary>
    private void Update()
    {
        /* TODO: 4.a CODE ALONG 4.a */

        if (IsPlacing)
        {
            // Move the object.
            Move();

            // Set the visual elements.
            Vector3 targetPosition;
            Vector3 surfaceNormal;
            bool canBePlaced = ValidatePlacement(out targetPosition, out surfaceNormal);
            DisplayBounds(canBePlaced);
            DisplayShadow(targetPosition, surfaceNormal, canBePlaced);
        }
        else
        {
            // Disable the visual elements.
            boundsAsset.SetActive(false);
            shadowAsset.SetActive(false);

            // Gracefully place the object on the target surface.
            float dist = (gameObject.transform.position - targetPosition).magnitude;
            if (dist > 0)
            {
                gameObject.transform.position = Vector3.Lerp(gameObject.transform.position, targetPosition, placementVelocity / dist);
            }
            else
            {
                // Unhide the child object(s) to make placement easier.
                for (int i = 0; i < ChildrenToHide.Count; i++)
                {
                    ChildrenToHide[i].SetActive(true);
                }
            }
        }
    }

    /// <summary>
    /// Verify whether or not the object can be placed.
    /// </summary>
    /// <param name="position">
    /// The target position on the surface.
    /// </param>
    /// <param name="surfaceNormal">
    /// The normal of the surface on which the object is to be placed.
    /// </param>
    /// <returns>
    /// True if the target position is valid for placing the object, otherwise false.
    /// </returns>
    private bool ValidatePlacement(out Vector3 position, out Vector3 surfaceNormal)
    {
        Vector3 raycastDirection = gameObject.transform.forward;

        if (PlacementSurface == PlacementSurfaces.Horizontal)
        {
            // Placing on horizontal surfaces.
            // Raycast from the bottom face of the box collider.
            raycastDirection = -(Vector3.up);
        }

        // Initialize out parameters.
        position = Vector3.zero;
        surfaceNormal = Vector3.zero;

        Vector3[] facePoints = GetColliderFacePoints();

        // The origin points we receive are in local space and we
        // need to raycast in world space.
        for (int i = 0; i < facePoints.Length; i++)
        {
            facePoints[i] = gameObject.transform.TransformVector(facePoints[i]) + gameObject.transform.position;
        }

        // Cast a ray from the center of the box collider face to the surface.
        RaycastHit centerHit;
        if (!Physics.Raycast(facePoints[0],
                        raycastDirection,
                        out centerHit,
                        maximumPlacementDistance,
                        SpatialMappingManager.Instance.LayerMask))
        {
            // If the ray failed to hit the surface, we are done.
            return false;
        }

        // We have found a surface.  Set position and surfaceNormal.
        position = centerHit.point;
        surfaceNormal = centerHit.normal;

        // Cast a ray from the corners of the box collider face to the surface.
        for (int i = 1; i < facePoints.Length; i++)
        {
            RaycastHit hitInfo;
            if (Physics.Raycast(facePoints[i],
                                raycastDirection,
                                out hitInfo,
                                maximumPlacementDistance,
                                SpatialMappingManager.Instance.LayerMask))
            {
                // To be a valid placement location, each of the corners must have a similar
                // enough distance to the surface as the center point
                if (!IsEquivalentDistance(centerHit.distance, hitInfo.distance))
                {
                    return false;
                }
            }
            else
            {
                // The raycast failed to intersect with the target layer.
                return false;
            }
        }

        return true;
    }

    /// <summary>
    /// Determine the coordinates, in local space, of the box collider face that
    /// will be placed against the target surface.
    /// </summary>
    /// <returns>
    /// Vector3 array with the center point of the face at index 0.
    /// </returns>
    private Vector3[] GetColliderFacePoints()
    {
        // Get the collider extents.  
        // The size values are twice the extents.
        Vector3 extents = boxCollider.size / 2;

        // Calculate the min and max values for each coordinate.
        float minX = boxCollider.center.x - extents.x;
        float maxX = boxCollider.center.x + extents.x;
        float minY = boxCollider.center.y - extents.y;
        float maxY = boxCollider.center.y + extents.y;
        float minZ = boxCollider.center.z - extents.z;
        float maxZ = boxCollider.center.z + extents.z;

        Vector3 center;
        Vector3 corner0;
        Vector3 corner1;
        Vector3 corner2;
        Vector3 corner3;

        if (PlacementSurface == PlacementSurfaces.Horizontal)
        {
            // Placing on horizontal surfaces.
            center = new Vector3(boxCollider.center.x, minY, boxCollider.center.z);
            corner0 = new Vector3(minX, minY, minZ);
            corner1 = new Vector3(minX, minY, maxZ);
            corner2 = new Vector3(maxX, minY, minZ);
            corner3 = new Vector3(maxX, minY, maxZ);
        }
        else
        {
            // Placing on vertical surfaces.
            center = new Vector3(boxCollider.center.x, boxCollider.center.y, maxZ);
            corner0 = new Vector3(minX, minY, maxZ);
            corner1 = new Vector3(minX, maxY, maxZ);
            corner2 = new Vector3(maxX, minY, maxZ);
            corner3 = new Vector3(maxX, maxY, maxZ);
        }

        return new Vector3[] { center, corner0, corner1, corner2, corner3 };
    }

    /// <summary>
    /// Put the object into placement mode.
    /// </summary>
    public void OnPlacementStart()
    {
        // If we are managing the collider, enable it.
        if (managingBoxCollider)
        {
            boxCollider.enabled = true;
        }

        // Hide the child object(s) to make placement easier.
        for (int i = 0; i < ChildrenToHide.Count; i++)
        {
            ChildrenToHide[i].SetActive(false);
        }

        // Tell the gesture manager that it is to assume
        // all input is to be given to this object.
        GestureManager.Instance.OverrideFocusedObject = gameObject;

        // Enter placement mode.
        IsPlacing = true;
    }

    /// <summary>
    /// Take the object out of placement mode.
    /// </summary>
    /// <remarks>
    /// This method will leave the object in placement mode if called while
    /// the object is in an invalid location.  To determine whether or not
    /// the object has been placed, check the value of the IsPlacing property.
    /// </remarks>
    public void OnPlacementStop()
    {
        // ValidatePlacement requires a normal as an out parameter.
        Vector3 position;
        Vector3 surfaceNormal;

        // Check to see if we can exit placement mode.
        if (!ValidatePlacement(out position, out surfaceNormal))
        {
            return;
        }

        // The object is allowed to be placed.
        // We are placing at a small buffer away from the surface.
        targetPosition = position + (0.01f * surfaceNormal);

        OrientObject(true, surfaceNormal);

        // If we are managing the collider, disable it.
        if (managingBoxCollider)
        {
            boxCollider.enabled = false;
        }

        // Tell the gesture manager that it is to resume
        // its normal behavior.
        GestureManager.Instance.OverrideFocusedObject = null;

        // Exit placement mode.
        IsPlacing = false;
    }

    /// <summary>
    /// Positions the object along the surface toward which the user is gazing.
    /// </summary>
    /// <remarks>
    /// If the user's gaze does not intersect with a surface, the object
    /// will remain at the most recently calculated distance.
    /// </remarks>
    private void Move()
    {
        Vector3 moveTo = gameObject.transform.position;
        Vector3 surfaceNormal = Vector3.zero;
        RaycastHit hitInfo;

        bool hit = Physics.Raycast(Camera.main.transform.position,
                                Camera.main.transform.forward,
                                out hitInfo,
                                20f,
                                SpatialMappingManager.Instance.LayerMask);

        if (hit)
        {
            float offsetDistance = hoverDistance;

            // Place the object a small distance away from the surface while keeping
            // the object from going behind the user.
            if (hitInfo.distance <= hoverDistance)
            {
                offsetDistance = 0f;
            }

            moveTo = hitInfo.point + (offsetDistance * hitInfo.normal);

            lastDistance = hitInfo.distance;
            surfaceNormal = hitInfo.normal;
        }
        else
        {
            // The raycast failed to hit a surface.  In this case, keep the object at the distance of the last
            // intersected surface.
            moveTo = Camera.main.transform.position + (Camera.main.transform.forward * lastDistance);
        }

        // Follow the user's gaze.
        float dist = Mathf.Abs((gameObject.transform.position - moveTo).magnitude);
        gameObject.transform.position = Vector3.Lerp(gameObject.transform.position, moveTo, placementVelocity / dist);

        // Orient the object.
        // We are using the return value from Physics.Raycast to instruct
        // the OrientObject function to align to the vertical surface if appropriate.
        OrientObject(hit, surfaceNormal);
    }

    /// <summary>
    /// Orients the object so that it faces the user.
    /// </summary>
    /// <param name="alignToVerticalSurface">
    /// If true and the object is to be placed on a vertical surface,
    /// orient parallel to the target surface.  If false, orient the object
    /// to face the user.
    /// </param>
    /// <param name="surfaceNormal">
    /// The target surface's normal vector.
    /// </param>
    /// <remarks>
    /// The aligntoVerticalSurface parameter is ignored if the object
    /// is to be placed on a horizontalSurface
    /// </remarks>
    private void OrientObject(bool alignToVerticalSurface, Vector3 surfaceNormal)
    {
        Quaternion rotation = Camera.main.transform.localRotation;

        // If the user's gaze does not intersect with the Spatial Mapping mesh,
        // orient the object towards the user.
        if (alignToVerticalSurface && (PlacementSurface == PlacementSurfaces.Vertical))
        {
            // We are placing on a vertical surface.
            // If the normal of the Spatial Mapping mesh indicates that the
            // surface is vertical, orient parallel to the surface.
            if (Mathf.Abs(surfaceNormal.y) <= (1 - upNormalThreshold))
            {
                rotation = Quaternion.LookRotation(-surfaceNormal, Vector3.up);
            }
        }
        else
        {
            rotation.x = 0f;
            rotation.z = 0f;
        }

        gameObject.transform.rotation = rotation;
    }

    /// <summary>
    /// Displays the bounds asset.
    /// </summary>
    /// <param name="canBePlaced">
    /// Specifies if the object is in a valid placement location.
    /// </param>
    private void DisplayBounds(bool canBePlaced)
    {
        // Ensure the bounds asset is sized and positioned correctly.
        boundsAsset.transform.localPosition = boxCollider.center;
        boundsAsset.transform.localScale = boxCollider.size;
        boundsAsset.transform.rotation = gameObject.transform.rotation;

        // Apply the appropriate material.
        if (canBePlaced)
        {
            boundsAsset.GetComponent<Renderer>().sharedMaterial = PlaceableBoundsMaterial;
        }
        else
        {
            boundsAsset.GetComponent<Renderer>().sharedMaterial = NotPlaceableBoundsMaterial;
        }

        // Show the bounds asset.
        boundsAsset.SetActive(true);
    }

    /// <summary>
    /// Displays the placement shadow asset.
    /// </summary>
    /// <param name="position">
    /// The position at which to place the shadow asset.
    /// </param>
    /// <param name="surfaceNormal">
    /// The normal of the surface on which the asset will be placed
    /// </param>
    /// <param name="canBePlaced">
    /// Specifies if the object is in a valid placement location.
    /// </param>
    private void DisplayShadow(Vector3 position,
                            Vector3 surfaceNormal,
                            bool canBePlaced)
    {
        // Rotate and scale the shadow so that it is displayed on the correct surface and matches the object.
        float rotationX = 0.0f;

        if (PlacementSurface == PlacementSurfaces.Horizontal)
        {
            rotationX = 90.0f;
            shadowAsset.transform.localScale = new Vector3(boxCollider.size.x, boxCollider.size.z, 1);
        }
        else
        {
            shadowAsset.transform.localScale = boxCollider.size;
        }

        Quaternion rotation = Quaternion.Euler(rotationX, gameObject.transform.rotation.eulerAngles.y, 0);
        shadowAsset.transform.rotation = rotation;

        // Apply the appropriate material.
        if (canBePlaced)
        {
            shadowAsset.GetComponent<Renderer>().sharedMaterial = PlaceableShadowMaterial;
        }
        else
        {
            shadowAsset.GetComponent<Renderer>().sharedMaterial = NotPlaceableShadowMaterial;
        }

        // Show the shadow asset as appropriate.        
        if (position != Vector3.zero)
        {
            // Position the shadow a small distance from the target surface, along the normal.
            shadowAsset.transform.position = position + (0.01f * surfaceNormal);
            shadowAsset.SetActive(true);
        }
        else
        {
            shadowAsset.SetActive(false);
        }
    }

    /// <summary>
    /// Determines if two distance values should be considered equivalent.
    /// </summary>
    /// <param name="d1">
    /// Distance to compare.
    /// </param>
    /// <param name="d2">
    /// Distance to compare.
    /// </param>
    /// <returns>
    /// True if the distances are within the desired tolerance, otherwise false.
    /// </returns>
    private bool IsEquivalentDistance(float d1, float d2)
    {
        float dist = Mathf.Abs(d1 - d2);
        return (dist <= distanceThreshold);
    }

    /// <summary>
    /// Called when the GameObject is unloaded.
    /// </summary>
    private void OnDestroy()
    {
        // Unload objects we have created.
        Destroy(boundsAsset);
        boundsAsset = null;
        Destroy(shadowAsset);
        shadowAsset = null;
    }
}
```

### ビルドと配置

-   先ほどと同様、プロジェクトをビルドして HoloLens に配置します。
-   空間マッピング データのスキャンと処理が完了するのを待ちます。
-   太陽系が表示されたら、その下にあるプロジェクションボックスに視線を向け、「選ぶ」ジェスチャーを使って動かします。プロジェクションボックスが選択されている間は、プロジェクションボックスの周りに境界キューブが表示されます。
-   頭を動かして室内のさまざまな場所に視線を向けます。プロジェクションボックスが視線に追従します。プロジェクションボックスの下の影が赤になったら、その面にはホログラムを配置できません。プロジェクションボックスの下の影が緑になったら、もう一度「選ぶ」ジェスチャーを使ってホログラムを配置します。
-   壁にあるホログラフィック ポスターの1枚を探して選び、新しい場所に移動します。ポスターが床と天井には配置できないことと、ポスターを動かすと正しく各壁の方に向くことがわかります。

## 第 5 章 - オクルージョン

### 目標

-   ホログラムが空間マッピングのメッシュによって遮られているかどうかを判断する。
-   オクルージョンのさまざまなテクニックを適用して、面白い効果を実現する。

### 手順

まず、空間マッピングのメッシュが現実世界を遮ることなく、他のホログラムを遮るようにします。

-   \[Hierarchy\] パネルで、SpatialProcessing オブジェクトを選びます。
-   \[Inspector\] パネルの \[Play Space Manager (Script)\] コンポーネントに移動します。
-   \[Secondary Material\] プロパティの横にある円をクリックします。
-   \[Occlusion\] マテリアルを見つけて選び、ウィンドウを閉じます。

次に、地球に特別な動作を追加して、地球が (太陽のような)別のホログラムや空間マッピングのメッシュに遮られたときに、青色で強調表示されるようにします。

-   \[Project\] パネルの Holograms フォルダーで SolarSystem オブジェクトを展開します。
-   \[Earth\] をクリックします。
-   \[Inspector\] パネルの Earth のマテリアル (一番下のコンポーネント) に移動します。
-   \[Shader\] のドロップダウンで、\[Custom\] を選び、シェーダーを \[OcclusionRim\] に変更します。これにより、地球が他のオブジェクトに遮られたときは必ず、地球の周りに青い強調表示がレンダリングされます。

最後に、太陽系の惑星の透視効果を有効にします。(Scripts\\SolarSystemフォルダーにある) PlanetOcclusion.cs を編集して、以下を行います。

1.  惑星が SpatialMapping レイヤー (室内のメッシュと他の惑星) に遮られるかどうかを判断します。
2.  惑星が SpatialMapping レイヤーに遮られているときは必ず、惑星のワイヤーフレーム表現を表示します。
3.  惑星が SpatialMapping レイヤーに遮られていない場合は、惑星のワイヤーフレーム表現を非表示にします。

PlanetOcclusion.cs のコーディング作業に従うか、以下の完成版ソリューションを使用します。

PlanetOcclusion.cs
```cs
using UnityEngine;
using Academy.HoloToolkit.Unity;

/// <summary>
/// Determines when the occluded version of the planet should be visible.
/// This script allows us to do selective occlusion, so the occlusionObject
/// will only be rendered when a Spatial Mapping surface is occluding the planet,
/// not when another hologram is responsible for the occlusion.
/// </summary>
public class PlanetOcclusion : MonoBehaviour
{
    [Tooltip("Object to display when the planet is occluded.")]
    public GameObject occlusionObject;

    /// <summary>
    /// Points to raycast to when checking for occlusion.
    /// </summary>
    private Vector3[] checkPoints;

    // Use this for initialization
    void Start()
    {
        occlusionObject.SetActive(false);

        // Set the check points to use when testing for occlusion.
        MeshFilter filter = gameObject.GetComponent<MeshFilter>();
        Vector3 extents = filter.mesh.bounds.extents;
        Vector3 center = filter.mesh.bounds.center;
        Vector3 top = new Vector3(center.x, center.y + extents.y, center.z);
        Vector3 left = new Vector3(center.x - extents.x, center.y, center.z);
        Vector3 right = new Vector3(center.x + extents.x, center.y, center.z);
        Vector3 bottom = new Vector3(center.x, center.y - extents.y, center.z);

        checkPoints = new Vector3[] { center, top, left, right, bottom };
    }

    // Update is called once per frame
    void Update()
    {
        /* TODO: 5.a DEVELOPER CODING EXERCISE 5.a */

        // Check to see if any of the planet's boundary points are occluded.
        for (int i = 0; i < checkPoints.Length; i++)
        {
            // 5.a: Convert the current checkPoint to world coordinates.
            // Call gameObject.transform.TransformPoint(checkPoints[i]).
            // Assign the result to a new Vector3 variable called 'checkPt'.
            Vector3 checkPt = gameObject.transform.TransformPoint(checkPoints[i]);

            // 5.a: Call Vector3.Distance() to calculate the distance
            // between the Main Camera's position and 'checkPt'.
            // Assign the result to a new float variable called 'distance'.
            float distance = Vector3.Distance(Camera.main.transform.position, checkPt);

            // 5.a: Take 'checkPt' and subtract the Main Camera's position from it.
            // Assign the result to a new Vector3 variable called 'direction'.
            Vector3 direction = checkPt - Camera.main.transform.position;

            // Used to indicate if the call to Physics.Raycast() was successful.
            bool raycastHit = false;

            // 5.a: Check if the planet is occluded by a spatial mapping surface.
            // Call Physics.Raycast() with the following arguments:
            // - Pass in the Main Camera's position as the origin.
            // - Pass in 'direction' for the direction.
            // - Pass in 'distance' for the maxDistance.
            // - Pass in SpatialMappingManager.Instance.LayerMask as layerMask.
            // Assign the result to 'raycastHit'.
            raycastHit = Physics.Raycast(Camera.main.transform.position, direction, distance, SpatialMappingManager.Instance.LayerMask);

            if (raycastHit)
            {
                // 5.a: Our raycast hit a surface, so the planet is occluded.
                // Set the occlusionObject to active.
                occlusionObject.SetActive(true);

                // At least one point is occluded, so break from the loop.
                break;
            }
            else
            {
                // 5.a: The Raycast did not hit, so the planet is not occluded.
                // Deactivate the occlusionObject.
                occlusionObject.SetActive(false);
            }
        }
    }
}
```

### ビルドと配置

-   いつものように、アプリをビルドして、HoloLens に配置します。
-   空間マッピング データのスキャンと処理が完了(壁に青い線が表示されます) するのを待ちます。
-   太陽系のプロジェクションボックスを見つけて選び、このボックスを壁の横かカウンターの後ろに設置します。
-   面の後ろに隠すことで、基本的なオクルージョンを表示して、ポスターやプロジェクションボックスを視界に入れることができます。
-   地球を探し、他のホログラムや面の後ろに隠れると必ず青い強調表示効果が表示されることを確認します。
-   惑星が壁や室内の他の面の後ろに移動するのを観察します。これで、透視が利用できるようになり、ワイヤーフレームのスケルトンを確認できます。

## 終わりに

お疲れ様でした。これでチュートリアル「ホログラム 230 – 空間マッピング」は終わりです。

-   環境をスキャンして空間マッピング データを Unity に読み込む方法を学びました。
-   シェーダーの基礎と、仮想世界を再度視覚化するためにマテリアルを使用する方法を学びました。
-   平面を見つけてメッシュから三角形を取り除く、新しい処理テクニックを学びました。
-   ホログラムを移動して、面の適切な位置に配置できるようになりました。
-   オクルージョンのさまざまなテクニックを体験し、透視効果を活用しました。
