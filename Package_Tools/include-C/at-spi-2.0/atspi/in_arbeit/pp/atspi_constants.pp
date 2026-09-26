
unit atspi_constants;
interface

{
  Automatically converted by H2Pas 1.0.0 from atspi_constants.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    atspi_constants.h
}

{ Pointers to basic pascal types, inserted by h2pas conversion program.}
Type
  PLongint  = ^Longint;
  PSmallInt = ^SmallInt;
  PByte     = ^Byte;
  PWord     = ^Word;
  PDWord    = ^DWord;
  PDouble   = ^Double;

Type
PAtspiCache  = ^AtspiCache;
PAtspiCollectionMatchType  = ^AtspiCollectionMatchType;
PAtspiCollectionSortOrder  = ^AtspiCollectionSortOrder;
PAtspiCollectionTreeTraversalType  = ^AtspiCollectionTreeTraversalType;
PAtspiComponentLayer  = ^AtspiComponentLayer;
PAtspiCoordType  = ^AtspiCoordType;
PAtspiEventType  = ^AtspiEventType;
PAtspiKeyEventType  = ^AtspiKeyEventType;
PAtspiKeySynthType  = ^AtspiKeySynthType;
PAtspiLive  = ^AtspiLive;
PAtspiLocaleType  = ^AtspiLocaleType;
PAtspiModifierType  = ^AtspiModifierType;
PAtspiRelationType  = ^AtspiRelationType;
PAtspiRole  = ^AtspiRole;
PAtspiScrollType  = ^AtspiScrollType;
PAtspiStateType  = ^AtspiStateType;
PAtspiTextBoundaryType  = ^AtspiTextBoundaryType;
PAtspiTextClipType  = ^AtspiTextClipType;
PAtspiTextGranularity  = ^AtspiTextGranularity;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * AT-SPI - Assistive Technology Service Provider Interface
 * (Gnome Accessibility Project; http://developer.gnome.org/projects/gap)
 *
 * Copyright 2010, 2011 Novell, Inc.
 * Copyright (c) 2012 SUSE LINUX Products GmbH, Nuernberg, Germany.
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the
 * Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
 * Boston, MA 02110-1301, USA.
  }
{ TODO: Auto-generate this file again



 !\mainpage AT-SPI Interfaces and Subinterfaces

  This is the main documentation page for the
  Assistive Technology Service Provider Interface (AT-SPI).

  \section apps Applications and Interface Components
  Namespace Accessibility includes service APIs implemented by
  participating applications and their user interface components:\n\n
  Accessibility::Accessible\n
  Accessibility::Application\n
  Accessibility::Desktop\n
  Accessibility::Collecgtion\n
  Accessibility::Component\n
  Accessibility::Hypertext\n
  Accessibility::Image\n
  Accessibility::Selection\n
  Accessibility::Table\n
  Accessibility::Text\n
  Accessibility::EditableText\n
  Accessibility::Value

  \section types Enumerated Types
  Accessibility defines a number of key enumerated types, including:\n\n
  Accessibility::RelationType\n
  Accessibility::Role\n
  Accessibility::StateType\n
  Accessibility::Event\n
  Accessibility::EventDetails \n
  Accessibility::ScrollType \n
  Accessibility::CoordType \n

  \section Registry
  Accessibility also includes Accessibility::Registry,
  which is the service used by assistive technologies and related
  AT-SPI clients to register interest in certain classes of events,
  enumerate the currently available desktop and application list,
  and to synthesize certain kinds of device events.

  \section listeners Event Listener Interfaces
  Accessibility::EventListener\n
  Accessibility::DeviceEventListener

  \section helpers Helper Interfaces

  The following interfaces may be implemented by assistive technologies
  themselves, in order to export their services in a consistent manner or
  in order to interoperate with other applications or desktop services.\n

  Accessibility::LoginHelper : Implemented by adaptive technologies which
  need to participate in user-authentication or login activities, and which
  therefore may need negotiation with authentication agents or processes.\n

  Accessibility::Selector [NEW]: Implemented by user agents or assistive
  technologies which export lists of choices from which the end-user is
  expected to make selections.  Useful for various types of remote
  activation or intercommunication between multiple ATs.

  }
{$ifndef _ATSPI_CONSTANTS_H_}
{$define _ATSPI_CONSTANTS_H_}
{*
 * AtspiConstants:
 *
 * Constant definitions needed by multiple interfaces.
  }
{*
   * AtspiLocaleType:
   * @ATSPI_LOCALE_TYPE_MESSAGES: For localizable natural-language messages.
   * @ATSPI_LOCALE_TYPE_COLLATE: For regular expression matching and string
   * collation.
   * @ATSPI_LOCALE_TYPE_CTYPE: For regular expression matching, character
   * classification, conversion, case-sensitive comparison, and wide character
   * functions.
   * @ATSPI_LOCALE_TYPE_MONETARY: For monetary formatting.
   * @ATSPI_LOCALE_TYPE_NUMERIC: For number formatting (such as the decimal
   * point and the thousands separator).
   * @ATSPI_LOCALE_TYPE_TIME: For time and date formatting.
   *
   * Used by interfaces #AtspiText and #AtspiDocument, this
   * enumeration corresponds to the POSIX 'setlocale' enum values.
   *
   * }
type
  PAtspiLocaleType = ^TAtspiLocaleType;
  TAtspiLocaleType =  Longint;
  Const
    ATSPI_LOCALE_TYPE_MESSAGES = 0;
    ATSPI_LOCALE_TYPE_COLLATE = 1;
    ATSPI_LOCALE_TYPE_CTYPE = 2;
    ATSPI_LOCALE_TYPE_MONETARY = 3;
    ATSPI_LOCALE_TYPE_NUMERIC = 4;
    ATSPI_LOCALE_TYPE_TIME = 5;
;
{*
 * ATSPI_LOCALE_TYPE_COUNT:
 *
 * One higher than the highest valid value of #AtspiLocaleType.
 * }
  ATSPI_LOCALE_TYPE_COUNT = 5+1;  
{*
   * AtspiCoordType:
   * @ATSPI_COORD_TYPE_SCREEN: Specifies xy coordinates relative to the screen.
   * @ATSPI_COORD_TYPE_WINDOW: Specifies xy coordinates relative to the widget's
   * top-level window.
   * @ATSPI_COORD_TYPE_PARENT: Specifies xy coordinates relative to the widget's
   * immediate parent.
   *
   * Enumeration used by #AtspiComponent, #AtspiImage, and #AtspiText interfaces
   * to specify whether coordinates are relative to the window or the screen.
   *
   * }
type
  PAtspiCoordType = ^TAtspiCoordType;
  TAtspiCoordType =  Longint;
  Const
    ATSPI_COORD_TYPE_SCREEN = 0;
    ATSPI_COORD_TYPE_WINDOW = 1;
    ATSPI_COORD_TYPE_PARENT = 2;
;
{*
 * ATSPI_COORD_TYPE_COUNT:
 *
 * One higher than the highest valid value of #AtspiCoordType.
 * }
  ATSPI_COORD_TYPE_COUNT = 2+1;  
{*
   * AtspiCollectionSortOrder:
   * @ATSPI_Collection_SORT_ORDER_INVALID: Invalid sort order
   * @ATSPI_Collection_SORT_ORDER_CANONICAL: Canonical sort order
   * @ATSPI_Collection_SORT_ORDER_FLOW: Flow sort order
   * @ATSPI_Collection_SORT_ORDER_TAB: Tab sort order
   * @ATSPI_Collection_SORT_ORDER_REVERSE_CANONICAL: Reverse canonical sort order
   * @ATSPI_Collection_SORT_ORDER_REVERSE_FLOW: Reverse flow sort order
   * @ATSPI_Collection_SORT_ORDER_REVERSE_TAB: Reverse tab sort order
   * @ATSPI_Collection_SORT_ORDER_LAST_DEFINED: Used only to determine the end of the
   * enumeration.

   *
   * Enumeration used by interface #AtspiCollection to specify
   * the way #AtspiAccesible objects should be sorted.
   *
   * }
type
  PAtspiCollectionSortOrder = ^TAtspiCollectionSortOrder;
  TAtspiCollectionSortOrder =  Longint;
  Const
    ATSPI_Collection_SORT_ORDER_INVALID = 0;
    ATSPI_Collection_SORT_ORDER_CANONICAL = 1;
    ATSPI_Collection_SORT_ORDER_FLOW = 2;
    ATSPI_Collection_SORT_ORDER_TAB = 3;
    ATSPI_Collection_SORT_ORDER_REVERSE_CANONICAL = 4;
    ATSPI_Collection_SORT_ORDER_REVERSE_FLOW = 5;
    ATSPI_Collection_SORT_ORDER_REVERSE_TAB = 6;
    ATSPI_Collection_SORT_ORDER_LAST_DEFINED = 7;
;
{*
 * ATSPI_SORTORDER_COUNT:
 *
 * One higher than the highest valid value of #AtspiCollectionSortOrder.
  }
  ATSPI_SORTORDER_COUNT = 7+1;  
{*
   * AtspiCollectionMatchType:
   * @ATSPI_Collection_MATCH_INVALID: Indicates an error condition or
   * uninitialized value.
   * @ATSPI_Collection_MATCH_ALL: #TRUE if all of the criteria are met.
   * @ATSPI_Collection_MATCH_ANY: #TRUE if any of the criteria are met.
   * @ATSPI_Collection_MATCH_NONE: #TRUE if none of the criteria are met.
   * @ATSPI_Collection_MATCH_EMPTY: Same as @ATSPI_Collection_MATCH_ALL if
   * the criteria is non-empty; for empty criteria this rule requires returned
   * value to also have empty set.
   * @ATSPI_Collection_MATCH_LAST_DEFINED: Used only to determine the end of the
   * enumeration.
   *
   * Enumeration used by #AtspiMatchRule to specify
   * how to interpret #AtspiAccessible objects.
   *
   * }
type
  PAtspiCollectionMatchType = ^TAtspiCollectionMatchType;
  TAtspiCollectionMatchType =  Longint;
  Const
    ATSPI_Collection_MATCH_INVALID = 0;
    ATSPI_Collection_MATCH_ALL = 1;
    ATSPI_Collection_MATCH_ANY = 2;
    ATSPI_Collection_MATCH_NONE = 3;
    ATSPI_Collection_MATCH_EMPTY = 4;
    ATSPI_Collection_MATCH_LAST_DEFINED = 5;
;
{*
 * ATSPI_MATCHTYPE_COUNT:
 *
 * One higher than the highest valid value of #AtspiCollectionMatchType.
 * }
  ATSPI_MATCHTYPES_COUNT = 5+1;  
{*
   * AtspiCollectionTreeTraversalType:
   * @ATSPI_Collection_TREE_RESTRICT_CHILDREN: Restrict children tree traveral
   * @ATSPI_Collection_TREE_RESTRICT_SIBLING: Restrict sibling tree traversal
   * @ATSPI_Collection_TREE_INORDER: In-order tree traversal.
   * @ATSPI_Collection_TREE_LAST_DEFINED: Used only to determine the end of the
   * enumeration.
   *
   * Enumeration used by interface #AtspiCollection to specify
   * restrictions on #AtspiAccesible objects to be traversed.
   *
   * }
