{$IFDEF read_interface}


{
 * Copyright © 2020 Red Hat, Inc.
 *
 * Permission is hereby granted, free of charge, to any person obtaining a
 * copy of this software and associated documentation files (the "Software"),
 * to deal in the Software without restriction, including without limitation
 * the rights to use, copy, modify, merge, publish, distribute, sublicense,
 * and/or sell copies of the Software, and to permit persons to whom the
 * Software is furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice (including the next
 * paragraph) shall be included in all copies or substantial portions of the
 * Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
 * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
 * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
 * DEALINGS IN THE SOFTWARE.
  }
{$ifndef _XKBREGISTRY_H_}
{$define _XKBREGISTRY_H_}
{$include <stdarg.h>}
{$include <stdbool.h>}
{*
 * @file
 * @brief Query for available RMLVO
 *
  }
{ C++ extern C conditionnal removed }
{*
 * @defgroup registry Query for available RMLVO
 *
 * The libxkbregistry API to query for available rules, models, layouts,
 * variants and options (RMLVO). libxkbregistry is a separate library to
 * libxkbcommon.
 *
 * This library is the replacement for clients currently parsing evdev.xml
 * directly. The library is intended to provide easy access to the set of
 * **possible** MLVO configurations for a given ruleset. It is not a library to
 * apply these configurations, merely to enumerate them. The intended users of
 * this library are the configuration UIs that allow a user to select their
 * keyboard layout of choice.
 *
 * @
  }
{*
 * @struct rxkb_context
 *
 * Opaque top level library context object.
 *
 * The context contains general library state, like include paths and parsed
 * data. Objects are created in a specific context, and multiple contexts
 * may coexist simultaneously. Objects from different contexts are
 * completely separated and do not share any memory or state.
  }
type
  Prxkb_context = ^Trxkb_context;
  Trxkb_context = record
      {undefined structure}
    end;

{*
 * @struct rxkb_model
 *
 * Opaque struct representing an XKB model.
  }
  Prxkb_model = ^Trxkb_model;
  Trxkb_model = record
      {undefined structure}
    end;

{*
 * @struct rxkb_layout
 *
 * Opaque struct representing an XKB layout, including an optional variant.
 * Where the variant is NULL, the layout is the base layout.
 *
 * For example, "us" is the base layout, "us(intl)" is the "intl" variant of the
 * layout "us".
  }
  Prxkb_layout = ^Trxkb_layout;
  Trxkb_layout = record
      {undefined structure}
    end;

{*
 * @struct rxkb_option_group
 *
 * Opaque struct representing an option group. Option groups divide the
 * individual options into logical groups. Their main purpose is to indicate
 * whether some options are mutually exclusive or not.
  }
  Prxkb_option_group = ^Trxkb_option_group;
  Trxkb_option_group = record
      {undefined structure}
    end;

{*
 * @struct rxkb_option
 *
 * Opaque struct representing an XKB option. Options are grouped inside an @ref
 * rxkb_option_group.
  }
  Prxkb_option = ^Trxkb_option;
  Trxkb_option = record
      {undefined structure}
    end;

{*
 *
 * @struct rxkb_iso639_code
 *
 * Opaque struct representing an ISO 639-3 code (e.g. "eng", "fra"). There
 * is no guarantee that two identical ISO codes share the same struct. You
 * must not rely on the pointer value of this struct.
 *
 * See https://iso639-3.sil.org/code_tables/639/data for a list of codes.
  }
  Prxkb_iso639_code = ^Trxkb_iso639_code;
  Trxkb_iso639_code = record
      {undefined structure}
    end;

{*
 *
 * @struct rxkb_iso3166_code
 *
 * Opaque struct representing an ISO 3166 Alpha 2 code (e.g. "US", "FR").
 * There is no guarantee that two identical ISO codes share the same struct.
 * You must not rely on the pointer value of this struct.
 *
 * See https://en.wikipedia.org/wiki/List_of_ISO_3166_country_codes for a list
 * of codes.
  }
  Prxkb_iso3166_code = ^Trxkb_iso3166_code;
  Trxkb_iso3166_code = record
      {undefined structure}
    end;

{*
 * Describes the popularity of an item. Historically, some highly specialized or
 * experimental definitions are excluded from the default list and shipped in
 * separate files. If these extra definitions are loaded (see @ref
 * RXKB_CONTEXT_LOAD_EXOTIC_RULES), the popularity of the item is set
 * accordingly.
 *
 * If the exotic items are not loaded, all items will have the standard
 * popularity.
  }
  Trxkb_popularity =  Longint;
  Const
    RXKB_POPULARITY_STANDARD = 1;
    RXKB_POPULARITY_EXOTIC = 2;

