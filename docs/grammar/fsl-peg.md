
# fsl-peg.pegjs

## 


### Document

![Document](.\fsl-peg/Document.svg)

References: [_WS](#_WS), [_Term](#_Term)

### _Term

![_Term](.\fsl-peg/_Term.svg)

Used by: [Document](#Document)
References: [Expr](#Expr), [StateDeclaration](#StateDeclaration), [NamedList](#NamedList), [MachineAttribute](#MachineAttribute), [MachineConfig](#MachineConfig)

### LabelOrListMachineAttributes

![LabelOrListMachineAttributes](.\fsl-peg/LabelOrListMachineAttributes.svg)

Used by: [MachineAttribute_LabelOrList](#MachineAttribute_LabelOrList)

### MachineAttribute_LabelOrList

![MachineAttribute_LabelOrList](.\fsl-peg/MachineAttribute_LabelOrList.svg)

Used by: [MachineAttribute](#MachineAttribute)
References: [LabelOrListMachineAttributes](#LabelOrListMachineAttributes), [_WS](#_WS), [_LabelOrLabelList](#_LabelOrLabelList)

### LabelMachineAttributes

![LabelMachineAttributes](.\fsl-peg/LabelMachineAttributes.svg)

Used by: [MachineAttribute_Label](#MachineAttribute_Label)

### MachineAttribute_Label

![MachineAttribute_Label](.\fsl-peg/MachineAttribute_Label.svg)

Used by: [MachineAttribute](#MachineAttribute)
References: [LabelMachineAttributes](#LabelMachineAttributes), [_WS](#_WS), [_Label](#_Label)

### SemverMachineAttributes

![SemverMachineAttributes](.\fsl-peg/SemverMachineAttributes.svg)

Used by: [MachineAttribute_Semver](#MachineAttribute_Semver)

### MachineAttribute_Semver

![MachineAttribute_Semver](.\fsl-peg/MachineAttribute_Semver.svg)

Used by: [MachineAttribute](#MachineAttribute)
References: [SemverMachineAttributes](#SemverMachineAttributes), [_WS](#_WS), [SemVer](#SemVer)

### MachineDefinition

![MachineDefinition](.\fsl-peg/MachineDefinition.svg)

Used by: [MachineAttribute](#MachineAttribute)
References: [_WS](#_WS), [URL](#URL)

### MachineLicense

![MachineLicense](.\fsl-peg/MachineLicense.svg)

Used by: [MachineAttribute](#MachineAttribute)
References: [_WS](#_WS), [LicenseNotation](#LicenseNotation)

### MachineAttribute

![MachineAttribute](.\fsl-peg/MachineAttribute.svg)

Used by: [_Term](#_Term)
References: [MachineDefinition](#MachineDefinition), [MachineLicense](#MachineLicense), [MachineAttribute_LabelOrList](#MachineAttribute_LabelOrList), [MachineAttribute_Label](#MachineAttribute_Label), [MachineAttribute_Semver](#MachineAttribute_Semver)

### Subexpr

![Subexpr](.\fsl-peg/Subexpr.svg)

Used by: [Subexpr](#Subexpr), [Expr](#Expr)
References: [_WS](#_WS), [_ActionLabel](#_ActionLabel), [ArrowProbability](#ArrowProbability), [ArrowDesc](#ArrowDesc), [Arrow](#Arrow), [ArrowTarget](#ArrowTarget), [Subexpr](#Subexpr)

### Expr

![Expr](.\fsl-peg/Expr.svg)

Used by: [_Term](#_Term)
References: [ArrowTarget](#ArrowTarget), [Subexpr](#Subexpr), [_WS](#_WS)

### _LineTerminator

![_LineTerminator](.\fsl-peg/_LineTerminator.svg)

Used by: [_LineCommentTail](#_LineCommentTail)

### _BlockCommentTail

![_BlockCommentTail](.\fsl-peg/_BlockCommentTail.svg)

Used by: [_BlockCommentTail](#_BlockCommentTail), [_BlockComment](#_BlockComment)
References: [_BlockCommentTail](#_BlockCommentTail)

### _BlockComment

![_BlockComment](.\fsl-peg/_BlockComment.svg)

Used by: [_WS](#_WS)
References: [_BlockCommentTail](#_BlockCommentTail)

### _EOF

![_EOF](.\fsl-peg/_EOF.svg)

Used by: [_LineCommentTail](#_LineCommentTail)

### _LineCommentTail

![_LineCommentTail](.\fsl-peg/_LineCommentTail.svg)

Used by: [_LineCommentTail](#_LineCommentTail), [_LineComment](#_LineComment)
References: [_LineTerminator](#_LineTerminator), [_EOF](#_EOF), [_LineCommentTail](#_LineCommentTail)

### _LineComment

![_LineComment](.\fsl-peg/_LineComment.svg)

Used by: [_WS](#_WS)
References: [_LineCommentTail](#_LineCommentTail)

### _WS

![_WS](.\fsl-peg/_WS.svg)

Used by: [Document](#Document), [MachineAttribute_LabelOrList](#MachineAttribute_LabelOrList), [MachineAttribute_Label](#MachineAttribute_Label), [MachineAttribute_Semver](#MachineAttribute_Semver), [MachineDefinition](#MachineDefinition), [MachineLicense](#MachineLicense), [Subexpr](#Subexpr), [Expr](#Expr), [_WS](#_WS), [GraphLayout](#GraphLayout), [_LabelList](#_LabelList), [NonNegNumber](#NonNegNumber), [Rgb3](#Rgb3), [Rgb6](#Rgb6), [Rgba4](#Rgba4), [Rgba8](#Rgba8), [ArrowItem](#ArrowItem), [SingleEdgeColor](#SingleEdgeColor), [ArrowDesc](#ArrowDesc), [MachineConfigTransition](#MachineConfigTransition), [MachineConfigStartState](#MachineConfigStartState), [MachineConfigEndState](#MachineConfigEndState), [MachineConfigState](#MachineConfigState), [ConfigTransitionItem_Head](#ConfigTransitionItem_Head), [ConfigTransitionItem_Color](#ConfigTransitionItem_Color), [ConfigStateItemThings_Shape](#ConfigStateItemThings_Shape), [ConfigStateItems](#ConfigStateItems), [ConfigStateItemList](#ConfigStateItemList), [StateDeclaration](#StateDeclaration), [NamedList](#NamedList)
References: [_BlockComment](#_BlockComment), [_WS](#_WS), [_LineComment](#_LineComment)

### _UrlProtocol

![_UrlProtocol](.\fsl-peg/_UrlProtocol.svg)

Used by: [URL](#URL)

### URL

![URL](.\fsl-peg/URL.svg)

Used by: [MachineDefinition](#MachineDefinition)
References: [_UrlProtocol](#_UrlProtocol)

### GvizLayoutType

![GvizLayoutType](.\fsl-peg/GvizLayoutType.svg)

Used by: [GraphLayout](#GraphLayout)

### GraphLayout

![GraphLayout](.\fsl-peg/GraphLayout.svg)

References: [_WS](#_WS), [GvizLayoutType](#GvizLayoutType)

### _Char

![_Char](.\fsl-peg/_Char.svg)

Used by: [_String](#_String)
References: [_Unescaped](#_Unescaped), [_Escape](#_Escape), [_HexDigit](#_HexDigit)

### _Escape

![_Escape](.\fsl-peg/_Escape.svg)

Used by: [_Char](#_Char), [_ActionLabelChar](#_ActionLabelChar)

### _QuoteMark

![_QuoteMark](.\fsl-peg/_QuoteMark.svg)

Used by: [_String](#_String)

### _Unescaped

![_Unescaped](.\fsl-peg/_Unescaped.svg)

Used by: [_Char](#_Char)

### _ActionLabelChar

![_ActionLabelChar](.\fsl-peg/_ActionLabelChar.svg)

Used by: [_ActionLabel](#_ActionLabel)
References: [_ActionLabelUnescaped](#_ActionLabelUnescaped), [_Escape](#_Escape), [_HexDigit](#_HexDigit)

### _ActionLabelQuoteMark

![_ActionLabelQuoteMark](.\fsl-peg/_ActionLabelQuoteMark.svg)

Used by: [_ActionLabel](#_ActionLabel)

### _ActionLabelUnescaped

![_ActionLabelUnescaped](.\fsl-peg/_ActionLabelUnescaped.svg)

Used by: [_ActionLabelChar](#_ActionLabelChar)

### _ActionLabel

![_ActionLabel](.\fsl-peg/_ActionLabel.svg)

Used by: [Subexpr](#Subexpr)
References: [_ActionLabelQuoteMark](#_ActionLabelQuoteMark), [_ActionLabelChar](#_ActionLabelChar)

### _String

![_String](.\fsl-peg/_String.svg)

Used by: [_Label](#_Label)
References: [_QuoteMark](#_QuoteMark), [_Char](#_Char)

### _AtomFirstLetter

![_AtomFirstLetter](.\fsl-peg/_AtomFirstLetter.svg)

Used by: [_Atom](#_Atom)

### _AtomLetter

![_AtomLetter](.\fsl-peg/_AtomLetter.svg)

Used by: [_Atom](#_Atom)

### _Atom

![_Atom](.\fsl-peg/_Atom.svg)

Used by: [_Label](#_Label)
References: [_AtomFirstLetter](#_AtomFirstLetter), [_AtomLetter](#_AtomLetter)

### _Label

![_Label](.\fsl-peg/_Label.svg)

Used by: [MachineAttribute_Label](#MachineAttribute_Label), [_LabelList](#_LabelList), [_LabelOrLabelList](#_LabelOrLabelList), [LicenseNotation](#LicenseNotation), [ArrowItem](#ArrowItem), [ArrowTarget](#ArrowTarget), [ConfigStateItems](#ConfigStateItems), [StateDeclaration](#StateDeclaration), [NamedList](#NamedList)
References: [_Atom](#_Atom), [_String](#_String)

### _LabelList

![_LabelList](.\fsl-peg/_LabelList.svg)

Used by: [_LabelOrLabelList](#_LabelOrLabelList), [ArrowTarget](#ArrowTarget)
References: [_WS](#_WS), [_Label](#_Label)

### _LabelOrLabelList

![_LabelOrLabelList](.\fsl-peg/_LabelOrLabelList.svg)

Used by: [MachineAttribute_LabelOrList](#MachineAttribute_LabelOrList), [NamedList](#NamedList)
References: [_LabelList](#_LabelList), [_Label](#_Label)

### LicenseNotation

![LicenseNotation](.\fsl-peg/LicenseNotation.svg)

Used by: [MachineLicense](#MachineLicense)
References: [_Label](#_Label)

### _HexDigit

![_HexDigit](.\fsl-peg/_HexDigit.svg)

Used by: [_Char](#_Char), [_ActionLabelChar](#_ActionLabelChar), [Rgb3](#Rgb3), [Rgb6](#Rgb6), [Rgba4](#Rgba4), [Rgba8](#Rgba8)

### _DecimalDigit

![_DecimalDigit](.\fsl-peg/_DecimalDigit.svg)

Used by: [NonNegIntegerLiteral](#NonNegIntegerLiteral), [NonNegNumber](#NonNegNumber)

### _NonZeroDigit

![_NonZeroDigit](.\fsl-peg/_NonZeroDigit.svg)

Used by: [NonNegIntegerLiteral](#NonNegIntegerLiteral)

### NonNegIntegerLiteral

![NonNegIntegerLiteral](.\fsl-peg/NonNegIntegerLiteral.svg)

Used by: [NonNegNumber](#NonNegNumber), [SemVer](#SemVer), [Stripe](#Stripe), [Cycle](#Cycle)
References: [_NonZeroDigit](#_NonZeroDigit), [_DecimalDigit](#_DecimalDigit)

### NonNegNumber

![NonNegNumber](.\fsl-peg/NonNegNumber.svg)

Used by: [ArrowProbability](#ArrowProbability)
References: [NonNegIntegerLiteral](#NonNegIntegerLiteral), [_DecimalDigit](#_DecimalDigit), [_WS](#_WS)

### SemVer

![SemVer](.\fsl-peg/SemVer.svg)

Used by: [MachineAttribute_Semver](#MachineAttribute_Semver), [_SemVerRule](#_SemVerRule)
References: [NonNegIntegerLiteral](#NonNegIntegerLiteral)

### _SemVerOper

![_SemVerOper](.\fsl-peg/_SemVerOper.svg)

Used by: [_SemVerRule](#_SemVerRule)

### _SemVerRule

![_SemVerRule](.\fsl-peg/_SemVerRule.svg)

Used by: [_SemVerRange](#_SemVerRange)
References: [_SemVerOper](#_SemVerOper), [SemVer](#SemVer)

### _SemVerRange

![_SemVerRange](.\fsl-peg/_SemVerRange.svg)

References: [_SemVerRule](#_SemVerRule)

### NamedColor

![NamedColor](.\fsl-peg/NamedColor.svg)

Used by: [Color](#Color)

### Rgb3

![Rgb3](.\fsl-peg/Rgb3.svg)

Used by: [Color](#Color)
References: [_HexDigit](#_HexDigit), [_WS](#_WS)

### Rgb6

![Rgb6](.\fsl-peg/Rgb6.svg)

Used by: [Color](#Color)
References: [_HexDigit](#_HexDigit), [_WS](#_WS)

### Rgba4

![Rgba4](.\fsl-peg/Rgba4.svg)

Used by: [Color](#Color)
References: [_HexDigit](#_HexDigit), [_WS](#_WS)

### Rgba8

![Rgba8](.\fsl-peg/Rgba8.svg)

Used by: [Color](#Color)
References: [_HexDigit](#_HexDigit), [_WS](#_WS)

### Color

![Color](.\fsl-peg/Color.svg)

Used by: [SingleEdgeColor](#SingleEdgeColor), [ConfigTransitionItem_Color](#ConfigTransitionItem_Color)
References: [NamedColor](#NamedColor), [Rgba8](#Rgba8), [Rgb6](#Rgb6), [Rgba4](#Rgba4), [Rgb3](#Rgb3)

### Arrow

![Arrow](.\fsl-peg/Arrow.svg)

Used by: [Subexpr](#Subexpr)
References: [MixedArrow](#MixedArrow), [LightArrow](#LightArrow), [FatArrow](#FatArrow), [TildeArrow](#TildeArrow)

### ForwardLightArrow

![ForwardLightArrow](.\fsl-peg/ForwardLightArrow.svg)

Used by: [LightArrow](#LightArrow)

### TwoWayLightArrow

![TwoWayLightArrow](.\fsl-peg/TwoWayLightArrow.svg)

Used by: [LightArrow](#LightArrow)

### BackLightArrow

![BackLightArrow](.\fsl-peg/BackLightArrow.svg)

Used by: [LightArrow](#LightArrow)

### ForwardFatArrow

![ForwardFatArrow](.\fsl-peg/ForwardFatArrow.svg)

Used by: [FatArrow](#FatArrow)

### TwoWayFatArrow

![TwoWayFatArrow](.\fsl-peg/TwoWayFatArrow.svg)

Used by: [FatArrow](#FatArrow)

### BackFatArrow

![BackFatArrow](.\fsl-peg/BackFatArrow.svg)

Used by: [FatArrow](#FatArrow)

### ForwardTildeArrow

![ForwardTildeArrow](.\fsl-peg/ForwardTildeArrow.svg)

Used by: [TildeArrow](#TildeArrow)

### TwoWayTildeArrow

![TwoWayTildeArrow](.\fsl-peg/TwoWayTildeArrow.svg)

Used by: [TildeArrow](#TildeArrow)

### BackTildeArrow

![BackTildeArrow](.\fsl-peg/BackTildeArrow.svg)

Used by: [TildeArrow](#TildeArrow)

### LightFatArrow

![LightFatArrow](.\fsl-peg/LightFatArrow.svg)

Used by: [MixedArrow](#MixedArrow)

### LightTildeArrow

![LightTildeArrow](.\fsl-peg/LightTildeArrow.svg)

Used by: [MixedArrow](#MixedArrow)

### FatLightArrow

![FatLightArrow](.\fsl-peg/FatLightArrow.svg)

Used by: [MixedArrow](#MixedArrow)

### FatTildeArrow

![FatTildeArrow](.\fsl-peg/FatTildeArrow.svg)

Used by: [MixedArrow](#MixedArrow)

### TildeLightArrow

![TildeLightArrow](.\fsl-peg/TildeLightArrow.svg)

Used by: [MixedArrow](#MixedArrow)

### TildeFatArrow

![TildeFatArrow](.\fsl-peg/TildeFatArrow.svg)

Used by: [MixedArrow](#MixedArrow)

### LightArrow

![LightArrow](.\fsl-peg/LightArrow.svg)

Used by: [Arrow](#Arrow)
References: [ForwardLightArrow](#ForwardLightArrow), [TwoWayLightArrow](#TwoWayLightArrow), [BackLightArrow](#BackLightArrow)

### FatArrow

![FatArrow](.\fsl-peg/FatArrow.svg)

Used by: [Arrow](#Arrow)
References: [ForwardFatArrow](#ForwardFatArrow), [TwoWayFatArrow](#TwoWayFatArrow), [BackFatArrow](#BackFatArrow)

### TildeArrow

![TildeArrow](.\fsl-peg/TildeArrow.svg)

Used by: [Arrow](#Arrow)
References: [ForwardTildeArrow](#ForwardTildeArrow), [TwoWayTildeArrow](#TwoWayTildeArrow), [BackTildeArrow](#BackTildeArrow)

### MixedArrow

![MixedArrow](.\fsl-peg/MixedArrow.svg)

Used by: [Arrow](#Arrow)
References: [LightFatArrow](#LightFatArrow), [LightTildeArrow](#LightTildeArrow), [FatLightArrow](#FatLightArrow), [FatTildeArrow](#FatTildeArrow), [TildeLightArrow](#TildeLightArrow), [TildeFatArrow](#TildeFatArrow)

### ArrowItemKey

![ArrowItemKey](.\fsl-peg/ArrowItemKey.svg)

Used by: [ArrowItem](#ArrowItem)

### ArrowItem

![ArrowItem](.\fsl-peg/ArrowItem.svg)

Used by: [ArrowItems](#ArrowItems)
References: [ArrowItemKey](#ArrowItemKey), [_WS](#_WS), [_Label](#_Label)

### SingleEdgeColor

![SingleEdgeColor](.\fsl-peg/SingleEdgeColor.svg)

Used by: [ArrowItems](#ArrowItems)
References: [_WS](#_WS), [Color](#Color)

### ArrowItems

![ArrowItems](.\fsl-peg/ArrowItems.svg)

Used by: [ArrowDesc](#ArrowDesc)
References: [SingleEdgeColor](#SingleEdgeColor), [ArrowItem](#ArrowItem)

### ArrowDesc

![ArrowDesc](.\fsl-peg/ArrowDesc.svg)

Used by: [Subexpr](#Subexpr)
References: [_WS](#_WS), [ArrowItems](#ArrowItems)

### ArrowProbability

![ArrowProbability](.\fsl-peg/ArrowProbability.svg)

Used by: [Subexpr](#Subexpr)
References: [NonNegNumber](#NonNegNumber)

### ArrowTarget

![ArrowTarget](.\fsl-peg/ArrowTarget.svg)

Used by: [Subexpr](#Subexpr), [Expr](#Expr)
References: [Stripe](#Stripe), [Cycle](#Cycle), [_LabelList](#_LabelList), [_Label](#_Label)

### _ShapeList

![_ShapeList](.\fsl-peg/_ShapeList.svg)

Used by: [Shape](#Shape)

### Shape

![Shape](.\fsl-peg/Shape.svg)

References: [_ShapeList](#_ShapeList)

### Stripe

![Stripe](.\fsl-peg/Stripe.svg)

Used by: [ArrowTarget](#ArrowTarget)
References: [NonNegIntegerLiteral](#NonNegIntegerLiteral)

### Cycle

![Cycle](.\fsl-peg/Cycle.svg)

Used by: [ArrowTarget](#ArrowTarget)
References: [NonNegIntegerLiteral](#NonNegIntegerLiteral)

### MachineConfigTransition

![MachineConfigTransition](.\fsl-peg/MachineConfigTransition.svg)

Used by: [MachineConfig](#MachineConfig)
References: [_WS](#_WS), [ConfigTransitionItems](#ConfigTransitionItems)

### MachineConfigStartState

![MachineConfigStartState](.\fsl-peg/MachineConfigStartState.svg)

Used by: [MachineConfig](#MachineConfig)
References: [_WS](#_WS), [ConfigStateItems](#ConfigStateItems)

### MachineConfigEndState

![MachineConfigEndState](.\fsl-peg/MachineConfigEndState.svg)

Used by: [MachineConfig](#MachineConfig)
References: [_WS](#_WS), [ConfigStateItems](#ConfigStateItems)

### MachineConfigState

![MachineConfigState](.\fsl-peg/MachineConfigState.svg)

Used by: [MachineConfig](#MachineConfig)
References: [_WS](#_WS), [ConfigStateItems](#ConfigStateItems)

### MachineConfig

![MachineConfig](.\fsl-peg/MachineConfig.svg)

Used by: [_Term](#_Term)
References: [MachineConfigTransition](#MachineConfigTransition), [MachineConfigStartState](#MachineConfigStartState), [MachineConfigEndState](#MachineConfigEndState), [MachineConfigState](#MachineConfigState)

### _TransitionKey_HeadType

![_TransitionKey_HeadType](.\fsl-peg/_TransitionKey_HeadType.svg)

Used by: [ConfigTransitionItem_Head](#ConfigTransitionItem_Head)

### ConfigTransitionItem_Head

![ConfigTransitionItem_Head](.\fsl-peg/ConfigTransitionItem_Head.svg)

Used by: [ConfigTransitionItems](#ConfigTransitionItems)
References: [_TransitionKey_HeadType](#_TransitionKey_HeadType), [_WS](#_WS), [ArrowHead](#ArrowHead)

### _TransitionKey_Color

![_TransitionKey_Color](.\fsl-peg/_TransitionKey_Color.svg)

Used by: [ConfigTransitionItem_Color](#ConfigTransitionItem_Color)

### ConfigTransitionItem_Color

![ConfigTransitionItem_Color](.\fsl-peg/ConfigTransitionItem_Color.svg)

Used by: [ConfigTransitionItems](#ConfigTransitionItems)
References: [_TransitionKey_Color](#_TransitionKey_Color), [_WS](#_WS), [Color](#Color)

### ConfigTransitionItems

![ConfigTransitionItems](.\fsl-peg/ConfigTransitionItems.svg)

Used by: [MachineConfigTransition](#MachineConfigTransition)
References: [ConfigTransitionItem_Color](#ConfigTransitionItem_Color), [ConfigTransitionItem_Head](#ConfigTransitionItem_Head)

### _StateItemThingKey_Shape

![_StateItemThingKey_Shape](.\fsl-peg/_StateItemThingKey_Shape.svg)

Used by: [ConfigStateItemThings_Shape](#ConfigStateItemThings_Shape)

### ConfigStateItemThings_Shape

![ConfigStateItemThings_Shape](.\fsl-peg/ConfigStateItemThings_Shape.svg)

Used by: [ConfigStateItemThings](#ConfigStateItemThings)
References: [_StateItemThingKey_Shape](#_StateItemThingKey_Shape), [_WS](#_WS)

### _StateItemThingKey_Color

![_StateItemThingKey_Color](.\fsl-peg/_StateItemThingKey_Color.svg)

Used by: [ConfigStateItemThings_Color](#ConfigStateItemThings_Color)

### ConfigStateItemThings_Color

![ConfigStateItemThings_Color](.\fsl-peg/ConfigStateItemThings_Color.svg)

Used by: [ConfigStateItemThings](#ConfigStateItemThings)
References: [_StateItemThingKey_Color](#_StateItemThingKey_Color)

### ConfigStateItemThings

![ConfigStateItemThings](.\fsl-peg/ConfigStateItemThings.svg)

Used by: [ConfigStateItems](#ConfigStateItems)
References: [ConfigStateItemThings_Shape](#ConfigStateItemThings_Shape), [ConfigStateItemThings_Color](#ConfigStateItemThings_Color)

### ConfigStateItems

![ConfigStateItems](.\fsl-peg/ConfigStateItems.svg)

Used by: [MachineConfigStartState](#MachineConfigStartState), [MachineConfigEndState](#MachineConfigEndState), [MachineConfigState](#MachineConfigState), [ConfigStateItemList](#ConfigStateItemList)
References: [ConfigStateItemThings](#ConfigStateItemThings), [_WS](#_WS), [_Label](#_Label)

### ConfigStateItemList

![ConfigStateItemList](.\fsl-peg/ConfigStateItemList.svg)

Used by: [StateDeclaration](#StateDeclaration)
References: [_WS](#_WS), [ConfigStateItems](#ConfigStateItems)

### _ArrowHeadList

![_ArrowHeadList](.\fsl-peg/_ArrowHeadList.svg)

Used by: [ArrowHead](#ArrowHead), [ReverseArrowHead](#ReverseArrowHead)

### ArrowHead

![ArrowHead](.\fsl-peg/ArrowHead.svg)

Used by: [ConfigTransitionItem_Head](#ConfigTransitionItem_Head)
References: [_ArrowHeadList](#_ArrowHeadList)

### ReverseArrowHead

![ReverseArrowHead](.\fsl-peg/ReverseArrowHead.svg)

References: [_ArrowHeadList](#_ArrowHeadList)

### StateDeclaration

![StateDeclaration](.\fsl-peg/StateDeclaration.svg)

Used by: [_Term](#_Term)
References: [_Label](#_Label), [_WS](#_WS), [ConfigStateItemList](#ConfigStateItemList)

### NamedList

![NamedList](.\fsl-peg/NamedList.svg)

Used by: [_Term](#_Term)
References: [_WS](#_WS), [_Label](#_Label), [_LabelOrLabelList](#_LabelOrLabelList)