type
  PAtspiCollectionTreeTraversalType = ^TAtspiCollectionTreeTraversalType;
  TAtspiCollectionTreeTraversalType =  Longint;
  Const
    ATSPI_Collection_TREE_RESTRICT_CHILDREN = 0;
    ATSPI_Collection_TREE_RESTRICT_SIBLING = 1;
    ATSPI_Collection_TREE_INORDER = 2;
    ATSPI_Collection_TREE_LAST_DEFINED = 3;
;
{*
 * ATSPI_TREETRAVERSALTYPE_COUNT:
 *
 * One higher than the highest valid value of
 * #AtspiCollection_TreeTraversalType.
  }
  ATSPI_TREETRAVERSALTYPE_COUNT = 3+1;  
{*
   * AtspiComponentLayer:
   * @ATSPI_LAYER_INVALID: Indicates an error condition or uninitialized value.
   * @ATSPI_LAYER_BACKGROUND: The bottom-most layer, over which everything else
   * is painted.        The 'desktop background' is generally in this layer.
   * @ATSPI_LAYER_CANVAS: The 'background' layer for most content renderers and
   * UI #AtspiComponent containers.
   * @ATSPI_LAYER_WIDGET: The layer in which the majority of ordinary
   * 'foreground' widgets reside.
   * @ATSPI_LAYER_MDI: A special layer between @ATSPI_LAYER_CANVAS and
   * @ATSPI_LAYER_WIDGET, in which the 'pseudo windows' (e.g. the MDI frames)
   * reside. See #atspi_component_get_mdi_z_order.
   * @ATSPI_LAYER_POPUP: A layer for popup window content, above
   * @ATSPI_LAYER_WIDGET.
   * @ATSPI_LAYER_OVERLAY: The topmost layer.
   * @ATSPI_LAYER_WINDOW: The layer in which a toplevel window background usually
   * resides.
   * @ATSPI_LAYER_LAST_DEFINED: Used only to determine the end of the
   * enumeration.
   *
   * The #AtspiComponentLayer of an #AtspiComponent instance indicates its
   * relative stacking order with respect to the onscreen visual representation
   * of the UI. #AtspiComponentLayer, in combination with #AtspiComponent bounds
   * information, can be used to compute the visibility of all or part of a
   * component.  This is important in programmatic determination of
   * region-of-interest for magnification, and in
   * flat screen review models of the screen, as well as
   * for other uses. Objects residing in two of the #AtspiComponentLayer
   * categories support further z-ordering information, with respect to their
   * peers in the same layer: namely, @ATSPI_LAYER_WINDOW and
   * @ATSPI_LAYER_MDI.  Relative stacking order for other objects within the
   * same layer is not available; the recommended heuristic is
   * first child paints first. In other words, assume that the
   * first siblings in the child list are subject to being overpainted by later
   * siblings if their bounds intersect. The order of layers, from bottom to top,
   *  is: @ATSPI_LAYER_BACKGROUND, @ATSPI_LAYER_WINDOW, @ATSPI_LAYER_MDI,
   * @ATSPI_LAYER_CANVAS, @ATSPI_LAYER_WIDGET, @ATSPI_LAYER_POPUP, and
   * @ATSPI_LAYER_OVERLAY.
   *
    }
type
  PAtspiComponentLayer = ^TAtspiComponentLayer;
  TAtspiComponentLayer =  Longint;
  Const
    ATSPI_LAYER_INVALID = 0;
    ATSPI_LAYER_BACKGROUND = 1;
    ATSPI_LAYER_CANVAS = 2;
    ATSPI_LAYER_WIDGET = 3;
    ATSPI_LAYER_MDI = 4;
    ATSPI_LAYER_POPUP = 5;
    ATSPI_LAYER_OVERLAY = 6;
    ATSPI_LAYER_WINDOW = 7;
    ATSPI_LAYER_LAST_DEFINED = 8;
;
{*
 * ATSPI_COMPONENTLAYER_COUNT:
 *
 * One higher than the highest valid value of #AtspiComponentLayer.
 * }
  ATSPI_COMPONENTLAYER_COUNT = 8+1;  
{*
   * AtspiTextBoundaryType:
   * @ATSPI_TEXT_BOUNDARY_CHAR: An #AtspiText instance is bounded by this
   * character only. Start and end offsets differ by one, by definition,
   * for this value.
   * @ATSPI_TEXT_BOUNDARY_WORD_START: Boundary condition is start of a word; i.e.
   * range is from start of one word to the start of another word.
   * @ATSPI_TEXT_BOUNDARY_WORD_END: Boundary condition is the end of a word; i.e.
   * range is from the end of one word to the end of another. Some locales
   * may not distinguish between words and characters or glyphs. In particular,
   * those locales which use wholly or partially ideographic character sets.
   * In these cases, characters may be returned in lieu of multi-character
   * substrings.
   * @ATSPI_TEXT_BOUNDARY_SENTENCE_START: Boundary condition is start of a
   * sentence, as determined by the application. Some locales or
   * character sets may not include explicit sentence delimiters, so this
   * boundary type can not always be honored. Some locales will return lines
   * of text instead of grammatical sentences.
   * @ATSPI_TEXT_BOUNDARY_SENTENCE_END: Boundary condition is end of a sentence,
   * as determined by the application, including the sentence-delimiting
   * character, for instance '.' Some locales or character sets may not
   * include explicit sentence delimiters, so this boundary type can not
   * always be honored. Some locales will return lines of text instead of
   * grammatical sentences.
   * @ATSPI_TEXT_BOUNDARY_LINE_START: Boundary condition is the start of a line;
   * i.e. range is from start of one line to the start of another.  This
   * generally means that an end-of-line character will appear at the end of
   * the range.
   * @ATSPI_TEXT_BOUNDARY_LINE_END: Boundary condition is the end of a line; i.e.
   * range is from start of one line to the start of another.  This generally
   * means that an end-of-line character will be the first character of the
   * range.
   *
   * Specifies the boundary conditions determining a run of text as returned from
   * #atspi_text_get_text_at_offset, #atspi_text_get_text_after_offset, and
   * #atspi_text_get_text_before_offset.
   *
   * This enumerationis deprecated since 2.9.90 and should not be used. Use
   * AtspiTextGranularity with #atspi_text_get_string_at_offset instead.
   * }
type
  PAtspiTextBoundaryType = ^TAtspiTextBoundaryType;
  TAtspiTextBoundaryType =  Longint;
  Const
    ATSPI_TEXT_BOUNDARY_CHAR = 0;
    ATSPI_TEXT_BOUNDARY_WORD_START = 1;
    ATSPI_TEXT_BOUNDARY_WORD_END = 2;
    ATSPI_TEXT_BOUNDARY_SENTENCE_START = 3;
    ATSPI_TEXT_BOUNDARY_SENTENCE_END = 4;
    ATSPI_TEXT_BOUNDARY_LINE_START = 5;
    ATSPI_TEXT_BOUNDARY_LINE_END = 6;
;
{*
   *AtspiTextGranularity:
   *@ATSPI_TEXT_GRANULARITY_CHAR: Granularity is defined by the boundaries between characters
   * (including non-printing characters)
   *@ATSPI_TEXT_GRANULARITY_WORD: Granularity is defined by the boundaries of a word,
   * starting at the beginning of the current word and finishing at the beginning of
   * the following one, if present.
   *@ATSPI_TEXT_GRANULARITY_SENTENCE: Granularity is defined by the boundaries of a sentence,
   * starting at the beginning of the current sentence and finishing at the beginning of
   * the following one, if present.
   *@ATSPI_TEXT_GRANULARITY_LINE: Granularity is defined by the boundaries of a line,
   * starting at the beginning of the current line and finishing at the beginning of
   * the following one, if present.
   *@ATSPI_TEXT_GRANULARITY_PARAGRAPH: Granularity is defined by the boundaries of a paragraph,
   * starting at the beginning of the current paragraph and finishing at the beginning of
   * the following one, if present.
   *
   * Text granularity types used for specifying the granularity of the region of
   * text we are interested in.
   * }
type
  PAtspiTextGranularity = ^TAtspiTextGranularity;
  TAtspiTextGranularity =  Longint;
  Const
    ATSPI_TEXT_GRANULARITY_CHAR = 0;
    ATSPI_TEXT_GRANULARITY_WORD = 1;
    ATSPI_TEXT_GRANULARITY_SENTENCE = 2;
    ATSPI_TEXT_GRANULARITY_LINE = 3;
    ATSPI_TEXT_GRANULARITY_PARAGRAPH = 4;
;
{*
 * ATSPI_TEXT_BOUNDARY_TYPE_COUNT:
 *
 * One higher than the highest valid value of #AtspiTextBoundaryType.
  }
  ATSPI_TEXT_BOUNDARY_TYPE_COUNT = 6+1;  
{*
   * AtspiTextClipType:
   * @ATSPI_TEXT_CLIP_NONE: No characters/glyphs are omitted.
   * @ATSPI_TEXT_CLIP_MIN: Characters/glyphs clipped by the minimum coordinate
   * are omitted.
   * @ATSPI_TEXT_CLIP_MAX: Characters/glyphs which intersect the maximum
   * coordinate are omitted.
   * @ATSPI_TEXT_CLIP_BOTH: Only glyphs falling entirely within the region
   * bounded by min and max are retained.
   *
   * Enumeration used by interface #AtspiText to indicate
   * how to treat characters intersecting bounding boxes.
   *
   * }
type
  PAtspiTextClipType = ^TAtspiTextClipType;
  TAtspiTextClipType =  Longint;
  Const
    ATSPI_TEXT_CLIP_NONE = 0;
    ATSPI_TEXT_CLIP_MIN = 1;
    ATSPI_TEXT_CLIP_MAX = 2;
    ATSPI_TEXT_CLIP_BOTH = 3;