{*
 * Flags for context creation.
  }
{*
     * Skip the default include paths. This requires the caller to call
     * rxkb_context_include_path_append() or
     * rxkb_context_include_path_append_default().
      }
{*
     * Load the extra items that are considered too exotic for the default list.
     *
     * For historical reasons, xkeyboard-config ships those exotic rules in a
     * separate file (e.g. `evdev.extras.xml`). Where the exotic rules are
     * requested, libxkbregistry will look for and load `$ruleset.extras.xml`
     * in the include paths, see rxkb_context_include_path_append() for details
     * on the lookup behavior.
      }
{*
     * Disable the use of secure_getenv for this context, so that privileged
     * processes can use environment variables. Client uses at their own risk.
     *
     * @since 1.5.0
      }
type
  Trxkb_context_flags =  Longint;
  Const
    RXKB_CONTEXT_NO_FLAGS = 0;
    RXKB_CONTEXT_NO_DEFAULT_INCLUDES = 1 shl 0;
    RXKB_CONTEXT_LOAD_EXOTIC_RULES = 1 shl 1;
    RXKB_CONTEXT_NO_SECURE_GETENV = 1 shl 2;

{*
 * Create a new xkb registry context.
 *
 * The context has an initial refcount of 1. Use rxkb_context_unref() to release
 * memory associated with this context.
 *
 * Creating a context does not parse the files yet, use
 * rxkb_context_parse().
 *
 * @param flags Flags affecting context behavior
 * @return A new xkb registry context or NULL on failure
  }

function rxkb_context_new(flags:Trxkb_context_flags):Prxkb_context;cdecl;external libxkbregistry;
{* Specifies a logging level.  }
{*< Log critical internal errors only.  }
{*< Log all errors.  }
{*< Log warnings and errors.  }
{*< Log information, warnings, and errors.  }
{*< Log everything.  }
type
  Trxkb_log_level =  Longint;
  Const
    RXKB_LOG_LEVEL_CRITICAL = 10;
    RXKB_LOG_LEVEL_ERROR = 20;
    RXKB_LOG_LEVEL_WARNING = 30;
    RXKB_LOG_LEVEL_INFO = 40;
    RXKB_LOG_LEVEL_DEBUG = 50;

{*
 * Set the current logging level.
 *
 * @param ctx     The context in which to set the logging level.
 * @param level   The logging level to use.  Only messages from this level
 * and below will be logged.
 *
 * The default level is RXKB_LOG_LEVEL_ERROR.  The environment variable
 * RXKB_LOG_LEVEL, if set at the time the context was created, overrides the
 * default value.  It may be specified as a level number or name.
  }

procedure rxkb_context_set_log_level(ctx:Prxkb_context; level:Trxkb_log_level);cdecl;external libxkbregistry;
{*
 * Get the current logging level.
  }
function rxkb_context_get_log_level(ctx:Prxkb_context):Trxkb_log_level;cdecl;external libxkbregistry;
{*
 * Set a custom function to handle logging messages.
 *
 * @param ctx     The context in which to use the set logging function.
 * @param log_fn  The function that will be called for logging messages.
 * Passing NULL restores the default function, which logs to stderr.
 *
 * By default, log messages from this library are printed to stderr.  This
 * function allows you to replace the default behavior with a custom
 * handler.  The handler is only called with messages which match the
 * current logging level and verbosity settings for the context.
 * level is the logging level of the message.  @a format and @a args are
 * the same as in the vprintf(3) function.
 *
 * You may use rxkb_context_set_user_data() on the context, and then call
 * rxkb_context_get_user_data() from within the logging function to provide
 * it with additional private context.
  }
procedure rxkb_context_set_log_fn(ctx:Prxkb_context; log_fn:procedure (ctx:Prxkb_context; level:Trxkb_log_level; format:Pchar; args:Tva_list));cdecl;external libxkbregistry;
{*
 * Parse the given ruleset. This can only be called once per context and once
 * parsed the data in the context is considered constant and will never
 * change.
 *
 * This function parses all files with the given ruleset name. See
 * rxkb_context_include_path_append() for details.
 *
 * If this function returns false, libxkbregistry failed to parse the xml files.
 * This is usually caused by invalid files on the host and should be debugged by
 * the host's administrator using external tools. Callers should reduce the
 * include paths to known good paths and/or fall back to a default RMLVO set.
 *
 * If this function returns false, the context should be be considered dead and
 * must be released with rxkb_context_unref().
 *
 * @param ctx The xkb registry context
 * @param ruleset The ruleset to parse, e.g. "evdev"
 * @return true on success or false on failure
  }
