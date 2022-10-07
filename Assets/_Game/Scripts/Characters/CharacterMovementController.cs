using System;
using System.Linq;
using _Framework;
using DG.Tweening;
using Sirenix.OdinInspector;
using UnityEngine;
using UnityEngine.Events;

namespace _Game.Scripts.Characters
{
    public class CharacterMovementController : MonoBehaviour
    {
        [OnStateUpdate("MoveToStartPoint")] [SerializeField] private Transform _startPoint;
        [SerializeField] private UnityEvent _onCompletePath;
        [SerializeField] private FloatVariable _moveSpeed;

        public event Action OnCompletedPath;

        private Sequence _moveSequence;
        private Tween _moveTween;

        void Awake()
        {
            MoveToStartPoint();
        }

        public void MoveToStartPoint()
        {
            if (_startPoint != null)
            {
                transform.position = _startPoint.position;
            }
        }

        public void FollowPath(Transform[] waypoints)
        {
            if (_moveSequence != null)
            {
                _moveSequence.Kill();
            }
            
            _moveSequence = DOTween.Sequence();
            
            foreach (var waypoint in waypoints)
            {
                var tween = transform.DOMove(waypoint.position, _moveSpeed.Value).SetSpeedBased().SetEase(Ease.InOutQuad);
                _moveSequence.Append(tween);
            }

            _moveSequence.OnComplete(CompletedPath);
        }

        public void FollowPathAlt(Transform[] waypoints)
        {
            if (_moveTween != null)
            {
                _moveTween.Kill();
            }
            
            var waypointPositions = waypoints.Select(waypoint => waypoint.position).ToArray();
            _moveTween = transform.DOPath(waypointPositions, _moveSpeed.Value, PathType.Linear, PathMode.Ignore).SetSpeedBased().SetEase(Ease.InOutQuad);

            _moveTween.OnComplete(CompletedPath);
        }

        private void CompletedPath()
        {
            OnCompletedPath?.Invoke();
            _onCompletePath.Invoke();
        }
    }
}