;
{*
 * ATSPI_TEXT_CLIP_TYPE_COUNT:
 *
 * One higher than the highest valid value of #AtspiTextClipType.
  }
  ATSPI_TEXT_CLIP_TYPE_COUNT = 3+1;  
{*
   * AtspiStateType:
   * @ATSPI_STATE_INVALID: Indicates an invalid state - probably an error
   * condition.
   * @ATSPI_STATE_ACTIVE: Indicates a window is currently the active window, or
   * an object is the active subelement within a container or table.
   * @ATSPI_STATE_ACTIVE should not be used for objects which have
   * #ATSPI_STATE_FOCUSABLE or #ATSPI_STATE_SELECTABLE: Those objects should use
   * @ATSPI_STATE_FOCUSED and @ATSPI_STATE_SELECTED respectively.
   * @ATSPI_STATE_ACTIVE is a means to indicate that an object which is not
   * focusable and not selectable is the currently-active item within its
   * parent container.
   * @ATSPI_STATE_ARMED: Indicates that the object is armed.
   * @ATSPI_STATE_BUSY: Indicates the current object is busy, i.e. onscreen
   * representation is in the process of changing, or       the object is
   * temporarily unavailable for interaction due to activity already in progress.
   * @ATSPI_STATE_CHECKED: Indicates this object is currently checked.
   * @ATSPI_STATE_COLLAPSED: Indicates this object is collapsed.
   * @ATSPI_STATE_DEFUNCT: Indicates that this object no longer has a valid
   * backing widget        (for instance, if its peer object has been destroyed).
   * @ATSPI_STATE_EDITABLE: Indicates the user can change the contents of this
   * object.
   * @ATSPI_STATE_ENABLED: Indicates that this object is enabled, i.e. that it
   * currently reflects some application state. Objects that are "greyed out"
   * may lack this state, and may lack the @ATSPI_STATE_SENSITIVE if direct
   * user interaction cannot cause them to acquire @ATSPI_STATE_ENABLED.
   * See @ATSPI_STATE_SENSITIVE.
   * @ATSPI_STATE_EXPANDABLE: Indicates this object allows progressive
   * disclosure of its children.
   * @ATSPI_STATE_EXPANDED: Indicates this object is expanded.
   * @ATSPI_STATE_FOCUSABLE: Indicates this object can accept keyboard focus,
   * which means all events resulting from typing on the keyboard will
   * normally be passed to it when it has focus.
   * @ATSPI_STATE_FOCUSED: Indicates this object currently has the keyboard
   * focus.
   * @ATSPI_STATE_HAS_TOOLTIP: Indicates that the object has an associated
   * tooltip.
   * @ATSPI_STATE_HORIZONTAL: Indicates the orientation of this object is
   * horizontal.
   * @ATSPI_STATE_ICONIFIED: Indicates this object is minimized and is
   * represented only by an icon.
   * @ATSPI_STATE_MODAL: Indicates something must be done with this object
   * before the user can interact with an object in a different window.
   * @ATSPI_STATE_MULTI_LINE: Indicates this (text) object can contain multiple
   * lines of text.
   * @ATSPI_STATE_MULTISELECTABLE: Indicates this object allows more than one of
   * its children to be selected at the same time, or in the case of text
   * objects, that the object supports non-contiguous text selections.
   * @ATSPI_STATE_OPAQUE: Indicates this object paints every pixel within its
   * rectangular region. It also indicates an alpha value of unity, if it
   * supports alpha blending.
   * @ATSPI_STATE_PRESSED: Indicates this object is currently pressed.
   * @ATSPI_STATE_RESIZABLE: Indicates the size of this object's size is not
   * fixed.
   * @ATSPI_STATE_SELECTABLE: Indicates this object is the child of an object
   * that allows its children to be selected and that this child is one of
   * those children       that can be selected.
   * @ATSPI_STATE_SELECTED: Indicates this object is the child of an object that
   * allows its children to be selected and that this child is one of those
   * children that has been selected.
   * @ATSPI_STATE_SENSITIVE: Indicates this object is sensitive, e.g. to user
   * interaction. @ATSPI_STATE_SENSITIVE usually accompanies.
   * @ATSPI_STATE_ENABLED for user-actionable controls, but may be found in the
   * absence of @ATSPI_STATE_ENABLED if the current visible state of the control
   * is "disconnected" from the application state.  In such cases, direct user
   * interaction can often result in the object gaining @ATSPI_STATE_SENSITIVE,
   * for instance if a user makes an explicit selection using an object whose
   * current state is ambiguous or undefined. See @ATSPI_STATE_ENABLED,
   * @ATSPI_STATE_INDETERMINATE.
   * @ATSPI_STATE_SHOWING: Indicates this object, the object's parent, the
   * object's parent's parent, and so on, are all 'shown' to the end-user,
   * i.e. subject to "exposure" if blocking or obscuring objects do not
   * interpose between this object and the top of the window stack.
   * @ATSPI_STATE_SINGLE_LINE: Indicates this (text) object can contain only a
   * single line of text.
   * @ATSPI_STATE_STALE: Indicates that the information returned for this object
   * may no longer be synchronized with the application state.  This can occur
   * if the object has @ATSPI_STATE_TRANSIENT, and can also occur towards the
   * end of the object peer's lifecycle.
   * @ATSPI_STATE_TRANSIENT: Indicates this object is transient.
   * @ATSPI_STATE_VERTICAL: Indicates the orientation of this object is vertical;
   * for example this state may appear on such objects as scrollbars, text
   * objects (with vertical text flow), separators, etc.
   * @ATSPI_STATE_VISIBLE: Indicates this object is visible, e.g. has been
   * explicitly marked for exposure to the user. @ATSPI_STATE_VISIBLE is no
   * guarantee that the object is actually unobscured on the screen, only that
   * it is 'potentially' visible, barring obstruction, being scrolled or clipped
   * out of the field of view, or having an ancestor container that has not yet
   * made visible. A widget is potentially onscreen if it has both
   * @ATSPI_STATE_VISIBLE and @ATSPI_STATE_SHOWING. The absence of
   * @ATSPI_STATE_VISIBLE and @ATSPI_STATE_SHOWING is
   * semantically equivalent to saying that an object is 'hidden'.
   * @ATSPI_STATE_MANAGES_DESCENDANTS: Indicates that "active-descendant-changed"
   * event is sent when children become 'active' (i.e. are selected or
   * navigated to onscreen).  Used to prevent need to enumerate all children
   * in very large containers, like tables. The presence of
   * @ATSPI_STATE_MANAGES_DESCENDANTS is an indication to the client that the
   * children should not, and need not, be enumerated by the client.
   * Objects implementing this state are expected to provide relevant state
   * notifications to listening clients, for instance notifications of
   * visibility changes and activation of their contained child objects, without
   * the client having previously requested references to those children.
   * @ATSPI_STATE_INDETERMINATE: Indicates that a check box or other boolean
   * indicator is in a state other than checked or not checked.  This
   * usually means that the boolean value reflected or controlled by the
   * object does not apply consistently to the entire current context.
   * For example, a checkbox for the "Bold" attribute of text may have
   * @ATSPI_STATE_INDETERMINATE if the currently selected text contains a mixture
   * of weight attributes. In many cases interacting with a
   * @ATSPI_STATE_INDETERMINATE object will cause the context's corresponding
   * boolean attribute to be homogenized, whereupon the object will lose
   * @ATSPI_STATE_INDETERMINATE and a corresponding state-changed event will be
   * fired.
   * @ATSPI_STATE_REQUIRED: Indicates that user interaction with this object is
   * 'required' from the user, for instance before completing the
   * processing of a form.
   * @ATSPI_STATE_TRUNCATED: 	  Indicates that an object's onscreen content
   * is truncated, e.g. a text value in a spreadsheet cell.
   * @ATSPI_STATE_ANIMATED: Indicates this object's visual representation is
   * dynamic, not static. This state may be applied to an object during an
   * animated 'effect' and be removed from the object once its visual
   * representation becomes static. Some applications, notably content viewers,
   * may not be able to detect all kinds of animated content.  Therefore the
   * absence of this state should not be taken as
   * definitive evidence that the object's visual representation is
   * static; this state is advisory.
   * @ATSPI_STATE_INVALID_ENTRY: This object has indicated an error condition
   * due to failure of input validation.  For instance, a form control may
   * acquire this state in response to invalid or malformed user input.
   * @ATSPI_STATE_SUPPORTS_AUTOCOMPLETION: This state indicates that the object
   * in question implements some form of typeahead or
   * pre-selection behavior whereby entering the first character of one or more
   * sub-elements causes those elements to scroll into view or become
   * selected. Subsequent character input may narrow the selection further as
   * long as one or more sub-elements match the string. This state is normally
   * only useful and encountered on objects that implement #AtspiSelection.
   * In some cases the typeahead behavior may result in full or partial
   * completion of the data in the input field, in which case
   * these input events may trigger text-changed events from the source.
   * @ATSPI_STATE_SELECTABLE_TEXT: This state indicates that the object in
   * question supports text selection. It should only be exposed on objects
   * which implement the #AtspiText interface, in order to distinguish this state
   * from @ATSPI_STATE_SELECTABLE, which infers that the object in question is a
   * selectable child of an object which implements #AtspiSelection. While
   * similar, text selection and subelement selection are distinct operations.
   * @ATSPI_STATE_IS_DEFAULT: This state indicates that the object in question is
   * the 'default' interaction object in a dialog, i.e. the one that gets
   * activated if the user presses "Enter" when the dialog is initially
   * posted.
   * @ATSPI_STATE_VISITED: This state indicates that the object (typically a
   * hyperlink) has already been activated or invoked, with the result that
   * some backing data has been downloaded or rendered.
   *@ATSPI_STATE_CHECKABLE: Indicates this object has the potential to
   *  be checked, such as a checkbox or toggle-able table cell. @Since:
   *  2.12
   *@ATSPI_STATE_HAS_POPUP: Indicates that the object has a popup
   * context menu or sub-level menu which may or may not be
   * showing. This means that activation renders conditional content.
   * Note that ordinary tooltips are not considered popups in this
   * context. @Since: 2.12
   * @ATSPI_STATE_READ_ONLY: Indicates that an object which is ENABLED and
   * SENSITIVE has a value which can be read, but not modified, by the
   * user. @Since: 2.16
   * @ATSPI_STATE_LAST_DEFINED: This value of the enumeration should not be used
   * as a parameter, it indicates the number of items in the #AtspiStateType
   * enumeration.
   *
   *
   * Enumeration used by various interfaces indicating every possible state
   * an #AtspiAccesible object can assume.
   *
   * }