function rxkb_context_parse(ctx:Prxkb_context; ruleset:Pchar):Tbool;cdecl;external libxkbregistry;
{*
 * Parse the default ruleset as configured at build time. See
 * rxkb_context_parse() for details.
  }
function rxkb_context_parse_default_ruleset(ctx:Prxkb_context):Tbool;cdecl;external libxkbregistry;
{*
 * Increases the refcount of this object by one and returns the object.
 *
 * @param ctx The xkb registry context
 * @return The passed in object
  }
function rxkb_context_ref(ctx:Prxkb_context):Prxkb_context;cdecl;external libxkbregistry;
{*
 * Decreases the refcount of this object by one. Where the refcount of an
 * object hits zero, associated resources will be freed.
 *
 * @param ctx The xkb registry context
 * @return always NULL
  }
function rxkb_context_unref(ctx:Prxkb_context):Prxkb_context;cdecl;external libxkbregistry;
{*
 * Assign user-specific data. libxkbregistry will not look at or modify the
 * data, it will merely return the same pointer in
 * rxkb_context_get_user_data().
 *
 * @param ctx The xkb registry context
 * @param user_data User-specific data pointer
  }
procedure rxkb_context_set_user_data(ctx:Prxkb_context; user_data:pointer);cdecl;external libxkbregistry;
{*
 * Return the pointer passed into rxkb_context_get_user_data().
 *
 * @param ctx The xkb registry context
 * @return User-specific data pointer
  }
function rxkb_context_get_user_data(ctx:Prxkb_context):pointer;cdecl;external libxkbregistry;
{*
 * Append a new entry to the context's include path.
 *
 * The include path handling is optimized for the most common use-case: a set of
 * system files that provide a complete set of MLVO and some
 * custom MLVO provided by a user **in addition** to the system set.
 *
 * The include paths should be given so that the least complete path is
 * specified first and the most complete path is appended last. For example:
 *
 * @code
 *    ctx = rxkb_context_new(RXKB_CONTEXT_NO_DEFAULT_INCLUDES);
 *    rxkb_context_include_path_append(ctx, "/home/user/.config/xkb");
 *    rxkb_context_include_path_append(ctx, "/usr/share/X11/xkb");
 *    rxkb_context_parse(ctx, "evdev");
 * @endcode
 *
 * The above example reflects the default behavior unless @ref
 * RXKB_CONTEXT_NO_DEFAULT_INCLUDES is provided.
 *
 * Loading of the files is in **reverse order**, i.e. the last path appended is
 * loaded first - in this case the ``/usr/share/X11/xkb`` path.
 * Any models, layouts, variants and options defined in the "evdev" ruleset
 * are loaded into the context. Then, any RMLVO found in the "evdev" ruleset of
 * the user's path (``/home/user/.config/xkb`` in this example) are **appended**
 * to the existing set.
 *
 * Note that data from previously loaded include paths is never overwritten,
 * only appended to. It is not not possible to change the system-provided data,
 * only to append new models, layouts, variants and options to it.
 *
 * In other words, to define a new variant of the "us" layout called "banana",
 * the following XML is sufficient.
 *
 * @verbatim
 * <xkbConfigRegistry version="1.1">
 * <layoutList>
 *   <layout>
 *     <configItem>
 *       <name>us</name>
 *     </configItem>
 *     <variantList>
 *       <variant>
 *         <configItem>
 *          <name>banana</name>
 *          <description>English (Banana)</description>
 *        </configItem>
 *      </variant>
 *    </layout>
 * </layoutList>
 * </xkbConfigRegistry>
 * @endverbatim
 *
 * The list of models, options and all other layouts (including "us" and its
 * variants) is taken from the system files. The resulting list of layouts will
 * thus have a "us" keyboard layout with the variant "banana" and all other
 * system-provided variants (dvorak, colemak, intl, etc.)
 *
 * This function must be called before rxkb_context_parse() or
 * rxkb_context_parse_default_ruleset().
 *
 * @returns true on success, or false if the include path could not be added
 * or is inaccessible.
  }
