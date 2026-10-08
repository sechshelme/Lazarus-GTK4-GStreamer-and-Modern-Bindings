/* Copyright (C) 2005-2023 Free Software Foundation, Inc.
   Contributed by Richard Henderson <rth@redhat.com>.

   This file is part of the GNU Offloading and Multi Processing Library
   (libgomp).

   Libgomp is free software; you can redistribute it and/or modify it
   under the terms of the GNU General Public License as published by
   the Free Software Foundation; either version 3, or (at your option)
   any later version.

   Libgomp is distributed in the hope that it will be useful, but WITHOUT ANY
   WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
   FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
   more details.

   Under Section 7 of GPL version 3, you are granted additional
   permissions described in the GCC Runtime Library Exception, version
   3.1, as published by the Free Software Foundation.

   You should have received a copy of the GNU General Public License and
   a copy of the GCC Runtime Library Exception along with this program;
   see the files COPYING3 and COPYING.RUNTIME respectively.  If not, see
   <http://www.gnu.org/licenses/>.  */

#ifndef _OMP_H
#define _OMP_H 1


 typedef struct
{
  unsigned char _x[4] 
  
} omp_lock_t;

typedef struct
{
  unsigned char _x[8 + sizeof (void *)] 
} omp_nest_lock_t;

typedef enum omp_sched_t
{
  omp_sched_static = 1,
  omp_sched_dynamic = 2,
  omp_sched_guided = 3,
  omp_sched_auto = 4,
  omp_sched_monotonic = 0x80000000U
} omp_sched_t;

typedef enum omp_proc_bind_t
{
  omp_proc_bind_false = 0,
  omp_proc_bind_true = 1,
  omp_proc_bind_primary = 2,
  omp_proc_bind_close = 3,
  omp_proc_bind_spread = 4
} omp_proc_bind_t;

typedef enum omp_sync_hint_t
{
  omp_sync_hint_none = 0,
  omp_sync_hint_uncontended = 1,
  omp_sync_hint_contended = 2,
  omp_sync_hint_nonspeculative = 4,
  omp_sync_hint_speculative = 8,
} omp_sync_hint_t;

typedef  omp_sync_hint_t omp_lock_hint_t;

typedef struct  omp_depend_t
{
  char __omp_depend_t__[2 * sizeof (void *)];
} omp_depend_t;

typedef enum omp_pause_resource_t
{
  omp_pause_soft = 1,
  omp_pause_hard = 2,
} omp_pause_resource_t;

typedef __UINTPTR_TYPE__ omp_uintptr_t;


typedef enum omp_memspace_handle_t
{
  omp_default_mem_space = 0,
  omp_large_cap_mem_space = 1,
  omp_const_mem_space = 2,
  omp_high_bw_mem_space = 3,
  omp_low_lat_mem_space = 4,
} omp_memspace_handle_t;

typedef enum omp_allocator_handle_t 
{
  omp_null_allocator = 0,
  omp_default_mem_alloc = 1,
  omp_large_cap_mem_alloc = 2,
  omp_const_mem_alloc = 3,
  omp_high_bw_mem_alloc = 4,
  omp_low_lat_mem_alloc = 5,
  omp_cgroup_mem_alloc = 6,
  omp_pteam_mem_alloc = 7,
  omp_thread_mem_alloc = 8,
} omp_allocator_handle_t;

typedef enum omp_alloctrait_key_t
{
  omp_atk_sync_hint = 1,
  omp_atk_alignment = 2,
  omp_atk_access = 3,
  omp_atk_pool_size = 4,
  omp_atk_fallback = 5,
  omp_atk_fb_data = 6,
  omp_atk_pinned = 7,
  omp_atk_partition = 8
} omp_alloctrait_key_t;

typedef enum omp_alloctrait_value_t
{
  omp_atv_default =  -1,
  omp_atv_false = 0,
  omp_atv_true = 1,
  omp_atv_contended = 3,
  omp_atv_uncontended = 4,
  omp_atv_serialized = 5,
  omp_atv_private = 6,
  omp_atv_all = 7,
  omp_atv_thread = 8,
  omp_atv_pteam = 9,
  omp_atv_cgroup = 10,
  omp_atv_default_mem_fb = 11,
  omp_atv_null_fb = 12,
  omp_atv_abort_fb = 13,
  omp_atv_allocator_fb = 14,
  omp_atv_environment = 15,
  omp_atv_nearest = 16,
  omp_atv_blocked = 17,
  omp_atv_interleaved = 18
} omp_alloctrait_value_t;

typedef struct omp_alloctrait_t
{
  omp_alloctrait_key_t key;
  omp_uintptr_t value;
} omp_alloctrait_t;

typedef enum omp_event_handle_t 
{
xxxxxxxxxxxxxx
} omp_event_handle_t;

enum xxxxxxxxx
{
  omp_initial_device = -1,
  omp_invalid_device = -4
};


extern void omp_set_num_threads (int) ;
extern int omp_get_num_threads (void) ;
extern int omp_get_max_threads (void) ;
extern int omp_get_thread_num (void) ;
extern int omp_get_num_procs (void) ;

extern int omp_in_parallel (void) ;

extern void omp_set_dynamic (int) ;
extern int omp_get_dynamic (void) ;

extern void omp_set_nested (int)  ;
extern int omp_get_nested (void)  ;