type
  PAtspiStateType = ^TAtspiStateType;
  TAtspiStateType =  Longint;
  Const
    ATSPI_STATE_INVALID = 0;
    ATSPI_STATE_ACTIVE = 1;
    ATSPI_STATE_ARMED = 2;
    ATSPI_STATE_BUSY = 3;
    ATSPI_STATE_CHECKED = 4;
    ATSPI_STATE_COLLAPSED = 5;
    ATSPI_STATE_DEFUNCT = 6;
    ATSPI_STATE_EDITABLE = 7;
    ATSPI_STATE_ENABLED = 8;
    ATSPI_STATE_EXPANDABLE = 9;
    ATSPI_STATE_EXPANDED = 10;
    ATSPI_STATE_FOCUSABLE = 11;
    ATSPI_STATE_FOCUSED = 12;
    ATSPI_STATE_HAS_TOOLTIP = 13;
    ATSPI_STATE_HORIZONTAL = 14;
    ATSPI_STATE_ICONIFIED = 15;
    ATSPI_STATE_MODAL = 16;
    ATSPI_STATE_MULTI_LINE = 17;
    ATSPI_STATE_MULTISELECTABLE = 18;
    ATSPI_STATE_OPAQUE = 19;
    ATSPI_STATE_PRESSED = 20;
    ATSPI_STATE_RESIZABLE = 21;
    ATSPI_STATE_SELECTABLE = 22;
    ATSPI_STATE_SELECTED = 23;
    ATSPI_STATE_SENSITIVE = 24;
    ATSPI_STATE_SHOWING = 25;
    ATSPI_STATE_SINGLE_LINE = 26;
    ATSPI_STATE_STALE = 27;
    ATSPI_STATE_TRANSIENT = 28;
    ATSPI_STATE_VERTICAL = 29;
    ATSPI_STATE_VISIBLE = 30;
    ATSPI_STATE_MANAGES_DESCENDANTS = 31;
    ATSPI_STATE_INDETERMINATE = 32;
    ATSPI_STATE_REQUIRED = 33;
    ATSPI_STATE_TRUNCATED = 34;
    ATSPI_STATE_ANIMATED = 35;
    ATSPI_STATE_INVALID_ENTRY = 36;
    ATSPI_STATE_SUPPORTS_AUTOCOMPLETION = 37;
    ATSPI_STATE_SELECTABLE_TEXT = 38;
    ATSPI_STATE_IS_DEFAULT = 39;
    ATSPI_STATE_VISITED = 40;
    ATSPI_STATE_CHECKABLE = 41;
    ATSPI_STATE_HAS_POPUP = 42;
    ATSPI_STATE_READ_ONLY = 43;
    ATSPI_STATE_LAST_DEFINED = 44;
;
{*
 * ATSPI_STATETYPE_COUNT:
 *
 * One higher than the highest valid value of #AtspiStateType.
 * }
  ATSPI_STATETYPE_COUNT = 41+1;  
{*
   * AtspiKeyEventType:
   * @ATSPI_KEY_PRESSED: Key press event
   * @ATSPI_KEY_RELEASED: Key release event
   *
   * Deprecated. Should not be used.
   *
   * }
type
  PAtspiKeyEventType = ^TAtspiKeyEventType;
  TAtspiKeyEventType =  Longint;
  Const
    ATSPI_KEY_PRESSED = 0;
    ATSPI_KEY_RELEASED = 1;
;
{*
 * ATSPI_KEYEVENTTYPE_COUNT:
 *
 * One higher than the highest valid value of #AtspiKeyEventType.
 * }
  ATSPI_KEYEVENTTYPE_COUNT = 1+1;  
{*
   * AtspiEventType:
   * @ATSPI_KEY_PRESSED_EVENT: Indicates that a key on a keyboard device was
   * pressed.
   * @ATSPI_KEY_RELEASED_EVENT: Indicates that a key on a keyboard device was
   * released.
   * @ATSPI_BUTTON_PRESSED_EVENT: Indicates that a button on a non-keyboard
   * human interface device (HID) was pressed.
   * @ATSPI_BUTTON_RELEASED_EVENT: Indicates that a button on a non-keyboard
   * human interface device (HID) was released.
   *
   * Enumeration used to specify the event types of interest to an
   * #AtspiEventListener, or
   * to identify the type of an event for which notification has been sent.
   *
   * }
type
  PAtspiEventType = ^TAtspiEventType;
  TAtspiEventType =  Longint;
  Const
    ATSPI_KEY_PRESSED_EVENT = 0;
    ATSPI_KEY_RELEASED_EVENT = 1;
    ATSPI_BUTTON_PRESSED_EVENT = 2;
    ATSPI_BUTTON_RELEASED_EVENT = 3;
;
{*
 * ATSPI_EVENTTYPE_COUNT:
 *
 * One higher than the highest valid value of #AtspiEventType.
  }
  ATSPI_EVENTTYPE_COUNT = 3+1;  
{*
   * AtspiKeySynthType:
   * @ATSPI_KEY_PRESS: Emulates the pressing of a hardware keyboard key.
   * @ATSPI_KEY_RELEASE: Emulates the release of a hardware keyboard key.
   * @ATSPI_KEY_PRESSRELEASE: Emulates the pressing and immediate releasing
   * of a hardware keyboard key.
   * @ATSPI_KEY_SYM: A symbolic key event is generated, without specifying a
   * hardware key. Note: if the keysym is not present in the current keyboard
   * map, the #AtspiDeviceEventController instance has a limited ability to
   * generate such keysyms on-the-fly. Reliability of GenerateKeyboardEvent
   * calls using out-of-keymap keysyms will vary from system to system, and on
   * the number of different out-of-keymap keysyms being generated in quick
   * succession.
   * In practice this is rarely significant, since the keysyms of interest to
   * AT clients and keyboard emulators are usually part of the current keymap,
   * i.e., present on the system keyboard for the current locale (even if a
   * physical hardware keyboard is not connected).
   * @ATSPI_KEY_STRING: A string is converted to its equivalent keyboard events
   * and emitted. If the string consists of complex characters or composed
   * characters which are not in the current keymap, string emission is
   * subject to the out-of-keymap limitations described for
   * @ATSPI_KEY_SYM. In practice this limitation primarily effects
   * Chinese and Japanese locales.
   * @ATSPI_KEY_LOCKMODIFIERS: Emulates locking a set of modifiers.
   * @ATSPI_KEY_UNLOCKMODIFIERS: Emulates unlocking a set of modifiers.
   *
   * Enumeration used when synthesizing keyboard input via
   * #atspi_generate_keyboard_event.
   *
   * }
type
  PAtspiKeySynthType = ^TAtspiKeySynthType;
  TAtspiKeySynthType =  Longint;
  Const
    ATSPI_KEY_PRESS = 0;
    ATSPI_KEY_RELEASE = 1;
    ATSPI_KEY_PRESSRELEASE = 2;
    ATSPI_KEY_SYM = 3;
    ATSPI_KEY_STRING = 4;
    ATSPI_KEY_LOCKMODIFIERS = 5;
    ATSPI_KEY_UNLOCKMODIFIERS = 6;
;
{*
 * ATSPI_KEYSYNTHTYPE_COUNT:
 *
 * One higher than the highest valid value of #AtspiKeySynthType.
 * }
  ATSPI_KEYSYNTHTYPE_COUNT = 4+1;  
{*
   * AtspiModifierType:
   * @ATSPI_MODIFIER_SHIFT: The left or right 'Shift' key.
   * @ATSPI_MODIFIER_SHIFTLOCK: The ShiftLock or CapsLock key.
   * @ATSPI_MODIFIER_CONTROL: 'Control'/'Ctrl'.
   * @ATSPI_MODIFIER_ALT: The Alt key (as opposed to AltGr).
   * @ATSPI_MODIFIER_META: Depending on the platform, this may map to 'Window',
   * 'Function', 'Meta', 'Menu', or 'NumLock'. Such 'Meta keys' will
   * map to one of META, META2, META3. On X Windows platforms these META
   * values map to the modifier masks Mod1Mask, Mod2Mask, Mod3Mask, e.g. an
   * event having @ATSPI_MODIFIER_META2 means that the 'Mod2Mask' bit
   * is set in the corresponding XEvent.
   * @ATSPI_MODIFIER_META2: See @ATSPI_MODIFIER_META.
   * @ATSPI_MODIFIER_META3: See @ATSPI_MODIFIER_META.
   * @ATSPI_MODIFIER_NUMLOCK: A symbolic meta key name that is mapped by AT-SPI
   * to the appropriate META value, for the convenience of the client.
   *
   *
   *
   * }
type
  PAtspiModifierType = ^TAtspiModifierType;
  TAtspiModifierType =  Longint;
  Const
    ATSPI_MODIFIER_SHIFT = 0;
    ATSPI_MODIFIER_SHIFTLOCK = 1;
    ATSPI_MODIFIER_CONTROL = 2;
    ATSPI_MODIFIER_ALT = 3;
    ATSPI_MODIFIER_META = 4;
    ATSPI_MODIFIER_META2 = 5;
    ATSPI_MODIFIER_META3 = 6;
    ATSPI_MODIFIER_NUMLOCK = 14;