function rxkb_context_include_path_append(ctx:Prxkb_context; path:Pchar):Tbool;cdecl;external libxkbregistry;
{*
 * Append the default include paths to the context's include path.
 * See rxkb_context_include_path_append() for details about the merge order.
 *
 * This function must be called before rxkb_context_parse() or
 * rxkb_context_parse_default_ruleset().
 *
 * @returns true on success, or false if the include path could not be added
 * or is inaccessible.
  }
function rxkb_context_include_path_append_default(ctx:Prxkb_context):Tbool;cdecl;external libxkbregistry;
{*
 * Return the first model for this context. Use this to start iterating over
 * the models, followed by calls to rxkb_model_next(). Models are not sorted.
 *
 * The refcount of the returned model is not increased. Use rxkb_model_ref() if
 * you need to keep this struct outside the immediate scope.
 *
 * @return The first model in the model list.
  }
function rxkb_model_first(ctx:Prxkb_context):Prxkb_model;cdecl;external libxkbregistry;
{*
 * Return the next model for this context. Returns NULL when no more models
 * are available.
 *
 * The refcount of the returned model is not increased. Use rxkb_model_ref() if
 * you need to keep this struct outside the immediate scope.
 *
 * @return the next model or NULL at the end of the list
  }
function rxkb_model_next(m:Prxkb_model):Prxkb_model;cdecl;external libxkbregistry;
{*
 * Increase the refcount of the argument by one.
 *
 * @returns The argument passed in to this function.
  }
function rxkb_model_ref(m:Prxkb_model):Prxkb_model;cdecl;external libxkbregistry;
{*
 * Decrease the refcount of the argument by one. When the refcount hits zero,
 * all memory associated with this struct is freed.
 *
 * @returns always NULL
  }
function rxkb_model_unref(m:Prxkb_model):Prxkb_model;cdecl;external libxkbregistry;
{*
 * Return the name of this model. This is the value for M in RMLVO, to be used
 * with libxkbcommon.
  }
function rxkb_model_get_name(m:Prxkb_model):Pchar;cdecl;external libxkbregistry;
{*
 * Return a human-readable description of this model. This function may return
 * NULL.
  }
function rxkb_model_get_description(m:Prxkb_model):Pchar;cdecl;external libxkbregistry;
{*
 * Return the vendor name for this model. This function may return NULL.
  }
function rxkb_model_get_vendor(m:Prxkb_model):Pchar;cdecl;external libxkbregistry;
{*
 * Return the popularity for this model.
  }
function rxkb_model_get_popularity(m:Prxkb_model):Trxkb_popularity;cdecl;external libxkbregistry;
{*
 * Return the first layout for this context. Use this to start iterating over
 * the layouts, followed by calls to rxkb_layout_next(). Layouts are not sorted.
 *
 * The refcount of the returned layout is not increased. Use rxkb_layout_ref() if
 * you need to keep this struct outside the immediate scope.
 *
 * @return The first layout in the layout list.
  }
function rxkb_layout_first(ctx:Prxkb_context):Prxkb_layout;cdecl;external libxkbregistry;
{*
 * Return the next layout for this context. Returns NULL when no more layouts
 * are available.
 *
 * The refcount of the returned layout is not increased. Use rxkb_layout_ref()
 * if you need to keep this struct outside the immediate scope.
 *
 * @return the next layout or NULL at the end of the list
  }
function rxkb_layout_next(l:Prxkb_layout):Prxkb_layout;cdecl;external libxkbregistry;
{*
 * Increase the refcount of the argument by one.
 *
 * @returns The argument passed in to this function.
  }
function rxkb_layout_ref(l:Prxkb_layout):Prxkb_layout;cdecl;external libxkbregistry;
{*
 * Decrease the refcount of the argument by one. When the refcount hits zero,
 * all memory associated with this struct is freed.
 *
 * @returns always NULL
  }
function rxkb_layout_unref(l:Prxkb_layout):Prxkb_layout;cdecl;external libxkbregistry;
{*
 * Return the name of this layout. This is the value for L in RMLVO, to be used
 * with libxkbcommon.
  }
function rxkb_layout_get_name(l:Prxkb_layout):Pchar;cdecl;external libxkbregistry;
{*
 * Return the variant of this layout. This is the value for V in RMLVO, to be
 * used with libxkbcommon.
 *
 * A variant does not stand on its own, it always depends on the base layout.
 * e.g. there may be multiple variants called "intl" but there is only one
 * "us(intl)".
 *
 * Where the variant is NULL, the layout is the base layout (e.g. "us").
  }