extern void omp_init_lock (omp_lock_t *) ;
extern void omp_init_lock_with_hint (omp_lock_t *, omp_sync_hint_t)
  ;
extern void omp_destroy_lock (omp_lock_t *) ;
extern void omp_set_lock (omp_lock_t *) ;
extern void omp_unset_lock (omp_lock_t *) ;
extern int omp_test_lock (omp_lock_t *) ;

extern void omp_init_nest_lock (omp_nest_lock_t *) ;
extern void omp_init_nest_lock_with_hint (omp_nest_lock_t *, omp_sync_hint_t)
  ;
extern void omp_destroy_nest_lock (omp_nest_lock_t *) ;
extern void omp_set_nest_lock (omp_nest_lock_t *) ;
extern void omp_unset_nest_lock (omp_nest_lock_t *) ;
extern int omp_test_nest_lock (omp_nest_lock_t *) ;

extern double omp_get_wtime (void) ;
extern double omp_get_wtick (void) ;

extern void omp_set_schedule (omp_sched_t, int) ;
extern void omp_get_schedule (omp_sched_t *, int *) ;
extern int omp_get_thread_limit (void) ;
extern void omp_set_max_active_levels (int) ;
extern int omp_get_max_active_levels (void) ;
extern int omp_get_supported_active_levels (void) ;
extern int omp_get_level (void) ;
extern int omp_get_ancestor_thread_num (int) ;
extern int omp_get_team_size (int) ;
extern int omp_get_active_level (void) ;

extern int omp_in_final (void) ;
extern int omp_in_explicit_task (void) ;

extern int omp_get_cancellation (void) ;
extern omp_proc_bind_t omp_get_proc_bind (void) ;
extern int omp_get_num_places (void) ;
extern int omp_get_place_num_procs (int) ;
extern void omp_get_place_proc_ids (int, int *) ;
extern int omp_get_place_num (void) ;
extern int omp_get_partition_num_places (void) ;
extern void omp_get_partition_place_nums (int *) ;

extern void omp_set_default_device (int) ;
extern int omp_get_default_device (void) ;
extern int omp_get_num_devices (void) ;
extern int omp_get_device_num (void) ;
extern int omp_get_num_teams (void) ;
extern int omp_get_team_num (void) ;

extern int omp_is_initial_device (void) ;
extern int omp_get_initial_device (void) ;
extern int omp_get_max_task_priority (void) ;

extern void omp_fulfill_event (omp_event_handle_t) ;

extern void omp_set_num_teams (int) ;
extern int omp_get_max_teams (void) ;
extern void omp_set_teams_thread_limit (int) ;
extern int omp_get_teams_thread_limit (void) ;

extern void *omp_target_alloc (size_t, int) ;
extern void omp_target_free (void *, int) ;
extern int omp_target_is_present (const void *, int) ;
extern int omp_target_memcpy (void *, const void *, size_t,
			      size_t, size_t, int, int)
  ;
extern int omp_target_memcpy_async (void *, const void *, size_t,
				    size_t, size_t, int, int,
				    int, omp_depend_t *)
  ;
extern int omp_target_memcpy_rect (void *, const void *, size_t, int,
				   const size_t *,
				   const size_t *,
				   const size_t *,
				   const size_t *,
				   const size_t *, int, int)
  ;
extern int omp_target_memcpy_rect_async (void *, const void *, size_t,
					 int, const size_t *,
					 const size_t *,
					 const size_t *,
					 const size_t *,
					 const size_t *, int, int, int,
					 omp_depend_t *)
  ;
extern int omp_target_associate_ptr (const void *, const void *, size_t,
				     size_t, int) ;
extern int omp_target_disassociate_ptr (const void *, int) ;
extern void *omp_get_mapped_ptr (const void *, int) ;
extern int omp_target_is_accessible (const void *, size_t, int)
  ;

extern void omp_set_affinity_format (const char *) ;
extern size_t omp_get_affinity_format (char *, size_t)
  ;
extern void omp_display_affinity (const char *) ;
extern size_t omp_capture_affinity (char *, size_t, const char *)
  ;

extern int omp_pause_resource (omp_pause_resource_t, int) ;
extern int omp_pause_resource_all (omp_pause_resource_t) ;

extern omp_allocator_handle_t omp_init_allocator (omp_memspace_handle_t,
						  int,
						  const omp_alloctrait_t *)
  ;
extern void omp_destroy_allocator (omp_allocator_handle_t) ;
extern void omp_set_default_allocator (omp_allocator_handle_t) ;
extern omp_allocator_handle_t omp_get_default_allocator (void) ;
extern void omp_free (void *,
		      omp_allocator_handle_t )
  ;


extern void *omp_alloc (size_t,
			omp_allocator_handle_t );
extern void *omp_aligned_alloc (size_t, size_t,
				omp_allocator_handle_t
				);
extern void *omp_calloc (size_t, size_t,
			 omp_allocator_handle_t )
;
extern void *omp_aligned_calloc (size_t, size_t, size_t,
				 omp_allocator_handle_t
				 );
extern void *omp_realloc (void *, size_t,
			  omp_allocator_handle_t ,
			  omp_allocator_handle_t )
;

extern void omp_display_env (int) ;

#ifdef __cplusplus
}
#endif

#endif /* _OMP_H */