;
{*
 * ATSPI_MODIFIERTYPE_COUNT:
 *
 * One higher than the highest valid value of #AtspiModifierType.
 * }
  ATSPI_MODIFIERTYPE_COUNT = 7+1;  
{*
   * AtspiRelationType:
   * @ATSPI_RELATION_NULL: Not a meaningful relationship; clients should not
   * normally encounter this #AtspiRelationType value.
   * @ATSPI_RELATION_LABEL_FOR: Object is a label for one or more other objects.
   * @ATSPI_RELATION_LABELLED_BY: Object is labelled by one or more other
   * objects.
   * @ATSPI_RELATION_CONTROLLER_FOR: Object is an interactive object which
   * modifies the state, onscreen location, or other attributes of one or more
   * target objects.
   * @ATSPI_RELATION_CONTROLLED_BY: Object state, position, etc. is
   * modified/controlled by user interaction with one or more other objects.
   * For instance a viewport or scroll pane may be @ATSPI_RELATION_CONTROLLED_BY
   * scrollbars.
   * @ATSPI_RELATION_MEMBER_OF: Object has a grouping relationship (e.g. 'same
   * group as') to one or more other objects.
   * @ATSPI_RELATION_TOOLTIP_FOR: Object is a tooltip associated with another
   * object.
   * @ATSPI_RELATION_NODE_CHILD_OF: Object is a child of the target.
   * @ATSPI_RELATION_NODE_PARENT_OF: Object is a parent of the target.
   * @ATSPI_RELATION_EXTENDED: Used to indicate that a relationship exists, but
   * its type is not specified in the enumeration.
   * @ATSPI_RELATION_FLOWS_TO: Object renders content which flows logically to
   * another object. For instance, text in a paragraph may flow to another
   * object which is not the 'next sibling' in the accessibility hierarchy.
   * @ATSPI_RELATION_FLOWS_FROM: Reciprocal of @ATSPI_RELATION_FLOWS_TO.
   * @ATSPI_RELATION_SUBWINDOW_OF: Object is visually and semantically considered
   * a subwindow of another object, even though it is not the object's child.
   * Useful when dealing with embedded applications and other cases where the
   * widget hierarchy does not map cleanly to the onscreen presentation.
   * @ATSPI_RELATION_EMBEDS: Similar to @ATSPI_RELATION_SUBWINDOW_OF, but
   * specifically used for cross-process embedding.
   * @ATSPI_RELATION_EMBEDDED_BY: Reciprocal of @ATSPI_RELATION_EMBEDS. Used to
   * denote content rendered by embedded renderers that live in a separate process
   * space from the embedding context.
   * @ATSPI_RELATION_POPUP_FOR: Denotes that the object is a transient window or
   * frame associated with another onscreen object. Similar to @ATSPI_TOOLTIP_FOR,
   * but more general. Useful for windows which are technically toplevels
   * but which, for one or more reasons, do not explicitly cause their
   * associated window to lose 'window focus'. Creation of an @ATSPI_ROLE_WINDOW
   * object with the @ATSPI_RELATION_POPUP_FOR relation usually requires
   * some presentation action on the part
   * of assistive technology clients, even though the previous toplevel
   * @ATSPI_ROLE_FRAME object may still be the active window.
   * @ATSPI_RELATION_PARENT_WINDOW_OF: This is the reciprocal relation to
   * @ATSPI_RELATION_POPUP_FOR.
   * @ATSPI_RELATION_DESCRIPTION_FOR: Reciprocal of %ATSPI_RELATION_DESCRIBED_BY.
   * Indicates that this object provides descriptive information about the target
   * object(s). See also %ATSPI_RELATION_DETAILS_FOR and %ATSPI_RELATION_ERROR_FOR.
   * @ATSPI_RELATION_DESCRIBED_BY: Reciprocal of %ATSPI_RELATION_DESCRIPTION_FOR.
   * Indicates that one or more target objects provide descriptive information
   * about this object. This relation type is most appropriate for information
   * that is not essential as its presentation may be user-configurable and/or
   * limited to an on-demand mechanism such as an assistive technology command.
   * For brief, essential information such as can be found in a widget's on-screen
   * label, use %ATSPI_RELATION_LABELLED_BY. For an on-screen error message, use
   * %ATSPI_RELATION_ERROR_MESSAGE. For lengthy extended descriptive information
   * contained in an on-screen object, consider using %ATSPI_RELATION_DETAILS as
   * assistive technologies may provide a means for the user to navigate to
   * objects containing detailed descriptions so that their content can be more
   * closely reviewed.
   * @ATSPI_RELATION_DETAILS: Reciprocal of %ATSPI_RELATION_DETAILS_FOR. Indicates
   * that this object has a detailed or extended description, the contents of
   * which can be found in the target object(s). This relation type is most
   * appropriate for information that is sufficiently lengthy as to make
   * navigation to the container of that information desirable. For less verbose
   * information suitable for announcement only, see %ATSPI_RELATION_DESCRIBED_BY.
   * If the detailed information describes an error condition,
   * %ATSPI_RELATION_ERROR_FOR should be used instead. @Since: 2.26.
   * @ATSPI_RELATION_DETAILS_FOR: Reciprocal of %ATSPI_RELATION_DETAILS. Indicates
   * that this object provides a detailed or extended description about the target
   * object(s). See also %ATSPI_RELATION_DESCRIPTION_FOR and
   * %ATSPI_RELATION_ERROR_FOR. @Since: 2.26.
   * @ATSPI_RELATION_ERROR_MESSAGE: Reciprocal of %ATSPI_RELATION_ERROR_FOR.
   * Indicates that this object has one or more errors, the nature of which is
   * described in the contents of the target object(s). Objects that have this
   * relation type should also contain %ATSPI_STATE_INVALID_ENTRY in their
   * #AtspiStateSet. @Since: 2.26.
   * @ATSPI_RELATION_ERROR_FOR: Reciprocal of %ATSPI_RELATION_ERROR_MESSAGE.
   * Indicates that this object contains an error message describing an invalid
   * condition in the target object(s). @Since: 2.26.
   * @ATSPI_RELATION_LAST_DEFINED: Do not use as a parameter value, used to
   * determine the size of the enumeration.
   *
   * #AtspiRelationType specifies a relationship between objects
   * (possibly one-to-many
   * or many-to-one) outside of the normal parent/child hierarchical
   * relationship. It allows better semantic       identification of how objects
   * are associated with one another.       For instance the
   * @ATSPI_RELATION_LABELLED_BY
   * relationship may be used to identify labelling information       that should
   * accompany the accessible name property when presenting an object's content or
   * identity       to the end user.  Similarly,
   * @ATSPI_RELATION_CONTROLLER_FOR can be used
   * to further specify the context in which a valuator is useful, and/or the
   * other UI components which are directly effected by user interactions with
   * the valuator. Common examples include association of scrollbars with the
   * viewport or panel which they control.
   *
   *
   * Enumeration used to specify
   * the type of relation encapsulated in an #AtspiRelation object.
   *
   * }
type
  PAtspiRelationType = ^TAtspiRelationType;
  TAtspiRelationType =  Longint;
  Const
    ATSPI_RELATION_NULL = 0;
    ATSPI_RELATION_LABEL_FOR = 1;
    ATSPI_RELATION_LABELLED_BY = 2;
    ATSPI_RELATION_CONTROLLER_FOR = 3;
    ATSPI_RELATION_CONTROLLED_BY = 4;
    ATSPI_RELATION_MEMBER_OF = 5;
    ATSPI_RELATION_TOOLTIP_FOR = 6;
    ATSPI_RELATION_NODE_CHILD_OF = 7;
    ATSPI_RELATION_NODE_PARENT_OF = 8;
    ATSPI_RELATION_EXTENDED = 9;
    ATSPI_RELATION_FLOWS_TO = 10;
    ATSPI_RELATION_FLOWS_FROM = 11;
    ATSPI_RELATION_SUBWINDOW_OF = 12;
    ATSPI_RELATION_EMBEDS = 13;
    ATSPI_RELATION_EMBEDDED_BY = 14;
    ATSPI_RELATION_POPUP_FOR = 15;
    ATSPI_RELATION_PARENT_WINDOW_OF = 16;
    ATSPI_RELATION_DESCRIPTION_FOR = 17;
    ATSPI_RELATION_DESCRIBED_BY = 18;
    ATSPI_RELATION_DETAILS = 19;
    ATSPI_RELATION_DETAILS_FOR = 20;
    ATSPI_RELATION_ERROR_MESSAGE = 21;
    ATSPI_RELATION_ERROR_FOR = 22;
    ATSPI_RELATION_LAST_DEFINED = 23;
;
{*
 * ATSPI_RELATIONTYPE_COUNT:
 *
 * One higher than the highest valid value of #AtspiRelationType.
 * }
  ATSPI_RELATIONTYPE_COUNT = 23+1;  
{*
   * AtspiRole:
   * @ATSPI_ROLE_INVALID: A role indicating an error condition, such as
   * uninitialized Role data.
   * @ATSPI_ROLE_ACCELERATOR_LABEL: Object is a label indicating the keyboard
   * accelerators for the parent.
   * @ATSPI_ROLE_ALERT: Object is used to alert the user about something.
   * @ATSPI_ROLE_ANIMATION: Object contains a dynamic or moving image of some
   * kind.
   * @ATSPI_ROLE_ARROW: Object is a 2d directional indicator.
   * @ATSPI_ROLE_CALENDAR: Object contains one or more dates, usually arranged
   * into a 2d list.
   * @ATSPI_ROLE_CANVAS: Object that can be drawn into and is used to trap
   * events.
   * @ATSPI_ROLE_CHECK_BOX: A choice that can be checked or unchecked and
   * provides a separate       indicator for the current state.
   * @ATSPI_ROLE_CHECK_MENU_ITEM: A menu item that behaves like a check box. See
   * @ATSPI_ROLE_CHECK_BOX.
   * @ATSPI_ROLE_COLOR_CHOOSER: A specialized dialog that lets the user choose a
   * color.
   * @ATSPI_ROLE_COLUMN_HEADER: The header for a column of data.
   * @ATSPI_ROLE_COMBO_BOX: A list of choices the user can select from.
   * @ATSPI_ROLE_DATE_EDITOR: An object which allows entry of a date.
   * @ATSPI_ROLE_DESKTOP_ICON: An inconifed internal frame within a DESKTOP_FRAME.
   * @ATSPI_ROLE_DESKTOP_FRAME: A pane that supports internal frames and
   * iconified versions of those internal frames.
   * @ATSPI_ROLE_DIAL: An object that allows a value to be changed via rotating a
   * visual element, or which displays a value via such a rotating element.
   * @ATSPI_ROLE_DIALOG: A top level window with title bar and a border.
   * @ATSPI_ROLE_DIRECTORY_PANE: A pane that allows the user to navigate through
   * and select the contents of a directory.
   * @ATSPI_ROLE_DRAWING_AREA: An object used for drawing custom user interface
   * elements.
   * @ATSPI_ROLE_FILE_CHOOSER: A specialized dialog that displays the files in
   * the directory and lets the user select a file, browse a different
   * directory, or specify a filename.
   * @ATSPI_ROLE_FILLER: A object that fills up space in a user interface.
   * @ATSPI_ROLE_FOCUS_TRAVERSABLE: Don't use, reserved for future use.
   * @ATSPI_ROLE_FONT_CHOOSER: Allows selection of a display font.
   * @ATSPI_ROLE_FRAME: A top level window with a title bar, border, menubar,
   * etc.
   * @ATSPI_ROLE_GLASS_PANE: A pane that is guaranteed to be painted on top of
   * all panes beneath it.
   * @ATSPI_ROLE_HTML_CONTAINER: A document container for HTML, whose children
   * represent the document content.
   * @ATSPI_ROLE_ICON: A small fixed size picture, typically used to decorate
   * components.
   * @ATSPI_ROLE_IMAGE: An image, typically static.
   * @ATSPI_ROLE_INTERNAL_FRAME: A frame-like object that is clipped by a desktop
   * pane.
   * @ATSPI_ROLE_LABEL: An object used to present an icon or short string in an
   * interface.
   * @ATSPI_ROLE_LAYERED_PANE: A specialized pane that allows its children to be
   * drawn in layers, providing a form of stacking order.
   * @ATSPI_ROLE_LIST: An object that presents a list of objects to the user and
   * allows the user to select one or more of them.
   * @ATSPI_ROLE_LIST_ITEM: An object that represents an element of a list.
   * @ATSPI_ROLE_MENU: An object usually found inside a menu bar that contains a
   * list of actions the user can choose from.
   * @ATSPI_ROLE_MENU_BAR: An object usually drawn at the top of the primary
   * dialog box of an application that contains a list of menus the user can
   * choose from.
   * @ATSPI_ROLE_MENU_ITEM: An object usually contained in a menu that presents
   * an action the user can choose.
   * @ATSPI_ROLE_OPTION_PANE: A specialized pane whose primary use is inside a
   * dialog.
   * @ATSPI_ROLE_PAGE_TAB: An object that is a child of a page tab list.
   * @ATSPI_ROLE_PAGE_TAB_LIST: An object that presents a series of panels (or
   * page tabs), one at a time,through some mechanism provided by the
   * object.
   * @ATSPI_ROLE_PANEL: A generic container that is often used to group objects.
   * @ATSPI_ROLE_PASSWORD_TEXT: A text object uses for passwords, or other places
   * where the text content is not shown visibly to the user.
   * @ATSPI_ROLE_POPUP_MENU: A temporary window that is usually used to offer the
   * user a list of choices, and then hides when the user selects one of those
   * choices.
   * @ATSPI_ROLE_PROGRESS_BAR: An object used to indicate how much of a task has
   * been completed.
   * @ATSPI_ROLE_PUSH_BUTTON: An object the user can manipulate to tell the
   * application to do something.
   * @ATSPI_ROLE_RADIO_BUTTON: A specialized check box that will cause other
   * radio buttons in the same group to become unchecked when this one is
   * checked.
   * @ATSPI_ROLE_RADIO_MENU_ITEM: Object is both a menu item and a "radio button"
   * . See @ATSPI_ROLE_RADIO_BUTTON.
   * @ATSPI_ROLE_ROOT_PANE: A specialized pane that has a glass pane and a
   * layered pane as its children.
   * @ATSPI_ROLE_ROW_HEADER: The header for a row of data.
   * @ATSPI_ROLE_SCROLL_BAR: An object usually used to allow a user to
   * incrementally view a large amount of data by moving the bounds of a
   * viewport along a one-dimensional axis.
   * @ATSPI_ROLE_SCROLL_PANE: An object that allows a user to incrementally view
   * a large amount of information. @ATSPI_ROLE_SCROLL_PANE objects are usually
   * accompanied by @ATSPI_ROLE_SCROLL_BAR controllers, on which the
   * @ATSPI_RELATION_CONTROLLER_FOR and @ATSPI_RELATION_CONTROLLED_BY
   * reciprocal relations are set. See  #atspi_get_relation_set.
   * @ATSPI_ROLE_SEPARATOR: An object usually contained in a menu to provide a
   * visible and logical separation of the contents in a menu.
   * @ATSPI_ROLE_SLIDER: An object that allows the user to select from a bounded
   * range.  Unlike @ATSPI_ROLE_SCROLL_BAR, @ATSPI_ROLE_SLIDER objects need not control
   * 'viewport'-like objects.
   * @ATSPI_ROLE_SPIN_BUTTON: An object which allows one of a set of choices to
   * be selected, and which displays the current choice.
   * @ATSPI_ROLE_SPLIT_PANE: A specialized panel that presents two other panels
   * at the same time.
   * @ATSPI_ROLE_STATUS_BAR: Object displays non-quantitative status information
   * (c.f. @ATSPI_ROLE_PROGRESS_BAR)
   * @ATSPI_ROLE_TABLE: An object used to repesent information in terms of rows
   * and columns.
   * @ATSPI_ROLE_TABLE_CELL: A 'cell' or discrete child within a Table. Note:
   * Table cells need not have @ATSPI_ROLE_TABLE_CELL, other
   * #AtspiRoleType values are valid as well.
   * @ATSPI_ROLE_TABLE_COLUMN_HEADER: An object which labels a particular column
   * in an #AtspiTable.
   * @ATSPI_ROLE_TABLE_ROW_HEADER: An object which labels a particular row in a
   * #AtspiTable. #AtspiTable rows and columns may also be labelled via the
   * @ATSPI_RELATION_LABEL_FOR/@ATSPI_RELATION_LABELLED_BY relationships.
   * See #atspi_get_relation_set.
   * @ATSPI_ROLE_TEAROFF_MENU_ITEM: Object allows menu to be removed from menubar
   * and shown in its own window.
   * @ATSPI_ROLE_TERMINAL: An object that emulates a terminal.
   * @ATSPI_ROLE_TEXT: An interactive widget that supports multiple lines of text
   * and optionally accepts user input, but whose purpose is not to solicit user
   * input. Thus @ATSPI_ROLE_TEXT is appropriate for the text view in a plain text
   * editor but inappropriate for an input field in a dialog box or web form. For
   * widgets whose purpose is to solicit input from the user, see @ATSPI_ROLE_ENTRY
   * and @ATSPI_ROLE_PASSWORD_TEXT. For generic objects which display a brief amount
   * of textual information, see @ATSPI_ROLE_STATIC.
   * @ATSPI_ROLE_TOGGLE_BUTTON: A specialized push button that can be checked or
   * unchecked, but does not procide a separate indicator for the current
   * state.
   * @ATSPI_ROLE_TOOL_BAR: A bar or palette usually composed of push buttons or
   * toggle buttons.
   * @ATSPI_ROLE_TOOL_TIP: An object that provides information about another
   * object.
   * @ATSPI_ROLE_TREE: An object used to repsent hierarchical information to the
   * user.
   * @ATSPI_ROLE_TREE_TABLE: An object that presents both tabular and
   * hierarchical info to the user.
   * @ATSPI_ROLE_UNKNOWN: The object contains some #AtspiAccessible information,
   * but its role is not known.
   * @ATSPI_ROLE_VIEWPORT: An object usually used in a scroll pane, or to
   * otherwise clip a larger object or content renderer to a specific
   * onscreen viewport.
   * @ATSPI_ROLE_WINDOW: A top level window with no title or border.
   * @ATSPI_ROLE_EXTENDED: means that the role for this item is known, but not
   * included in the core enumeration. Deprecated since 2.24.
   * @ATSPI_ROLE_HEADER: An object that serves as a document header.
   * @ATSPI_ROLE_FOOTER: An object that serves as a document footer.
   * @ATSPI_ROLE_PARAGRAPH: An object which is contains a single paragraph of
   * text content. See also @ATSPI_ROLE_TEXT.
   * @ATSPI_ROLE_RULER: An object which describes margins and tab stops, etc.
   *    for text objects which it controls (should have
   * @ATSPI_RELATION_CONTROLLER_FOR relation to such).
   * @ATSPI_ROLE_APPLICATION: An object corresponding to the toplevel accessible
   * of an application, which may contain @ATSPI_ROLE_FRAME objects or other
   * accessible objects. Children of objects with the #ATSPI_ROLE_DESKTOP_FRAME role are generally
   * @ATSPI_ROLE_APPLICATION objects.
   * @ATSPI_ROLE_AUTOCOMPLETE: The object is a dialog or list containing items
   * for insertion into an entry widget, for instance a list of words for
   * completion of a text entry.
   * @ATSPI_ROLE_EDITBAR: The object is an editable text object in a toolbar.
   * @ATSPI_ROLE_EMBEDDED: The object is an embedded component container.  This
   * role is a "grouping" hint that the contained objects share a context
   * which is different from the container in which this accessible is
   * embedded. In particular, it is used for some kinds of document embedding,
   * and for embedding of out-of-process component, "panel applets", etc.
   * @ATSPI_ROLE_ENTRY: The object is a component whose textual content may be
   * entered or modified by the user, provided @ATSPI_STATE_EDITABLE is present.
   * A readonly @ATSPI_ROLE_ENTRY object (i.e. where @ATSPI_STATE_EDITABLE is
   * not present) implies a read-only 'text field' in a form, as opposed to a
   * title, label, or caption.
   * @ATSPI_ROLE_CHART: The object is a graphical depiction of quantitative data.
   * It may contain multiple subelements whose attributes and/or description
   * may be queried to obtain both the  quantitative data and information about
   * how the data is being presented. The @ATSPI_LABELLED_BY relation is
   * particularly important in interpreting objects of this type, as is the
   * accessible description property. See @ATSPI_ROLE_CAPTION.
   * @ATSPI_ROLE_CAPTION: The object contains descriptive information, usually
   * textual, about another user interface element such as a table, chart, or
   * image.
   * @ATSPI_ROLE_DOCUMENT_FRAME: The object is a visual frame or container which
   * contains a view of document content. #AtspiDocument frames may occur within
   * another #AtspiDocument instance, in which case the second  document may be
   * said to be embedded in the containing instance.  HTML frames are often
   * ATSPI_ROLE_DOCUMENT_FRAME:  Either this object, or a singleton descendant,
   * should implement the #AtspiDocument interface.
   * @ATSPI_ROLE_HEADING: The object serves as a heading for content which
   * follows it in a document. The 'heading level' of the heading, if
   * availabe,  may be obtained by       querying the object's attributes.
   * @ATSPI_ROLE_PAGE: The object is a containing instance which encapsulates a
   * page of information. @ATSPI_ROLE_PAGE is used in documents and content which
   * support a paginated navigation model.
   * @ATSPI_ROLE_SECTION: The object is a containing instance of document content
   * which constitutes a particular 'logical' section of the document.  The
   * type of content within a section, and the nature of the section division
   * itself, may be obtained by querying the object's attributes.  Sections
   * may be nested.
   * @ATSPI_ROLE_REDUNDANT_OBJECT: The object is redundant with another object in
   * the hierarchy, and is exposed for purely technical reasons.  Objects of
   * this role should be ignored by clients, if they are encountered at all.
   * @ATSPI_ROLE_FORM: The object is a containing instance of document content
   * which has within it components with which the user can interact in order
   * to input information; i.e. the object is a container for pushbuttons,
   * comboboxes, text input fields, and other 'GUI' components. @ATSPI_ROLE_FORM
   * should not, in general, be used for toplevel GUI containers or dialogs,
   * but should be reserved for 'GUI' containers which occur within document
   * content, for instance within Web documents, presentations, or text
   * documents.  Unlike other GUI containers and dialogs which occur inside
   * application instances, @ATSPI_ROLE_FORM containers' components are
   * associated with the current document, rather than the current foreground
   * application or viewer instance.
   * @ATSPI_ROLE_LINK: The object is a hypertext anchor, i.e. a "link" in a
   * hypertext document.  Such objects are distinct from 'inline'       content
   * which may also use the #AtspiHypertext/#AtspiHyperlink interfacesto indicate
   * the range/location within a text object where an inline or embedded object
   * lies.
   * @ATSPI_ROLE_INPUT_METHOD_WINDOW: The object is a window or similar viewport
   * which is used to allow composition or input of a 'complex character',
   * in other words it is an "input method window".
   * @ATSPI_ROLE_TABLE_ROW: A row in a table.
   * @ATSPI_ROLE_TREE_ITEM: An object that represents an element of a tree.
   * @ATSPI_ROLE_DOCUMENT_SPREADSHEET: A document frame which contains a
   * spreadsheet.
   * @ATSPI_ROLE_DOCUMENT_PRESENTATION: A document frame which contains a
   * presentation or slide content.
   * @ATSPI_ROLE_DOCUMENT_TEXT: A document frame which contains textual content,
   * such as found in a word processing
   * application.
   * @ATSPI_ROLE_DOCUMENT_WEB: A document frame which contains HTML or other
   * markup suitable for display in a web browser.
   * @ATSPI_ROLE_DOCUMENT_EMAIL: A document frame which contains email content
   * to be displayed or composed either in plain text or
   * HTML.
   * @ATSPI_ROLE_COMMENT: An object found within a document and designed to
   * present a comment, note, or other annotation. In some cases, this object
   * might not be visible until activated.
   * @ATSPI_ROLE_LIST_BOX: A non-collapsible list of choices the user can
   * select from.
   * @ATSPI_ROLE_GROUPING: A group of related widgets. This group typically has
   * a label.
   * @ATSPI_ROLE_IMAGE_MAP: An image map object. Usually a graphic with multiple
   * hotspots, where each hotspot can be activated resulting in the loading of
   * another document or section of a document.
   * @ATSPI_ROLE_NOTIFICATION: A transitory object designed to present a
   * message to the user, typically at the desktop level rather than inside a
   * particular application.
   * @ATSPI_ROLE_INFO_BAR: An object designed to present a message to the user
   * within an existing window.
   * @ATSPI_ROLE_LEVEL_BAR: A bar that serves as a level indicator to, for
   * instance, show the strength of a password or the state of a battery. @Since: 2.8
   * @ATSPI_ROLE_TITLE_BAR: A bar that serves as the title of a window or a
   *  dialog. @Since: 2.12
   * @ATSPI_ROLE_BLOCK_QUOTE: An object which contains a text section
   *  that is quoted from another source.  @Since: 2.12
   * @ATSPI_ROLE_AUDIO: An object which represents an audio
   *  element. @Since: 2.12
   * @ATSPI_ROLE_VIDEO: An object which represents a video
   *  element. @Since: 2.12
   * @ATSPI_ROLE_DEFINITION: A definition of a term or concept. @Since: 2.12
   * @ATSPI_ROLE_ARTICLE: A section of a page that consists of a
   *  composition that forms an independent part of a document, page, or
   *  site. Examples: A blog entry, a news story, a forum post. @Since:
   *  2.12
   * @ATSPI_ROLE_LANDMARK: A region of a web page intended as a
   *  navigational landmark. This is designed to allow Assistive
   *  Technologies to provide quick navigation among key regions within a
   *  document. @Since: 2.12
   * @ATSPI_ROLE_LOG: A text widget or container holding log content, such
   *  as chat history and error logs. In this role there is a
   *  relationship between the arrival of new items in the log and the
   *  reading order. The log contains a meaningful sequence and new
   *  information is added only to the end of the log, not at arbitrary
   *  points. @Since: 2.12
   * @ATSPI_ROLE_MARQUEE: A container where non-essential information
   *  changes frequently. Common usages of marquee include stock tickers
   *  and ad banners. The primary difference between a marquee and a log
   *  is that logs usually have a meaningful order or sequence of
   *  important content changes. @Since: 2.12
   * @ATSPI_ROLE_MATH: A text widget or container that holds a mathematical
   *  expression. @Since: 2.12
   * @ATSPI_ROLE_RATING: A widget whose purpose is to display a rating,
   *  such as the number of stars associated with a song in a media
   *  player. Objects of this role should also implement
   *  AtspiValue. @Since: 2.12
   * @ATSPI_ROLE_TIMER: An object containing a numerical counter which
   *  indicates an amount of elapsed time from a start point, or the time
   *  remaining until an end point. @Since: 2.12
   * @ATSPI_ROLE_STATIC: A generic non-container object whose purpose is to display
   *  a brief amount of information to the user and whose role is known by the
   *  implementor but lacks semantic value for the user. Examples in which
   *  @ATSPI_ROLE_STATIC is appropriate include the message displayed in a message
   *  box and an image used as an alternative means to display text.
   *  @ATSPI_ROLE_STATIC should not be applied to widgets which are traditionally
   *  interactive, objects which display a significant amount of content, or any
   *  object which has an accessible relation pointing to another object. The
   *  displayed information, as a general rule, should be exposed through the
   *  accessible name of the object. For labels which describe another widget, see
   *  @ATSPI_ROLE_LABEL. For text views, see @ATSPI_ROLE_TEXT. For generic
   *  containers, see @ATSPI_ROLE_PANEL. For objects whose role is not known by the
   *  implementor, see @ATSPI_ROLE_UNKNOWN. @Since: 2.16.
   * @ATSPI_ROLE_MATH_FRACTION: An object that represents a mathematical fraction. @Since: 2.16.
   * @ATSPI_ROLE_MATH_ROOT: An object that represents a mathematical expression
   *  displayed with a radical. @Since: 2.16.
   * @ATSPI_ROLE_SUBSCRIPT: An object that contains text that is displayed as a
   *  subscript. @Since: 2.16.
   * @ATSPI_ROLE_SUPERSCRIPT: An object that contains text that is displayed as a
   *  superscript. @Since: 2.16.
   * @ATSPI_ROLE_DESCRIPTION_LIST: An object that represents a list of term-value
   *  groups. A term-value group represents an individual description and consist
   *  of one or more names (@ATSPI_ROLE_DESCRIPTION_TERM) followed by one or more
   *  values (@ATSPI_ROLE_DESCRIPTION_VALUE). For each list, there should not be
   *  more than one group with the same term name. @Since: 2.26.
   * @ATSPI_ROLE_DESCRIPTION_TERM: An object that represents a term or phrase
   *  with a corresponding definition. @Since: 2.26.
   * @ATSPI_ROLE_DESCRIPTION_VALUE: An object that represents the description,
   *  definition, or value of a term. @Since: 2.26.
   * @ATSPI_ROLE_FOOTNOTE: An object that contains the text of a footnote. @Since: 2.26.
   * @ATSPI_ROLE_CONTENT_DELETION: Content previously deleted or proposed to be
   * deleted, e.g. in revision history or a content view providing suggestions
   * from reviewers. @Since: 2.34.
   * @ATSPI_ROLE_CONTENT_INSERTION: Content previously inserted or proposed to be
   * inserted, e.g. in revision history or a content view providing suggestions
   * from reviewers. @Since: 2.34.
   * @ATSPI_ROLE_MARK: A run of content that is marked or highlighted, such as for
   * reference purposes, or to call it out as having a special purpose. If the
   * marked content has an associated section in the document elaborating on the
   * reason for the mark, then %ATSPI_RELATION_DETAILS should be used on the mark
   * to point to that associated section. In addition, the reciprocal relation
   * %ATSPI_RELATION_DETAILS_FOR should be used on the associated content section
   * to point back to the mark. @Since: 2.36.
   * @ATSPI_ROLE_SUGGESTION: A container for content that is called out as a proposed
   * change from the current version of the document, such as by a reviewer of the
   * content. An object with this role should include children with %ATSPI_ROLE_CONTENT_DELETION and/or
   * %ATSPI_ROLE_CONTENT_INSERTION, in any order, to indicate what the
   * actual change is. @Since: 2.36
   * @ATSPI_ROLE_PUSH_BUTTON_MENU: A specialized push button to open a menu. @Since 2.46
   * @ATSPI_ROLE_LAST_DEFINED: Not a valid role, used for finding end of
   * enumeration.
   *
   * Enumeration used by interface #AtspiAccessible to specify the role
   * of an #AtspiAccessible object.
   *
    }
type
  PAtspiRole = ^TAtspiRole;
  TAtspiRole =  Longint;
  Const
    ATSPI_ROLE_INVALID = 0;
    ATSPI_ROLE_ACCELERATOR_LABEL = 1;
    ATSPI_ROLE_ALERT = 2;
    ATSPI_ROLE_ANIMATION = 3;
    ATSPI_ROLE_ARROW = 4;
    ATSPI_ROLE_CALENDAR = 5;
    ATSPI_ROLE_CANVAS = 6;
    ATSPI_ROLE_CHECK_BOX = 7;
    ATSPI_ROLE_CHECK_MENU_ITEM = 8;
    ATSPI_ROLE_COLOR_CHOOSER = 9;
    ATSPI_ROLE_COLUMN_HEADER = 10;
    ATSPI_ROLE_COMBO_BOX = 11;
    ATSPI_ROLE_DATE_EDITOR = 12;
    ATSPI_ROLE_DESKTOP_ICON = 13;
    ATSPI_ROLE_DESKTOP_FRAME = 14;
    ATSPI_ROLE_DIAL = 15;
    ATSPI_ROLE_DIALOG = 16;
    ATSPI_ROLE_DIRECTORY_PANE = 17;
    ATSPI_ROLE_DRAWING_AREA = 18;
    ATSPI_ROLE_FILE_CHOOSER = 19;
    ATSPI_ROLE_FILLER = 20;
    ATSPI_ROLE_FOCUS_TRAVERSABLE = 21;
    ATSPI_ROLE_FONT_CHOOSER = 22;
    ATSPI_ROLE_FRAME = 23;
    ATSPI_ROLE_GLASS_PANE = 24;
    ATSPI_ROLE_HTML_CONTAINER = 25;
    ATSPI_ROLE_ICON = 26;
    ATSPI_ROLE_IMAGE = 27;
    ATSPI_ROLE_INTERNAL_FRAME = 28;
    ATSPI_ROLE_LABEL = 29;
    ATSPI_ROLE_LAYERED_PANE = 30;
    ATSPI_ROLE_LIST = 31;
    ATSPI_ROLE_LIST_ITEM = 32;
    ATSPI_ROLE_MENU = 33;
    ATSPI_ROLE_MENU_BAR = 34;
    ATSPI_ROLE_MENU_ITEM = 35;
    ATSPI_ROLE_OPTION_PANE = 36;
    ATSPI_ROLE_PAGE_TAB = 37;
    ATSPI_ROLE_PAGE_TAB_LIST = 38;
    ATSPI_ROLE_PANEL = 39;
    ATSPI_ROLE_PASSWORD_TEXT = 40;
    ATSPI_ROLE_POPUP_MENU = 41;
    ATSPI_ROLE_PROGRESS_BAR = 42;
    ATSPI_ROLE_PUSH_BUTTON = 43;
    ATSPI_ROLE_RADIO_BUTTON = 44;
    ATSPI_ROLE_RADIO_MENU_ITEM = 45;
    ATSPI_ROLE_ROOT_PANE = 46;
    ATSPI_ROLE_ROW_HEADER = 47;
    ATSPI_ROLE_SCROLL_BAR = 48;
    ATSPI_ROLE_SCROLL_PANE = 49;
    ATSPI_ROLE_SEPARATOR = 50;
    ATSPI_ROLE_SLIDER = 51;
    ATSPI_ROLE_SPIN_BUTTON = 52;
    ATSPI_ROLE_SPLIT_PANE = 53;
    ATSPI_ROLE_STATUS_BAR = 54;
    ATSPI_ROLE_TABLE = 55;
    ATSPI_ROLE_TABLE_CELL = 56;
    ATSPI_ROLE_TABLE_COLUMN_HEADER = 57;
    ATSPI_ROLE_TABLE_ROW_HEADER = 58;
    ATSPI_ROLE_TEAROFF_MENU_ITEM = 59;
    ATSPI_ROLE_TERMINAL = 60;
    ATSPI_ROLE_TEXT = 61;
    ATSPI_ROLE_TOGGLE_BUTTON = 62;
    ATSPI_ROLE_TOOL_BAR = 63;
    ATSPI_ROLE_TOOL_TIP = 64;
    ATSPI_ROLE_TREE = 65;
    ATSPI_ROLE_TREE_TABLE = 66;
    ATSPI_ROLE_UNKNOWN = 67;
    ATSPI_ROLE_VIEWPORT = 68;
    ATSPI_ROLE_WINDOW = 69;
    ATSPI_ROLE_EXTENDED = 70;
    ATSPI_ROLE_HEADER = 71;
    ATSPI_ROLE_FOOTER = 72;
    ATSPI_ROLE_PARAGRAPH = 73;
    ATSPI_ROLE_RULER = 74;
    ATSPI_ROLE_APPLICATION = 75;
    ATSPI_ROLE_AUTOCOMPLETE = 76;
    ATSPI_ROLE_EDITBAR = 77;
    ATSPI_ROLE_EMBEDDED = 78;
    ATSPI_ROLE_ENTRY = 79;
    ATSPI_ROLE_CHART = 80;
    ATSPI_ROLE_CAPTION = 81;
    ATSPI_ROLE_DOCUMENT_FRAME = 82;
    ATSPI_ROLE_HEADING = 83;
    ATSPI_ROLE_PAGE = 84;
    ATSPI_ROLE_SECTION = 85;
    ATSPI_ROLE_REDUNDANT_OBJECT = 86;
    ATSPI_ROLE_FORM = 87;
    ATSPI_ROLE_LINK = 88;
    ATSPI_ROLE_INPUT_METHOD_WINDOW = 89;
    ATSPI_ROLE_TABLE_ROW = 90;
    ATSPI_ROLE_TREE_ITEM = 91;
    ATSPI_ROLE_DOCUMENT_SPREADSHEET = 92;
    ATSPI_ROLE_DOCUMENT_PRESENTATION = 93;
    ATSPI_ROLE_DOCUMENT_TEXT = 94;
    ATSPI_ROLE_DOCUMENT_WEB = 95;
    ATSPI_ROLE_DOCUMENT_EMAIL = 96;
    ATSPI_ROLE_COMMENT = 97;
    ATSPI_ROLE_LIST_BOX = 98;
    ATSPI_ROLE_GROUPING = 99;
    ATSPI_ROLE_IMAGE_MAP = 100;
    ATSPI_ROLE_NOTIFICATION = 101;
    ATSPI_ROLE_INFO_BAR = 102;
    ATSPI_ROLE_LEVEL_BAR = 103;
    ATSPI_ROLE_TITLE_BAR = 104;
    ATSPI_ROLE_BLOCK_QUOTE = 105;
    ATSPI_ROLE_AUDIO = 106;
    ATSPI_ROLE_VIDEO = 107;
    ATSPI_ROLE_DEFINITION = 108;
    ATSPI_ROLE_ARTICLE = 109;
    ATSPI_ROLE_LANDMARK = 110;
    ATSPI_ROLE_LOG = 111;
    ATSPI_ROLE_MARQUEE = 112;
    ATSPI_ROLE_MATH = 113;
    ATSPI_ROLE_RATING = 114;
    ATSPI_ROLE_TIMER = 115;
    ATSPI_ROLE_STATIC = 116;
    ATSPI_ROLE_MATH_FRACTION = 117;
    ATSPI_ROLE_MATH_ROOT = 118;
    ATSPI_ROLE_SUBSCRIPT = 119;
    ATSPI_ROLE_SUPERSCRIPT = 120;
    ATSPI_ROLE_DESCRIPTION_LIST = 121;
    ATSPI_ROLE_DESCRIPTION_TERM = 122;
    ATSPI_ROLE_DESCRIPTION_VALUE = 123;
    ATSPI_ROLE_FOOTNOTE = 124;
    ATSPI_ROLE_CONTENT_DELETION = 125;
    ATSPI_ROLE_CONTENT_INSERTION = 126;
    ATSPI_ROLE_MARK = 127;
    ATSPI_ROLE_SUGGESTION = 128;
    ATSPI_ROLE_PUSH_BUTTON_MENU = 129;
    ATSPI_ROLE_LAST_DEFINED = 130;
;
{*
 * ATSPI_ROLE_COUNT:
 *
 * One higher than the highest valid value of #AtspiRole.
  }
  ATSPI_ROLE_COUNT = 130+1;  
type
  PAtspiCache = ^TAtspiCache;
  TAtspiCache =  Longint;
  Const
    ATSPI_CACHE_NONE = 0;
    ATSPI_CACHE_PARENT = 1 shl 0;
    ATSPI_CACHE_CHILDREN = 1 shl 1;
    ATSPI_CACHE_NAME = 1 shl 2;
    ATSPI_CACHE_DESCRIPTION = 1 shl 3;
    ATSPI_CACHE_STATES = 1 shl 4;
    ATSPI_CACHE_ROLE = 1 shl 5;
    ATSPI_CACHE_INTERFACES = 1 shl 6;
    ATSPI_CACHE_ATTRIBUTES = 1 shl 7;
    ATSPI_CACHE_ALL = $3fffffff;
    ATSPI_CACHE_DEFAULT = (((((ATSPI_CACHE_PARENT or ATSPI_CACHE_CHILDREN) or ATSPI_CACHE_NAME) or ATSPI_CACHE_DESCRIPTION) or ATSPI_CACHE_STATES) or ATSPI_CACHE_ROLE) or ATSPI_CACHE_INTERFACES;
    ATSPI_CACHE_UNDEFINED = $40000000;
;
{*
   * AtspiScrollType:
   * @ATSPI_SCROLL_TOP_LEFT: Scroll the object to the top left corner of the
   * window.
   * @ATSPI_SCROLL_BOTTOM_RIGHT: Scroll the object to the bottom right corner of
   * the window.
   * @ATSPI_SCROLL_TOP_EDGE: Scroll the object to the top edge of the window.
   * @ATSPI_SCROLL_BOTTOM_EDGE: Scroll the object to the bottom edge of the
   * window.
   * @ATSPI_SCROLL_LEFT_EDGE: Scroll the object to the left edge of the
   * window.
   * @ATSPI_SCROLL_RIGHT_EDGE: Scroll the object to the right edge of the
   * window.
   * @ATSPI_SCROLL_ANYWHERE: Scroll the object to application-dependent position
   * on the window.
   *
   * Enumeration used by interface #AtspiAccessible to specify where an
   * #AtspiAccessible object should be placed on the screen when using scroll_to.
   *
    }
type
  PAtspiScrollType = ^TAtspiScrollType;
  TAtspiScrollType =  Longint;
  Const
    ATSPI_SCROLL_TOP_LEFT = 0;
    ATSPI_SCROLL_BOTTOM_RIGHT = 1;
    ATSPI_SCROLL_TOP_EDGE = 2;
    ATSPI_SCROLL_BOTTOM_EDGE = 3;
    ATSPI_SCROLL_LEFT_EDGE = 4;
    ATSPI_SCROLL_RIGHT_EDGE = 5;
    ATSPI_SCROLL_ANYWHERE = 6;
;
{*
 * ATSPI_SCROLLTYPE_COUNT:
 *
 * One higher than the highest valid value of #AtspiScrollType.
  }
  ATSPI_SCROLLTYPE_COUNT = 6+1;  
{*
   * AtspiLive:
   * @ATSPI_LIVE_NONE: No live region.
   * @ATSPI_LIVE_POLITE: This live region should be considered polite.
   * @ATSPI_LIVE_ASSERTIVE: This live region should be considered assertive.
   *
   * Enumeration used to indicate a type of live region and how assertive it
   * should be in terms of speaking notifications. Currently, this is only used
   * for "announcement" events, but it may be used for additional purposes
   * in the future.
    }
type
  PAtspiLive = ^TAtspiLive;
  TAtspiLive =  Longint;
  Const
    ATSPI_LIVE_NONE = 0;
    ATSPI_LIVE_POLITE = 1;
    ATSPI_LIVE_ASSERTIVE = 2;
;
  ATSPI_DBUS_NAME_REGISTRY = 'org.a11y.atspi.Registry';  
  ATSPI_DBUS_PATH_REGISTRY = '/org/a11y/atspi/registry';  
  ATSPI_DBUS_INTERFACE_REGISTRY = 'org.a11y.atspi.Registry';  
  ATSPI_DBUS_PATH_NULL = '/org/a11y/atspi/null';  
  ATSPI_DBUS_PATH_ROOT = '/org/a11y/atspi/accessible/root';  
  ATSPI_DBUS_PATH_DEC = '/org/a11y/atspi/registry/deviceeventcontroller';  
  ATSPI_DBUS_INTERFACE_DEC = 'org.a11y.atspi.DeviceEventController';  
  ATSPI_DBUS_INTERFACE_DEVICE_EVENT_LISTENER = 'org.a11y.atspi.DeviceEventListener';  
  ATSPI_DBUS_INTERFACE_CACHE = 'org.a11y.atspi.Cache';  
  ATSPI_DBUS_INTERFACE_ACCESSIBLE = 'org.a11y.atspi.Accessible';  
  ATSPI_DBUS_INTERFACE_ACTION = 'org.a11y.atspi.Action';  
  ATSPI_DBUS_INTERFACE_APPLICATION = 'org.a11y.atspi.Application';  
  ATSPI_DBUS_INTERFACE_COLLECTION = 'org.a11y.atspi.Collection';  
  ATSPI_DBUS_INTERFACE_COMPONENT = 'org.a11y.atspi.Component';  
  ATSPI_DBUS_INTERFACE_DOCUMENT = 'org.a11y.atspi.Document';  
  ATSPI_DBUS_INTERFACE_EDITABLE_TEXT = 'org.a11y.atspi.EditableText';  
  ATSPI_DBUS_INTERFACE_EVENT_KEYBOARD = 'org.a11y.atspi.Event.Keyboard';  
  ATSPI_DBUS_INTERFACE_EVENT_MOUSE = 'org.a11y.atspi.Event.Mouse';  
  ATSPI_DBUS_INTERFACE_EVENT_OBJECT = 'org.a11y.atspi.Event.Object';  
  ATSPI_DBUS_INTERFACE_HYPERLINK = 'org.a11y.atspi.Hyperlink';  
  ATSPI_DBUS_INTERFACE_HYPERTEXT = 'org.a11y.atspi.Hypertext';  
  ATSPI_DBUS_INTERFACE_IMAGE = 'org.a11y.atspi.Image';  
  ATSPI_DBUS_INTERFACE_SELECTION = 'org.a11y.atspi.Selection';  
  ATSPI_DBUS_INTERFACE_TABLE = 'org.a11y.atspi.Table';  
  ATSPI_DBUS_INTERFACE_TABLE_CELL = 'org.a11y.atspi.TableCell';  
  ATSPI_DBUS_INTERFACE_TEXT = 'org.a11y.atspi.Text';  
  ATSPI_DBUS_INTERFACE_VALUE = 'org.a11y.atspi.Value';  
  ATSPI_DBUS_INTERFACE_SOCKET = 'org.a11y.atspi.Socket';  
  ATSPI_DBUS_PATH_SCREEN_READER = '/org/a11y/atspi/screenreader';  
  ATSPI_DBUS_INTERFACE_EVENT_SCREEN_READER = 'org.a11y.atspi.Event.ScreenReader';  
{ C++ end of extern C conditionnal removed }
{$endif}
{ _ATSPI_CONSTANTS_H_  }

implementation


end.