function rxkb_layout_get_variant(l:Prxkb_layout):Pchar;cdecl;external libxkbregistry;
{*
 * Return a short (one-word) description of this layout. This function may
 * return NULL.
  }
function rxkb_layout_get_brief(l:Prxkb_layout):Pchar;cdecl;external libxkbregistry;
{*
 * Return a human-readable description of this layout. This function may return
 * NULL.
  }
function rxkb_layout_get_description(l:Prxkb_layout):Pchar;cdecl;external libxkbregistry;
{*
 * Return the popularity for this layout.
  }
function rxkb_layout_get_popularity(l:Prxkb_layout):Trxkb_popularity;cdecl;external libxkbregistry;
{*
 * Return the first option group for this context. Use this to start iterating
 * over the option groups, followed by calls to rxkb_option_group_next().
 * Option groups are not sorted.
 *
 * The refcount of the returned option group is not increased. Use
 * rxkb_option_group_ref() if you need to keep this struct outside the immediate
 * scope.
 *
 * @return The first option group in the option group list.
  }
function rxkb_option_group_first(ctx:Prxkb_context):Prxkb_option_group;cdecl;external libxkbregistry;
{*
 * Return the next option group for this context. Returns NULL when no more
 * option groups are available.
 *
 * The refcount of the returned option group is not increased. Use
 * rxkb_option_group_ref() if you need to keep this struct outside the immediate
 * scope.
 *
 * @return the next option group or NULL at the end of the list
  }
function rxkb_option_group_next(g:Prxkb_option_group):Prxkb_option_group;cdecl;external libxkbregistry;
{*
 * Increase the refcount of the argument by one.
 *
 * @returns The argument passed in to this function.
  }
function rxkb_option_group_ref(g:Prxkb_option_group):Prxkb_option_group;cdecl;external libxkbregistry;
{*
 * Decrease the refcount of the argument by one. When the refcount hits zero,
 * all memory associated with this struct is freed.
 *
 * @returns always NULL
  }
function rxkb_option_group_unref(g:Prxkb_option_group):Prxkb_option_group;cdecl;external libxkbregistry;
{*
 * Return the name of this option group. This is **not** the value for O in
 * RMLVO, the name can be used for internal sorting in the caller. This function
 * may return NULL.
  }
function rxkb_option_group_get_name(m:Prxkb_option_group):Pchar;cdecl;external libxkbregistry;
{*
 * Return a human-readable description of this option group. This function may
 * return NULL.
  }
function rxkb_option_group_get_description(m:Prxkb_option_group):Pchar;cdecl;external libxkbregistry;
{*
 * @return true if multiple options within this option group can be selected
 *              simultaneously, false if all options within this option group
 *              are mutually exclusive.
  }
function rxkb_option_group_allows_multiple(g:Prxkb_option_group):Tbool;cdecl;external libxkbregistry;
{*
 * Return the popularity for this option group.
  }
function rxkb_option_group_get_popularity(g:Prxkb_option_group):Trxkb_popularity;cdecl;external libxkbregistry;
{*
 * Return the first option for this option group. Use this to start iterating
 * over the options, followed by calls to rxkb_option_next(). Options are not
 * sorted.
 *
 * The refcount of the returned option is not increased. Use rxkb_option_ref()
 * if you need to keep this struct outside the immediate scope.
 *
 * @return The first option in the option list.
  }
function rxkb_option_first(group:Prxkb_option_group):Prxkb_option;cdecl;external libxkbregistry;
{*
 * Return the next option for this option group. Returns NULL when no more
 * options are available.
 *
 * The refcount of the returned options is not increased. Use rxkb_option_ref()
 * if you need to keep this struct outside the immediate scope.
 *
 * @returns The next option or NULL at the end of the list
  }
function rxkb_option_next(o:Prxkb_option):Prxkb_option;cdecl;external libxkbregistry;
{*
 * Increase the refcount of the argument by one.
 *
 * @returns The argument passed in to this function.
  }
function rxkb_option_ref(o:Prxkb_option):Prxkb_option;cdecl;external libxkbregistry;
{*
 * Decrease the refcount of the argument by one. When the refcount hits zero,
 * all memory associated with this struct is freed.
 *
 * @returns always NULL
  }
