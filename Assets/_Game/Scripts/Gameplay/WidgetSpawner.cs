using System.Collections;
using System.Collections.Generic;
using _Framework;
using UnityEngine;
using UnityEngine.Events;

namespace _Game.Scripts.Gameplay
{
    public class WidgetSpawner : MonoBehaviour
    {
        [SerializeField] private UnityEvent<GameObject> _spawnedWidget;
        [SerializeField] private FloatVariable _spawnRate;
        [SerializeField] private bool _spawningActive;

        private Collider2D _collider;
        private BoxCollider2D _lastSpawned;

        private WaitForSeconds _delayYield;
        private Coroutine _runningCoroutine;

        void Awake()
        {
            _collider = GetComponent<BoxCollider2D>();
        }

        void OnEnable()
        {
            _spawnRate.OnChange += OnSpawnRateChange;
        }

        void Start()
        {
            _delayYield = new WaitForSeconds(_spawnRate.Value);
            _runningCoroutine = StartCoroutine(SpawnerCoroutine());
        }

        void OnDisable()
        {
            _spawnRate.OnChange -= OnSpawnRateChange;
        }

        private void OnSpawnRateChange(float value)
        {
            StopCoroutine(_runningCoroutine);
            _delayYield = new WaitForSeconds(value);
            _runningCoroutine = StartCoroutine(SpawnerCoroutine());
        }

        IEnumerator SpawnerCoroutine()
        {
            while (true)
            {
                yield return _delayYield;
                yield return new WaitUntil(() => _spawningActive);
                SpawnWidget();
            }
        }

        public void SpawnWidget()
        {
            var widgetGO = WidgetPool.Instance.GetWidget();
            widgetGO.transform.SetParent(transform);
            widgetGO.transform.position = transform.position;
            _spawnedWidget.Invoke(widgetGO);
        }
    }
}