function rxkb_option_unref(o:Prxkb_option):Prxkb_option;cdecl;external libxkbregistry;
{*
 * Return the name of this option. This is the value for O in RMLVO, to be used
 * with libxkbcommon.
  }
function rxkb_option_get_name(o:Prxkb_option):Pchar;cdecl;external libxkbregistry;
{*
 * Return a short (one-word) description of this option. This function may
 * return NULL.
  }
function rxkb_option_get_brief(o:Prxkb_option):Pchar;cdecl;external libxkbregistry;
{*
 * Return a human-readable description of this option. This function may return
 * NULL.
  }
function rxkb_option_get_description(o:Prxkb_option):Pchar;cdecl;external libxkbregistry;
{*
 * Return the popularity for this option.
  }
function rxkb_option_get_popularity(o:Prxkb_option):Trxkb_popularity;cdecl;external libxkbregistry;
{*
 * Increase the refcount of the argument by one.
 *
 * @returns The argument passed in to this function.
  }
function rxkb_iso639_code_ref(iso639:Prxkb_iso639_code):Prxkb_iso639_code;cdecl;external libxkbregistry;
{*
 * Decrease the refcount of the argument by one. When the refcount hits zero,
 * all memory associated with this struct is freed.
 *
 * @returns always NULL
  }
function rxkb_iso639_code_unref(iso639:Prxkb_iso639_code):Prxkb_iso639_code;cdecl;external libxkbregistry;
{*
 * Return the ISO 639-3 code for this code (e.g. "eng", "fra").
  }
function rxkb_iso639_code_get_code(iso639:Prxkb_iso639_code):Pchar;cdecl;external libxkbregistry;
{*
 * Return the first ISO 639 for this layout. Use this to start iterating over
 * the codes, followed by calls to rxkb_iso639_code_next(). Codes are not
 * sorted.
 *
 * The refcount of the returned code is not increased. Use rxkb_iso639_code_ref()
 * if you need to keep this struct outside the immediate scope.
 *
 * @return The first code in the code list.
  }
function rxkb_layout_get_iso639_first(layout:Prxkb_layout):Prxkb_iso639_code;cdecl;external libxkbregistry;
{*
 * Return the next code in the list. Returns NULL when no more codes
 * are available.
 *
 * The refcount of the returned codes is not increased. Use
 * rxkb_iso639_code_ref() if you need to keep this struct outside the immediate
 * scope.
 *
 * @returns The next code or NULL at the end of the list
  }
function rxkb_iso639_code_next(iso639:Prxkb_iso639_code):Prxkb_iso639_code;cdecl;external libxkbregistry;
{*
 * Increase the refcount of the argument by one.
 *
 * @returns The argument passed in to this function.
  }
function rxkb_iso3166_code_ref(iso3166:Prxkb_iso3166_code):Prxkb_iso3166_code;cdecl;external libxkbregistry;
{*
 * Decrease the refcount of the argument by one. When the refcount hits zero,
 * all memory associated with this struct is freed.
 *
 * @returns always NULL
  }
function rxkb_iso3166_code_unref(iso3166:Prxkb_iso3166_code):Prxkb_iso3166_code;cdecl;external libxkbregistry;
{*
 * Return the ISO 3166 Alpha 2 code for this code (e.g. "US", "FR").
  }
function rxkb_iso3166_code_get_code(iso3166:Prxkb_iso3166_code):Pchar;cdecl;external libxkbregistry;
{*
 * Return the first ISO 3166 for this layout. Use this to start iterating over
 * the codes, followed by calls to rxkb_iso3166_code_next(). Codes are not
 * sorted.
 *
 * The refcount of the returned code is not increased. Use
 * rxkb_iso3166_code_ref() if you need to keep this struct outside the immediate
 * scope.
 *
 * @return The first code in the code list.
  }
function rxkb_layout_get_iso3166_first(layout:Prxkb_layout):Prxkb_iso3166_code;cdecl;external libxkbregistry;
{*
 * Return the next code in the list. Returns NULL when no more codes
 * are available.
 *
 * The refcount of the returned codes is not increased. Use
 * rxkb_iso3166_code_ref() if you need to keep this struct outside the immediate
 * scope.
 *
 * @returns The next code or NULL at the end of the list
  }
function rxkb_iso3166_code_next(iso3166:Prxkb_iso3166_code):Prxkb_iso3166_code;cdecl;external libxkbregistry;
{* @  }
{$endif}
{ _XKBREGISTRY_H_  }

// === Konventiert am: 14-6-26 17:33:27 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
